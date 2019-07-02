from flask import Flask, render_template, request, url_for, redirect, session

app = Flask(__name__)

app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'

def check_password(password):
    return password == 'Yves187Gang'

def check_username(username):
    return username != ''

def check_login():
    return check_password(request.form['password']) and check_username(session['username'])

@app.route('/login', methods=['GET', 'POST'])
def login():
    message = ''
    if request.method == 'POST':
        session['username'] = request.form['username']
        session['logged_In'] = check_login()
        return redirect(url_for('loggedIn'))
    return render_template('Login.html', message=message)

@app.route('/loggedIn', methods=['GET', 'POST'])
def loggedIn():
    if not session.get('logged_In'):
        return redirect(url_for('login'))
    return render_template('LoggedIn.html', username=session['username'])    

if __name__ == "__main__":
    app.run(debug=True)
