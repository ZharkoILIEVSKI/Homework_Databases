use SEDC_ACADEMY_HOMEWORK

--Calculate the count of all grades per Teacher in the system

select * from dbo.Grade
order by TeacherID asc

select t.ID as TeacherId, t.FirstName as TeacherFirstName, count(Grade) as COUNTofGrades 
from dbo.Teacher as t
inner join dbo.Grade as g ON t.ID = g.TeacherID 
group by t.ID, t.FirstName, g.Grade
order by TeacherId asc


--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

select t.ID as TeacherId, t.FirstName as TeacherFirstName, count(Grade) as COUNTofGrades 
from dbo.Teacher as t
inner join dbo.Grade as g ON t.ID = g.TeacherID 
inner join dbo.Student as s ON s.ID = g.StudentID
where g.StudentID < 100
group by t.ID, t.FirstName
order by TeacherId asc

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system

select g.StudentID, MAX(g.Grade) as MAXOfGrades , AVG(g.Grade) as AVGOfGrades
from dbo.Grade as g
group by g.StudentID
order by g.StudentID asc

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

select t.ID as TeacherId, t.FirstName as TeacherFirstName, count(g.Grade) as COUNTofGrades 
from dbo.Teacher as t
inner join dbo.Grade as g ON t.ID = g.TeacherID 
inner join dbo.Student as s ON s.ID = g.StudentID
group by t.ID, t.FirstName, g.Grade
having count(g.Grade) > 200
order by TeacherId asc

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the
--system. Filter only records where Maximal Grade is equal to Average Grade

select g.StudentID , AVG(Grade) as AVGGrade, MAX(Grade) as MAXGrade, COUNT(Grade) as COUNTGrade
from dbo.Grade as g
group by g.StudentID 
order by g.StudentID asc

--List Student First Name and Last Name next to the other details from previous query

select g.StudentID , s.FirstName, s.LastName, AVG(Grade) as AVGGrade, MAX(Grade) as MAXGrade, COUNT(Grade) as COUNTGrade
from dbo.Grade as g
inner join dbo.Teacher as t ON t.ID = g.TeacherID 
inner join dbo.Student as s ON s.ID = g.StudentID
group by g.StudentID, s.FirstName, s.LastName
order by g.StudentID asc

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

create view vv_StudentGrades
as
select g.StudentID, COUNT(g.Grade) as COUNTOfGrades
from dbo.Grade as g
group by g.StudentID

--Change the view to show Student First and Last Names instead of StudentID

alter view vv_StudentGrades
as
select g.StudentID, s.FirstName, s.LastName ,COUNT(g.Grade) as COUNTOfGrades
from dbo.Grade as g
inner join dbo.Student as s ON s.ID = g.StudentID
group by g.StudentID, s.FirstName, s.LastName

--List all rows from view ordered by biggest Grade Count
select StudentID, FirstName, LastName , COUNTOfGrades
from vv_StudentGrades
order by COUNTOfGrades desc
