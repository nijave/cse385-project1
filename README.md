# cse385-project1

## Overview
This is a multi-user password management system backed by a database. It relies on central authentication 
services to authenticate users (rather than store passwords). It is written in Python using the Flask framework 
and Bootstrap.
### Features
* Authenticates against CAS (central authentication services)
* Allows assigning users and passwords groups
	* Users can belong to multiple groups
	* Passwords can be assigned to multiple groups
	* Users can be assigned single passwords
* Tracks login history
* Tracks password change history
* Stores secure notes

## Database overview
The database contains the following tables:
* Users - Contain a list of valid users and when they were added
* Groups - Contains a list of groups, their name, and a description
* User-Groups - Contains assignments of users to groups
* User-Passwords - Contains assignments of users to passwords to allow the assignment of a user to a single 
password without the need for creating complex group structures
* Passwords - Contains site title, username/login, password, date added, and date last updated. It also contains 
an optional secure note with more information
* Passwords-Groups - Contains a mapping of which groups a password can belong to and whether the group is 
read-only or can make changes
* Login-History - Contains a log of each time a user logins and the IP address they are using (for audit 
purposes)
* Password-Change-History - Contains a record of when a password what changed and what the previous value was. 
This also contains who can change passwords
* Secure-Notes - Contains a title, optional website, and text
