#!/usr/bin/python3

import flask
import flask_cas
from flask import Flask, render_template, request, url_for
from flask_cas import CAS
from flask_cas import login_required
import os
from initDB import Database

app = Flask(__name__)

# Database configuration information
app.config['DB_URL'] = '192.168.1.140'
app.config['DB_USER'] = 'fmscu'
app.config['DB_PASS'] = ''
app.config['DB_NAME'] = 'fmscu_passwords'
			
@app.route('/')
def index():
	user = {'nickname': 'Brandon'}
	db = Database()
	data = db.test()
	
	return render_template('index.html', title = 'Home', data = data, username = cas.username)


@app.route('/test/')
@login_required
def route_test():
	return render_template('whoami.html', username = cas.username)	

@app.route('/passwords')
@login_required
def route_passwords():
	return render_template('passwords.html', username = cas.username)

@app.route('/groups')
@login_required
def route_groups():
	return render_template('groups.html', username = cas.username)

@app.route('/settings')
@login_required
def route_settings():
	return render_template('settings.html', username = cas.username)

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
