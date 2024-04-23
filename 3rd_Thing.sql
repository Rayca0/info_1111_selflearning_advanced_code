-- Create database for University Administration System
CREATE DATABASE UniversityDatabase;
USE UniversityDatabase;

-- Create tables for Students, Professors, Courses, and Enrollments
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Professors (
    ProfessorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100),
    ProfessorID INT,
    FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade FLOAT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert sample data into tables
INSERT INTO Students (FirstName, LastName, Email) VALUES 
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

INSERT INTO Professors (FirstName, LastName, Email) VALUES 
('Michael', 'Johnson', 'michael.johnson@example.com'),
('Emily', 'Brown', 'emily.brown@example.com');

INSERT INTO Courses (CourseName, ProfessorID) VALUES 
('Introduction to Computer Science', 1),
('Database Management', 2);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES 
(1, 1, 85),
(2, 2, 78);

-- Select all students and their enrolled courses
SELECT Students.FirstName, Students.LastName, Courses.CourseName 
FROM Students 
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID 
JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- Update grade for a specific student's enrollment
UPDATE Enrollments 
SET Grade = 90 
WHERE StudentID = 1 AND CourseID = 1;

-- Delete related enrollments first
DELETE FROM Enrollments WHERE StudentID = 2;

-- Now delete the student
DELETE FROM Students WHERE StudentID = 2;

-- Order students by last name
SELECT * FROM Students ORDER BY LastName;

-- Control flow: Update grade only if it's greater than the previous grade
UPDATE Enrollments
SET Grade = CASE
    WHEN Grade < 90 THEN 90
    ELSE Grade
    END
WHERE CourseID = 1;

-- Select students with grades above 80
SELECT Students.FirstName, Students.LastName, Enrollments.Grade
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
WHERE Enrollments.Grade > 80;




