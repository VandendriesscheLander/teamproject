from flask import Flask, request, jsonify
import whisper
import tempfile
import os
import time
import re
import requests
import json
from werkzeug.utils import secure_filename
from transformers import pipeline

app = Flask(__name__)

# Load the Hugging Face NER pipeline with RoBERTa
nlp_ner = pipeline("ner", model="Jean-Baptiste/roberta-large-ner-english", aggregation_strategy="simple")

def safe_delete(file_path, max_attempts=5):
    """Safely delete a file with multiple attempts"""
    for i in range(max_attempts):
        try:
            if os.path.exists(file_path):
                os.close(os.open(file_path, os.O_RDONLY))
                os.unlink(file_path)
            return True
        except PermissionError:
            if i < max_attempts - 1:
                time.sleep(0.1)
            continue
        except Exception as e:
            print(f"Failed to delete {file_path}: {e}")
            return False
    return False

def redact_personal_info(text, language='en'):
    """Redact personal information from text using RoBERTa NER"""
    age_patterns = {
        'nl': [
            r'\b(\d{1,3})\s*(?:jaar\s*oud|jarige?)\b',
            r'\b(?:leeftijd\s+van\s+)(\d{1,3})\b'
        ],
        'en': [
            r'\b(\d{1,3})\s*(?:years?\s*old|\-years?\-old|yr\s*old)\b',
            r'\b(?:age(?:d)?\s+)(\d{1,3})\b'
        ]
    }

    ner_results = nlp_ner(text)

    entities_to_redact = {
        'PER': '[NAME]' if language == 'en' else '[NAAM]',
        'LOC': '[LOCATION]' if language == 'en' else '[LOCATIE]',
        'ORG': '[ORGANIZATION]' if language == 'en' else '[ORGANISATIE]',
        'GPE': '[PLACE]' if language == 'en' else '[PLAATS]',
    }

    spans_to_redact = []
    for entity in ner_results:
        entity_type = entity['entity_group']
        if entity_type in entities_to_redact:
            spans_to_redact.append((entity['start'], entity['end'], entities_to_redact[entity_type]))

    patterns = age_patterns.get(language, age_patterns['en'])
    for pattern in patterns:
        for match in re.finditer(pattern, text, re.IGNORECASE):
            age_replacement = '[AGE]' if language == 'en' else '[LEEFTIJD]'
            spans_to_redact.append((match.start(), match.end(), age_replacement))

    spans_to_redact.sort(key=lambda x: x[0], reverse=True)
    redacted_text = text
    for start, end, replacement in spans_to_redact:
        redacted_text = redacted_text[:start] + replacement + redacted_text[end:]

    return redacted_text

@app.route('/transcribe', methods=['POST'])
def transcribe_audio():
    file = request.files.get('file') or request.files.get('Audio')
    if not file or file.filename == '':
        return jsonify({'error': 'No valid file provided'}), 400

    temp_file = None
    try:
        temp_file = tempfile.NamedTemporaryFile(delete=False, suffix='.opus')
        temp_path = temp_file.name
        temp_file.close()
        file.save(temp_path)

        model = whisper.load_model("large-v3-turbo")
        result = model.transcribe(temp_path)
        detected_language = result['language']
        language = 'en' if detected_language == 'en' else 'nl'

        original_text = result['text']
        redacted_text = redact_personal_info(original_text, language)
        redacted_segments = [
            {
                **segment,
                'text': redact_personal_info(segment['text'], language)
            } for segment in result['segments']
        ]

        response_data = {
            'text': redacted_text,
            'segments': redacted_segments,
            'detected_language': detected_language,
        }

        safe_delete(temp_path)
        return jsonify(response_data)
    except Exception as e:
        if temp_file:
            safe_delete(temp_file.name)
        return jsonify({'error': str(e)}), 500

