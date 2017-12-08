﻿

USE [Comp229Assign03]

/* Object: Table Comp229Assign03.[dbo].[Students] */
GO
Create Procedure dbo.ViewCoursesList
(
@CourseID Int
)
As
SELECT CourseID,Title from Courses
GO


	Select s.StudentID,s.FirstMidName, s.LastName, c.CourseID, c.Title
	from Courses c join Enrollments e on e.CourseID = c.CourseID
	join Students s on s.StudentID = e.StudentID where c.CourseID in (select Courses.CourseID from courses)
	group by s.StudentID,s.FirstMidName, s.LastName, c.CourseID, c.Title 
	


	select * from students s join Enrollments e on s.StudentID =e.StudentID
	Go

Create Procedure dbo.ListMemo5
As
	Select a.StudentID,a.FirstMidName,a.LastName,a.EnrollmentDate, b.CourseID
	From Students a join Enrollments b on a.StudentID = b.StudentID
	Go

Create Procedure dbo.ViewCourse15

As	

	Select s.StudentID,s.FirstMidName, s.LastName
	from Courses c join Enrollments e on e.CourseID = c.CourseID
	join Students s on s.StudentID = e.StudentID where c.CourseID in (select Courses.CourseID from courses)
	group by s.StudentID,s.FirstMidName, s.LastName
	
Go


Create Procedure dbo.ViewMemo15
(
	@StudentID Int,
	@CourseID Int
	
)
As	
	Select s.StudentID, s.FirstMidName, s.LastName, s.EnrollmentDate,c.Title ,c.CourseID
	from Students s
	Join Enrollments e on e.StudentID = s.StudentID
	Join Courses c on c.CourseID = e.CourseID
	Where e.StudentID = @StudentID
	Group by s.StudentID, s.FirstMidName, s.LastName, s.EnrollmentDate,c.Title ,c.CourseID
	Select CourseID, Title from Courses
	Where CourseID = @CourseID
	Group by CourseID, Title
Go


Create Proc dbo.ModifyMemo1
(
	@FirstMidName NVarChar(25),
	@LastName NVarChar(100),
	@StudentID Int
)
As
Begin Transaction
	Update Students
	Set
		FirstMidName = @FirstMidName,
		LastName = @LastName
	Where StudentID = @StudentID
Commit Transaction
Go

USE [Comp229Assign03]

/* Object: Table Comp229Assign03.[dbo].[Students] */
GO

Create Proc dbo.CourseDelete
(
	@EnrollmentID Int
)
As
	Delete Enrollments
	Where EnrollmentID = @EnrollmentID
Go

rollback;


USE [Comp229Assign03]

/* Object: Table Comp229Assign03.[dbo].[Students] */
GO

Create Procedure dbo.WriteMemo14
(
	@LastName NvarChar(25),
	@FirstMidName NVarChar(100),
	@EnrollmentDate Date,
	@CourseID Int
)
As
	Insert Students(LastName, FirstMidName, EnrollmentDate)
	Values(@LastName, @FirstMidName, @EnrollmentDate)
	Insert Enrollments(StudentID,CourseID,Grade)
	Select Students.StudentID, @CourseID, 10 from Enrollments, Students
GO



Create Procedure dbo.WriteMemo6
(
	@LastName NvarChar(25),
	@FirstMidName NVarChar(100),
	@EnrollmentDate Date,
	@CourseID Int
)
As
	Declare @StudentID As Table (StudentID Int)
	Insert Students(FirstMidName, LastName, EnrollmentDate) Output Inserted.StudentID Into @StudentID
	Values(@LastName, @FirstMidName, @EnrollmentDate)
	Insert Enrollment(CourseID, StudentID,Grade)
	Values(@CourseID,@StudentID.StudentID,10)
Go


USE [Comp229Assign03]

/* Object: Table Comp229Assign03.[dbo].[Students] */
GO
Create Procedure dbo.WriteMemo12
(
	@LastName NvarChar(25),
	@FirstMidName NVarChar(100),
	@EnrollmentDate Date,
	@CourseID Int
)
As
	Insert Students(LastName, FirstMidName, EnrollmentDate)
	Values(@LastName, @FirstMidName, @EnrollmentDate)
	Insert Enrollments(StudentID,CourseID,Grade)
	Values(300005,@CourseID,10)
	GO


Create Procedure dbo.ListMemo3
(
	@StudentID Int,
	@CourseID Int
)
As
	Select StudentID,FirstMidName,LastName,EnrollmentDate
	From Students Order By StudentID Desc
Go 

USE [Comp229Assign03]

/* Object: Table Comp229Assign03.[dbo].[Students] */
GO
Create Procedure dbo.ListMemo10
As
	Select a.StudentID,a.FirstMidName,a.LastName,a.EnrollmentDate, c. CourseID
	From Students a left outer join Enrollments b on a.studentId = b.studentId 
	join Courses c on b.CourseID = c.CourseID
	group by a.StudentID, a.FirstMidName, a.LastName, a.EnrollmentDate, c.CourseID
	Order By a.StudentID Desc


	Select StudentID,FirstMidName,LastName,EnrollmentDate
	From Students


	Select s.StudentID, s.FirstMidName, s.LastName, s.EnrollmentDate,c.Title ,c.CourseID
	from Students s
	Join Enrollments e on e.StudentID = s.StudentID
	Join Courses c on c.CourseID = e.CourseID
	Where e.StudentID = 307008



	
