CREATE DATABASE GWHS_db;
USE GWHS_db;

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

INSERT INTO Students VALUES
	(1001, 'John', 'Smith', '2005-03-12', 'Male', '123 Main St, Boston', '2023-09-01', 'john.smith@school.edu', '555-1001', 'Robert Smith'),
	(1002, 'Emily', 'Johnson', '2006-07-25', 'Female', '456 Oak Ave, Cambridge', '2023-09-01', 'emily.j@school.edu', '555-1002', 'Susan Johnson'),
	(1003, 'Michael', 'Williams', '2004-11-30', 'Male', '789 Pine Rd, Somerville', '2023-09-01', NULL, '555-1003', 'James Williams'),
	(1004, 'Sarah', 'Brown', '2007-01-18', 'Female', '321 Elm St, Boston', '2023-09-01', 'sarah.b@school.edu', '555-1004', 'Lisa Brown'),
	(1005, 'David', 'Jones', '2005-09-05', 'Male', '654 Maple Dr, Brookline', '2023-09-01', 'david.j@school.edu', '555-1005', 'Thomas Jones'),
	(1006, 'Jessica', 'Garcia', '2006-04-22', 'Female', '987 Cedar Ln, Newton', '2023-09-01', 'jessica.g@school.edu', '555-1006', 'Maria Garcia'),
	(1007, 'Daniel', 'Martinez', '2004-12-08', 'Male', '159 Birch St, Quincy', '2023-09-01', NULL, '555-1007', 'Carlos Martinez'),
	(1008, 'Olivia', 'Davis', '2007-02-14', 'Female', '753 Walnut Ave, Waltham', '2023-09-01', 'olivia.d@school.edu', '555-1008', 'Jennifer Davis'),
	(1009, 'Ethan', 'Rodriguez', '2005-08-03', 'Male', '852 Spruce Blvd, Medford', '2023-09-01', 'ethan.r@school.edu', '555-1009', 'Juan Rodriguez'),
	(1010, 'Sophia', 'Wilson', '2006-05-19', 'Female', '426 Oak St, Arlington', '2023-09-01', NULL, '555-1010', 'Patricia Wilson'),
	(1011, 'Matthew', 'Anderson', '2004-10-27', 'Male', '963 Pine Ave, Lexington', '2023-09-01', 'matthew.a@school.edu', '555-1011', 'Richard Anderson'),
	(1012, 'Ava', 'Thomas', '2007-03-09', 'Female', '741 Elm Dr, Watertown', '2023-09-01', 'ava.t@school.edu', '555-1012', 'Nancy Thomas'),
	(1013, 'Andrew', 'Taylor', '2005-06-15', 'Male', '258 Maple Ln, Belmont', '2023-09-01', NULL, '555-1013', 'Paul Taylor'),
	(1014, 'Isabella', 'Moore', '2006-01-31', 'Female', '369 Cedar Rd, Needham', '2023-09-01', 'isabella.m@school.edu', '555-1014', 'Karen Moore'),
	(1015, 'James', 'Jackson', '2004-09-24', 'Male', '852 Birch Ave, Wellesley', '2023-09-01', 'james.j@school.edu', '555-1015', 'Kevin Jackson'),
	(1016, 'Charlotte', 'White', '2007-04-17', 'Female', '147 Walnut St, Framingham', '2023-09-01', NULL, '555-1016', 'Laura White'),
	(1017, 'Benjamin', 'Harris', '2005-02-28', 'Male', '753 Spruce Dr, Natick', '2023-09-01', 'benjamin.h@school.edu', '555-1017', 'Steven Harris'),
	(1018, 'Mia', 'Martin', '2006-11-12', 'Female', '426 Pine Blvd, Dedham', '2023-09-01', 'mia.m@school.edu', '555-1018', 'Amy Martin'),
	(1019, 'Alexander', 'Lee', '2004-07-06', 'Male', '963 Elm Ave, Milton', '2023-09-01', NULL, '555-1019', 'Edward Lee'),
	(1020, 'Amelia', 'Thompson', '2007-05-20', 'Female', '741 Oak Ln, Braintree', '2023-09-01', 'amelia.t@school.edu', '555-1020', 'Rebecca Thompson');
	
