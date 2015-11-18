-- Keep track of passwords
CREATE TABLE PASSWORDS (
	PID INT NOT NULL AUTO_INCREMENT,
	TITLE VARCHAR(32) NOT NULL,
	DESCRIPTION VARCHAR(256),
	USERNAME VARCHAR(32) NOT NULL,
	PASSWORD VARCHAR(32) NOT NULL,
	DATE_ADDED DATETIME NOT NULL,
	DATE_UPDATED DATETIME NOT NULL,
	ACTIVE INT NOT NULL,
	PRIMARY KEY (PID)
) ENGINE=INNODB;

-- Keep track of groups
CREATE TABLE GROUPS (
	GID INT NOT NULL AUTO_INCREMENT,
	NAME VARCHAR(32) NOT NULL,
	DESCRIPTION VARCHAR(256),
	ACTIVE INT NOT NULL,
	PRIMARY KEY (GID)
) ENGINE=INNODB;

-- Keep track of which passwords are in which groups
CREATE TABLE PASSWORD_GROUPS (
	GID INT NOT NULL,
	PID INT NOT NULL,
	DATE_ADDED DATETIME NOT NULL,
	PRIMARY KEY (GID, PID),
	FOREIGN KEY (GID) REFERENCES GROUPS(GID),
	FOREIGN KEY (PID) REFERENCES PASSWORDS(PID)
) ENGINE=INNODB;

-- Keep track of users who have access
CREATE TABLE USERS (
	UID VARCHAR(8) NOT NULL,
	DATE_ADDED DATETIME NOT NULL,
	ACTIVE INT NOT NULL,
	PRIMARY KEY (UID)
) ENGINE=INNODB;

-- Keep track of who's in which groups
CREATE TABLE USER_GROUPS (
	UID VARCHAR(8) NOT NULL,
	GID INT NOT NULL,
	DATE_ADDED DATETIME NOT NULL,
	ROLE CHAR(1) NOT NULL,
	PRIMARY KEY (UID, GID),
	FOREIGN KEY (UID) REFERENCES USERS(UID),
	FOREIGN KEY (GID) REFERENCES GROUPS(GID)
) ENGINE=INNODB;

-- Keep track of user<->password associations
CREATE TABLE USER_PASSWORDS (
	UID VARCHAR(8) NOT NULL,
	PID INT NOT NULL,
	DATE_ADDED DATETIME NOT NULL,
	PRIMARY KEY (UID, PID),
	FOREIGN KEY (UID) REFERENCES USERS(UID),
	FOREIGN KEY (PID) REFERENCES PASSWORDS(PID)
) ENGINE=INNODB;

-- Keep track of login history
CREATE TABLE LOGIN_HISTORY (
	UID VARCHAR(8) NOT NULL,
	IP_ADDR VARCHAR(15) NOT NULL,
	DATETIME DATETIME NOT NULL,
	FOREIGN KEY (UID) REFERENCES USERS(UID)
) ENGINE=INNODB;

-- Keep track of password change history
CREATE TABLE PASSWORD_CHANGE_HISTORY (
	UID VARCHAR(8) NOT NULL,
	PID INT NOT NULL,
	PREVIOUS_VALUE VARCHAR(32),
	DATETIME DATETIME NOT NULL,
	FOREIGN KEY (UID) REFERENCES USERS(UID),
	FOREIGN KEY (PID) REFERENCES PASSWORDS(PID)
) ENGINE=INNODB;

-- Stored procedure for updating password and storing change in history
DELIMITER $$
CREATE PROCEDURE `updatePassword` (_uid VARCHAR(8), _pid INT, _new_value VARCHAR(32))
BEGIN
	DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    START TRANSACTION;
	SELECT @PREV:=PASSWORD FROM PASSWORDS WHERE PID=_pid;
	UPDATE PASSWORDS SET PASSWORD=_new_value WHERE PID=_pid;
	INSERT INTO PASSWORD_CHANGE_HISTORY (UID,PID,PREVIOUS_VALUE,DATETIME)
		VALUES(_uid, _pid, @PREV, NOW());
    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END$$
DELIMITER ;

-- Stored procedure to add a new password
DELIMITER $$
CREATE PROCEDURE `insertPassword` 
(
	 _uid VARCHAR(8)
	,_title VARCHAR(32) 
	,_desc VARCHAR(256) 
	,_user VARCHAR(32)
	,_pass VARCHAR(32)
)
BEGIN
	DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    START TRANSACTION;
	INSERT INTO PASSWORDS (TITLE, DESCRIPTION, USERNAME, PASSWORD, DATE_ADDED, DATE_UPDATED, ACTIVE)
		VALUES(_title, _desc, _user, _pass, NOW(), NOW(), 1);
	INSERT INTO PASSWORD_CHANGE_HISTORY (UID,PID,PREVIOUS_VALUE,DATETIME)
		VALUES(_uid, (SELECT LAST_INSERT_ID()), NULL, NOW());
    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END$$
DELIMITER ;