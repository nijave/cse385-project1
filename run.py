#!/usr/bin/python3

import flask
import flask_cas
from flask import Flask, render_template, request
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
	return render_template('whoami.html', user = cas.username)	

cas = CAS()
cas.init_app(app)
file = os.path.dirname(os.path.abspath(__file__)) + '/secret_key'
sk_f = open(file, 'r')
secret = sk_f.readline()
sk_f.close()

app.config['CAS_SERVER'] = 'https://muidp.miamioh.edu'
app.config['CAS_AFTER_LOGIN'] = 'route_test'
app.secret_key = secret

if __name__ == "__main__":
	app.run(debug=True, host='0.0.0.0')
