--
-- Sample queries for the password application
--

-- Select passwords that a user has access to
SELECT PID, TITLE, DESCRIPTION, USERNAME, PASSWORD 
FROM PASSWORDS P
NATURAL JOIN USER_GROUPS UG
NATURAL JOIN USER_PASSWORDS UP
WHERE P.ACTIVE = 1
AND (
	UG.UID = 'uniqueID'
	OR
	UP.UID = 'uniqueID'
);

-- Select groups that a user belongs to
SELECT GID, NAME, DESCRIPTION
FROM GROUPS G
NATURAL JOIN USER_GROUPS UG
WHERE G.ACTIVE = 1 AND UG.UID = 'uniqueID';

-- Find how many times a password has been changed
SELECT COUNT(*) as Changes
FROM PASSWORD_CHANGE_HISTORY
WHERE PID=1;

-- Find out who has changed passwords the most
SELECT COUNT(*) as Changes, UID as User
FROM PASSWORD_CHANGE_HISTORY
GROUP BY UID
ORDER BY Changes DESC;

-- Add a new user to the database
INSERT INTO USERS (UID, DATE_ADDED, ACTIVE) VALUES('uniqueID', NOW(), 1);

-- Add a user to an existing groups as viewer (V)
INSERT INTO USER_GROUPS (UID, GID, DATE_ADDED, ROLE) 
	VALUES('uniqueID', 1, NOW(), 'V');

-- Add a user to an existing group as editor (E)
INSERT INTO USER_GROUPS (UID, GID, DATE_ADDED, ROLE) 
	VALUES('uniqueID', 1, NOW(), 'E');
	
-- Add a user to an existing group as owner (O)
INSERT INTO USER_GROUPS (UID, GID, DATE_ADDED, ROLE) 
	VALUES('uniqueID', 1, NOW(), 'O');	
	
-- Add a new password
CALL insertPassword('uniqueID', 'Title', 'Description', 'username', 'password');

-- Update a password
CALL updatePassword('uniqueID', 1, 'new-password');