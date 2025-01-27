from flask import Flask, render_template, request, redirect, url_for, session, flash
from flask_login import current_user
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import InputRequired, Length
from flask_bcrypt import Bcrypt
import firebase_admin
from firebase_admin import credentials, firestore
import requests
import os

# Initialize Flask app
app = Flask(__name__)
app.secret_key = os.getenv('FLASK_SECRET_KEY')
bcrypt = Bcrypt(app)

# Firebase setup
cred = credentials.Certificate(os.getenv('FIREBASE_CREDENTIALS_PATH'))
firebase_admin.initialize_app(cred)
db = firestore.client()

# Language translation
def translate_text(text, source_lang="en", target_lang="nl"):
    url = "https://api.mymemory.translated.net/get"
    params = {
        "q": text,
        "langpair": f"{source_lang}|{target_lang}"
    }
    response = requests.get(url, params=params)
    translation = response.json().get("responseData", {}).get("translatedText", "")
    return translation

# Login form
class LoginForm(FlaskForm):
    username = StringField('Username', validators=[InputRequired(), Length(min=4, max=20)])
    password = PasswordField('Password', validators=[InputRequired(), Length(min=6, max=20)])
    submit = SubmitField('Login')

# Question form
class QuestionForm(FlaskForm):
    question = StringField('Question', validators=[InputRequired(), Length(min=1, max=200)])
    submit = SubmitField('Add Question')

@app.route('/', methods=['GET', 'POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        
        # Query Firestore to check if user exists
        users_ref = db.collection('UsersDB')
        user_query = users_ref.where('user', '==', username).stream()
        user_data = None
        for user in user_query:
            user_data = user.to_dict()
            break
        
        if user_data:
            # Directly compare input password with stored plain-text password
            if user_data['password'] == password:
                session['user'] = username
                flash('Login successful!', 'success')
                return redirect(url_for('view_questions'))
            else:
                flash('Invalid password!', 'danger')
        else:
            flash('User not found!', 'danger')
    return render_template('login.html', form=form)

@app.route('/add-question', methods=['GET', 'POST'])
def add_question():
    if 'user' not in session:
        flash('Please log in first!', 'warning')
        return redirect(url_for('login'))
    
    form = QuestionForm()
    if form.validate_on_submit():
        question_text = form.question.data
        
        # Translate the question to Dutch
        translated_text = translate_text(question_text, "en", "nl")
        
        # Prepare the document to be added to Firestore
        question_doc = {
            'mainQuestion': question_text,  # Original English question
            'mainQuestionNL': translated_text  # Translated Dutch question
        }
        
        # Add question to Firestore
        db.collection('QuestionsDB').add(question_doc)
        
        flash('Question added successfully!', 'success')
        return redirect(url_for('add_question'))
    
    return render_template('add_question.html', form=form)

@app.route('/view-questions', methods=['GET'])
def view_questions():
    if 'user' not in session:
        flash('Please log in first!', 'warning')
        return redirect(url_for('login'))
    
    # Fetch questions from Firestore
    questions_ref = db.collection('QuestionsDB')
    questions = [{'id': doc.id, 'data': doc.to_dict()} for doc in questions_ref.stream()]
    return render_template('view_questions.html', questions=questions)

@app.route('/questions/<path:question_text>')
def question_detail(question_text):
    # Query VoiceDB for all documents with matching question
    docs = db.collection('VoiceDB').where('originalQuestion', '==', question_text).stream()
    
    # Convert documents to list of answer data
    answers = []
    for doc in docs:
        data = doc.to_dict()
        answers.append({
            'question': data.get('question'),
            'questionAnswer': data.get('questionAnswer'),
            'followup1': data.get('followup1'),
            'followup1Answer': data.get('followup1Answer'),
            'followup2': data.get('followup2'),
            'followup2Answer': data.get('followup2Answer'),
            'followup3': data.get('followup3'),
            'followup3Answer': data.get('followup3Answer'),
            'themes': data.get('themes', [])
        })

    if not answers:
        flash('No answers found for this question', 'danger')
        return redirect(url_for('view_questions'))

    return render_template('detail_question.html', answers=answers)

@app.route('/delete-questions', methods=['GET', 'POST'])
def delete_questions():
    if 'user' not in session:
        flash('Please log in first!', 'warning')
        return redirect(url_for('login'))
    
    questions_ref = db.collection('QuestionsDB')
    documents = list(questions_ref.stream())

    if request.method == 'POST':
        # Get selected document indices from the form
        selected_indices = request.form.getlist('selected_questions')
        selected_indices = [int(index) for index in selected_indices]
        
        # Delete selected documents
        for index in selected_indices:
            if 0 <= index < len(documents):
                doc = documents[index]
                doc.reference.delete()
        flash('Selected questions deleted successfully!', 'success')
        return redirect(url_for('view_questions'))

    # Pass documents to template for selection
    questions = [{'id': i, 'data': doc.to_dict()} for i, doc in enumerate(documents)]
    return render_template('delete_questions.html', questions=questions)

@app.route('/add_probing_questions/<path:main_question>', methods=['GET'])
def add_probing_questions(main_question):
    if 'user' not in session:
        flash('Please log in first!', 'warning')
        return redirect(url_for('login'))
    
    # Verify the question exists in the database
    questions_ref = db.collection('QuestionsDB')
    query = questions_ref.where('mainQuestion', '==', main_question).stream()
    
    # Check if question exists
    question_exists = any(doc for doc in query)
    if not question_exists:
        flash('Question not found.', 'danger')
        return redirect(url_for('view_questions'))
    
    return render_template('add_probing_questions.html', 
                           main_question=main_question)

@app.route('/save_probing_questions', methods=['POST'])
def save_probing_questions():
    if 'user' not in session:
        flash('Please log in first!', 'warning')
        return redirect(url_for('login'))
    
    # Get the main question and probing questions from the form
    main_question = request.form.get('main_question', '').strip()
    probing_questions = [
        request.form.get('probing_question1', '').strip(),
        request.form.get('probing_question2', '').strip(),
        request.form.get('probing_question3', '').strip()
    ]
    
    # Validate inputs
    if not main_question:
        flash('Main question is required.', 'danger')
        return redirect(url_for('view_questions'))
    
    if not all(probing_questions):
        flash('All probing questions are required.', 'danger')
        return redirect(url_for('view_questions'))
    
    try:
        # Translate the main question and probing questions to Dutch
        main_question_nl = translate_text(main_question, "en", "nl")
        probing_questions_nl = [translate_text(q, "en", "nl") for q in probing_questions]
        
        # Find the question document in Firestore
        questions_ref = db.collection('QuestionsDB')
        query = questions_ref.where('mainQuestion', '==', main_question).stream()
        
        # Get the first matching document
        doc_ref = None
        for doc in query:
            doc_ref = doc
            break
        
        if not doc_ref:
            flash('Selected question not found.', 'danger')
            return redirect(url_for('view_questions'))
        
        # Update the question document with probing questions (both English and Dutch)
        doc_ref.reference.update({
            'probingQuestions': probing_questions,  # Original probing questions in English
            'probingQuestionsNL': probing_questions_nl,  # Translated probing questions in Dutch
            'mainQuestionNL': main_question_nl  # Translated main question in Dutch
        })
        
        flash('Probing questions added successfully!', 'success')
        return redirect(url_for('view_questions'))
    
    except Exception as e:
        print(f"Error: {e}")
        flash('Error saving probing questions.', 'danger')
        return redirect(url_for('view_questions'))


@app.route('/logout')
def logout():
    session.pop('user', None)
    flash('Logged out successfully!', 'info')
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)
