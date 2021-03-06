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
	return render_template('index.html', title = 'Home', username = cas.username)

@app.route('/passwords')
@login_required
def route_passwords():
	password_list = app.db.getUserPasswords(cas.username)
	return render_template('passwords.html', username = cas.username, title="Passwords", password_list=password_list)

@app.route('/groups')
@login_required
def route_groups():
	group_list = app.db.getUserGroups(cas.username)
	return render_template('groups.html', username = cas.username, title="Groups", group_list=group_list)

@app.route('/profile')
@login_required
def route_settings():
	return render_template('profile.html', username = cas.username)

## Start management routes
@app.route('/manage')
@login_required
def route_manage():
	return render_template('manage.html', username = cas.username, title="Management Panel")
	
#### Start management pages	
@app.route('/manage/passwords')
@login_required
def route_manage_passwords():
	password_list = app.db.getUserPasswords(cas.username)
	return render_template('manage/passwords.html', username = cas.username, title="Manage Passwords", data=password_list)
	
@app.route('/manage/users')
@login_required
def route_manage_users():
	user_list = app.db.getUserList()
	return render_template('manage/users.html', username = cas.username, title="Manage Users", data=user_list)
	
@app.route('/manage/groups')
@login_required
def route_manage_groups():
	group_list = app.db.getUserGroups(cas.username)
	return render_template('manage/groups.html', username = cas.username, title="Manage Groups", data=group_list)

## Start history pages
@app.route('/history/<type>')
@login_required
def route_history_passwords():
	return render_template('history/' + type + '.html')

## Start addition pages
@app.route('/add/<type>')
@login_required
def route_add(type):
	return render_template('add/' + type +'.html')

cas = CAS()
cas.init_app(app)
file = os.path.dirname(os.path.abspath(__file__)) + '/secret_key'
sk_f = open(file, 'r')
secret = sk_f.readline()
sk_f.close()

app.config['CAS_SERVER'] = 'https://muidp.miamioh.edu'
app.config['CAS_AFTER_LOGIN'] = 'index'
app.secret_key = secret

if __name__ == "__main__":
	app.run(debug=True, host='0.0.0.0')
