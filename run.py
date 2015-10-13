#! venv/bin/python
from flask import Flask
from flask import render_template

app = Flask(__name__)
app.run(debug = True)

@app.route('/')
@app.route('/index')
def index():
        user = {'nickname': 'Brandon'}
        posts = [
                {
                'author': {'nickname': 'John'},
                'body': 'Beautiful day in Portland!'
                },
                {
                'author': {'nickname': 'Susan'},
                'body': 'The Avengers movie was so cool!'
                }
        ]
        return render_template('index.html', title = 'Home', user = user, posts = posts)
