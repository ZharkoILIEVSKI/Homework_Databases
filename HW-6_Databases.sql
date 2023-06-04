--HOMEWORK 1
--• Create new procedure called CreateGrade
--• Procedure should create only records in table Grade (not Grade Details)
--• Procedure should return the total number of grades in the system for the Student on input
--(from the CreateGrade)
--• Procedure should return second resultset with the MAX Grade of all grades for the Student
--and Teacher on input (regardless the Course)

use SEDC_ACADEMY_HOMEWORK

create procedure dbo.cp_CreateGrade(
@ID int,
@StudentID int,
@CourseID int,
@TeacherID int,
@Grade tinyint,
@Comment nvarchar(max),
@CreatedDate datetime 
)
as
begin

insert into dbo.Grade(ID,StudentID,	CourseID, TeacherID, Grade, Comment, CreatedDate)  
values(@ID,	@StudentID,	@CourseID, @TeacherID, @Grade, @Comment, @CreatedDate)

create function dbo.fn_TotalNumberOfGrades(@StudentID int)
returns int
as
begin

	declare @TotalNumberOfGrades int
	select @TotalNumberOfGrades = count(g.Grade)from dbo.Grade as g
	where @StudentID = StudentID
	return @TotalNumberOfGrades

end

select dbo.fn_TotalNumberOfGrades(1)

create function dbo.fn_MaxNumberOfAllGrades(@StudentID int, @TeacherID int)
returns int
as
begin

	declare @MaxNumberOfAllGrades int
	select @MaxNumberOfAllGrades = max(g.Grade)  from dbo.Grade as g
	where @StudentID = StudentID and @TeacherID = TeacherID
	return @MaxNumberOfAllGrades

end

select dbo.fn_MaxNumberOfAllGrades(1,1)

end

exec dbo.cp_CreateGrade '34','23','20','20', '5','blabla','2023-10-10' 


--HOMEWORK 2
--• Create new procedure called CreateGradeDetail
--• Procedure should add details for specific Grade (new record for new AchievementTypeID,
--Points, MaxPoints, Date for specific Grade). The procedure should insert values in table
--GradeDetails.
--• Output from this procedure should be resultset with SUM of GradePoints calculated with
--formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

use SEDC_ACADEMY_HOMEWORK

create procedure dbo.cp_GradeDetail(
@ID int,
@GradeID int,
@AchievementTypeID int,
@AchievementPoints smallint,
@AchievementMaxPoints smallint,
@AchievementDate date 
)
as
begin

insert into dbo.GradeDetails(ID, GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints,
AchievementDate)  
values(@ID, @GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)

create function dbo.fn_SumOfGradePoints(@AchievementPoints smallint, @AchievementMaxPoints smallint)
returns int
as
begin

	declare @SumOfGradePoints int
	select @SumOfGradePoints = sum(gd.AchievementPoints / gd.AchievementMaxPoints * at.ParticipationRate) from dbo.GradeDetails as gd
	inner join dbo.AchievementType as at on at.ID = gd.AchievementTypeID
	where @AchievementPoints = AchievementPoints and @AchievementMaxPoints = AchievementMaxPoints
	 
	return @SumOfGradePoints

end

select dbo.fn_SumOfGradePoints(10,2)

end

exec dbo.cp_GradeDetail '1','1','1','1','1','2023-10-10'