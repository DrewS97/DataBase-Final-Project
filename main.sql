CREATE TABLE employees (
  employee_id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  job_title VARCHAR(50) NOT NULL,
  stocks INTEGER NOT NULL
);

CREATE TABLE certifications (
  certification_id INTEGER PRIMARY KEY AUTOINCREMENT,
  cert_name VARCHAR(50) NOT NULL,
  category VARCHAR(50) NOT NULL,
  price INTEGER NOT NULL
);

CREATE TABLE credientials (
  employee_id INTEGER,
  certification_id INTEGER,
  PRIMARY KEY (employee_id, certification_id)
);

--Extra spaces in entries is to increase column length to show all of the words
INSERT INTO employees (first_name, last_name, job_title, stocks)
VALUES
('Geralt              ', 'of Rivia              ', 'Witcher                ', 1000000),
('Ciri              ', 'of Elder Blood              ', 'Space-Time Goddess              ', 800000000),
('Yennefer              ', 'of Vengerberg              ', 'Sorceress              ', 700000),
('Triss              ', 'Merigold              ', 'Temptress              ', 10),
('Gaunter              ', 'O''Dimm              ', 'Mysterious Demon              ', 1000);

INSERT INTO certifications (cert_name, category, price)
VALUES
('Pickpocketing              ', 'Thievery              ', 2000),
('Whirl              ', 'Fast-Attacks              ', 5000),
('Ghoul Decoction              ', 'Alchemy              ', 4000),
('Skill-Level: Journeyman              ', 'Smithing              ', 3000),
('Skill-Level: GrandMaster              ', 'Smithing              ', 8000);

INSERT INTO credientials (employee_id, certification_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(4, 1),
(4, 4),
(5, 1),
(5, 5);

--this command aligns the columns
.mode "column" 
--this command adds the field names to the columns
.headers "on" 

.print ---------------------------------------------------Problem 5--------------------------------------------------\n
SELECT * FROM employees;

.print \n\n\n---------------------------------------------------Problem 6--------------------------------------------------\n
SELECT * FROM certifications;

.print \n\n\n---------------------------------------------------Problem 7--------------------------------------------------\n
SELECT * FROM credientials;

.print \n\n\n---------------------------------------------------Problem 8--------------------------------------------------\n
.print These people have the Ghoul Decoction Certification
.print --------------------------------------------------------------------------------------------------------------\n

SELECT first_name, last_name
FROM (employees INNER JOIN credientials ON employees.employee_id = credientials.employee_id)
WHERE credientials.certification_id = 3;

.print \n\n\n---------------------------------------------------Problem 9--------------------------------------------------\n
.print Certification name and category for employee with ID of 2
.print --------------------------------------------------------------------------------------------------------------\n

SELECT cert_name, category
FROM (employees INNER JOIN credientials ON employees.employee_id = credientials.employee_id) INNER JOIN certifications ON certifications.certification_id = credientials.certification_id
WHERE employees.employee_id = 2;

.print \n\n\n---------------------------------------------------Problem 10-------------------------------------------------\n
.print Emp_id and job_title from employees and the name and price from certifications for each certification earned by each employee
.print --------------------------------------------------------------------------------------------------------------\n

SELECT employees.employee_id, job_title, cert_name, price
FROM (employees INNER JOIN credientials ON employees.employee_id = credientials.employee_id) INNER JOIN certifications ON certifications.certification_id = credientials.certification_id;

.print \n\n\n---------------------------------------------------Problem 11-------------------------------------------------\n
.print All employees with less than 500 stocks and which certifications they have
.print --------------------------------------------------------------------------------------------------------------\n

SELECT first_name, last_name, job_title, stocks, cert_name
FROM (employees INNER JOIN credientials ON employees.employee_id = credientials.employee_id) INNER JOIN certifications ON certifications.certification_id = credientials.certification_id
WHERE employees.stocks < 500;

.print \n\n\n---------------------------------------------------Problem 12-------------------------------------------------\n
.print Displays all certifications with a price over 150 and which employees have earned them.
.print --------------------------------------------------------------------------------------------------------------\n

SELECT employees.employee_id, cert_name, category, price
FROM (employees INNER JOIN credientials ON employees.employee_id = credientials.employee_id) INNER JOIN certifications ON certifications.certification_id = credientials.certification_id
WHERE price > 150;