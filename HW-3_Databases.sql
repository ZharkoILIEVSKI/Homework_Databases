--Find all Students with FirstName = Antonio

use SEDC_ACADEMY_HOMEWORK

select * from dbo.Student
where (FirstName = 'Antonio')

--Find all Students with DateOfBirth greater than ‘01.01.1999’

select * from dbo.Student
where (DateOfBirth > '1999-01-01')

--Find all Students with 
--LastName starting With ‘J’ enrolled in January/1998

select * from dbo.Student
where (LastName like 'J%') and (EnrolledDate like '1998-01%')

--List all Students ordered by FirstName

select * from dbo.Student
order by FirstName asc

--List all Teacher Last Names and Student Last Names in single result set.
--Remove duplicates

select LastName 
from dbo.Student
union
select LastName 
from dbo.Teacher

--Create Foreign key constraints from diagram or with script
--ВАЖНО!!! ОВА ВЕЌЕ Е НАПРАВЕНО ВО ДОМАШНАТА ИЛИ НЕ ГО РАЗБИРАМ БАШ :)

--List all possible combinations of Courses names and AchievementType
--names that can be passed by student

select * 
from dbo.Course 
cross join dbo.AchievementType 

--List all Teachers without exam Grade

select * 
from dbo.Teacher as a
inner join dbo.Grade as b ON a.ID=b.TeacherID
where (Grade = 9)

select * from dbo.Grade