CREATE TABLE Courses(
    course_id    INT PRIMARY KEY,
    course_name  VARCHAR(50) NOT NULL,
    course_code  VARCHAR(15) NOT NULL,
    department   VARCHAR(50),
    credit_hours INT,
    description  TEXT
);

SELECT * FROM Courses;

INSERT INTO Courses VALUES
	(101, 'Mathematics', 'MATH101', 'Science', 4, 'Algebra and Calculus fundamentals'),
	(102, 'English Literature', 'ENG102', 'Humanities', 3, 'Classic and modern literature studies'),
	(103, 'Physics', 'PHY103', 'Science', 4, 'Mechanics, thermodynamics, and electromagnetism'),
	(104, 'History', 'HIS104', 'Humanities', 3, 'World history from ancient to modern times'),
	(105, 'Computer Science', 'CS105', 'Technology', 4, 'Programming and algorithms'),
	(106, 'Biology', 'BIO106', 'Science', 4, 'Cell biology, genetics, and ecology'),
	(107, 'Chemistry', 'CHE107', 'Science', 4, 'Organic and inorganic chemistry principles'),
	(108, 'Economics', 'ECO108', 'Social Sciences', 3, 'Micro and macroeconomics'),
	(109, 'Art', 'ART109', 'Arts', 2, 'Drawing, painting, and art history'),
	(110, 'Physical Education', 'PE110', 'Sports', 1, 'Fitness and team sports');

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

INSERT INTO Teachers VALUES
	(501, 'Robert', 'Miller', 'Science', '2018-08-15', 'r.miller@school.edu', '555-2001'),
	(502, 'Lisa', 'Davis', 'Humanities', '2019-01-20', 'l.davis@school.edu', '555-2002'),
	(503, 'James', 'Wilson', 'Science', '2017-09-10', 'j.wilson@school.edu', '555-2003'),
	(504, 'Jennifer', 'Taylor', 'Arts', '2020-03-05', 'j.taylor@school.edu', '555-2004'),
	(505, 'Thomas', 'Anderson', 'Technology', '2016-07-12', 't.anderson@school.edu', '555-2005'),
	(506, 'Patricia', 'Jackson', 'Social Sciences', '2018-11-30', 'p.jackson@school.edu', '555-2006'),
	(507, 'Richard', 'White', 'Science', '2019-04-22', 'r.white@school.edu', '555-2007'),
	(508, 'Susan', 'Harris', 'Humanities', '2021-02-18', 's.harris@school.edu', '555-2008'),
	(509, 'Daniel', 'Martin', 'Sports', '2017-08-25', 'd.martin@school.edu', '555-2009'),
	(510, 'Nancy', 'Thompson', 'Arts', '2020-05-14', 'n.thompson@school.edu', '555-2010');

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

