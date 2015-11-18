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

	def getPasswords(self, id):
		self.__connect()
		self.__cur.execute("\
			SELECT P.PID, TITLE, DESCRIPTION, USERNAME, PASSWORD \
			FROM PASSWORDS P \
			INNER JOIN PASSWORD_GROUPS USING(PID) \
			INNER JOIN USER_GROUPS UG USING(GID) \
			WHERE P.ACTIVE = 1 \
			AND UID = %s \
			UNION ALL \
			SELECT P.PID, TITLE, DESCRIPTION, USERNAME, PASSWORD \
			FROM PASSWORDS P \
			INNER JOIN USER_PASSWORDS USING(PID) \
			WHERE P.ACTIVE = 1 \
			AND UID = %s", (id, id))
		return self.__cur.fetchall()
		
	def getGroups(self, id):
		self.__connect()
		self.__cur.execute("\
			SELECT GID, NAME, DESCRIPTION \
			FROM GROUPS G \
			NATURAL JOIN USER_GROUPS UG \
			WHERE G.ACTIVE = 1 AND UG.UID = %s, id")
		return self.__cur.fetchall()