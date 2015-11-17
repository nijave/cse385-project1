import pymysql

class Database:
	# Constructor
	def __init__(self, host, username, password, db):
		self.__host = host
		self.__username = username
		self.__password = password
		self.__db = db
		self.__conn = None
		
	'''
	# Deconstructor
	def __del__(self):
		self.__cur.close()
		self.__conn.close()
	'''
	
	def __connect(self):
		if self.__conn is None or not self.__conn.open:
			self.__conn = pymysql.connect(\
				host=self.__host, user=self.__username, passwd=self.__password, db=self.__db)
			self.__cur = self.__conn.cursor()
	
	def test(self):
		self.__connect()
		self.__cur.execute("SELECT * FROM USERS")
		return self.__cur.__dict__['_rows']
	
	def getUser(self, id):
		self.__connect()
		self.__cur.execute("SELECT UID, ACTIVE FROM USERS WHERE UID=%s", id)
		user = self.__cur.fetchone()
		
'''
	def connect_db():
		"""Connects to the specific database."""
		rv = sqlite3.connect(app.config['DATABASE'])
		rv.row_factory = sqlite3.Row
		return rv


	def init_db():
		"""Initializes the database."""
		db = get_db()
		with app.open_resource('schema.sql', mode='r') as f:
			db.cursor().executescript(f.read())
		db.commit()


	@app.cli.command('initdb')
	def initdb_command():
		"""Creates the database tables."""
		init_db()
		print('Initialized the database.')


	def get_db():
		"""Opens a new database connection if there is none yet for the
		current application context.
		"""
		if not hasattr(g, 'sqlite_db'):
			g.sqlite_db = connect_db()
		return g.sqlite_db
'''
'''
	@app.teardown_appcontext
	def close_db(error):
		"""Closes the database again at the end of the request."""
		if hasattr(g, 'sqlite_db'):
			g.sqlite_db.close()


	@app.route('/')
	def show_entries():
		db = get_db()
		cur = db.execute('select title, text from entries order by id desc')
		entries = cur.fetchall()
		return render_template('show_entries.html', entries=entries)


	@app.route('/add', methods=['POST'])
	def add_entry():
		if not session.get('logged_in'):
			abort(401)
		db = get_db()
		db.execute('insert into entries (title, text) values (?, ?)',
				   [request.form['title'], request.form['text']])
		db.commit()
		flash('New entry was successfully posted')
		return redirect(url_for('show_entries'))
'''
