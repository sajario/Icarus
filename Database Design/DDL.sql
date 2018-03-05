/*Sara Pattinson: created27/02/2018*/
drop table if exists answercomp;
drop table if exists studentanswer;
drop table if exists answer;
drop table if exists qsexam;
drop table if exists question;
drop table if exists qtype;
drop table if exists test;
/*
drop table if exists moduleassigned;
*/
drop table if exists module;
drop table if exists class;
drop table if exists student;
drop table if exists teacher;
drop table if exists school;




CREATE TABLE school (
  schoolid int(5) NOT NULL AUTO_INCREMENT,
  schoolname varchar(200) NOT NULL,
  PRIMARY KEY (schoolid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE teacher (
  teacherid int(5) NOT NULL AUTO_INCREMENT,
  firstName varchar(50) NOT NULL,
  lastName varchar(50) NOT NULL,
  schoolid int(5) NOT NULL,
  PRIMARY KEY (teacherid),
  FOREIGN KEY (schoolid) REFERENCES school (schoolid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE student (
  studentid int(5) NOT NULL AUTO_INCREMENT,
  firstname varchar(50) NOT NULL,
  lastname varchar(50) NOT NULL,
  username varchar(20) NOT NULL,
  userpass char(64) DEFAULT NULL,
  salt char(32) NOT NULL,
  email varchar(60) NOT NULL,
  sessionid varchar(52) DEFAULT NULL,
  usertype int(1) DEFAULT NULL,
  xp int(5),
  schoolid int(5) NOT NULL,
  PRIMARY KEY (studentid),
  FOREIGN KEY (schoolid) REFERENCES school (schoolid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE class (
  classid int(5) NOT NULL AUTO_INCREMENT,
  teacherid int(5) NOT NULL,
  studentid int(5) NOT NULL,
  PRIMARY KEY (classid),
  FOREIGN KEY (teacherid) REFERENCES teacher (teacherid),
  FOREIGN KEY (studentid) REFERENCES student (studentid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE module (
  moduleid int(5) NOT NULL AUTO_INCREMENT,
  modulename varchar(20) NOT NULL,
  PRIMARY KEY (moduleid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*
CREATE TABLE moduleassigned (
  moduleid int(5) NOT NULL,
  classid int(5) NOT NULL,
  PRIMARY KEY (moduleid,classid),
  FOREIGN KEY (moduleid) REFERENCES module (moduleid),
  FOREIGN KEY (classid) REFERENCES class (classid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/
CREATE TABLE test (
  testid int(5) NOT NULL AUTO_INCREMENT,
  unit varchar(20) NOT NULL,
  type varchar(20) NOT NULL,
  moduleid int(5) NOT NULL,
  PRIMARY KEY (testid),
  FOREIGN KEY (moduleid) REFERENCES module (moduleid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE qtype (
  qtypeid int(5) NOT NULL AUTO_INCREMENT,
  qtype varchar(20) NOT NULL,
  qdesc varchar(200) NOT NULL,
  PRIMARY KEY (qtypeid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE question (
  questionid int(5) NOT NULL AUTO_INCREMENT,
  questiontext varchar(255) NOT NULL,
  qtypeid int(5) NOT NULL,
  PRIMARY KEY (questionid),
  FOREIGN KEY (qtypeid) REFERENCES qtype (qtypeid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE qsexam (
  questionid int(5) NOT NULL,
  testid int(5) NOT NULL,
  PRIMARY KEY (questionid,testid),
  FOREIGN KEY (questionid) REFERENCES question (questionid),
  FOREIGN KEY (testid) REFERENCES test (testid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE answer (
  answerid int(5) NOT NULL AUTO_INCREMENT,
  validanswer varchar(255),
  mchoice varchar(5),
  questionid int(5) NOT NULL,
  PRIMARY KEY (answerid),
  FOREIGN KEY (questionid) REFERENCES question (questionid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE studentanswer (
  studentanswerid int(5) NOT NULL AUTO_INCREMENT,
  questionid int(5) NOT NULL,
  testid int(5) NOT NULL,
  studentid int(5) NOT NULL,
  time datetime NOT NULL,
  studentanswer varchar(255),
  studentmchoice varchar(5),
  PRIMARY KEY (studentanswerid),
  FOREIGN KEY (questionid) REFERENCES qsexam (questionid),
  FOREIGN KEY (testid) REFERENCES qsexam (testid),
  FOREIGN KEY (studentid) REFERENCES student (studentid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE answercomp (
  studentanswerid int(5) NOT NULL,
  answerid int(5) NOT NULL,
  satisfactoryTF boolean NOT NULL,
  comments varchar(255),
  PRIMARY KEY (studentanswerid),
  FOREIGN KEY (answerid) REFERENCES answer (answerid),
  FOREIGN KEY (studentanswerid) REFERENCES studentanswer (studentanswerid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO school VALUES (1,"UHI");
INSERT INTO student values (1,"1","1","1","13c94bf9325490692b3ee8c65675fd8d38bca00f0466d5cb488fd6c9a181e95f","dc6686fbe6dddf78b87c4151e9298a1b","1@1.com","nm1smj0r7dr69bavepbj4373roudkbv5rgv0b2g5f6kuchaoo610",1,0,1);
