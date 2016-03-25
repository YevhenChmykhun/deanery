USE deanery;

DROP VIEW IF EXISTS student_view;

CREATE VIEW student_view AS
  SELECT
    s.first_name,
    s.last_name,
    s.enrollment_year,
    e.`grant`,
    f.name AS faculty
  FROM
    education e
    INNER JOIN student s
      ON s.id = e.student_id
    INNER JOIN faculty f
      ON f.id = e.faculty_id
  ORDER BY s.last_name;

DROP VIEW IF EXISTS intermidiate_view_for_city;

CREATE VIEW intermidiate_view_for_city AS
SELECT
       c.name   AS city,
       COUNT(*) AS total,
       f.name   AS faculty
     FROM
       education e
       INNER JOIN faculty f
         ON f.id = e.faculty_id
       INNER JOIN student s
         ON s.id = e.student_id
       INNER JOIN city c
         ON c.id = s.city_id
     GROUP BY f.name, c.name;

DROP VIEW IF EXISTS city_view;

CREATE VIEW city_view AS
SELECT
    city,
    MAX(total) AS total,
    faculty
  FROM
    intermidiate_view_for_city
  GROUP BY city;

DROP VIEW IF EXISTS enrollment_year_statistic_view;

CREATE VIEW enrollment_year_statistic_view AS
  SELECT
    SUBSTRING(dof, 1, 4) AS year,
    COUNT(*)             AS students_total
  FROM student
  GROUP BY year;

DROP VIEW IF EXISTS faculty_view;

CREATE VIEW faculty_view AS
  SELECT
    f.name              AS faculty,
    d.last_name         AS dean_last_name,
    f.places,
    e.course,
    COUNT(*)            AS students_on_course,
    COUNT(*) > f.places AS overflow
  FROM
    education e
    INNER JOIN student s
      ON s.id = e.student_id
    INNER JOIN faculty f
      ON f.id = e.faculty_id
    INNER JOIN dean d
      ON d.id = f.id
  GROUP BY e.course, faculty
  ORDER BY faculty, e.course;










