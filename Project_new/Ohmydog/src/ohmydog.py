# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
from flask import Flask, render_template, request, url_for, redirect, session
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config["MYSQL_USER"] = "root"
app.config["MYSQL_DB"] = "e_shop"
app.config["MYSQL_HOST"] = "localhost"

mysql = MySQL(app)

app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'

def checkLogin(username, password):
    cursor = mysql.connection.cursor()
    cursor.execute('''select passwort from user where Benutzername = %s''' % username)
    rv = cursor.fetchall()
    if len(rv == 1) and rv == password:
        return True

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        session['username'] = request.form['username']
        session['logged_In'] = checkLogin(session['username'], request.form['password'])
        return redirect(url_for('katalog'))
    return render_template('Login.html')

@app.route('/katalog', methods=['GET', 'POST'])
def katalog():
    return render_template('Katalog.html')

if __name__ == "__main__":
    app.run()
