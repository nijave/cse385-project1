#!/usr/bin/python3

import flask
import flask_cas
from flask import Flask, render_template, request, url_for
from flask_cas import CAS
from flask_cas import login_required
import os
from db_mysql import Database

app = Flask(__name__)

# Database configuration information
app.db = Database('192.168.1.140','fmscu','','fmscu_passwords')
			
@app.route('/')
def index():
	user = {'nickname': 'Brandon'}
	data = app.db.test()
	
	return render_template('index.html', title = 'Home', data = data, username = cas.username)


@app.route('/test/')
@login_required
def route_test():
	return render_template('whoami.html', username = cas.username)	

@app.route('/passwords')
@login_required
def route_passwords():
	password_list = app.db.getPasswords(cas.username)
	return render_template('passwords.html', username = cas.username, password_list=password_list)

@app.route('/groups')
@login_required
def route_groups():
	group_list = app.db.getGroups(cas.username)
	return render_template('groups.html', username = cas.username, group_list=group_list)

@app.route('/profile')
@login_required
def route_settings():
	return render_template('profile.html', username = cas.username)
	
@app.route('/manage')
@login_required
def route_manage():
	return render_template('manage.html')
	
@app.route('/manage/passwords')
@login_required
def route_manage_passwords():
	return render_template('manage/passwords.html')
	
@app.route('/manage/users')
@login_required
def route_manage_users():
	return render_template('manage/users.html')
	
@app.route('/manage/groups')
@login_required
def route_manage_groups():
	return render_template('manage/groups.html')

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
