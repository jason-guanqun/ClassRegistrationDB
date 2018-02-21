# ClassRegistrationDB
A class registration database implementation with some sample data.  
The implementation include Inheritance, Correctness, Triggers, and Procedures.
## For each of Student and Faculty
* Implement a view that supports query of all attributes, including those in the corresponding Person tuple.
* Implement a procedure for create, update and delete of an entity by UNI. The procedures should affect both the derived entity, e.g. student, and the base entity (Person).
## Populate the following tables with sample data
* Student (at least 10 tuples)
* Faculty (at least 5 tuples)
* Course (at least 5 tuples)
* Section, with at least 2 sections per course.
* Prereqs: Every course in the course table except for two courses must have at lest one prereq.
## Some triggers 
* Enrolling a student for a section is an INSERT on the Course_Participant table. Assigning a faculty member to a section is also an INSERT on the Course_Participant table. Enforce the constrains below using triggers. (NOTE: You WILL have to add columns to some of the tables. Figuring out the required columns is part of the assignment). You do not need to implement triggers for any operations other than INSERT. 
* A student may ONLY enroll in a section if the student has completed the course prereqs.
* Sections have enrollment limits. A student enrollment should fail if the course is at then enrollment limit.
* A faculty member may only teach 3 sections a semester.
## Create the following views
* A view that contains a tuple for each student of the form (UNI, completed course, year and semester completed). How do you know a student has completed a course? The section enrollment happened in the past? For an academic year, like 2017-2018, the semester numbers are 1 (fall), 2 (spring), 3 (summer 1), 4 (summer 2). Thus, you know WHEN the student took the course. How do you know it is in the past? The function now() returns the current date and time, and date(now()) returns the current date. You can write a simple function that returns the semester based on the month. 
* A view that contains a tuple for each faculty member of the form (uni, course_id, semester, year) representing each course a faculty member is teaching or has taught.

