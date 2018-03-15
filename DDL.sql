/*Change Log*/
/*Sara Pattinson: created 27/02/2018*/
/*Sara Pattinson: modified 13/03/2018*/

drop table if exists `answercomp`;
drop table if exists `studentanswer`;
drop table if exists `answer`;
drop table if exists `qsexam`;
drop table if exists `question`;
drop table if exists `test`;
drop table if exists `qtype`;
drop table if exists `class`;
drop table if exists `unit`;
drop table if exists `module`;
drop table if exists `student`;
drop table if exists `usertype`;
drop table if exists `teacher`;
drop table if exists `school`;


CREATE TABLE `school` (
  `schoolidPK` int(5) NOT NULL AUTO_INCREMENT,
  `schoolname` varchar(200) NOT NULL,
  PRIMARY KEY (`schoolidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `teacher` (
  `teacheridPK` int(5) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `schoolidFK` int(5) NOT NULL,
  PRIMARY KEY (`teacheridPK`),
  FOREIGN KEY (`schoolidFK`) REFERENCES `school` (`schoolidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `usertype` (
  `utypeidPK` int(5) NOT NULL AUTO_INCREMENT,
  `utype` varchar(200) NOT NULL,
  PRIMARY KEY (`utypeidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `student` (
  `studentidPK` int(5) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `userpass` char(64) DEFAULT NULL,
  `salt` char(32) NOT NULL,
  `email` varchar(60) NOT NULL,
  `sessionid` varchar(64) DEFAULT NULL,
  `utypeidFK` int(5) DEFAULT NULL,
  `xp` int(5),
  `schoolidFK` int(5) NOT NULL,
  PRIMARY KEY (`studentidPK`),
  FOREIGN KEY (`schoolidFK`) REFERENCES `school` (`schoolidPK`),
  FOREIGN KEY (`utypeidFK`) REFERENCES `usertype` (`utypeidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `module` (
  `moduleidPK` int(5) NOT NULL AUTO_INCREMENT,
  `modulename` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL,
  PRIMARY KEY (`moduleidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `unit` (
  `unitidPK` int(5) NOT NULL AUTO_INCREMENT,
  `unitname` varchar(50) NOT NULL,
  `moduleidPKFK` int(5) NOT NULL,
  PRIMARY KEY (`unitidPK`),
  FOREIGN KEY (`moduleidPKFK`) REFERENCES `module` (`moduleidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `class` (
  `moduleidPKFK` int(5) NOT NULL,
  `teacheridPKFK` int(5) NOT NULL,
  `studentidPKFK` int(5) NOT NULL,
  PRIMARY KEY (`moduleidPKFK`, `teacheridPKFK`,`studentidPKFK`),
  FOREIGN KEY (`moduleidPKFK`) REFERENCES `module` (`moduleidPK`),
  FOREIGN KEY (`teacheridPKFK`) REFERENCES `teacher` (`teacheridPK`),
  FOREIGN KEY (`studentidPKFK`) REFERENCES `student` (`studentidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
CREATE TABLE `moduleassigned` (
  `moduleidPKFK` int(5) NOT NULL,
  `classidPKFK` int(5) NOT NULL,
  PRIMARY KEY (`moduleidPKFK`,`classidPKFK`),
  FOREIGN KEY (`moduleidPKFK`) REFERENCES `module` (`moduleidPK`),
  FOREIGN KEY (`classidPKFK`) REFERENCES `class` (`classidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/

CREATE TABLE `qtype` (
  `qtypeidPK` int(5) NOT NULL AUTO_INCREMENT,
  `qtype` varchar(50) NOT NULL,
  `qdesc` varchar(200) NOT NULL,
  PRIMARY KEY (`qtypeidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `test` (
  `testidPK` int(5) NOT NULL AUTO_INCREMENT,
  `qtypeidFK` int(5) NOT NULL,
  `unitidFK` int(5) NOT NULL,
  PRIMARY KEY (`testidPK`),
  FOREIGN KEY (`qtypeidFK`) REFERENCES `qtype` (`qtypeidPK`),
  FOREIGN KEY (`unitidFK`) REFERENCES `unit` (`unitidPK`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `question` (
  `questionidPK` int(5) NOT NULL AUTO_INCREMENT,
  `questiontext` varchar(255) NOT NULL,
  `questionimage` varchar(255), /*split with * between image names*/
  `qtypeidFK` int(5) NOT NULL,
  PRIMARY KEY (`questionidPK`),
  FOREIGN KEY (`qtypeidFK`) REFERENCES `qtype` (`qtypeidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qsexam` (
  `questionidPKFK` int(5) NOT NULL,
  `testidPKFK` int(5) NOT NULL,
  PRIMARY KEY (`questionidPKFK`,`testidPKFK`),
  FOREIGN KEY (`questionidPKFK`) REFERENCES `question` (`questionidPK`),
  FOREIGN KEY (`testidPKFK`) REFERENCES `test` (`testidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `answer` (
  `answeridPK` int(5) NOT NULL AUTO_INCREMENT,
  `validanswer` varchar(255),
  `mchoice` varchar(5),
  `answerimage` varchar(255),/*split with * between image names*/
  `questionidPKFK` int(5) NOT NULL,
  PRIMARY KEY (`answeridPK`),
  FOREIGN KEY (`questionidPKFK`) REFERENCES `question` (`questionidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `studentanswer` (
  `studentansweridPK` int(5) NOT NULL AUTO_INCREMENT,
  `questionidFK` int(5) NOT NULL,
  `studentidFK` int(5) NOT NULL,
  `time` datetime NOT NULL,
  `studentanswer` varchar(255),
  `studentmchoice` varchar(5),
  PRIMARY KEY (`studentansweridPK`),
  FOREIGN KEY (`questionidFK`) REFERENCES `qsexam` (`questionidPKFK`),
  FOREIGN KEY (`studentidFK`) REFERENCES `student` (`studentidPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `answercomp` (
  `studentansweridPKFK` int(5) NOT NULL,
  `answeridFK` int(5) NOT NULL,
  `satisfactoryTF` boolean NOT NULL,
  `comments` varchar(255),
  PRIMARY KEY (`studentansweridPKFK`),
  FOREIGN KEY (`answeridFK`) REFERENCES `answer` (`answeridPK`),
  FOREIGN KEY (`studentansweridPKFK`) REFERENCES `studentanswer` (`studentansweridPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





