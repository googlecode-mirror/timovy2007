TRUNCATE PROJECTS CASCADE;
TRUNCATE GRADUATES CASCADE;
TRUNCATE SPECIALIZATIONS CASCADE;

TRUNCATE ACADEMICS CASCADE;
TRUNCATE USERS CASCADE;

INSERT INTO users VALUES (1, 'te22111', 'test', NULL, '098f6bcd4621d373cade4e832627b4f6', 'Test', NULL, 'Testerovic', 'Bc.', 'hidden@hotmail.sk', 'Modrá 24/4
Bratislava
9898 988', '0907333400', '97897678098', '', NULL, 75, 1);

INSERT INTO users_clearances VALUES (1, 1, 1, 'allow');
INSERT INTO users_clearances VALUES (2, 1, 2, 'allow');
INSERT INTO users_clearances VALUES (3, 1, 3, 'allow');
INSERT INTO users_clearances VALUES (4, 1, 4, 'allow');
INSERT INTO users_clearances VALUES (5, 1, 5, 'allow');
INSERT INTO users_clearances VALUES (6, 1, 6, 'allow');
INSERT INTO users_clearances VALUES (7, 1, 7, 'allow');
INSERT INTO users_clearances VALUES (8, 1, 8, 'allow');
INSERT INTO users_clearances VALUES (9, 1, 9, 'allow');
INSERT INTO users_clearances VALUES (10, 1, 10, 'allow');
INSERT INTO users_clearances VALUES (11, 1, 11, 'allow');