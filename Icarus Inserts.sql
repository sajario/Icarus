/*School*/
INSERT INTO `school`(`schoolname`) VALUES ('Perth High School');
INSERT INTO `school`(`schoolname`) VALUES ('Perth Grammar School');
INSERT INTO `school`(`schoolname`) VALUES ('Balnacraig School');
INSERT INTO `school`(`schoolname`) VALUES ('St Johns Academy');

/*Teacher*/
INSERT INTO `teacher`(`firstname`,`lastname`,`schoolidFK`) 
VALUES ('Alanna','Walker',1);
INSERT INTO `teacher`(`firstname`,`lastname`,`schoolidFK`) 
VALUES ('James','Ray',1);
INSERT INTO `teacher`(`firstname`,`lastname`,`schoolidFK`) 
VALUES ('Karen','Maynard',2);
INSERT INTO `teacher`(`firstname`,`lastname`,`schoolidFK`) 
VALUES ('Philip','Torggia',4);

/*User Type*/
INSERT INTO `usertype`(`utype`) VALUES ('Active');
INSERT INTO `usertype`(`utype`) VALUES ('Leaver');
INSERT INTO `usertype`(`utype`) VALUES ('Suspended');
INSERT INTO `usertype`(`utype`) VALUES ('Banned');

/*Student*/
INSERT INTO `student`(`firstname`,`lastname`,`username`,`userpass`,`salt`,`email`,`sessionid`,`utypeidFK`,`xp`,`schoolidFK`)
VALUES ('Sean','Breen','PumpedKicks',000,000,'sb@uhi.ac.uk',000,1,423,1);
INSERT INTO `student`(`firstname`,`lastname`,`username`,`userpass`,`salt`,`email`,`sessionid`,`utypeidFK`,`xp`,`schoolidFK`)
VALUES ('Marcin','Olesiak','SmoothOperator',000,000,'mo@uhi.ac.uk',000,1,368,2);
INSERT INTO `student`(`firstname`,`lastname`,`username`,`userpass`,`salt`,`email`,`sessionid`,`utypeidFK`,`xp`,`schoolidFK`)
VALUES ('Kieran','Plank','DadShoes',000,000,'kp@uhi.ac.uk',000,1,279,2);
INSERT INTO `student`(`firstname`,`lastname`,`username`,`userpass`,`salt`,`email`,`sessionid`,`utypeidFK`,`xp`,`schoolidFK`)
VALUES ('Sara','Pattinson','ShitShoes',000,000,'sp@uhi.ac.uk',000,1,423,3);

/*Module*/
INSERT INTO `module`(`modulename`,`level`) VALUES ('Web Development','Higher');
INSERT INTO `module`(`modulename`,`level`) VALUES ('Software Construction','Higher');
INSERT INTO `module`(`modulename`,`level`) VALUES ('Networking','Higher');
INSERT INTO `module`(`modulename`,`level`) VALUES ('Web Development','Advanced Higher');

/*Unit*/
INSERT INTO `unit`(`unitname`,`moduleidPKFK`)
VALUES ('Analysis',1);
INSERT INTO `unit`(`unitname`,`moduleidPKFK`)
VALUES ('Development',1);
INSERT INTO `unit`(`unitname`,`moduleidPKFK`)
VALUES ('Implementation - HTML',1);
INSERT INTO `unit`(`unitname`,`moduleidPKFK`)
VALUES ('Implementation - CSS',1);
INSERT INTO `unit`(`unitname`,`moduleidPKFK`)
VALUES ('Implementation - JS',1);
INSERT INTO `unit`(`unitname`,`moduleidPKFK`)
VALUES ('Testing',1);
INSERT INTO `unit`(`unitname`,`moduleidPKFK`)
VALUES ('Evaluation',1);
INSERT INTO `unit`(`unitname`,`moduleidPKFK`)
VALUES ('Final',1);

/*Class*/
INSERT INTO `class`(`moduleidPKFK`,`teacheridPKFK`,`studentidPKFK`)
VALUES(1,1,1);
INSERT INTO `class`(`moduleidPKFK`,`teacheridPKFK`,`studentidPKFK`)
VALUES(1,1,2);
INSERT INTO `class`(`moduleidPKFK`,`teacheridPKFK`,`studentidPKFK`)
VALUES(1,2,3);
INSERT INTO `class`(`moduleidPKFK`,`teacheridPKFK`,`studentidPKFK`)
VALUES(1,2,4);
INSERT INTO `class`(`moduleidPKFK`,`teacheridPKFK`,`studentidPKFK`)
VALUES(3,4,1);
INSERT INTO `class`(`moduleidPKFK`,`teacheridPKFK`,`studentidPKFK`)
VALUES(3,4,3);
INSERT INTO `class`(`moduleidPKFK`,`teacheridPKFK`,`studentidPKFK`)
VALUES(2,3,2);
INSERT INTO `class`(`moduleidPKFK`,`teacheridPKFK`,`studentidPKFK`)
VALUES(2,3,4);

/*Question Type*/
INSERT INTO `qtype`(`qtype`,`qdesc`)
VALUES('Multiple Choice','These are options given to the students where one or more selections are correct');
INSERT INTO `qtype`(`qtype`,`qdesc`)
VALUES('Text Answers','These are text based answers which will need marked by a teacher before feedback can be given');

/*Test*/
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(1,1);
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(2,1);
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(1,2);
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(2,2);
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(1,3);
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(1,4);
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(1,5);
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(1,6);
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(2,6);
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(1,7);
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(2,7);
INSERT INTO `test`(`qtypeidFK`,`unitidFK`)
VALUES(2,8);



