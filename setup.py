from setuptools import setup

setup(
	name = 'g-passman',
	version = '0.1dev',
	author = 'Nick Venenga, Brandon Wilson, Blake Wasung',
	author_email = 'wilso199@miamioh.edu',
	packages = ['app',],
	license = '',
	install_requires = ['flask', 'Flask-CAS', 'pyodbc'],
)
