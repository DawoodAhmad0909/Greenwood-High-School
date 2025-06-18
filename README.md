# Greenwood-High-School
## Overview
#### Database:GWHS_db
This SQL project models a comprehensive school management system for GWHS (Government Women High School). It establishes the foundational structure of a relational database using PostgreSQL, comprising five core tables: Students, Courses, Teachers, Enrollments, and Class_schedule. The schema is designed to capture essential educational operations such as course registrations, grade assignments, teacher allocations, and class timings.
## Objectives 
##### 1. Design a relational database to model a school system with normalized and interconnected entities.
##### 2. Store and manage student data, including demographics, course enrollments, and grades.
##### 3. Capture teacher and course associations including class scheduling information.
##### 4. Implement meaningful SQL queries to:
•Retrieve specific academic information.
•Analyze student performance.
•Track teacher assignments and scheduling.
•Identify top-performing students and course-wise grade distributions.
## Creating Database 
``` sql
CREATE DATABASE GWHS_db;
USE GWHS_db;
```
## Creating Tables 
### Table:Students
``` sql
CREATE TABLE Students(
student_id      INT PRIMARY KEY,
first_name      VARCHAR(25) NOT NULL,
last_name       VARCHAR(25) NOT NULL,
date_of_birth   DATE,
gender          VARCHAR(10),
address         TEXT,
enrollment_date DATE,
email           TEXT ,
phone           VARCHAR(15) UNIQUE,
guardian_name   VARCHAR(50)
);

SELECT *FROM Students;
```
### Table:Courses
``` sql
CREATE TABLE Courses(
course_id    INT PRIMARY KEY,
course_name  VARCHAR(50) NOT NULL,
course_code  VARCHAR(15) NOT NULL,
department   VARCHAR(50),
credit_hours INT,
description  TEXT
);

SELECT * FROM Courses;
```
### Table:Teachers
``` sql
CREATE TABLE Teachers(
teacher_id  INT PRIMARY KEY,
first_name  VARCHAR(25) NOT NULL,
last_name   VARCHAR(25) NOT NULL,
department  VARCHAR(50),
hire_date   DATE,
email       TEXT ,
phone       VARCHAR(15) UNIQUE
);

SELECT * FROM Teachers;
```
### Table:Enrollments
``` sql
CREATE TABLE Enrollments(
enrollment_id    INT PRIMARY KEY,
student_id       INT,
course_id        INT,
enrollment_date  DATE,
grade            VARCHAR(15),
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

SELECT * FROM Enrollments;
```
### Table:Class_schedule
``` sql
CREATE TABLE Class_schedule(
schedule_id  INT PRIMARY KEY,
course_id    INT,
teacher_id   INT,
day_of_week  VARCHAR(15),
start_time   TIME,
end_time     TIME,
room_number  VARCHAR(25),
FOREIGN KEY (course_id) REFERENCES Courses(course_id),
FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

SELECT * FROM Class_schedule;
```
#### 1. List all students sorted by last name alphabetically.
``` sql
SELECT * FROM Students
ORDER BY last_name;
```
#### 2. Show all courses offered by the Science department.
``` sql
SELECT * FROM Courses
WHERE department='Science';
```
#### 3. Find all teachers hired before 2020.
``` sql
SELECT * FROM Teachers
WHERE YEAR(hire_date)<'2021';
```
#### 4. Display students who enrolled in 2023.
``` sql
SELECT * FROM Students
WHERE YEAR(enrollment_date)=2023;
```
#### 5. Count how many female students are in the system.
``` sql
SELECT gender, COUNT(*) AS Total_Students FROM Students
GROUP BY gender
HAVING gender='Female';
```
#### 6. Find students born between 2005-2007.
``` sql
SELECT * FROM Students
WHERE YEAR(date_of_birth) BETWEEN '2005' AND '2007';
```
#### 7. List courses with more than 3 credit hours.
``` sql
SELECT * FROM Courses
WHERE credit_hours>3;
```
#### 8. Show teachers sorted by their years of service (longest first).
``` sql
SELECT *, TIMESTAMPDIFF(YEAR,hire_date,NOW()) AS Years_of_Service FROM Teachers
ORDER BY Years_of_Service DESC;
```
#### 9. Find all enrollments with grades of 'A' or 'A-'.
``` sql
SELECT * FROM Enrollments
WHERE grade='A' OR grade='A-'
ORDER BY grade;
```
#### 10. Display students who haven't provided an email address.
``` sql
SELECT * FROM Students
WHERE email IS NULL;
```
#### 11. List all enrollments with student names and course names.
``` sql
SELECT
CONCAT(s.first_name,' ',s.last_name) AS Student_Name,
c.course_name, e.*
FROM Enrollments e
JOIN Students s
ON s.student_id=e.student_id
JOIN Courses c
ON c.course_id=e.course_id;
```
#### 12. Show class schedules with teacher names and room numbers.
``` sql
SELECT
CONCAT(t.first_name,' ',t.last_name) AS Teacher_Name,cs.*
FROM Class_schedule cs
JOIN Teachers t
ON t.teacher_id=cs.teacher_id;
```
#### 13. Find which courses each student is taking (student name + course name).
``` sql
SELECT
CONCAT(s.first_name,' ',s.last_name) AS Student_Name,c.course_name
FROM Enrollments e
JOIN Students s
ON s.student_id=e.student_id
JOIN Courses c
ON c.course_id=e.course_id
ORDER BY CONCAT(s.first_name,' ',s.last_name);
```
#### 14. Display teachers along with the courses they teach.
``` sql
SELECT
CONCAT(t.first_name,' ',t.last_name) AS Teacher_Name,c.course_name
FROM Teachers t
LEFT JOIN Class_schedule cs
ON t.Teacher_id=cs.Teacher_id
LEFT JOIN Courses c
ON c.course_id=cs.course_id
ORDER BY CONCAT(t.first_name,' ',t.last_name);
```
#### 15. List students with their guardians' contact information.
``` sql
SELECT student_id, CONCAT(first_name,' ',last_name) AS Student_Name,guardian_name FROM Students;
```
#### 16. Calculate the average grade for each course.
``` sql
SELECT
c.course_name,
CASE
WHEN AVG(CASE grade
WHEN 'A' THEN 4.0 WHEN 'A-' THEN 3.7 WHEN 'B+' THEN 3.3 WHEN 'B' THEN 3.0 WHEN 'B-' THEN 2.7
WHEN 'C+' THEN 2.3 WHEN 'C' THEN 2.0 WHEN 'C-' THEN 1.7 WHEN 'D+' THEN 1.3 WHEN 'D' THEN 1.0
ELSE 0
END)>= 3.9  THEN 'A'
WHEN AVG(CASE grade
WHEN 'A' THEN 4.0 WHEN 'A-' THEN 3.7 WHEN 'B+' THEN 3.3 WHEN 'B' THEN 3.0 WHEN 'B-' THEN 2.7
WHEN 'C+' THEN 2.3 WHEN 'C' THEN 2.0 WHEN 'C-' THEN 1.7 WHEN 'D+' THEN 1.3 WHEN 'D' THEN 1.0
ELSE 0
END)>= 3.7  THEN 'A-'
WHEN AVG(CASE grade
WHEN 'A' THEN 4.0 WHEN 'A-' THEN 3.7 WHEN 'B+' THEN 3.3 WHEN 'B' THEN 3.0 WHEN 'B-' THEN 2.7
WHEN 'C+' THEN 2.3 WHEN 'C' THEN 2.0 WHEN 'C-' THEN 1.7 WHEN 'D+' THEN 1.3 WHEN 'D' THEN 1.0
ELSE 0
END)>= 3.3  THEN 'B+'
WHEN AVG(CASE grade
WHEN 'A' THEN 4.0 WHEN 'A-' THEN 3.7 WHEN 'B+' THEN 3.3 WHEN 'B' THEN 3.0 WHEN 'B-' THEN 2.7
WHEN 'C+' THEN 2.3 WHEN 'C' THEN 2.0 WHEN 'C-' THEN 1.7 WHEN 'D+' THEN 1.3 WHEN 'D' THEN 1.0
ELSE 0
END)>= 3.0  THEN 'B'
WHEN AVG(CASE grade
WHEN 'A' THEN 4.0 WHEN 'A-' THEN 3.7 WHEN 'B+' THEN 3.3 WHEN 'B' THEN 3.0 WHEN 'B-' THEN 2.7
WHEN 'C+' THEN 2.3 WHEN 'C' THEN 2.0 WHEN 'C-' THEN 1.7 WHEN 'D+' THEN 1.3 WHEN 'D' THEN 1.0
ELSE 0
END)>= 2.7  THEN 'B-'
WHEN AVG(CASE grade
WHEN 'A' THEN 4.0 WHEN 'A-' THEN 3.7 WHEN 'B+' THEN 3.3 WHEN 'B' THEN 3.0 WHEN 'B-' THEN 2.7
WHEN 'C+' THEN 2.3 WHEN 'C' THEN 2.0 WHEN 'C-' THEN 1.7 WHEN 'D+' THEN 1.3 WHEN 'D' THEN 1.0
ELSE 0
END)>= 2.3  THEN 'C+'
WHEN AVG(CASE grade
WHEN 'A' THEN 4.0 WHEN 'A-' THEN 3.7 WHEN 'B+' THEN 3.3 WHEN 'B' THEN 3.0 WHEN 'B-' THEN 2.7
WHEN 'C+' THEN 2.3 WHEN 'C' THEN 2.0 WHEN 'C-' THEN 1.7 WHEN 'D+' THEN 1.3 WHEN 'D' THEN 1.0
ELSE 0
END)>= 2.0  THEN 'C'
WHEN AVG(CASE grade
WHEN 'A' THEN 4.0 WHEN 'A-' THEN 3.7 WHEN 'B+' THEN 3.3 WHEN 'B' THEN 3.0 WHEN 'B-' THEN 2.7
WHEN 'C+' THEN 2.3 WHEN 'C' THEN 2.0 WHEN 'C-' THEN 1.7 WHEN 'D+' THEN 1.3 WHEN 'D' THEN 1.0
ELSE 0
END)>= 1.7  THEN 'C-'
WHEN AVG(CASE grade
WHEN 'A' THEN 4.0 WHEN 'A-' THEN 3.7 WHEN 'B+' THEN 3.3 WHEN 'B' THEN 3.0 WHEN 'B-' THEN 2.7
WHEN 'C+' THEN 2.3 WHEN 'C' THEN 2.0 WHEN 'C-' THEN 1.7 WHEN 'D+' THEN 1.3 WHEN 'D' THEN 1.0
ELSE 0
END)>= 1.3  THEN 'D+'
WHEN AVG(CASE grade
WHEN 'A' THEN 4.0 WHEN 'A-' THEN 3.7 WHEN 'B+' THEN 3.3 WHEN 'B' THEN 3.0 WHEN 'B-' THEN 2.7
WHEN 'C+' THEN 2.3 WHEN 'C' THEN 2.0 WHEN 'C-' THEN 1.7 WHEN 'D+' THEN 1.3 WHEN 'D' THEN 1.0
ELSE 0
END)>= 1.0  THEN 'D'
ELSE 'F'
END AS Average_grade
FROM Enrollments e
JOIN Courses c
ON c.course_id=e.course_id
GROUP BY c.course_name
ORDER BY Average_Grade;
```
#### 17. Count how many students are enrolled in each course.
``` sql
SELECT
c.course_name, COUNT(s.student_id) AS Total_Students
FROM Enrollments e
JOIN Students s
ON s.student_id=e.student_id
JOIN Courses c
ON c.course_id=e.course_id
GROUP BY c.course_name
ORDER BY c.course_name;
```
#### 18. Find the most popular department by enrollment numbers.
``` sql
SELECT
c.department,COUNT(e.enrollment_id) AS Total_Enrollments
FROM Enrollments e
JOIN Courses c
ON c.course_id=e.course_id
GROUP BY c.department
ORDER BY Total_Enrollments DESC
LIMIT 2;
```
#### 19. Show the distribution of grades across all enrollments.
``` sql
SELECT grade, COUNT(*) AS Total_Enrollments FROM Enrollments
GROUP BY grade
ORDER BY grade;
```
#### 20. Calculate the total credit hours each student is taking.
``` sql
SELECT
CONCAT(s.first_name,' ',s.last_name) AS Student_Name, SUM(c.credit_hours) AS Total_Credit_Hours
FROM Students s
LEFT JOIN Enrollments e
ON s.student_id=e.student_id
LEFT JOIN Courses c
ON c.course_id=e.course_id
GROUP BY Student_Name
ORDER BY Student_Name;
```
## Conclusion
This project successfully demonstrates the practical application of relational database design and SQL for managing a school system. By implementing a well-structured schema and executing a diverse set of queries, the project showcases how institutions like GWHS can benefit from automated, data-driven decision-making. Key functionalities such as GPA calculations, enrollment analysis, and course scheduling are efficiently handled. This SQL-based solution lays a solid foundation for scaling further into more advanced features such as attendance tracking, parent communication, and student progress dashboards.


