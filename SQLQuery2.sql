--DDL - DATA DEFINITION LANGUAGE
CREATE DATABASE P510

DROP DATABASE P510

use P510;

CREATE TABLE Students(
	Id int,
	Name nvarchar(30),
	Surname nvarchar(30)
)

DROP TABLE Students

ALTER TABLE Students
ADD Age int

ALTER TABLE Students
DROP COLUMN Age

ALTER TABLE Students
ADD Age int, Email nvarchar(30)

ALTER TABLE Students
DROP COLUMN Age, Email

TRUNCATE TABLE Students

--DML - DATA MANIPULATION LANGUAGE

SELECT * FROM Students
SELECT Name 'FirstName', Surname 'LastName' FROM Students

SELECT * FROM Students
WHERE Id>1 AND Surname='Suleymanli'

select * from Students
where Id=2 or Surname='Suleymanli'

SELECT * FROM Students
WHERE Surname LIKE '%li'

SELECT * FROM Students
WHERE Surname LIKE 'Is%'

SELECT * FROM Students
WHERE Surname LIKE '%a%'

SELECT * FROM Students
WHERE Surname LIKE 'S%i'

SELECT * FROM Students
ORDER BY Name
--EQUAL
SELECT * FROM Students
ORDER BY Name ASC

SELECT * FROM Students
ORDER BY Name DESC

SELECT * FROM Students
Order by Id desc

INSERT INTO Students
VALUES (8, 'Test', 'TestTest')

INSERT INTO Students
VALUES (9, 'Test1', 'TestTest1'),
		(10, 'Test2', 'TestTest2')

INSERT INTO Students(Id, Name)
values (11, 'Test3')

INSERT INTO Students(Id, Name)
values (12, 'Test4'),
		(13, 'Test5')

UPDATE Students SET Name='Test44'

UPDATE Students SET Name='Tural'
WHERE Id=1

DELETE FROM Students
WHERE Id>7

--Constraints

CREATE TABLE Customers(
	Id int primary key identity,
	Name nvarchar(30) not null,
	Surname nvarchar(30),
	Age int CHECK(Age > 18),
	Email nvarchar(30) unique,
	City nvarchar(30) DEFAULT 'Baku'
)

insert into Customers(Name, Surname, Age, Email)
values ('Elnur', 'Abbasov', 19, 'elnur@code.az')

insert into Customers(Name, Surname, Age, Email, City)
values ('Seymur', 'Suleymanli', 19, 'seymur@code.az', 'Kelbecer')

insert into Customers(Surname, Age, Email, City)
values ('Suleymanli', 19, 'tural@code.az', 'Kelbecer')

--SQL FUNCTIONS

SELECT COUNT(*) FROM Students

SELECT MAX(Age) FROM Customers

SELECT Min(Age) FROM Customers

SELECT AVG(Age) FROM Customers

SELECT SUM(Age) FROM Customers

--Relations

CREATE TABLE Groups(
	Id int primary key identity,
	Name nvarchar(10)
)

ALTER TABLE Students
Add GroupId int references Groups(Id)

INSERT INTO Students
VALUES (9, 'Nihat', 'Osmanov', 3)

SELECT * FROM Students