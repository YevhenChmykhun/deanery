DROP SCHEMA IF EXISTS deanery;

CREATE SCHEMA IF NOT EXISTS deanery
  DEFAULT CHARACTER SET 'UTF8';

USE deanery;

DROP TABLE IF EXISTS city;

CREATE TABLE IF NOT EXISTS city (
  id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(50)  NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  COMMENT = 'Table contains city detail';

DROP TABLE IF EXISTS specialty;

CREATE TABLE IF NOT EXISTS specialty (
  id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  COMMENT = 'Table contains specialty details';

DROP TABLE IF EXISTS `group`;

CREATE TABLE IF NOT EXISTS `group` (
  id           INT UNSIGNED NOT NULL AUTO_INCREMENT,
  specialty_id INT UNSIGNED NOT NULL,
  name         VARCHAR(50)  NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_group_specialty (specialty_id ASC),
  CONSTRAINT fk_group_specialty
  FOREIGN KEY (specialty_id)
  REFERENCES specialty (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  COMMENT = 'Table contains group details';

DROP TABLE IF EXISTS student;

CREATE TABLE IF NOT EXISTS student (
  id              INT UNSIGNED NOT NULL AUTO_INCREMENT,
  city_id         INT UNSIGNED NOT NULL,
  first_name      VARCHAR(50)  NOT NULL,
  last_name       VARCHAR(50)  NOT NULL,
  dof             DATE         NOT NULL,
  enrollment_year INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_student_city (city_id ASC),
  CONSTRAINT fk_student_city
  FOREIGN KEY (city_id)
  REFERENCES city (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  COMMENT = 'Table contains student details';

DROP TABLE IF EXISTS faculty;

CREATE TABLE IF NOT EXISTS faculty (
  id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name        VARCHAR(20)  NOT NULL,
  description VARCHAR(255) NOT NULL,
  places      INT UNSIGNED NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB
  COMMENT = 'Table contains faculty details';

DROP TABLE IF EXISTS dean;

CREATE TABLE IF NOT EXISTS dean (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50)  NOT NULL,
  last_name  VARCHAR(50)  NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_dean
  FOREIGN KEY (id)
  REFERENCES faculty (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  COMMENT = 'Table contains dean details';

DROP TABLE IF EXISTS education;

CREATE TABLE IF NOT EXISTS education (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
  student_id INT UNSIGNED NOT NULL,
  faculty_id INT UNSIGNED NOT NULL,
  group_id   INT UNSIGNED NOT NULL,
  `grant`    INT UNSIGNED NOT NULL,
  course     INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_education_student (student_id ASC),
  INDEX fk_education_faculty (faculty_id ASC),
  INDEX fk_education_group (group_id ASC),
  CONSTRAINT fk_education_student
  FOREIGN KEY (student_id)
  REFERENCES student (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_education_faculty
  FOREIGN KEY (faculty_id)
  REFERENCES faculty (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_education_group
  FOREIGN KEY (group_id)
  REFERENCES `group` (id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  COMMENT = 'Education table matches students with faculties and records their course and grants';
