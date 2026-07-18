-- =====================================================================
-- ALU DATABASE SCHEMA GROUP ASSIGNMENT
-- =====================================================================

-- 1. DATABASE CREATION
CREATE DATABASE IF NOT EXISTS alu_db;
USE alu_db;

-- =====================================================================
-- STEP 1: CREATE TABLES (IN DEPENDENCY ORDER)
-- =====================================================================

-- [MEMBER 2] CREATE CLASSROOM TABLE (No dependencies)
CREATE TABLE Classroom (
    classroom_id INT NOT NULL AUTO_INCREMENT,
    room_number VARCHAR(10) NOT NULL,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL,
    PRIMARY KEY (classroom_id)
);

-- [MEMBER 3] CREATE FACULTY TABLE (No dependencies)
CREATE TABLE Faculty (
    faculty_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    department VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (faculty_id)
);

-- [MEMBER 1] CREATE STUDENTS TABLE (Depends on Classroom)
CREATE TABLE Students (
    student_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    classroom_id INT,
    enrollment_date DATE NOT NULL,
    PRIMARY KEY (student_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- Note: Members 4 and 5 will append their CREATE TABLE blocks for 
-- Courses, Extra_Curricular_Activities, and Junction Tables here.


-- =====================================================================
-- STEP 2: INSERT SAMPLE DATA (At least 5 rows per table)
-- =====================================================================

-- [MEMBER 2] CLASSROOM INSERTS
INSERT INTO Classroom (room_number, building, capacity) VALUES
('Lab 101', 'Kigali Innovation City', 45),
('Lab 102', 'Kigali Innovation City', 30),
('Room 201', 'Bakhita Building', 50),
('Room 202', 'Bakhita Building', 40),
('Room 301', 'Leadership Center', 25);

-- [MEMBER 3] FACULTY INSERTS
INSERT INTO Faculty (first_name, last_name, email, phone, department, hire_date) VALUES
('Alice', 'Mugisha', 'a.mugisha@alu.edu', '+250780001001', 'Computer Science', '2018-08-01'),
('Bernard', 'Nkurunziza', 'b.nkuru@alu.edu', '+250780001002', 'Mathematics', '2019-01-15'),
('Claire', 'Uwase', 'c.uwase@alu.edu', '+250780001003', 'Business', '2020-03-10'),
('David', 'Habinana', 'd.habimana@alu.edu', '+250780001004', 'Engineering', '2017-06-22'),
('Esther', 'Ingabire', 'e.ingabire@alu.edu', '+250780001005', 'Liberal Arts', '2021-09-01');

-- Member 1, 4, and 5 will add their INSERT INTO statements below...


-- =====================================================================
-- STEP 3: INDIVIDUAL MEMBER ACTIONS (SELECT, UPDATE, DELETE)
-- =====================================================================

-- ---------------------------------------------------------------------
-- MEMBER 2 (Classroom) Operations
-- ---------------------------------------------------------------------
-- SELECT with WHERE
SELECT * FROM Classroom WHERE capacity >= 40;

-- UPDATE 
UPDATE Classroom SET capacity = 35 WHERE room_number = 'Lab 102';

-- DELETE
DELETE FROM Classroom WHERE room_number = 'Room 301';


-- ---------------------------------------------------------------------
-- MEMBER 3 (Faculty) Operations
-- ---------------------------------------------------------------------
-- UPDATE: change Claire's department
UPDATE Faculty SET department = 'Entrepreneurship' WHERE faculty_id = 3;

-- DELETE: remove Esther
DELETE FROM Faculty WHERE faculty_id = 5;

-- SELECT with WHERE: find all faculty in Computer Science
SELECT faculty_id, first_name, last_name, email, hire_date 
FROM Faculty 
WHERE department = 'Computer Science';


-- =====================================================================
-- STEP 4: GROUP QUERIES & NORMALIZATION
-- (To be completed together by the group at the bottom)
-- =====================================================================
/* 
GROUP NORMALIZATION PARAGRAPH:
Our database schema achieves 3NF (Third Normal Form) efficiency. Each foundational entity 
isolates its attributes to ensure data is stored in exactly one logical place without redundant duplication. 
To resolve the complex many-to-many relationships existing between Students and Courses, 
as well as Students and Extra-Curricular Activities, we deployed distinct operational junction 
tables (Student_Courses and Student_Activities). This structure successfully eliminates repeated multi-valued 
arrays, relying strictly on foreign key pairings to scale relationships cleanly.
*/