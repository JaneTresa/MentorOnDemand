USE [master]
GO
/****** Object:  Database [mentor]    Script Date: 11/22/2019 4:02:37 PM ******/
CREATE DATABASE [mentor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mentor', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\mentor.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mentor_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\mentor_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mentor] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mentor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mentor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mentor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mentor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mentor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mentor] SET ARITHABORT OFF 
GO
ALTER DATABASE [mentor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mentor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mentor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mentor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mentor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mentor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mentor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mentor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mentor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mentor] SET  ENABLE_BROKER 
GO
ALTER DATABASE [mentor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mentor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mentor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mentor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mentor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mentor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mentor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mentor] SET RECOVERY FULL 
GO
ALTER DATABASE [mentor] SET  MULTI_USER 
GO
ALTER DATABASE [mentor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mentor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mentor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mentor] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [mentor] SET DELAYED_DURABILITY = DISABLED 
GO
USE [mentor]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[ad_Id] [int] IDENTITY(1000,1) NOT NULL,
	[ad_Username] [nvarchar](50) NULL,
	[ad_Password] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ad_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mentor]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mentor](
	[mid] [int] IDENTITY(2000,1) NOT NULL,
	[MName] [varchar](30) NULL,
	[user_name] [varchar](30) NOT NULL,
	[linkedin_url] [nvarchar](200) NOT NULL,
	[red_datetime] [datetime] NULL,
	[reg_code] [bigint] NULL,
	[years_of_experience] [int] NULL,
	[active] [nvarchar](20) NULL,
	[Password] [varchar](20) NULL,
 CONSTRAINT [PK__mentor__DF5032EC0739465A] PRIMARY KEY CLUSTERED 
(
	[mid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mentor_skills]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mentor_skills](
	[ms_Id] [int] IDENTITY(1000,1) NOT NULL,
	[mid] [int] NULL,
	[sk_Id] [int] NULL,
	[ms_SelfRating] [decimal](3, 1) NULL,
	[ms_Years_Of_Experience] [int] NULL,
	[ms_Training_Delivered] [int] NULL,
	[ms_Facilities_Offered] [nvarchar](100) NULL,
 CONSTRAINT [PK__mentor_s__974F1CF300542922] PRIMARY KEY CLUSTERED 
(
	[ms_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[skills]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skills](
	[sk_Id] [int] IDENTITY(1000,1) NOT NULL,
	[sk_Name] [nvarchar](50) NOT NULL,
	[sk_TOC] [nvarchar](50) NOT NULL,
	[sk_Duration] [int] NOT NULL,
	[sk_Prerequistes] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[training]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training](
	[tr_Id] [int] IDENTITY(1000,1) NOT NULL,
	[tr_uId] [int] NULL,
	[tr_mId] [int] NULL,
	[tr_sId] [int] NULL,
	[tr_Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[tr_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_details]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_details](
	[UserId] [int] IDENTITY(1000,1) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Pass] [varchar](15) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[Contact] [bigint] NOT NULL,
	[reg_datetime] [datetime] NOT NULL,
	[reg_code] [bigint] NULL,
	[force_reset_password] [varchar](50) NULL,
	[active] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

GO
INSERT [dbo].[admin] ([ad_Id], [ad_Username], [ad_Password]) VALUES (1001, N'admin@gmail.com', N'adminpass')
GO
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[mentor] ON 

GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2006, N'John', N'john@gmail.com', N'https://in.linkedin.com/', CAST(N'2019-02-03 00:00:00.000' AS DateTime), NULL, 5, NULL, N'johnpass')
GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2007, N'Joe', N'joe@gmail.com', N'https://in.linkedin.com/', CAST(N'2019-08-03 00:00:00.000' AS DateTime), NULL, 2, NULL, N'joepass')
GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2008, N'Akash', N'akash@gmail.com', N'https://in.linkedin.com/', CAST(N'2018-03-04 00:00:00.000' AS DateTime), NULL, 5, NULL, N'akashpass')
GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2009, N'Geo', N'geo@gmail.com', N'https://in.linkedin.com/', CAST(N'2017-03-04 00:00:00.000' AS DateTime), NULL, 3, NULL, N'geopass')
GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2010, N'aa', N'aa@gmail.com', N'aa', CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, 6, NULL, N'')
GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2011, N'aa', N'aa@gmail.com', N'aa', CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, 6, NULL, N'')
GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2012, N'edfedsf', N'aaff@gmail.com', N'sdasd', CAST(N'2019-11-30 00:00:00.000' AS DateTime), NULL, 6, NULL, N'sdfsadfsf')
GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2013, N'sdfsd', N'dsfd@gmail.com', N'sfdsfds', CAST(N'2019-11-28 00:00:00.000' AS DateTime), NULL, 5, NULL, N'dfgsddfs')
GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2014, N'ggg', N'sdasda@gmail.com', N'sfdsfds', CAST(N'2019-11-23 00:00:00.000' AS DateTime), NULL, 7, NULL, N'dfsdfsdf')
GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2015, N'sdasf', N'dsffd@gmail.com', N'sdf', CAST(N'2019-11-20 00:00:00.000' AS DateTime), NULL, 4, NULL, N'drfgfdgdg')
GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2016, N'sdfsf', N'ada@gmail.com', N'sfdsfds', CAST(N'2019-11-27 00:00:00.000' AS DateTime), NULL, 5, NULL, N'dfgdfgsd')
GO
INSERT [dbo].[mentor] ([mid], [MName], [user_name], [linkedin_url], [red_datetime], [reg_code], [years_of_experience], [active], [Password]) VALUES (2017, N'gggsd', N'aad@gmail.com', N'sfdsfds', CAST(N'2019-11-21 00:00:00.000' AS DateTime), NULL, 4, NULL, N'dsfdsfsd')
GO
SET IDENTITY_INSERT [dbo].[mentor] OFF
GO
SET IDENTITY_INSERT [dbo].[mentor_skills] ON 

