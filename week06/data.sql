-- =============================================================
-- VUA-SEN307 DATABASE SYSTEMS - WEEK 6 PRACTICAL
-- Lab 4: Data Manipulation Language (DML)
-- Database: sen307_vug_sen_24_12865
-- Academic session used in the practical: 2026/2027
--
-- IMPORTANT:
-- The original INSERT statements for the departments, courses,
-- lecturers, students, enrolments and course allocations were
-- already executed successfully in MySQL Workbench.
-- Their full column lists and values are not available in this
-- conversation, so they are not recreated here. Do not invent or
-- rerun replacement INSERT statements against populated tables.
-- The queries below document the remaining confirmed operations
-- and provide final verification.
-- =============================================================

USE sen307_vug_sen_24_12865;

-- -------------------------------------------------------------
-- 1. INSERT DEPARTMENTS AND COURSES
-- -------------------------------------------------------------
-- Completed earlier in MySQL Workbench.
-- The five departments currently in the database are:
-- 1 Software Engineering
-- 2 Computer Science
-- 3 Artificial Intelligence
-- 4 Data Science
-- 5 Cybersecurity
-- Ten courses were also inserted and verified.
-- See the final verification queries at the bottom of this file.

-- -------------------------------------------------------------
-- 2. INSERT LECTURERS AND STUDENTS
-- -------------------------------------------------------------
-- Completed earlier in MySQL Workbench.
-- Ten lecturers and at least twenty students were verified.
-- The student's own record is:
-- VUG/SEN/24/12865 - Godwin Jacob Ufedo-ojo
-- Transfer Student already existed with matric_no 20239999.

-- -------------------------------------------------------------
-- 3. INSERT ENROLMENTS
-- -------------------------------------------------------------
-- Completed earlier in MySQL Workbench.
-- At least forty enrolment records were verified.

-- -------------------------------------------------------------
-- 4. INSERT COURSE ALLOCATIONS
-- -------------------------------------------------------------
-- Completed earlier in MySQL Workbench.
-- Course allocations were inserted and verified in Workbench.

-- -------------------------------------------------------------
-- 5. UPDATE A STUDENT'S DEPARTMENT
-- -------------------------------------------------------------
-- Ada Obi (matric_no 20231234) was moved from Computer Science
-- (dept_id 2) to Artificial Intelligence (dept_id 3).
UPDATE Student
SET dept_id = 3
WHERE matric_no = '20231234';

-- Verify Ada Obi's department assignment.
SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = '20231234';

-- -------------------------------------------------------------
-- 6. INSERT THE TEMPORARY DEPARTMENT / TRANSFER STUDENT
-- -------------------------------------------------------------
-- Transfer Student (20239999) already existed, so no duplicate
-- student row was inserted. The temporary department was created
-- with dept_id 57 during the practical.
-- This INSERT is retained for documentation. It is commented out
-- because the department has already been created and deleted.
-- INSERT INTO Department (dept_name)
-- VALUES ('Library and Information Science');

-- The following UPDATE was used to assign the existing student
-- to the temporary department (dept_id 57).
-- It is commented out because the temporary department is gone.
-- UPDATE Student
-- SET dept_id = 57
-- WHERE matric_no = '20239999';

-- -------------------------------------------------------------
-- 7. ATTEMPT TO DELETE THE TEMPORARY DEPARTMENT (ERROR 1451)
-- -------------------------------------------------------------
-- This statement was executed while Transfer Student still had
-- dept_id 57. MySQL returned Error 1451 because Student.dept_id
-- references Department.dept_id through a foreign key.
-- It is commented out so that rerunning this file does not stop
-- with the expected foreign-key error.
-- DELETE FROM Department
-- WHERE dept_id = 57;

-- -------------------------------------------------------------
-- 8. REASSIGN THE STUDENT AND DELETE THE TEMPORARY DEPARTMENT
-- -------------------------------------------------------------
-- The student was reassigned to Software Engineering (dept_id 1)
-- and the temporary department (dept_id 57) was then deleted.
-- These statements are commented out because both actions have
-- already been completed successfully.
-- UPDATE Student
-- SET dept_id = 1
-- WHERE matric_no = '20239999';
--
-- DELETE FROM Department
-- WHERE dept_id = 57;

-- -------------------------------------------------------------
-- 9. FINAL VERIFICATION QUERIES
-- -------------------------------------------------------------
SELECT COUNT(*) AS total_departments FROM Department;
SELECT COUNT(*) AS total_lecturers FROM Lecturer;
SELECT COUNT(*) AS total_students FROM Student;
SELECT COUNT(*) AS total_courses FROM Course;
SELECT COUNT(*) AS total_enrolments FROM Enrolment;
SELECT COUNT(*) AS total_allocations FROM CourseAllocation;

-- Confirm the five departments remaining after the temporary
-- department was deleted.
SELECT dept_id, dept_name
FROM Department
ORDER BY dept_id;

-- Confirm Ada Obi's updated department.
SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = '20231234';

-- Confirm Transfer Student was returned to Software Engineering.
SELECT student_id, matric_no, full_name, dept_id
FROM Student
WHERE matric_no = '20239999';

-- End of Week 6 Lab 4 data.sql