select s.StudentID,s.FirstMidName, s.LastName from Courses c join Enrollments e on e.CourseID = c.CourseID
	join Students s on s.StudentID = e.StudentID where c.CourseID = 4001
	group by s.StudentID,s.FirstMidName, s.LastName, c.CourseID, c.Title



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Comp229Assign03.[dbo].[Students](
	[StudentID] [int] IDENTITY (300000, 1) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[FirstMidName] [varchar](50) NOT NULL,
	[EnrollmentDate] [date] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/* Object: Table Comp229Assign03.[dbo].[Enrollments] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Comp229Assign03.[dbo].[Enrollments](
	[EnrollmentID] [int] IDENTITY (1, 1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/* Object: Table Comp229Assign03.[dbo].[Departments] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Comp229Assign03.[dbo].[Departments](
	[DepartmentID] [int] IDENTITY (1, 1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Budget] [decimal](18,2) NOT NULL,
 CONSTRAINT [PK_Deparments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/* Object: Table Comp229Assign03.[dbo].[Courses] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE Comp229Assign03.[dbo].[Courses](
	[CourseID] [int] IDENTITY (4000, 1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Credits] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

ALTER TABLE Comp229Assign03.[dbo].Courses
ADD CONSTRAINT FK_Courses_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)

ALTER TABLE Comp229Assign03.[dbo].Enrollments
ADD CONSTRAINT FK_Enrollments_CourseID FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)

ALTER TABLE Comp229Assign03.[dbo].Enrollments
ADD CONSTRAINT FK_Enrollments_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID)

--Departments
INSERT INTO Comp229Assign03.[dbo].Departments (Name, Budget)
VALUES ('English', 350000)

INSERT INTO Comp229Assign03.[dbo].Departments (Name, Budget)
VALUES ('Mathematics', 100000)

INSERT INTO Comp229Assign03.[dbo].Departments (Name, Budget)
VALUES ('Engineering', 350000)

INSERT INTO Comp229Assign03.[dbo].Departments (Name, Budget)
VALUES ('Economics', 100000)

--Courses
INSERT INTO Comp229Assign03.[dbo].Courses (Title, Credits, DepartmentID)
VALUES ('Chemistry', 3, 3)

INSERT INTO Comp229Assign03.[dbo].Courses (Title, Credits, DepartmentID)
VALUES ('Microeconomics', 3, 4)

INSERT INTO Comp229Assign03.[dbo].Courses (Title, Credits, DepartmentID)
VALUES ('Macroeconomics', 3, 4)

INSERT INTO Comp229Assign03.[dbo].Courses (Title, Credits, DepartmentID)
VALUES ('Calculus', 4, 2)

INSERT INTO Comp229Assign03.[dbo].Courses (Title, Credits, DepartmentID)
VALUES ('Trigonometry', 4, 2)

INSERT INTO Comp229Assign03.[dbo].Courses (Title, Credits, DepartmentID)
VALUES ('Literature', 4, 1)

--Students
INSERT INTO Comp229Assign03.[dbo].Students (LastName, FirstMidName, EnrollmentDate)
VALUES ('Alexander', 'Carson', '2010-09-01')

INSERT INTO Comp229Assign03.[dbo].Students (LastName, FirstMidName, EnrollmentDate)
VALUES ('Alonso', 'Meredith', '2012-09-01')

INSERT INTO Comp229Assign03.[dbo].Students (LastName, FirstMidName, EnrollmentDate)
VALUES ('Anand', 'Arturo', '2013-09-01')

INSERT INTO Comp229Assign03.[dbo].Students (LastName, FirstMidName, EnrollmentDate)
VALUES ('Barzdukas', 'Gytis', '2012-09-01')

INSERT INTO Comp229Assign03.[dbo].Students (LastName, FirstMidName, EnrollmentDate)
VALUES ('Li', 'Yan', '2012-09-01')

INSERT INTO Comp229Assign03.[dbo].Students (LastName, FirstMidName, EnrollmentDate)
VALUES ('Justice', 'Peggy', '2011-09-01')

INSERT INTO Comp229Assign03.[dbo].Students (LastName, FirstMidName, EnrollmentDate)
VALUES ('Norman', 'Laura', '2013-09-01')

INSERT INTO Comp229Assign03.[dbo].Students (LastName, FirstMidName, EnrollmentDate)
VALUES ('Olivetto', 'Nino', '2005-09-01')

--Enrollments
INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4000, 300000, 65)

INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4000, 300001, 83)

INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4001, 300002, 74)

INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4001, 300003, 71)

INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4002, 300002, 95)

INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4002, 300003, 87)

INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4003, 300004, 50)

INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4003, 300005, 88)

INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4004, 300004, 61)

INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4004, 300005, 92)

INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4005, 300006, 74)

INSERT INTO Comp229Assign03.[dbo].Enrollments (CourseID, StudentID, Grade)
VALUES (4005, 300007, 73)