INSERT INTO Enrollments VALUES
	(1, 1001, 101, '2023-09-01', 'A'),
	(2, 1001, 103, '2023-09-01', 'B+'),
	(3, 1002, 102, '2023-09-01', 'A-'),
	(4, 1002, 104, '2023-09-01', 'B'),
	(5, 1003, 105, '2023-09-01', 'A'),
	(6, 1003, 107, '2023-09-01', 'C+'),
	(7, 1004, 106, '2023-09-01', 'B+'),
	(8, 1004, 108, '2023-09-01', 'A-'),
	(9, 1005, 101, '2023-09-01', 'B'),
	(10, 1005, 110, '2023-09-01', 'A'),
	(11, 1006, 102, '2023-09-01', 'A'),
	(12, 1006, 109, '2023-09-01', 'B+'),
	(13, 1007, 103, '2023-09-01', 'C'),
	(14, 1007, 105, '2023-09-01', 'B-'),
	(15, 1008, 104, '2023-09-01', 'A'),
	(16, 1008, 106, '2023-09-01', 'B'),
	(17, 1009, 107, '2023-09-01', 'A-'),
	(18, 1009, 108, '2023-09-01', 'B+'),
	(19, 1010, 109, '2023-09-01', 'A'),
	(20, 1010, 110, '2023-09-01', 'A'),
	(21, 1011, 101, '2023-09-01', 'B+'),
	(22, 1011, 103, '2023-09-01', 'A'),
	(23, 1012, 102, '2023-09-01', 'B'),
	(24, 1012, 104, '2023-09-01', 'C+'),
	(25, 1013, 105, '2023-09-01', 'A-'),
	(26, 1013, 107, '2023-09-01', 'B'),
	(27, 1014, 106, '2023-09-01', 'A'),
	(28, 1014, 108, '2023-09-01', 'B+'),
	(29, 1015, 109, '2023-09-01', 'C'),
	(30, 1015, 110, '2023-09-01', 'A');

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

INSERT INTO Class_schedule VALUES
	(1, 101, 501, 'Monday', '09:00:00', '10:30:00', 'Room 101'),
	(2, 101, 501, 'Wednesday', '09:00:00', '10:30:00', 'Room 101'),
	(3, 102, 502, 'Tuesday', '11:00:00', '12:30:00', 'Room 102'),
	(4, 102, 502, 'Thursday', '11:00:00', '12:30:00', 'Room 102'),
	(5, 103, 503, 'Monday', '13:00:00', '14:30:00', 'Room 103'),
	(6, 103, 503, 'Wednesday', '13:00:00', '14:30:00', 'Room 103'),
	(7, 104, 508, 'Tuesday', '10:00:00', '11:30:00', 'Room 104'),
	(8, 104, 508, 'Friday', '10:00:00', '11:30:00', 'Room 104'),
	(9, 105, 505, 'Monday', '14:00:00', '15:30:00', 'Room 105'),
	(10, 105, 505, 'Thursday', '14:00:00', '15:30:00', 'Room 105'),
	(11, 106, 507, 'Tuesday', '08:00:00', '09:30:00', 'Room 106'),
	(12, 106, 507, 'Friday', '08:00:00', '09:30:00', 'Room 106'),
	(13, 107, 503, 'Wednesday', '11:00:00', '12:30:00', 'Room 107'),
	(14, 107, 503, 'Friday', '11:00:00', '12:30:00', 'Room 107'),
	(15, 108, 506, 'Monday', '10:00:00', '11:30:00', 'Room 108'),
	(16, 108, 506, 'Thursday', '10:00:00', '11:30:00', 'Room 108'),
	(17, 109, 504, 'Tuesday', '13:00:00', '14:30:00', 'Room 109'),
	(18, 109, 504, 'Friday', '13:00:00', '14:30:00', 'Room 109'),
	(19, 110, 509, 'Wednesday', '15:00:00', '16:30:00', 'Gym'),
	(20, 110, 509, 'Friday', '15:00:00', '16:30:00', 'Gym');


-- 1. List all students sorted by last name alphabetically.
SELECT * FROM Students
ORDER BY last_name;

-- 2. Show all courses offered by the Science department.
SELECT * FROM Courses
WHERE department='Science';

-- 3. Find all teachers hired before 2020.
SELECT * FROM Teachers
WHERE YEAR(hire_date)<'2021';

-- 4. Display students who enrolled in 2023.
SELECT * FROM Students
WHERE YEAR(enrollment_date)=2023;

-- 5. Count how many female students are in the system.
SELECT gender, COUNT(*) AS Total_Students FROM Students
GROUP BY gender
HAVING gender='Female';

