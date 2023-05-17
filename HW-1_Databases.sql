create database SEDCACADEMYDB;

use SEDCACADEMYDB;

create TABLE Student
(
ID int IDENTITY(1,1),
FirstName NVARCHAR(20) not null,
LastName NVARCHAR(30) not null,
DateOfBirth DATE not null,
EnrolledDate DATE not null,
Gender CHAR(6) not null,
NationalIDNumber int not null,
StudentCardNumber int not null,
constraint PK_Student primary key clustered (ID)
)

--select * from Student

create TABLE Teacher
(
ID int IDENTITY(1,1),
FirstName NVARCHAR(20) not null,
LastName NVARCHAR(30) not null,
DateOfBirth DATE not null,
AcademicRank NVARCHAR(50) not null,
HireDate DATE not null,
constraint PK_Teacher primary key clustered (ID)
)

create TABLE Grade
(
ID int IDENTITY(1,1),
StudentID int not null,
CourseID int not null,
TeacherID int not null,
Grade int not null,
Comment NVARCHAR(100) not null,
CreateDate DATE not null,
constraint PK_Grade primary key clustered (ID)
)

create TABLE Course
(
ID int IDENTITY(1,1),
NameofCourse NVARCHAR(20) not null,
Credit int not null,
AcademicYear DATE not null,
Semester int not null,
constraint PK_Course primary key clustered (ID)
)

create TABLE GradeDetails
(
ID int IDENTITY(1,1),
GradeID int not null,
AchievmentTypeID int not null,
AchievmentPoints int not null,
AchievmentMaxPoints int not null,
AchievmentDate DATE not null,
constraint PK_GradeDetails primary key clustered (ID)
)

create TABLE AchievmentType
(
ID int IDENTITY(1,1),
NameOfAchievment NVARCHAR(30) not null,
DescriptionOfAchievment NVARCHAR(100) not null,
ParticipationRate decimal(3,2) not null,

constraint PK_AchievmentType primary key clustered (ID)
)