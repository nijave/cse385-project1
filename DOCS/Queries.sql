--
-- Sample queries for the password application
--

-- Select passwords that a user has access to
SELECT P.PID, TITLE, DESCRIPTION, USERNAME, PASSWORD 
FROM PASSWORDS P 
INNER JOIN PASSWORD_GROUPS USING(PID)
INNER JOIN USER_GROUPS UG USING(GID)
WHERE P.ACTIVE = 1
AND UID = 'venengnj'
UNION ALL
SELECT P.PID, TITLE, DESCRIPTION, USERNAME, PASSWORD 
FROM PASSWORDS P 
INNER JOIN USER_PASSWORDS USING(PID)
WHERE P.ACTIVE = 1
AND UID = 'venengnj';

-- Select groups that a user belongs to
SELECT GID, NAME, DESCRIPTION
FROM GROUPS G
NATURAL JOIN USER_GROUPS UG
WHERE G.ACTIVE = 1 AND UG.UID = 'venengnj';

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
	
-- Assign a password to a specific user
INSERT INTO USER_PASSWORDS(UID, PID, DATE_ADDED)
	VALUES('uniqueID', 1, NOW());
	
-- Remove a user from a group
DELETE FROM USER_GROUPS
WHERE UID='uniqueID'
AND GID=1;

-- Remove a specific user-password assignment
DELETE FROM USER_PASSWORDS
WHERE UID='uniqueID'
AND PID=1;

-- Deactivate a group
UPDATE GROUPS SET ACTIVE=0 WHERE GID=1;

-- Deactivate a user
UPDATE USERS SET ACTIVE=0 WHERE UID='uniqueID';

--Deactivate a password
UPDATE PASSWORDS SET ACTIVE=0 WHERE PID=1;

-- Add a new password
CALL insertPassword('uniqueID', 'Title', 'Description', 'username', 'password');

-- Update a password
CALL updatePassword('uniqueID', 1, 'new-password');