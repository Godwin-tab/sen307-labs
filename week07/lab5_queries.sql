
-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: Godwin Jacob Ufedo-ojo
-- Matric: VUG/SEN/24/12865
-- ============================================

USE sen307_vug_sen_24_12865;


-- ============================================
-- TASK 1: Students in one department, sorted A-Z
-- ============================================

-- Explanation: This query displays students in the Software Engineering
-- department and arranges their names alphabetically.

SELECT
    s.full_name,
    s.matric_no,
    d.dept_name
FROM Student AS s
INNER JOIN Department AS d
    ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;


-- ============================================
-- TASK 2: Courses with their lecturers (INNER JOIN)
-- ============================================

-- Explanation: This query joins Course, CourseAllocation and Lecturer
-- to display each course alongside the lecturer teaching it.

SELECT
    c.course_title,
    l.full_name AS lecturer_name
FROM Course AS c
INNER JOIN CourseAllocation AS ca
    ON c.course_id = ca.course_id
INNER JOIN Lecturer AS l
    ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_title ASC;


-- ============================================
-- TASK 3: Students and their courses (LEFT JOIN)
-- ============================================

-- Explanation: LEFT JOIN displays every student, including those
-- who have not enrolled in any course.

SELECT
    s.full_name,
    c.course_title
FROM Student AS s
LEFT JOIN Enrolment AS e
    ON s.student_id = e.student_id
LEFT JOIN Course AS c
    ON e.course_id = c.course_id
ORDER BY s.full_name ASC;


-- TASK 3 (ADDITIONAL): Students without enrolments
-- Explanation: IS NULL identifies students who do not have
-- an enrolled course.

SELECT
    s.full_name,
    s.matric_no
FROM Student AS s
LEFT JOIN Enrolment AS e
    ON s.student_id = e.student_id
LEFT JOIN Course AS c
    ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name ASC;


-- ============================================
-- TASK 4: Filtering with AND, IN and BETWEEN
-- ============================================

-- Explanation: This query finds female students in Software Engineering
-- or Artificial Intelligence who were born between 2004 and 2005.

SELECT
    full_name,
    matric_no,
    gender,
    dept_id,
    date_of_birth
FROM Student
WHERE gender = 'F'
AND dept_id IN (1, 3)
AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY full_name ASC;


-- ============================================
-- TASK 5: Pagination - Page 1 (Rows 1-10)
-- ============================================

-- Explanation: LIMIT displays only 10 enrolments.
-- OFFSET 0 starts from the first record.

SELECT *
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 0;


-- ============================================
-- TASK 5: Pagination - Page 2 (Rows 11-20)
-- ============================================

-- Explanation: OFFSET 10 skips the first 10 records
-- and displays the next 10 records.

SELECT *
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 10;


-- Explanation: ORDER BY is important when using LIMIT
-- because it ensures that records appear in a consistent
-- order when moving between pages.


-- ============================================
-- OPTIONAL CHALLENGE: RIGHT JOIN
-- ============================================

-- Explanation: RIGHT JOIN keeps every student from the
-- Student table, even when they have no enrolments.
-- The LEFT JOIN version is easier to read because Student
-- appears first as the main table.

SELECT
    s.full_name,
    c.course_title
FROM Enrolment AS e
RIGHT JOIN Student AS s
    ON e.student_id = s.student_id
LEFT JOIN Course AS c
    ON e.course_id = c.course_id
ORDER BY s.full_name ASC;
