USE deanery;

INSERT INTO city (name) VALUES
  ('Kiev'),
  ('Lviv'),
  ('Dnipropetrovsk'),
  ('Odesa'),
  ('Kharkiv'),
  ('Mykolayiv'),
  ('Zaporizhia'),
  ('Berlin'),
  ('London'),
  ('New York'),
  ('Washington'),
  ('San-Francisco'),
  ('Moscow'),
  ('St. Petersburg'),
  ('Vancouver'),
  ('Helsinki'),
  ('Stockholm'),
  ('Tokio'),
  ('Seoul'),
  ('Bern'),
  ('Paris'),
  ('Rome'),
  ('Warsaw'),
  ('Athens'),
  ('Ankara');

INSERT INTO specialty (name) VALUES
  ('Computer Science'),
  ('Computer Engineering'),
  ('Software Engineering'),
  ('Systems Engineering'),
  ('Metrology and Information-measuring Technologies'),
  ('Aircraft and Rocket Production'),
  ('Avionics');

INSERT INTO `group` (specialty_id, name) VALUES
  (5, 'VA-11'),
  (6, 'VL-21'),
  (6, 'VL-22'),
  (5, 'VA-51'),
  (7, 'VL-31'),
  (4, 'IO-31'),
  (2, 'IO-22'),
  (3, 'IO-42'),
  (1, 'IO-11');

INSERT INTO student (city_id, first_name, last_name, dof, enrollment_year) VALUES
  (10, 'John', 'Smith', '1982-03-24', 2009),
  (9, 'Mike', 'Johnson', '1982-04-14', 2006),
  (12, 'Alice', 'Robertson', '1985-03-17', 2010),
  (17, 'Mary', 'Richards', '1983-08-21', 2009),
  (3, 'Jack', 'Dare', '1981-08-16', 2009),
  (11, 'Tommy', 'Anderson', '1989-07-11', 2011),
  (3, 'Janet', 'Thomson', '1992-09-30', 2010),
  (12, 'Rick', 'Jackson', '1982-09-19', 2008),
  (4, 'Joanna', 'Rosenberg', '1993-05-13', 2007),
  (21, 'Jill', 'Jordan', '1995-04-10', 2007),
  (11, 'Ivan', 'Petrov', '1987-03-22', 2006),
  (21, 'Sergey', 'Ivanov', '1988-05-25', 2007),
  (3, 'Petr', 'Sidorov', '1988-03-25', 2011),
  (10, 'Anna', 'Ivanova', '1987-04-21', 2010),
  (17, 'Katerina', 'Petrova', '1981-09-12', 2008);


INSERT INTO faculty (name, description, places) VALUES
  ('FAKS', 'Faculty of Aerospace Systems', 10),
  ('FIOT', 'Faculty of Informatics and Computer Science', 30);

INSERT INTO dean (first_name, last_name) VALUES
  ('Oleksandr', 'Zbrutsky'),
  ('Oleksandr', 'Pavlov');

INSERT INTO education (student_id, faculty_id, group_id, course, `grant`) VALUES
  (1, 2, 7, 4, 749),
  (2, 2, 9, 1, 776),
  (3, 2, 7, 5, 747),
  (4, 1, 2, 4, 727),
  (5, 1, 5, 4, 778),
  (6, 2, 9, 6, 817),
  (7, 1, 4, 5, 739),
  (8, 1, 3, 3, 800),
  (9, 1, 4, 2, 768),
  (10, 2, 6, 2, 756),
  (11, 1, 1, 1, 790),
  (12, 2, 7, 2, 738),
  (13, 1, 1, 6, 815),
  (14, 2, 9, 5, 819),
  (15, 1, 2, 3, 751);