-- 6. Find students born between 2005-2007.
SELECT * FROM Students
WHERE YEAR(date_of_birth) BETWEEN '2005' AND '2007';

-- 7. List courses with more than 3 credit hours.
SELECT * FROM Courses
WHERE credit_hours>3;

-- 8. Show teachers sorted by their years of service (longest first).
SELECT *, TIMESTAMPDIFF(YEAR,hire_date,NOW()) AS Years_of_Service FROM Teachers
ORDER BY Years_of_Service DESC;

-- 9. Find all enrollments with grades of 'A' or 'A-'.
SELECT * FROM Enrollments
WHERE grade='A' OR grade='A-'
ORDER BY grade;

-- 10. Display students who haven't provided an email address.
SELECT * FROM Students
WHERE email IS NULL;

-- 11. List all enrollments with student names and course names.
SELECT 
	CONCAT(s.first_name,' ',s.last_name) AS Student_Name,
    c.course_name, e.*
FROM Enrollments e
JOIN Students s 
ON s.student_id=e.student_id
JOIN Courses c 
ON c.course_id=e.course_id;

-- 12. Show class schedules with teacher names and room numbers.
SELECT 
	CONCAT(t.first_name,' ',t.last_name) AS Teacher_Name,cs.*
FROM Class_schedule cs
JOIN Teachers t 
ON t.teacher_id=cs.teacher_id;

-- 13. Find which courses each student is taking (student name + course name).
SELECT 
	CONCAT(s.first_name,' ',s.last_name) AS Student_Name,c.course_name
FROM Enrollments e
JOIN Students s 
ON s.student_id=e.student_id
JOIN Courses c 
ON c.course_id=e.course_id
ORDER BY CONCAT(s.first_name,' ',s.last_name);

-- 14. Display teachers along with the courses they teach.
SELECT 
	CONCAT(t.first_name,' ',t.last_name) AS Teacher_Name,c.course_name
FROM Teachers t
LEFT JOIN Class_schedule cs 
ON t.Teacher_id=cs.Teacher_id
LEFT JOIN Courses c 
ON c.course_id=cs.course_id
ORDER BY CONCAT(t.first_name,' ',t.last_name);

-- 15. List students with their guardians' contact information.
SELECT student_id, CONCAT(first_name,' ',last_name) AS Student_Name,guardian_name FROM Students;

-- 16. Calculate the average grade for each course.
SELECT 
	Average_marks,
    c.course_name
FROM Enrollments e
JOIN Courses c 
ON c.course_id=e.course_id
GROUP BY c.course_name
ORDER BY AVG(e.grade);

-- 17. Count how many students are enrolled in each course.
SELECT 
	c.course_name, COUNT(s.student_id) AS Total_Students
FROM Enrollments e
JOIN Students s 
ON s.student_id=e.student_id
JOIN Courses c 
ON c.course_id=e.course_id
GROUP BY c.course_name
ORDER BY c.course_name;

-- 18. Find the most popular department by enrollment numbers.
SELECT 
	c.department,COUNT(e.enrollment_id) AS Total_Enrollments
FROM Enrollments e
JOIN Courses c 
ON c.course_id=e.course_id
GROUP BY c.department
ORDER BY Total_Enrollments DESC
LIMIT 3;

-- 19. Show the distribution of grades across all enrollments.
SELECT grade, COUNT(*) AS Total_Enrollments FROM Enrollments
GROUP BY grade
ORDER BY grade;

-- 20. Calculate the total credit hours each student is taking.
SELECT 
	CONCAT(s.first_name,' ',s.last_name) AS Student_Name, SUM(c.credit_hours) AS Total_Credit_Hours
FROM Students s 
LEFT JOIN Enrollments e
ON s.student_id=e.student_id
LEFT JOIN Courses c 
ON c.course_id=e.course_id
GROUP BY Student_Name
ORDER BY Student_Name;
