-- =====================================================================
-- DATABASE INITIALIZATION (Agreed on by the team)
-- =====================================================================
CREATE DATABASE IF NOT EXISTS alu_db;
USE alu_db;

-- =====================================================================
-- DEPENDENCY PLACEHOLDER (Classroom table must exist first)
-- =====================================================================
CREATE TABLE IF NOT EXISTS Classroom (
    classroom_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    building VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);

-- Member B's classroom sample data placeholder (needed to avoid FK errors)
INSERT IGNORE INTO Classroom (classroom_id, room_number, building, capacity) VALUES
(1, 'Room 101', 'Science Block', 30),
(2, 'Room 102', 'Science Block', 45),
(3, 'Lab A', 'Innovation Hub', 25),
(4, 'Aud-Max', 'Main Campus', 150),
(5, 'Room 201', 'Arts Building', 35);


-- =====================================================================
-- MEMBER 1 (Member A): Students Table Setup & Tasks
-- =====================================================================

-- 1. Create Students Table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    classroom_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id) ON DELETE SET NULL
);

-- 2. Insert 5 Sample Rows
INSERT INTO Students (name, email, classroom_id, enrollment_date) VALUES
('Alice Zubery', 'azubery@alu.edu', 1, '2025-09-01'),
('Bob Mensah', 'bmensah@alu.edu', 2, '2025-09-01'),
('Charlie Ndiaye', 'cndiaye@alu.edu', 3, '2026-01-15'),
('Diana Kamau', 'dkamau@alu.edu', 1, '2025-09-01'),
('Evans Osei', 'eosei@alu.edu', 4, '2026-01-15');

-- 3. One UPDATE statement
UPDATE Students 
SET email = 'alice.z@alu.edu' 
WHERE student_id = 1;

-- 4. One DELETE statement
DELETE FROM Students 
WHERE student_id = 5; 

-- 5. One SELECT query with a WHERE clause
SELECT * FROM Students 
WHERE enrollment_date >= '2026-01-01';