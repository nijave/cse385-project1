#! venv/bin/python
import flask
import flask_cas
from flask import Flask
from flask import render_template
from flask_cas import CAS
from flask_cas import login_required
import os

app = Flask(__name__)

@app.route('/')
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


@app.route('/test/')
@login_required
def route_test():
	#something
	

cas = CAS()
cas.init_app(app)

app.config['CAS_SERVER'] = 'https://muidp.miamioh.edu'
app.config['CAS_AFTER_LOGIN'] = 'route_test'
app.secret_key = os.environ.get('SECRET_KEY', None)

if __name__ == "__main__":
	app.run(debug=True, host='0.0.0.0')