GO
INSERT [dbo].[mentor_skills] ([ms_Id], [mid], [sk_Id], [ms_SelfRating], [ms_Years_Of_Experience], [ms_Training_Delivered], [ms_Facilities_Offered]) VALUES (1000, 2007, 1001, CAST(9.0 AS Decimal(3, 1)), 2, 3, N'sdfsadf')
GO
INSERT [dbo].[mentor_skills] ([ms_Id], [mid], [sk_Id], [ms_SelfRating], [ms_Years_Of_Experience], [ms_Training_Delivered], [ms_Facilities_Offered]) VALUES (1001, 2008, 1002, CAST(8.5 AS Decimal(3, 1)), 4, 2, N'dsfsadfsa')
GO
INSERT [dbo].[mentor_skills] ([ms_Id], [mid], [sk_Id], [ms_SelfRating], [ms_Years_Of_Experience], [ms_Training_Delivered], [ms_Facilities_Offered]) VALUES (1002, 2008, 1000, CAST(8.8 AS Decimal(3, 1)), 2, 3, N'efsdfad')
GO
INSERT [dbo].[mentor_skills] ([ms_Id], [mid], [sk_Id], [ms_SelfRating], [ms_Years_Of_Experience], [ms_Training_Delivered], [ms_Facilities_Offered]) VALUES (1003, 2007, 1001, CAST(6.0 AS Decimal(3, 1)), 6, 6, N'fdsgd')
GO
INSERT [dbo].[mentor_skills] ([ms_Id], [mid], [sk_Id], [ms_SelfRating], [ms_Years_Of_Experience], [ms_Training_Delivered], [ms_Facilities_Offered]) VALUES (1004, 2007, 1001, CAST(8.0 AS Decimal(3, 1)), 4, 6, N'fdgdgdg')
GO
INSERT [dbo].[mentor_skills] ([ms_Id], [mid], [sk_Id], [ms_SelfRating], [ms_Years_Of_Experience], [ms_Training_Delivered], [ms_Facilities_Offered]) VALUES (1005, 2007, 1002, CAST(8.7 AS Decimal(3, 1)), 5, 5, N'dssfsfsfs')
GO
INSERT [dbo].[mentor_skills] ([ms_Id], [mid], [sk_Id], [ms_SelfRating], [ms_Years_Of_Experience], [ms_Training_Delivered], [ms_Facilities_Offered]) VALUES (1006, 2007, 1001, CAST(9.0 AS Decimal(3, 1)), 7, 7, N'dsfdfsdfs')
GO
INSERT [dbo].[mentor_skills] ([ms_Id], [mid], [sk_Id], [ms_SelfRating], [ms_Years_Of_Experience], [ms_Training_Delivered], [ms_Facilities_Offered]) VALUES (1007, 2007, 1002, CAST(4.0 AS Decimal(3, 1)), 4, 4, N'dfsfas')
GO
INSERT [dbo].[mentor_skills] ([ms_Id], [mid], [sk_Id], [ms_SelfRating], [ms_Years_Of_Experience], [ms_Training_Delivered], [ms_Facilities_Offered]) VALUES (1008, 2007, 1001, CAST(9.0 AS Decimal(3, 1)), 9, 9, N'adsssdf')
GO
INSERT [dbo].[mentor_skills] ([ms_Id], [mid], [sk_Id], [ms_SelfRating], [ms_Years_Of_Experience], [ms_Training_Delivered], [ms_Facilities_Offered]) VALUES (1009, 2007, 1000, CAST(8.0 AS Decimal(3, 1)), 6, 8, N'jsadj')
GO
INSERT [dbo].[mentor_skills] ([ms_Id], [mid], [sk_Id], [ms_SelfRating], [ms_Years_Of_Experience], [ms_Training_Delivered], [ms_Facilities_Offered]) VALUES (1010, 2007, 1001, CAST(7.7 AS Decimal(3, 1)), 5, 4, N'dfsf')
GO
SET IDENTITY_INSERT [dbo].[mentor_skills] OFF
GO
SET IDENTITY_INSERT [dbo].[skills] ON 

