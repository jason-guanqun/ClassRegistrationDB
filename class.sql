-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: HW3
-- ------------------------------------------------------
-- Server version	5.7.18

-- Copyright (C) 2017 Jason Wang

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Person`
--
DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `UNI` varchar(12) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `type` char(1) NOT NULL,
  PRIMARY KEY (`UNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES ('ANMA1','Maria','Anders','S'),('ANTR1','Ana','Trujillo','S'),
('ANMO1','Antonio','Moreno','S'),('THHA1','Thomas','Hardy','S'),
('CHBE1','Christina','Berglund','S'),('HAMO1','Hanna','Moos','S'),
('FRCI1','Frdrique','Citeaux','S'),('MASO1','Martn','Sommer','S'),
('LALE1','Laurence','Lebihan','S'),('ELLI1','Elizabeth','Lincoln','S'),
('VIAS1','Victoria','Ashworth','F'),('PASI1','Patricio','Simpson','F'),
('FRCH1','Francisco','Chang','F'),('YAWA1','Yang','Wang','F'),
('PEAF1','Pedro','Afonso','F');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `UNI` varchar(12) NOT NULL,
  `school` varchar(30) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`UNI`),
  CONSTRAINT `person_student_fk` FOREIGN KEY (`UNI`) REFERENCES `Person` (`UNI`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('ANMA1','SEAS',2013),('ANTR1','SEAS',2014),
('ANMO1','SEAS',2015),('THHA1','SEAS',2016),
('CHBE1','SEAS',2017),('HAMO1','SEAS',2017),
('FRCI1','SEAS',2017),('MASO1','SEAS',2017),
('LALE1','SEAS',2016),('ELLI1','SEAS',2016);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `UNI` varchar(12) NOT NULL,
  `pay_grade` int(1)  NOT NULL,
  `title` varchar(30) NOT NULL,
  `department` varchar(30) NOT NULL,
  PRIMARY KEY (`UNI`),
  CONSTRAINT `person_faculty_fk` FOREIGN KEY (`UNI`) REFERENCES `Person` (`UNI`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES ('VIAS1',1,'Assistant Professor','COMS'),('PASI1',2,'Associate Professor','COMS'),
('FRCH1',3,'Professor','COMS'),('YAWA1',7,'Distinguished Professor','EENG'),
('PEAF1',1,'Assistant Professor','EENG');
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `course_participant`
--

DROP TABLE IF EXISTS `course_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_participant` (
  `UNI` varchar(12) NOT NULL,
  `section_call_no` char(5) NOT NULL,
  PRIMARY KEY (`UNI`,`section_call_no`),
  KEY `cp_section_fk` (`section_call_no`),
  CONSTRAINT `cp_participant_fk` FOREIGN KEY (`UNI`) REFERENCES `Person` (`UNI`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cp_section_fk` FOREIGN KEY (`section_call_no`) REFERENCES `sections` (`call_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_participant`
--

LOCK TABLES `course_participant` WRITE;
/*!40000 ALTER TABLE `course_participant` DISABLE KEYS */;
INSERT INTO `course_participant` VALUES ('VIAS1','00001'),('VIAS1','00002'),('VIAS1','00007'),
('ANMA1','00003'),('ANTR1','00001'),('VIAS1','00003'),('VIAS1','00004'),('VIAS1','00008'),
('FRCI1','00008'),('MASO1','00009'),('PASI1','00005'),
('FRCH1','00006'),('YAWA1','00007');
/*!40000 ALTER TABLE `course_participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_prereqs`
--

DROP TABLE IF EXISTS `course_prereqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_prereqs` (
  `course_id` varchar(12) NOT NULL,
  `prereq_id` varchar(12) NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `prereq_prereq_fk` (`prereq_id`),
  CONSTRAINT `prereq_course_fk` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prereq_prereq_fk` FOREIGN KEY (`prereq_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_prereqs`
--

LOCK TABLES `course_prereqs` WRITE;
/*!40000 ALTER TABLE `course_prereqs` DISABLE KEYS */;
INSERT INTO `course_prereqs` VALUES ('COMSW4111','COMSE1006'),('COMSW4111','COMSW3270'),
('COMSW3270','COMSE1006'),('COMSW2123','COMSE1006'),
('COMSW3456','COMSE1006'),('COMSW3456','COMSW3270'),
('COMSW3270','COMSW2123');
/*!40000 ALTER TABLE `course_prereqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `dept_code` char(4) NOT NULL,
  `faculty_code` enum('BC','C','E','F','G','V','W','X') NOT NULL,
  `level` enum('0','1','2','3','4','6','8','9') NOT NULL,
  `number` char(3) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(128) NOT NULL,
  `course_id` varchar(12) GENERATED ALWAYS AS (concat(`dept_code`,`faculty_code`,`level`,`number`)) STORED,
  `full_number` char(4) GENERATED ALWAYS AS (concat(`level`,`number`)) VIRTUAL,
  PRIMARY KEY (`dept_code`,`faculty_code`,`level`,`number`),
  UNIQUE KEY `course_id` (`course_id`),
  FULLTEXT KEY `keywords` (`title`,`description`),
  CONSTRAINT `course2_dept_fk` FOREIGN KEY (`dept_code`) REFERENCES `department` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` (`dept_code`, `faculty_code`, `level`, `number`, `title`, `description`) VALUES ('COMS','E','1','006','Intro. to Program for Eng.','Darth Don teaching in Spring.'),
('COMS','W','3','270','Data Structures','Seems safe to take.'),
('COMS','W','4','111','Intro. to Databases','Possibly the worst experience of your life.'),
('COMS','W','2','123','Programming Thoughts','Make you smarter'),
('COMS','W','3','456','Java Programming','Make you smarter');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `code` char(4) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('COMS','Computer Science'),('EENG','Electrical Engineering');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `call_no` char(5) NOT NULL,
  `course_id` varchar(12) NOT NULL,
  `section_no` varchar(45) NOT NULL,
  `year` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL,
 `section_key` varchar(45) GENERATED ALWAYS AS (concat(`year`,`semester`,`course_id`,`section_no`)) STORED,
 `enrollment_limit` int(5) NOT NULL,
  PRIMARY KEY (`call_no`),
  UNIQUE KEY `unique` (`course_id`,`section_no`,`year`,`semester`),
  CONSTRAINT `section_course_fk` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` (`call_no`, `course_id`, `section_no`, `year`, `semester`,`enrollment_limit`) VALUES ('00001','COMSW4111','1',2017,'1',2),('00002','COMSW4111','2',2017,'1',2),
('00003','COMSE1006','1',2015,'3',1),('00004','COMSE1006','2',2014,'1',4),
('00005','COMSW3270','1',2017,'2',5),('00006','COMSW3270','2',2017,'1',6),
('00007','COMSW2123','1',2017,'1',7),('00008','COMSW2123','3',2013,'2',8),
('00009','COMSW3456','3',2015,'3',9),('00010','COMSW3456','3',2016,'1',10);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'HW3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-23 18:14:26

-- Student view
DROP VIEW IF EXISTS `all_student`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `Problem3`.`all_student` AS
    SELECT 
        `Problem3`.`Person`.`UNI` AS `UNI`,
        `Problem3`.`Person`.`type` AS `type`,
        `Problem3`.`Person`.`last_name` AS `last_name`,
        `Problem3`.`Person`.`first_name` AS `first_name`,
        `Problem3`.`Student`.`school` AS `school`,
        `Problem3`.`Student`.`year` AS `year`
    FROM
        `Problem3`.`Person`
            JOIN
        `Problem3`.`Student` ON (`Problem3`.`Person`.`type` = 'S')
	WHERE
    `Problem3`.`Person`.`UNI`=`Problem3`.`Student`.`UNI`
    ORDER BY `UNI`;
        
-- Faculty view
DROP VIEW IF EXISTS `all_faculty`;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `Problem3`.`all_faculty` AS
    SELECT 
        `Problem3`.`Person`.`UNI` AS `UNI`,
        `Problem3`.`Person`.`type` AS `type`,
        `Problem3`.`Person`.`last_name` AS `last_name`,
        `Problem3`.`Person`.`first_name` AS `first_name`,
        `Problem3`.`Faculty`.`pay_grade` AS `pay_grade`,
        `Problem3`.`Faculty`.`title` AS `title`,
        `Problem3`.`Faculty`.`department` AS `department`
    FROM
        `Problem3`.`Person`
            JOIN
        `Problem3`.`Faculty` ON (`Problem3`.`Person`.`type` = 'F')
	WHERE
        `Problem3`.`Person`.`UNI`=`Problem3`.`Faculty`.`UNI`
    ORDER BY `UNI`;
    

delimiter $$
drop function if exists`generate_uni`$$
-- Generate a UNI
create definer=`root`@`localhost` function `generate_uni`(first_name varchar(30),last_name varchar(30)) returns varchar(12) charset utf8
begin 
declare c1 char(2);
declare c2 char(2);
declare prefix char(5);
declare uniCount int;
declare newUni varchar(8);

set c1 = upper(substr(first_name,1,2));
set c2 = upper(substr(last_name,1,2));
set prefix = concat(c1,c2,"%");

SELECT 
    COUNT(UNI)
INTO uniCount FROM
    Person
WHERE
    UNI LIKE prefix;
set newUni=concat(c1,c2,uniCount+1);

return newUni;
end$$

-- Insert student

drop procedure if exists`insert_student`$$
create definer=`root`@`localhost` procedure `insert_student` (in first_name varchar(30),in last_name varchar(30),in school varchar(30),in year int(11))
begin 
declare new_uni varchar(12);

set new_uni=generate_uni(first_name,last_name);
insert into Person (`UNI`,`last_name`,`first_name`,`type`) values (new_uni,last_name,first_name,'S');
insert into Student (`UNI`,`school`,`year`) values (new_uni,school,year);

end$$


-- Insert faculty
drop procedure if exists`insert_faculty`$$
create definer=`root`@`localhost` procedure `insert_faculty` (in first_name varchar(30),in last_name varchar(30),in pay_grade int(11),in title varchar(30),in department varchar(30))
begin 
declare new_uni varchar(12);

set new_uni=generate_uni(first_name,last_name);
insert into Person (`UNI`,`last_name`,`first_name`,`type`) values (new_uni,last_name,first_name,'F');
insert into Student (`UNI`,`pay_grade`,`title`,`department`) values (new_uni,pay_grade,title,department);

end$$

-- Update student
drop procedure if exists`update_student`$$
create definer=`root`@`localhost` procedure `update_student` (in UNI varchar(12),in school varchar(30),in year int(11))
begin 

update Student set `school`=school, `year`=year where Student.UNI=UNI;

end$$


-- Update faculty
drop procedure if exists`update_faculty`$$
create definer=`root`@`localhost` procedure `update_faculty` (in UNI varchar(12),in pay_grade int(11),in title varchar(30),in department varchar(30))
begin 

update Faculty set `pay_grade`=pay_grade,`title`=title,`department`=department where Faculty.UNI=UNI;

end$$

-- Delete student
drop procedure if exists`delete_student`$$

create definer=`root`@`localhost` procedure `delete_student` (in UNI varchar(12))
begin 

delete from Student where Student.UNI=UNI;
DELETE FROM Person 
WHERE
    Person.UNI = UNI;

end$$

-- Delete faculty
drop procedure if exists`delete_faculty`$$
create definer=`root`@`localhost` procedure `delete_faculty` (in UNI varchar(12))
begin 

DELETE FROM Faculty 
WHERE
    Faculty.UNI = UNI;
DELETE FROM Person 
WHERE
    Person.UNI = UNI;

end$$

-- check enrollment prereqs valid function
drop function if exists`enrollment_valid`$$
create definer=`root`@`localhost` function `enrollment_valid`(student_uni varchar(12), section_call_no char(5)) returns tinyint(1)
begin 
declare valid int;
if exists (select * from Student where student_uni=Student.UNI) then
set valid = (select exists 
(select prereq_id from 
(select course_prereqs.prereq_id from course_prereqs join courses on course_prereqs.course_id=courses.course_id join sections on courses.course_id = sections.course_id where sections.call_no=section_call_no) as a
where a.prereq_id not in 
(select  course_prereqs.course_id from course_prereqs join courses on course_prereqs.course_id=courses.course_id join sections on courses.course_id = sections.course_id join course_participant on course_participant.section_call_no=sections.call_no where course_participant.UNI=student_uni)
));
end if;
if valid=1 then return false;
else return true;
end if;

end$$

-- trigger for enrollment prereqs valid
create definer=`root`@`localhost` trigger `Problem3`.`enrollment_before_insert` before insert on `course_participant` for each row
begin
if not enrollment_valid(New.UNI, New.section_call_no) then 
signal sqlstate '04002'
set message_text='Prerequisites not satisfied!';
end if;
end$$

-- trigger for enrollment limit
create definer=`root`@`localhost` trigger `Problem3`.`enrollment_limit_before_insert` before insert on `course_participant` for each row
begin
declare studentCount int;
declare sectionCount int;

select count(*) into studentCount from course_participant join all_student on (all_student.UNI=course_participant.UNI) where `course_participant`.section_call_no=new.section_call_no;
select sections.enrollment_limit into sectionCount from sections where `sections`.`call_no`=new.section_call_no;

if studentCount = sectionCount
then 
signal sqlstate '04003'
set message_text='Section enrollment limit!';
end if;
end$$

-- trigger for faculty enrollment
create definer=`root`@`localhost` trigger `Problem3`.`faculty_limit_before_insert` before insert on `course_participant` for each row
begin
declare insert_year int;
declare insert_semester varchar(45);

select sections.year into insert_year from sections where sections.call_no=new.section_call_no;
select sections.semester into insert_semester from sections where sections.call_no=new.section_call_no;

if exists (select * from(select sections.`year` as `year`, sections.semester as semester, count(*) as `count` from course_participant join sections on (course_participant.section_call_no=sections.call_no)
join all_faculty on (course_participant.`UNI`=all_faculty.UNI)
where all_faculty.UNI=new.UNI
group by `year`,`semester`) as a where a.`count`=3 and `year`= insert_year and `semester`=insert_semester) then 
signal sqlstate '04003'
set message_text='Faculty cannot enroll three or more sections!';
end if;

end$$

-- function returns now_semester_num
drop function if exists`get_now_semester_num`$$
create definer=`root`@`localhost` function `get_now_semester_num`() returns char(1)
begin 

if month(now())>=9 and month(now())<=12 then return '1';end if;
if month(now())>=2 and month(now())<=5 then return '2';end if;
if month(now())>=6 and month(now())<=8 then return '3';end if;

end$$

-- student completed courses

DROP VIEW IF EXISTS `student_completed_courses`$$
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `Problem3`.`student_completed_courses` AS
    SELECT 
        `Problem3`.`all_student`.`UNI` AS `UNI`,
        `Problem3`.`courses`.`course_id` AS `course_id`,
        `Problem3`.`sections`.`year` AS `year`,
        `Problem3`.`sections`.`semester` AS `semester`
    FROM
        `Problem3`.`all_student`
            JOIN
        `Problem3`.`course_participant` ON (`Problem3`.`all_student`.`UNI` = `Problem3`.`course_participant`.`UNI`)
            JOIN
        `Problem3`.`sections` ON (`Problem3`.`sections`.`call_no` = `Problem3`.`course_participant`.`section_call_no`)
            JOIN
        `Problem3`.`courses` ON (`Problem3`.`sections`.`course_id` = `Problem3`.`courses`.`course_id`)
    WHERE
        (`Problem3`.`sections`.`year` < YEAR(NOW())) or
            (`Problem3`.`sections`.`year` = YEAR(NOW()) AND `Problem3`.`sections`.`semester` < get_now_semester_num())
    ORDER BY `UNI`$$

-- faculty's courses
DROP VIEW IF EXISTS `faculty_courses`$$
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `Problem3`.`faculty_courses` AS
    SELECT 
        `Problem3`.`all_faculty`.`UNI` AS `UNI`,
        `Problem3`.`courses`.`course_id` AS `course_id`,
        `Problem3`.`sections`.`year` AS `year`,
        `Problem3`.`sections`.`semester` AS `semester`,
        `Problem3`.`sections`.`section_no` AS `section_no`
    FROM
        `Problem3`.`all_faculty`
            JOIN
        `Problem3`.`course_participant` ON (`Problem3`.`all_faculty`.`UNI` = `Problem3`.`course_participant`.UNI)
            JOIN
        `Problem3`.`sections` ON (`Problem3`.`sections`.`call_no` = `Problem3`.`course_participant`.`section_call_no`)
            JOIN
        `Problem3`.`courses` ON (`Problem3`.`sections`.`course_id` = `Problem3`.`courses`.`course_id`)
    ORDER BY `UNI`$$
delimiter ;;
