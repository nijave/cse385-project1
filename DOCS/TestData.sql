-- This is a file to populate the database with test data used
-- during development

-- Populate USERS
INSERT INTO USERS VALUES('venengnj', NOW(), 1);
INSERT INTO USERS VALUES('wilso199', NOW(), 1);
INSERT INTO USERS VALUES('wasungbk', NOW(), 1);

-- Populate GROUPS
INSERT INTO GROUPS (NAME, DESCRIPTION, ACTIVE) VALUES('Group 1', 'This is the first group', 1);
INSERT INTO GROUPS (NAME, DESCRIPTION, ACTIVE) VALUES('Group 2', 'This is the second group', 1);
INSERT INTO GROUPS (NAME, DESCRIPTION, ACTIVE) VALUES('Inactive Group', 'This group is inactive', 0);

-- Populate PASSWORDS
INSERT INTO PASSWORDS (TITLE, DESCRIPTION, USERNAME, PASSWORD, DATE_ADDED, DATE_UPDATED, ACTIVE)
	VALUES('Google.com', 'A test login for google.com', 'example@gmail.com', 'secret-password', NOW(), NOW(), 1);
INSERT INTO PASSWORDS (DESCRIPTION, TITLE, USERNAME, PASSWORD, DATE_ADDED, DATE_UPDATED, ACTIVE)
	VALUES
	('Generated by http://www.fakenamegenerator.com/','LawsuitAid.com','Frintings','Shaiphi7ANg', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LawsuitAid.com','Usplany','yu2Ver0bai', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LocationCalculator.com','Thicest','Pah9ish3', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ConfidentialJournal.com','Halown','chaiphik1P', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LocationCalculator.com','Mannever','ecaeBah0En', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PasswordPals.com','Sirstee','Phoongai3ugh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PaylessLimos.com','Conions59','ohShee2geX3', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','SearchingPays.com','Ruchoculd','Hoa9johka4', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ProvidenceInsuranceAgents.com','Prost1963','am9ooPiey3', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Afrome','soWi2chae', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','FindPolo.com','Hinsuff','chee7MeRa7', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Almomen','Za0vo0UPh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PaylessLimos.com','Shistur1956','jeip2ahNg', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ConfidentialJournal.com','Therech1966','aezae3Pa', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Theagre','laeMaix0phae', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PaylessLimos.com','Nous1991','Xaemi0aiw', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Sooked','enoyae8pheC', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LawsuitAid.com','Didarculd','pe2EishahM', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LogTrades.com','Wourfact1983','gahRuop9Ph', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PaylessLimos.com','Thesseneated','Ien7doGh2', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PaylessLimos.com','Greptol','aht8uoZoo', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LawsuitAid.com','Plegelone','aiX5iimoh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ProvidenceInsuranceAgents.com','Buiblemp82','ohwith9J', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ConfidentialJournal.com','Upwainuer','us5rieNg', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LocationCalculator.com','Causbas','udiSei7ph', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PasswordPals.com','Sasts1955','uub6Oshai', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','SearchingPays.com','Folve1965','aroR5ieg', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LocationCalculator.com','Whopribed','saeka4ioYu7b', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PaylessLimos.com','Manoth','iPoh6wei', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','CampMissions.com','Ondur1995','aiW4Boosu7sh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Whaput','eQuah3Ei', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Hamelf','equ8aiki4Ui', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','TypoFail.com','Wispeas81','Deej1Yah8cae', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LawsuitAid.com','Routimerend','Oongee9bu', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ProvidenceInsuranceAgents.com','Whyall','see0Pohrah5', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ProvidenceInsuranceAgents.com','Guesse85','fai2aa7Wei7', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LogTrades.com','Surney','eef8ahMoo', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LawsuitAid.com','Roughtne','ailaQu0cai6', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Weepted1934','Ohshie4jae6', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','SearchingPays.com','Hises1977','ahQuoh7V', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ConfidentialJournal.com','Youlthalater','Xoh8fae3aen', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','TypoFail.com','Lusand','aeFahGh8Mu', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LocationCalculator.com','Samough','Joh9eidahSh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PasswordPals.com','Gratchim','eiReb8ophah', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Saling','eaHi4au3go2', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LogTrades.com','Sibes1989','heev4vohThe', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','TypoFail.com','Siguld1942','eWe7aiK2i', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LocationCalculator.com','Mome1935','WeShou7sae', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PasswordPals.com','Becater','EeGhiec5', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PasswordPals.com','Alren1975','iuyee6OhK', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','TypoFail.com','Astand','Aes7gah4Zui', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','TypoFail.com','Whatefteld','aes3CeiS', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LogTrades.com','Alling54','eih4mahLie', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','SearchingPays.com','Thadeciagre95','ahyo5ieCh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PasswordPals.com','Cluounce','shed6Mejoo', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','CampMissions.com','Ramie1933','Ieh8uhoo0aigh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PaylessLimos.com','Sornsward','aeCapo2ZooL', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Septan','ceiLahb5oh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','FindPolo.com','Biall1980','Joo1Naitho', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ProvidenceInsuranceAgents.com','Shathe','Quiu8shoo', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ProvidenceInsuranceAgents.com','Satioustre','ohQu0vah', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PaylessLimos.com','Shost1957','eShah3reiNg', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ProvidenceInsuranceAgents.com','Toger1965','aez1Kai0', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','TalkScope.com','Withir','siam8Ohjoo', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Hatily','hoVoh1Xu7oh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PasswordPals.com','Beinale','dod9aiTi4k', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ConfidentialJournal.com','Neastathard','loh6Iezo', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','FindPolo.com','Itimpookind','Ohk3sahzie', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LawsuitAid.com','Prourting','thoht4ahT', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ConfidentialJournal.com','Posely','Xiephah6Foh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ConfidentialJournal.com','Ponswed','Aht8mufe1yee', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','FindPolo.com','Expaletioll','ooFure5geen', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','TypoFail.com','Thistagating1935','uMaef9uo', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LocationCalculator.com','Willon','Aec2no8wae', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PaylessLimos.com','Theromele79','yoo0wa7ha4Ei', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LocationCalculator.com','Nood1945','mo9iejaeLei', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LawsuitAid.com','Swerown','xiMa5ikai7ch', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','TalkScope.com','Greaboy','KoSh8Ga4ee', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Musibitury63','Fohh3WiePe', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PasswordPals.com','Ittless1965','EaThah7oo', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Bitterephe30','uiBae5eiqu0', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','TypoFail.com','Nowel1972','Aipae6iejie', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ProvidenceInsuranceAgents.com','Wayinshound','sah8ioShaiJ', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LocationCalculator.com','Likeriatues1969','thahf2Wai', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PetroleumFinder.com','Dooder','Faega6Sh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','CampMissions.com','Takedent','Cig6OSh0uH', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','CampMissions.com','Eyess1952','ohgh4Ozagh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','CampMissions.com','Mach1980','UGeiZai3Ahc', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LocationCalculator.com','Arkly1985','ahLoovaiS3sh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ProvidenceInsuranceAgents.com','Knearot1934','aef7EpaeB', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','TypoFail.com','Adint1991','efahjoo7Ph', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','SearchingPays.com','Whord1993','JahX0pe5ep8', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PasswordPals.com','Eftees1993','aeface3Sh', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','TypoFail.com','Forto1971','moo8Aes2b', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','PasswordPals.com','Dithey83','WeNaeyath6S', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LocationCalculator.com','Ringe1971','mef5Iev0ah', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LogTrades.com','Saitteld','ahthai6Ah', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ProvidenceInsuranceAgents.com','Lignat1950','tae7thah1N', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','ConfidentialJournal.com','Dolow1992','ahshei1Ji8', NOW(), NOW(), 1),
	('Generated by http://www.fakenamegenerator.com/','LogTrades.com','Lond1985','Pea2Phaish', NOW(), NOW(), 1);
create view temp as select PID from PASSWORDS ORDER BY USERNAME ASC LIMIT 30,30;
UPDATE PASSWORDS SET ACTIVE=0 WHERE PID IN (select * from temp);
drop view temp;	