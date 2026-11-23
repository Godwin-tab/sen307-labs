--Godwin Jacob Ufedo-ojo
--VUG/SEN/24/12865

--task 1
SELECT
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
ORDER BY total_students DESC;

--Task 2
SELECT
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 3;

--Task 2B
SELECT
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 5;

--Task 2C
SELECT
    c.course_title,
    COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e
    ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 7;


--Task 3
SELECT
    s.full_name,
    COUNT(e.course_id) AS course_count
FROM Student s
LEFT JOIN Enrolment e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.full_name;

--Task 3B
SELECT
    ROUND(AVG(course_count), 2) AS average_courses
FROM (
    SELECT
        s.student_id,
        COUNT(e.course_id) AS course_count
    FROM Student s
    LEFT JOIN Enrolment e
        ON s.student_id = e.student_id
    GROUP BY s.student_id
) AS per_student;

--Task 4
SELECT
    s.student_id,
    s.full_name
FROM Student s
WHERE s.student_id NOT IN (
    SELECT student_id
    FROM Enrolment
);

--Task 5
-- TASK 5: Find the student with the highest number of enrolments in each department

SELECT
    d.dept_name,
    s.full_name,
    (
        SELECT COUNT(*)
        FROM Enrolment e
        WHERE e.student_id = s.student_id
    ) AS courses

FROM Student s
JOIN Department d
    ON s.dept_id = d.dept_id

WHERE (
    SELECT COUNT(*)
    FROM Enrolment e
    WHERE e.student_id = s.student_id
) = (

    SELECT COUNT(e2.student_id)
    FROM Student s2
    LEFT JOIN Enrolment e2
        ON s2.student_id = e2.student_id
    WHERE s2.dept_id = s.dept_id
    GROUP BY s2.student_id
    ORDER BY COUNT(e2.student_id) DESC
    LIMIT 1

)

ORDER BY d.dept_name;