from flask import Flask, request, jsonify
import whisper
import tempfile
import os
import time
import spacy
import requests
import json
import re
from werkzeug.utils import secure_filename

app = Flask(__name__)

# Load both language models
nlp_nl = spacy.load("nl_core_news_lg")
nlp_en = spacy.load("en_core_web_lg")

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

def redact_personal_info(text, language='nl'):
    """Redact personal information from text using Spacy NER"""
    if language == 'en':
        nlp = nlp_en
        age_pattern = r'\b(?:\d{1,3})\s*(?:years?\s+old|years?|y\.o\.)\b'
    else:  # Default to Dutch
        nlp = nlp_nl
        age_pattern = r'\b(?:\d{1,3})\s*(?:jaar\s+oud|jaar|j\.o\.|jaren)\b'
    
    doc = nlp(text)
    
    # Create a list of spans to redact
    spans_to_redact = []
    if language == 'en':
        entities_to_redact = {
            'PERSON': '[NAME]',
            'LOC': '[LOCATION]',
            'ORG': '[ORGANIZATION]',
            'GPE': '[PLACE]',
        }
    else:
        entities_to_redact = {
            'PERSON': '[NAAM]',
            'LOC': '[LOCATIE]',
            'ORG': '[ORGANISATIE]',
            'GPE': '[PLAATS]',
        }
    
    for ent in doc.ents:
        if ent.label_ in entities_to_redact:
            spans_to_redact.append((ent.start_char, ent.end_char, entities_to_redact[ent.label_]))
    
    for match in re.finditer(age_pattern, text, re.IGNORECASE):
        spans_to_redact.append((match.start(), match.end(), 
                              '[AGE]' if language == 'en' else '[LEEFTIJD]'))
    
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

        # Debugging: Log response details
        print(f"Request payload: {request_payload}")
        print(f"Response status code: {response.status_code}")
        print(f"Response text: {response.text}")

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
        print(f"Error communicating with the Llama API: {e}")  # Debugging: Log exception
        return jsonify({'error': f'Error communicating with the Llama API: {str(e)}'}), 500
    except Exception as e:
        print(f"General error: {e}")  # Debugging: Log general exceptions
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