GO
INSERT [dbo].[skills] ([sk_Id], [sk_Name], [sk_TOC], [sk_Duration], [sk_Prerequistes]) VALUES (1000, N'IOT', N'SDSDF', 3, N'Basics')
GO
INSERT [dbo].[skills] ([sk_Id], [sk_Name], [sk_TOC], [sk_Duration], [sk_Prerequistes]) VALUES (1001, N'Digital Marketing', N'dsfasfd', 3, N'Computer Knowledge')
GO
INSERT [dbo].[skills] ([sk_Id], [sk_Name], [sk_TOC], [sk_Duration], [sk_Prerequistes]) VALUES (1002, N'Front End Designing', N'sdsaads', 2, N'Angular')
GO
SET IDENTITY_INSERT [dbo].[skills] OFF
GO
SET IDENTITY_INSERT [dbo].[training] ON 

GO
INSERT [dbo].[training] ([tr_Id], [tr_uId], [tr_mId], [tr_sId], [tr_Status]) VALUES (1000, 1001, 2008, 1001, N'Requested')
GO
INSERT [dbo].[training] ([tr_Id], [tr_uId], [tr_mId], [tr_sId], [tr_Status]) VALUES (1001, 1001, 2008, 1001, N'Requested')
GO
INSERT [dbo].[training] ([tr_Id], [tr_uId], [tr_mId], [tr_sId], [tr_Status]) VALUES (1002, 1002, 2007, 1002, N'Requested')
GO
INSERT [dbo].[training] ([tr_Id], [tr_uId], [tr_mId], [tr_sId], [tr_Status]) VALUES (1003, 1001, 2007, 1001, N'Requested')
GO
INSERT [dbo].[training] ([tr_Id], [tr_uId], [tr_mId], [tr_sId], [tr_Status]) VALUES (1004, 1001, 2008, 1002, N'Requested')
GO
INSERT [dbo].[training] ([tr_Id], [tr_uId], [tr_mId], [tr_sId], [tr_Status]) VALUES (1005, 1002, 2008, 1002, N'Requested')
GO
INSERT [dbo].[training] ([tr_Id], [tr_uId], [tr_mId], [tr_sId], [tr_Status]) VALUES (1006, 1001, 2007, 1001, N'Requested')
GO
INSERT [dbo].[training] ([tr_Id], [tr_uId], [tr_mId], [tr_sId], [tr_Status]) VALUES (1007, 1001, 2007, 1001, N'Requested')
GO
SET IDENTITY_INSERT [dbo].[training] OFF
GO
SET IDENTITY_INSERT [dbo].[user_details] ON 

