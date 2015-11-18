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