from flask import Flask, render_template, request, redirect, url_for, session, flash
import mysql.connector
from datetime import datetime
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)

# Secret key for session and flashing messages
app.secret_key = 'your_secret_key'  # Replace this with a secure random string

# Upload folder for profile images
UPLOAD_FOLDER = 'static/uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# Connect to XAMPP MySQL
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="flaskapp"
    )

@app.route('/')
def login():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def do_login():
    username = request.form['username']
    password = request.form['password']

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users WHERE username=%s AND password=%s", (username, password))
    user = cursor.fetchone()
    conn.close()

    if user:
        try:
            birth_date = user['birthday']
            if isinstance(birth_date, str):
                birth_date = datetime.strptime(birth_date, '%Y-%m-%d')
            today = datetime.today()
            age = today.year - birth_date.year - ((today.month, today.day) < (birth_date.month, birth_date.day))
        except:
            age = "Unknown"

        flash('Login successful!')
        return render_template('profile.html', user=user, age=age)
    else:
        flash("Invalid username or password.")
        return redirect(url_for('login'))

@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/register', methods=['POST'])
def do_register():
    name = request.form['name']
    birthday = request.form['birthday']
    address = request.form['address']
    username = request.form['username']
    password = request.form['password']

    # Check if username already exists
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users WHERE username=%s", (username,))
    existing_user = cursor.fetchone()

    if existing_user:
        conn.close()
        flash("Username already taken. Please choose a different one.")
        return redirect(url_for('register'))

    # Handle profile image upload
    file = request.files['profile_image']
    if file and file.filename != '':
        filename = secure_filename(file.filename)
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(file_path)
        profile_image = f'uploads/{filename}'  # relative path for database
    else:
        profile_image = 'uploads/default.png'

    # Insert new user
    cursor.execute(
        "INSERT INTO users (name, birthday, address, username, password, profile_image) VALUES (%s, %s, %s, %s, %s, %s)",
        (name, birthday, address, username, password, profile_image)
    )
    conn.commit()
    conn.close()

    flash("Registration successful! You can now log in.")
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)