GO
INSERT [dbo].[user_details] ([UserId], [Email], [Pass], [First_Name], [Last_Name], [Contact], [reg_datetime], [reg_code], [force_reset_password], [active]) VALUES (1000, N'jane@gmail.com', N'janepass', N'Jane', N'Tresa', 9545124562, CAST(N'2019-11-12 00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[user_details] ([UserId], [Email], [Pass], [First_Name], [Last_Name], [Contact], [reg_datetime], [reg_code], [force_reset_password], [active]) VALUES (1001, N'charlie@gmail.com', N'charliepass', N'Charles', N'Geeanto', 9534124562, CAST(N'2019-10-12 00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[user_details] ([UserId], [Email], [Pass], [First_Name], [Last_Name], [Contact], [reg_datetime], [reg_code], [force_reset_password], [active]) VALUES (1002, N'finu@gmail.com', N'finupass', N'Finu', N'Nazar', 9545236562, CAST(N'2019-02-12 00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[user_details] ([UserId], [Email], [Pass], [First_Name], [Last_Name], [Contact], [reg_datetime], [reg_code], [force_reset_password], [active]) VALUES (1003, N'jane@gmail.com', N'janepass', N'Jane', N'Tresa', 9545124562, CAST(N'2019-11-12 00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[user_details] ([UserId], [Email], [Pass], [First_Name], [Last_Name], [Contact], [reg_datetime], [reg_code], [force_reset_password], [active]) VALUES (1008, N'asd@gmail.com', N'sdfsdfs', N'sdfsdf', N'sdfsdf', 9468734567, CAST(N'2019-11-22 00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
INSERT [dbo].[user_details] ([UserId], [Email], [Pass], [First_Name], [Last_Name], [Contact], [reg_datetime], [reg_code], [force_reset_password], [active]) VALUES (1009, N'jisma@gmail.com', N'jismapass', N'Jisma', N'Mary', 9574837483, CAST(N'2019-11-21 00:00:00.000' AS DateTime), NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[user_details] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__skills__F639279DC6E5DC07]    Script Date: 11/22/2019 4:02:38 PM ******/
ALTER TABLE [dbo].[skills] ADD UNIQUE NONCLUSTERED 
(
	[sk_Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mentor_skills]  WITH CHECK ADD  CONSTRAINT [FK__mentor_skil__mid__1FCDBCEB] FOREIGN KEY([mid])
REFERENCES [dbo].[mentor] ([mid])
GO
ALTER TABLE [dbo].[mentor_skills] CHECK CONSTRAINT [FK__mentor_skil__mid__1FCDBCEB]
GO
ALTER TABLE [dbo].[mentor_skills]  WITH CHECK ADD  CONSTRAINT [FK_mentor_skills_skills] FOREIGN KEY([sk_Id])
REFERENCES [dbo].[skills] ([sk_Id])
GO
ALTER TABLE [dbo].[mentor_skills] CHECK CONSTRAINT [FK_mentor_skills_skills]
GO
ALTER TABLE [dbo].[training]  WITH CHECK ADD  CONSTRAINT [FK__training__tr_mId__24927208] FOREIGN KEY([tr_mId])
REFERENCES [dbo].[mentor] ([mid])
GO
ALTER TABLE [dbo].[training] CHECK CONSTRAINT [FK__training__tr_mId__24927208]
GO
ALTER TABLE [dbo].[training]  WITH CHECK ADD FOREIGN KEY([tr_sId])
REFERENCES [dbo].[skills] ([sk_Id])
GO
ALTER TABLE [dbo].[training]  WITH CHECK ADD FOREIGN KEY([tr_uId])
REFERENCES [dbo].[user_details] ([UserId])
GO
/****** Object:  StoredProcedure [dbo].[addskill]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addskill](@mid bigint,@sid bigint,@rating decimal(3,1),@yoe int,@td varchar(30),@facilities varchar(30))
as
INSERT INTO [dbo].[mentor_skills]
           ([mid]
           ,[sk_Id]
           ,[ms_SelfRating]
           ,[ms_Years_Of_Experience]
           ,[ms_Training_Delivered]
           ,[ms_Facilities_Offered])
     VALUES
           (@mid,@sid,@rating,@yoe,@td,@facilities)
GO
/****** Object:  StoredProcedure [dbo].[admin_login]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[admin_login](@email varchar(30))
as
select * from admin
where ad_Username=@email
GO
/****** Object:  StoredProcedure [dbo].[changeStatus]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[changeStatus](@usid int,@mid int,@sid int)
as
INSERT INTO [dbo].[training]
           ([tr_uId]
           ,[tr_mId]
           ,[tr_sId]
           ,[tr_Status])
     VALUES
           (@usid,@mid,@sid,'Requested')
GO
/****** Object:  StoredProcedure [dbo].[Details]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Details]
as
select * from training
GO
/****** Object:  StoredProcedure [dbo].[get_admin]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[get_admin](@username varchar(30))
as
select * from admin
where ad_Username=@username
GO
/****** Object:  StoredProcedure [dbo].[get_admindet]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_admindet]
as
select * from admin
GO
/****** Object:  StoredProcedure [dbo].[get_mentor]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_mentor](@username varchar(30))
as
select * from mentor
where mentor_name=@username
GO
/****** Object:  StoredProcedure [dbo].[get_skills]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_skills]
as
select * from skills
GO
/****** Object:  StoredProcedure [dbo].[getcontact]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getcontact]
as
select contact from user_details
GO
/****** Object:  StoredProcedure [dbo].[getemail]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getemail]
as
select email from user_details
GO
/****** Object:  StoredProcedure [dbo].[getmentoremail]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getmentoremail]
as
select mentor_name from mentor
GO
/****** Object:  StoredProcedure [dbo].[getSkills]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[getSkills]
		   as
		   select * from skills
GO
/****** Object:  StoredProcedure [dbo].[mentor_details]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mentor_details]
as
select * from mentor
GO
/****** Object:  StoredProcedure [dbo].[mentor_details_for_userhome]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mentor_details_for_userhome]
as
select mentor_name as men_Name,linkedin_url as lin_url,ms_Years_Of_Experience as skill_exp,ms_Training_Delivered as trainings_delivered,sk_Name as name_of_skill from mentor,mentor_skills,skills 
where mentor.mid=mentor_skills.mid and mentor_skills.sk_Id=skills.sk_Id
GO
/****** Object:  StoredProcedure [dbo].[mentor_login]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[mentor_login](@uname varchar(30))
as
select * from mentor 
where user_name=@uname
GO
/****** Object:  StoredProcedure [dbo].[mentor_reg]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[mentor_reg](@mname varchar(30),@uname varchar(30),@linkurl varchar(200),@regdate datetime,@yoe int,@pass varchar(20))
as
INSERT INTO [dbo].[mentor]
           ([MName]
		   ,[user_name]
           ,[linkedin_url]
           ,[red_datetime]
           ,[reg_code]
           ,[years_of_experience]
           ,[active]
		   ,[Password])
     VALUES
           (@mname,@uname,@linkurl,@regdate,null,@yoe,null,@pass)
GO
/****** Object:  StoredProcedure [dbo].[mentorhome]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[mentorhome](@mentorId bigint)
as
select tr_Id as training_Id,tr_uId as UserId,tr_mId as mentor_Id,tr_sId as Skill_Id,tr_Status as Status,MName as mentor_Name,First_Name,sk_Name as skill_Name from user_details,skills,training,mentor
where training.tr_mId=@mentorId and  training.tr_sId=skills.sk_Id and user_details.UserId=training.tr_uId and mentor.mid=training.tr_mId

GO
/****** Object:  StoredProcedure [dbo].[user_login]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[user_login](@username varchar(30))
as
select * from user_details 
where Email=@username
GO
/****** Object:  StoredProcedure [dbo].[user_reg]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[user_reg](@email varchar(30),@pass varchar(15),@firstname varchar(50),@lastmane varchar(50),@contact bigint,@regdate datetime)
as
INSERT INTO [dbo].[user_details]
           ([Email]
           ,[Pass]
           ,[First_Name]
           ,[Last_Name]
           ,[Contact]
           ,[reg_datetime]
           ,[reg_code]
           ,[force_reset_password]
           ,[active])
     VALUES
           (@email,@pass,@firstname,@lastmane,@contact,@regdate,null,null,null)
GO
/****** Object:  StoredProcedure [dbo].[userDetails]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[userDetails]
as
select * from user_details
GO
/****** Object:  StoredProcedure [dbo].[userhome]    Script Date: 11/22/2019 4:02:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[userhome]
as
select mentor_skills.mid,ms_Id,mentor_skills.sk_Id,MName as men_Name, user_name as user_Name,linkedin_url as lin_url,sk_Name as name_of_skill,ms_Years_Of_Experience as skill_exp,ms_Training_Delivered as trainings_delivered from mentor,mentor_skills,skills 
where mentor.mid=mentor_skills.mid and mentor_skills.sk_Id=skills.sk_Id
GO
USE [master]
GO
ALTER DATABASE [mentor] SET  READ_WRITE 
GO
