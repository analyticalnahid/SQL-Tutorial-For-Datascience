
--                  Database                     --


/*
CREATE DATABASE passanger; -- create database

SHOW DATABASES; --show exitence database in system

DROP DATABASE world; -- delete database from system

 -- rename database

USE wood; -- selecting database

--                  Table                     --

CREATE TABLE users(
    id INTEGER,
    name VARCHAR(255),
    email VARCHAR(255)
); -- creating table


DROP TABLE users; -- deleting table

TURNCATE TABLE users; -- clearing table

DESC users; -- check table exist or not


--                  Column                     --

ALTER TABLE orders ADD COLUMN email varchar(255) NOT NULL   -- adding columns into database

ALTER TABLE orders DROP COLUMN email    -- deleting columns

ALTER TABLE orders MODIFY COLUMN email integer     -- modify columns

INSERT INTO users (id, name) VALUES (2,"Nahidul Islam"); -- inserting data in table

INSERT INTO users VALUES (3,"Nahid"),(4,"Yousuf"),(5,"Hacker");  -- inserting multiple data in table

SELECT * FROM train;    -- selecting all column

SELECT Name,Sex,Age FROM train;     -- selecting specific columns

SELECT Name AS PassangerName, Sex AS Gender, Survived FROM train;   -- renaming column name

SELECT Name, SibSp + Parch AS Family FROM train;    -- megering columns

UPDATE train SET Name = 'Nahid'     -- updating column

DELETE FROM users WHERE email LIKE "%yahoomail.com%";   -- deleting column

--                  Sorting Data                --

SELECT Age FROM train ORDER BY Age DESC LIMIT 10;

SELECT Age FROM train ORDER BY Age ASC LIMIT 10;

--                  Grouping Data                --

SELECT Embarked, COUNT(*) AS num_of FROM train GROUP BY Embarked;

SELECT Embarked, COUNT(*) AS num_of FROM train GROUP BY Embarked ORDER BY num_of DESC LIMIT 3;

SELECT Pclass, SUM(SibSp+ Parch) AS total_count FROM train GROUP BY Pclass ORDER BY total_count DESC;

SELECT Pclass, ROUND(AVG(Age)) AS avg_age FROM train GROUP BY Pclass ORDER BY avg_age DESC;

SELECT Pclass,Embarked, SUM(Survived) AS lived FROM train GROUP BY Pclass,Embarked ORDER BY lived DESC;

SELECT Embarked, ROUND(AVG(age)) AS old FROM train GROUP BY Embarked HAVING old>18 ORDER BY old DESC;

--                  Case                --

SELECT Pclass,(SibSp+Parch) family, 
CASE 
    WHEN Pclass = 1 THEN "Good Seat" 
    WHEN Pclass =2 THEN "Medium Seat" 
    WHEN Pclass =3 THEN "Bad Seat" 
    ELSE "No Quantity" 
    END AS verdict 
    FROM train;


--                  Join                --

SELECT * FROM users CROSS JOIN picker;      -- cartesian product

SELECT * FROM picker p JOIN users u ON p.id = u.id;     -- inner join

SELECT * FROM picker p LEFT OUTER JOIN users u ON p.id = u.id;      -- left outer join

SELECT * FROM picker p RIGHT OUTER JOIN users u ON p.id = u.id;     -- right outer join

SELECT * FROM picker p LEFT OUTER JOIN users u ON p.id = u.id UNION SELECT * FROM picker p RIGHT OUTER JOIN users u ON p.id = u.id;     -- full outer join

SELECT * FROM picker p JOIN users u ON p.id=u.id JOIN groups g ON g.uid = g.uid;    -- multiple join 

SELECT u1.name, u2.name FROM users u1 JOIN users u2 ON u1.contact = u2.id;  -- self join

--                  Union                --

SELECT id FROM picker UNION SELECT id FROM users;

SELECT id FROM picker UNION ALL SELECT id FROM users;


--                  Subquery                --

SELECT * FROM train WHERE Age IN (SELECT DISTINCT(Age) FROM train WHERE Age LIKE '3%');     -- independent

SELECT * FROM train WHERE Ticket IN (SELECT Ticket FROM (SELECT Ticket, SUM(Age) AS avg_age FROM train GROUP BY Ticket ORDER BY avg_age DESC LIMIT 5) A);      -- -- independent

SELECT Pclass, Age FROM train t1 WHERE Age = (SELECT MAX(Age) FROM train t2 WHERE t1.Pclass = t2.Pclass);   -- correlated

--                  Constant                --

SELECT Name, 100000 AS Compansesion FROM train;     -- adding constraint

--                  Distrint                --

SELECT DISTINCT Embarked,Pclass FROM train;


--                  Function                 --

SELECT Pclass, ABS((PassengerId-Age)) AS NewColumns FROM train;

SELECT Pclass, ROUND((Age/PassengerId)) AS NewColumns FROM train;

SELECT Pclass, CEIL((Age/PassengerId)) AS NewColumns FROM train;

SELECT Pclass, FLOOR((Age/PassengerId)) AS NewColumns FROM train;

SELECT UPPER(Name) FROM train;

SELECT LOWER(Name) FROM train;

SELECT Name, CONCAT(Name,' ',Sex) AS New FROM train;

SELECT Ticket, LENGTH(Ticket) AS Length FROM train;

SELECT Ticket, SUBSTR(Ticket,2,5) as Short FROM train;

SELECT Sex, MAX(Age) FROM train;

SELECT Sex, MIN(Age) FROM train;

SELECT SUM(Survived) FROM train;

SELECT AVG(Age) FROM train;

SELECT COUNT(DISTINCT(Age)) FROM train;

--          Comparison Operator             --

SELECT * FROM train WHERE Pclass = 3;

SELECT * FROM train WHERE Pclass = 3 AND Survived = 0;

SELECT * FROM train WHERE Age BETWEEN 0 AND 10;

SELECT * FROM train WHERE Embarked LIKE 'C' OR Embarked LIKE 'S';
    
SELECT Name,Sex,Age FROM train WHERE Embarked IN('S','C');

SELECT Name,Sex,Age FROM train WHERE Embarked NOT IN('S','C');

--                  Wildcard                --

SELECT Name FROM train WHERE Name LIKE 'N%';    -- wildcard

SELECT Name FROM train WHERE Name LIKE 'B____________';

--                  Constraint                --

ALTER TABLE orders ADD CONSTRAINT P_gender UNIQUE(gender) -- adding constraint

ALTER TABLE orders DROP CONSTRAINT P_gender  -- removing constraint


    NOT NUL 

CREATE TABLE np(
    id integer NOT NULL,
    name VARCHAR(255)
)

    UNIQUE

-- Single unique
CREATE TABLE users(
    id integer NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE
)

-- Multiple unique
CREATE TABLE users(
    id integer NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    UNIQUE(email,name)
)

-- Naming The Constraint
CREATE TABLE users(
    id integer NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    CONSTRAINT U_mail UNIQUE(email)
)

    PRIMARY KEY

CREATE TABLE toper(
    id integer PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
)

    FORIGEN KEY 
CREATE TABLE orders(
    order_id integer PRIMARY KEY,
    id integer,
    name VARCHAR(255),
    email VARCHAR(255),
    FOREIGN KEY(id) REFERENCES users(id)
)

    CHECK
CREATE TABLE orders(
    id integer PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    age integer CHECK (age>4 & age<40)
)    

    DEFAULT
CREATE TABLE orders(
    id integer PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    gender VARCHAR(255) DEFAULT "Others"
)   

    AUTO INCREMENT
CREATE TABLE picker(
    id integer AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
)   
*/