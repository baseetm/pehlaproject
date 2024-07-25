from flask import Flask, request, render_template
import mysql.connector

app = Flask(__name__)

# Configure MySQL connection
db = mysql.connector.connect(
    host="localhost",
    user="john",
    password="Johm@1234",
    database="mydb"
)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/add', methods=['POST'])
def add_record():
    name = request.form['name']
    email = request.form['email']

    cursor = db.cursor()
    cursor.execute("INSERT INTO records (name, email) VALUES (%s, %s)", (name, email))
    db.commit()

    return 'Record added successfully'

@app.route('/records')
def display_records():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM records")
    records = cursor.fetchall()

    return render_template('records.html', records=records)

if __name__ == '__main__':
    app.run(debug=True)