@app.route('/questions', methods=['POST'])
def generate_questions():
    try:
        data = request.json
        if not data or 'mainquestion' not in data or 'answer' not in data:
            return jsonify({'error': 'Invalid request. Please provide a JSON payload with "mainquestion" and "answer" keys.'}), 400

        mainquestion = data['mainquestion']
        answer = data['answer']
        system_prompt = (
            "Generate three probing questions based on the provided main question and answer. "
            "Each question should start with 1., 2., or 3. without additional text or explanation. "
            "Avoid referencing any information in square brackets."
            "Respond in the language of the answer."
        )

        request_payload = {
            "model": "llama3.1",
            "messages": [
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": f"Question: {mainquestion}, Answer: {answer}"}
            ],
            "stream": False
        }

        url = "http://localhost:11434/api/chat"
        response = requests.post(url, json=request_payload)

        response.raise_for_status()
        response_json = response.json()

        ai_reply = response_json.get("message", {}).get("content", "")
        questions = ai_reply.strip().split('\n')

        valid_questions = [q.strip()[3:].strip() for q in questions if q.strip() and q.strip().startswith(('1. ', '2. ', '3. '))]
        if len(valid_questions) < 3:
            return jsonify({'error': 'Failed to generate sufficient questions'}), 500

        return jsonify({
            "question1": valid_questions[0],
            "question2": valid_questions[1],
            "question3": valid_questions[2]
        })

    except requests.exceptions.RequestException as e:
        print(f"Error communicating with the Llama API: {e}")
        return jsonify({'error': f'Error communicating with the Llama API: {str(e)}'}), 500
    except Exception as e:
        print(f"General error: {e}")
        return jsonify({'error': str(e)}), 500

        
@app.route('/extract-themes', methods=['POST'])
def extract_themes():
    try:
        # Input validation
        data = request.json
        required_fields = ['mainquestion', 'Q1', 'Q2', 'Q3', 'mainanswer', 'A1', 'A2', 'A3']
        if not data or not all(field in data for field in required_fields):
            return jsonify({
                'error': 'Invalid request. Missing required fields.',
                'required_fields': required_fields
            }), 400

        # Base JSON template
        base_json = {
            "translated_questions_and_answers": {
                "mainquestion": "",
                "Q1": "",
                "Q2": "",
                "Q3": "",
                "mainanswer": "",
                "A1": "",
                "A2": "",
                "A3": ""
            },
            "themes": ["", "", ""]
        }

        # Create a cleaner prompt structure
        prompt = (
            "Translate the following questions and answers to Dutch and identify three key themes based mostly on the answers.\n\n"
            "Format your response as valid JSON using this exact structure:\n"
            f"{json.dumps(base_json, indent=2)}\n\n"
            "Content to translate and analyze:\n"
            f"Main Question: {data['mainquestion']}\n"
            f"Q1: {data['Q1']}\n"
            f"Q2: {data['Q2']}\n"
            f"Q3: {data['Q3']}\n"
            f"Main Answer: {data['mainanswer']}\n"
            f"A1: {data['A1']}\n"
            f"A2: {data['A2']}\n"
            f"A3: {data['A3']}\n\n"
            "Important: Respond only with the JSON structure, no additional text."
        )

        # Request to Llama API
        request_payload = {
            "model": "llama3.1",
            "messages": [
                {
                    "role": "system", 
                    "content": "You are a precise JSON generator that translates content to Dutch and extracts themes. Always respond with valid JSON only. If A1, A2 and A3 are not recorded, focus on the main question and answer."
                },
                {
                    "role": "user",
                    "content": prompt
                }
            ],
            "stream": False
        }

        # Make API request
        url = "http://localhost:11434/api/chat"
        response = requests.post(url, json=request_payload, timeout=30)
        response.raise_for_status()
        
        # Parse response
        response_json = response.json()
        ai_reply = response_json.get("message", {}).get("content", "")

        # Clean and validate JSON response
        cleaned_reply = ai_reply.strip()
        # Remove any markdown code block indicators if present
        if cleaned_reply.startswith("```json\n"):
            cleaned_reply = cleaned_reply[7:]
        if cleaned_reply.endswith("\n```"):
            cleaned_reply = cleaned_reply[:-4]
        cleaned_reply = cleaned_reply.strip()

        try:
            result = json.loads(cleaned_reply)
            # Validate structure
            if not isinstance(result, dict) or \
               "translated_questions_and_answers" not in result or \
               "themes" not in result or \
               not isinstance(result["themes"], list) or \
               len(result["themes"]) != 3:
                raise ValueError("Invalid JSON structure in response")
            
            return jsonify(result)
            
        except json.JSONDecodeError as e:
            print(f"JSON Parse Error: {e}")
            print(f"Attempted to parse: {cleaned_reply}")
            return jsonify({
                'error': 'Failed to parse AI response as JSON',
                'details': str(e)
            }), 500

    except requests.exceptions.RequestException as e:
        print(f"Llama API Error: {e}")
        return jsonify({
            'error': 'Error communicating with the Llama API',
            'details': str(e)
        }), 500
    except Exception as e:
        print(f"General Error: {e}")
        return jsonify({
            'error': 'Internal server error',
            'details': str(e)
        }), 500


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)