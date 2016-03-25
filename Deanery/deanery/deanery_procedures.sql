USE deanery;

DELIMITER //

DROP PROCEDURE IF EXISTS students_on_faculties;

CREATE PROCEDURE students_on_faculties
  ()
  BEGIN
    SELECT
      f.name   AS faculty_name,
      COUNT(*) AS students_sum
    FROM education e
      INNER JOIN faculty f
        ON f.id = e.faculty_id
      INNER JOIN student s
        ON s.id = e.student_id
    GROUP BY f.name;
  END //

DROP PROCEDURE IF EXISTS grant_avg_for_groups_in_faculty;

CREATE PROCEDURE grant_avg_for_groups_in_faculty
  (IN faculty_name VARCHAR(20))
  BEGIN
    SELECT
      g.name         AS group_name,
      AVG(e.`grant`) AS grant_avg
    FROM education e
      INNER JOIN `group` g
        ON g.id = e.group_id
      INNER JOIN faculty f
        ON f.id = e.faculty_id
    WHERE f.name = faculty_name
    GROUP BY g.name;
  END //

DROP PROCEDURE IF EXISTS students_sum_in_groups;

CREATE PROCEDURE students_sum_in_groups
  ()
  BEGIN
    SELECT
      f.name   AS faculty_name,
      g.name   AS group_name,
      COUNT(*) AS students
    FROM education e
      INNER JOIN faculty f
        ON f.id = e.faculty_id
      INNER JOIN `group` g
        ON g.id = e.group_id
    GROUP BY g.name
    ORDER BY f.name;
  END //

DROP PROCEDURE IF EXISTS students_and_grant_in_city;

CREATE PROCEDURE students_and_grant_in_city
  (IN city_name VARCHAR(50))
  BEGIN
    SELECT
      s.last_name AS last_name,
      e.`grant`   AS `grant`
    FROM education e
      INNER JOIN student s
        ON s.id = e.student_id
    WHERE s.city_id IN (SELECT id
                        FROM city
                        WHERE name = city_name);
  END //

DELIMITER ;
