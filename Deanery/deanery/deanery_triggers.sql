USE deanery;

DELIMITER //

CREATE TRIGGER places_overflow_check BEFORE INSERT ON education
FOR EACH ROW
  BEGIN
    IF ((SELECT COUNT(*)
         FROM
           education e
           INNER JOIN faculty f
             ON f.id = e.faculty_id
         WHERE f.id = NEW.faculty_id
         GROUP BY f.name) >= (SELECT f.places
                              FROM
                                education e
                                INNER JOIN faculty f
                                  ON f.id = e.faculty_id
                              WHERE f.id = NEW.faculty_id
                              GROUP BY f.name))
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Overflow of Faculty\'s places';
    END IF;

  END;//

DELIMITER ;

