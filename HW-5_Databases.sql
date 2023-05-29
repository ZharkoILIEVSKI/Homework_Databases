--Declare scalar variable for storing FirstName values
--• Assign value ‘Antonio’ to the FirstName variable
--• Find all Students having FirstName same as the variable

use SEDC_ACADEMY_HOMEWORK

declare @FirstName NVARCHAR(255);
set @FirstName = 'Antonio';

select * from dbo.Student
where FirstName = @FirstName;


--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--• Fill the table variable with all Female students

declare @StudentInfo table (StudentId int, StudentName nvarchar(20), DateOfBirth date)
insert into @StudentInfo
select id, FirstName, DateOfBirth from dbo.Student
where Gender = 'F'

select * from @StudentInfo

--Declare temp table that will contain LastName and EnrolledDate columns
--• Fill the temp table with all Male students having First Name starting with ‘A’
--• Retrieve the students from the table which last name is with 7 characters

create table #StudentInfo_2 (LastName nvarchar(20), EnrolledDate date)
insert into #StudentInfo_2
select LastName, EnrolledDate from dbo.Student

select * from #StudentInfo_2
where len(LastName) = 7

--Find all teachers whose FirstName length is less than 5 and
--• the first 3 characters of their FirstName and LastName are the same

select FirstName, LastName from dbo.Teacher
where len(FirstName) < 5 and left(FirstName, 3) = left(LastName,3)