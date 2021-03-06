USE [master]
GO
/****** Object:  Database [BarhatniyeBrovki]    Script Date: 22.06.2022 0:44:05 ******/
CREATE DATABASE [BarhatniyeBrovki]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BarhatniyeBrovki', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DEV\MSSQL\DATA\BarhatniyeBrovki.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BarhatniyeBrovki_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DEV\MSSQL\DATA\BarhatniyeBrovki_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BarhatniyeBrovki] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BarhatniyeBrovki].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BarhatniyeBrovki] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET ARITHABORT OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BarhatniyeBrovki] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BarhatniyeBrovki] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BarhatniyeBrovki] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BarhatniyeBrovki] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET RECOVERY FULL 
GO
ALTER DATABASE [BarhatniyeBrovki] SET  MULTI_USER 
GO
ALTER DATABASE [BarhatniyeBrovki] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BarhatniyeBrovki] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BarhatniyeBrovki] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BarhatniyeBrovki] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BarhatniyeBrovki] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BarhatniyeBrovki] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BarhatniyeBrovki', N'ON'
GO
ALTER DATABASE [BarhatniyeBrovki] SET QUERY_STORE = OFF
GO
USE [BarhatniyeBrovki]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[Products_ID] [int] NOT NULL,
	[Product1_ID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[Products_ID] ASC,
	[Product1_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [datetime] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientServices]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientServices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientServices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByServices]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByServices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByServices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhotoes]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhotoes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhotoes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSales]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSales] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service_b_import]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service_b_import](
	[column1] [nvarchar](100) NOT NULL,
	[column2] [decimal](19, 4) NOT NULL,
	[column3] [int] NOT NULL,
	[column4] [nvarchar](max) NULL,
	[column5] [nvarchar](100) NULL,
	[column6] [nvarchar](1000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhotoes]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhotoes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhotoes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [decimal](19, 4) NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[Clients_ID] [int] NOT NULL,
	[Tags_ID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[Clients_ID] ASC,
	[Tags_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 22.06.2022 0:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (1, N'Кузьмина
', N'Дэнна', N'Витальевна', CAST(N'1993-08-24T00:00:00.000' AS DateTime), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N' nichoj@mac.com
', N' 7(9940)977-45-73 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (2, N'Мамонтова
', N'Марфа', N'Миорновна
', CAST(N'1984-10-19T00:00:00.000' AS DateTime), CAST(N'2018-02-27T00:00:00.000' AS DateTime), N' rfoley@verizon.net
', N' 7(38)095-64-18 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (3, N'Степанова
', N'Амелия
', N'Робертовна
', CAST(N'1970-06-06T00:00:00.000' AS DateTime), CAST(N'2017-09-27T00:00:00.000' AS DateTime), N' rasca@hotmail.com
', N' 7(1217)441-28-42 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (4, N'Колесникова
', N'Алина
', N'Еремеевна
', CAST(N'2001-04-19T00:00:00.000' AS DateTime), CAST(N'2017-01-18T00:00:00.000' AS DateTime), N' gfxguy@outlook.com
', N' 7(74)977-39-71 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (5, N'Морозов
', N'Наум
', N'Валерьянович
', CAST(N'1985-07-04T00:00:00.000' AS DateTime), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N' salesgeek@mac.com
', N' 7(636)050-96-13 
', N'1', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (6, N'Сысоева
', N'Дарина
', N'Ярославовна
', CAST(N'1982-02-03T00:00:00.000' AS DateTime), CAST(N'2016-05-13T00:00:00.000' AS DateTime), N' treit@verizon.net
', N' 7(0698)387-96-04 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (7, N'Горбачёва
', N'Никки
', N'Еремеевна
', CAST(N'1987-04-21T00:00:00.000' AS DateTime), CAST(N'2018-08-16T00:00:00.000' AS DateTime), N' chinthaka@att.net
', N' 7(94)789-69-20 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (8, N'Бирюкова
', N'Инара
', N'Улебовна
', CAST(N'1978-07-21T00:00:00.000' AS DateTime), CAST(N'2017-10-01T00:00:00.000' AS DateTime), N' smpeters@hotmail.com
', N' 7(098)346-50-58 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (9, N'Киселёв
', N'Устин
', N'Яковлевич
', CAST(N'1985-01-08T00:00:00.000' AS DateTime), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N' dalamb@verizon.net
', N' 7(83)334-52-76 
', N'1', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (10, N'Крюкова', N'Авигея
', N'Святославовна
', CAST(N'2000-08-10T00:00:00.000' AS DateTime), CAST(N'2018-01-03T00:00:00.000' AS DateTime), N' simone@gmail.com
', N' 7(499)318-88-53 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (11, N'Костина
', N'Любава
', N'Авксентьевна
', CAST(N'1972-07-13T00:00:00.000' AS DateTime), CAST(N'2016-02-26T00:00:00.000' AS DateTime), N' gordonjcp@hotmail.com
', N' 7(6419)959-21-87 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (12, N'Попова
', N'Харита
', N'Якуновна
', CAST(N'1997-12-16T00:00:00.000' AS DateTime), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N' firstpr@verizon.net
', N' 7(335)386-81-06 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (13, N'Андреева
', N'Патрисия
', N'Валерьевна
', CAST(N'1993-11-18T00:00:00.000' AS DateTime), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N' jigsaw@aol.com
', N' 7(9648)953-81-26 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (15, N'Гусева
', N'Роза
', N'Дмитриевна
', CAST(N'1999-02-13T00:00:00.000' AS DateTime), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N' martyloo@live.com
', N' 7(23)064-51-84
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (16, N'Быков
', N'Трофим', N'Константинович', CAST(N'1994-12-20T00:00:00.000' AS DateTime), CAST(N'2016-04-17T00:00:00.000' AS DateTime), N' jguyer@aol.com
', N' 7(3414)460-12-05 
', N'1', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (18, N'Гусев
', N'Яков
', N'Авксентьевич
', CAST(N'1995-12-10T00:00:00.000' AS DateTime), CAST(N'2017-11-20T00:00:00.000' AS DateTime), N' jdhedden@icloud.com
', N' 7(0972)781-11-37 
', N'1', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (19, N'Турова
', N'Георгина
', N'Семёновна
', CAST(N'1974-05-28T00:00:00.000' AS DateTime), CAST(N'2018-02-22T00:00:00.000' AS DateTime), N' yruan@optonline.net
', N' 7(555)321-42-99 
', N'1', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (20, N'Баранова
', N'Эльмира
', N'Дмитриевна
', CAST(N'1977-01-15T00:00:00.000' AS DateTime), CAST(N'2016-07-08T00:00:00.000' AS DateTime), N' jgmyers@comcast.net
', N' 7(9240)643-15-50 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (22, N'Федотов
', N'Осип
', N'Анатольевич
', CAST(N'1971-04-13T00:00:00.000' AS DateTime), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N' breegster@hotmail.com
', N' 7(590)702-33-06 
', N'1', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (23, N'Борисов
', N'Аввакум
', N'Артемович
', CAST(N'1974-04-25T00:00:00.000' AS DateTime), CAST(N'2017-03-11T00:00:00.000' AS DateTime), N' chlim@live.com
', N' 7(2296)930-08-88 
', N'1', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (25, N'Артемьева
', N'Лиза
', N'Максимовна
', CAST(N'1996-05-17T00:00:00.000' AS DateTime), CAST(N'2018-10-07T00:00:00.000' AS DateTime), N' snunez@yahoo.ca
', N' 7(696)972-70-21 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (26, N'Воронова
', N'Изабелла
', N'Вячеславовна
', CAST(N'1999-09-24T00:00:00.000' AS DateTime), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N' kildjean@sbcglobal.net
', N' 7(17)433-44-98 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (27, N'Федотова
', N'Сандра
', N'Владленовна
', CAST(N'1985-03-29T00:00:00.000' AS DateTime), CAST(N'2016-11-08T00:00:00.000' AS DateTime), N' penna@verizon.net
', N' 7(126)195-25-86 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (28, N'Ефремов
', N'Витольд
', N'Авксентьевич
', CAST(N'1975-12-02T00:00:00.000' AS DateTime), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N' kwilliams@yahoo.ca
', N' 7(93)922-14-03 
', N'1', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (29, N'Ермакова
', N'Алла
', N'Мироновна
', CAST(N'1976-01-22T00:00:00.000' AS DateTime), CAST(N'2017-02-09T00:00:00.000' AS DateTime), N' whimsy@aol.com
', N' 7(06)437-13-73 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (30, N'Шашкова
', N'Гелла
', N'Эдуардовна
', CAST(N'1979-02-24T00:00:00.000' AS DateTime), CAST(N'2016-11-16T00:00:00.000' AS DateTime), N' jadavis@mac.com
', N' 7(57)446-21-04 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (31, N'Быкова
', N'Тала
', N'Георгьевна
', CAST(N'2000-02-22T00:00:00.000' AS DateTime), CAST(N'2016-08-13T00:00:00.000' AS DateTime), N' ganter@optonline.net
', N' 7(13)915-53-53 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (32, N'Орлова
', N'Влада
', N'Мартыновна
', CAST(N'1990-06-26T00:00:00.000' AS DateTime), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N' rnelson@yahoo.ca
', N' 7(2506)433-38-35 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (33, N'Анисимова
', N'Тамара
', N'Витальевна
', CAST(N'1988-06-16T00:00:00.000' AS DateTime), CAST(N'2016-02-25T00:00:00.000' AS DateTime), N' schwaang@mac.com
', N' 7(66)128-04-10 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (34, N'Архипова
', N'Прасковья
', N'Валерьевна
', CAST(N'1979-01-09T00:00:00.000' AS DateTime), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N' cgcra@live.com
', N' 7(86)540-10-21 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (35, N'Новиков
', N'Адриан
', N'Аркадьевич
', CAST(N'1974-01-15T00:00:00.000' AS DateTime), CAST(N'2018-11-23T00:00:00.000' AS DateTime), N' multiplx@verizon.net
', N' 7(70)572-33-62 
', N'1', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (36, N'Трофимова
', N'Альжбета
', N'Якововна
', CAST(N'1988-10-22T00:00:00.000' AS DateTime), CAST(N'2017-09-21T00:00:00.000' AS DateTime), N' gbacon@mac.com
', N' 7(1084)658-92-95 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (37, N'Лазарева
', N'Эльвина
', N'Робертовна
', CAST(N'1996-02-16T00:00:00.000' AS DateTime), CAST(N'2018-04-11T00:00:00.000' AS DateTime), N' ahuillet@comcast.net
', N' 7(5564)609-81-37 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (38, N'Афанасьева
', N'Розалия
', N'Макаровна
', CAST(N'1977-05-01T00:00:00.000' AS DateTime), CAST(N'2017-09-06T00:00:00.000' AS DateTime), N' malattia@hotmail.com
', N' 7(0661)413-23-32 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (39, N'Устинова
', N'Юнона
', N'Валентиновна
', CAST(N'1982-08-08T00:00:00.000' AS DateTime), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N' kempsonc@live.com
', N' 7(33)367-13-07
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (41, N'Алексеева
', N'Элина
', N'Матвеевна
', CAST(N'2002-05-07T00:00:00.000' AS DateTime), CAST(N'2018-03-28T00:00:00.000' AS DateTime), N' pthomsen@verizon.net
', N' 7(8086)245-64-81 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (42, N'Гущина
', N'Янита
', N'Федоровна
', CAST(N'1999-03-02T00:00:00.000' AS DateTime), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N' lishoy@att.net
', N' 7(4544)716-68-96 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (45, N'Суворова
', N'Божена
', N'Анатольевна
', CAST(N'1981-03-09T00:00:00.000' AS DateTime), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N' attwood@aol.com
', N' 7(347)895-86-57 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (47, N'Горшкова
', N'Марта
', N'Иосифовна
', CAST(N'2001-02-13T00:00:00.000' AS DateTime), CAST(N'2016-08-04T00:00:00.000' AS DateTime), N' gbacon@mac.com
', N' 7(544)650-59-03 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (48, N'Смирнов
', N'Мартын
', N'Арсеньевич
', CAST(N'1996-06-25T00:00:00.000' AS DateTime), CAST(N'2017-02-07T00:00:00.000' AS DateTime), N' haddawy@live.com
', N' 7(6251)589-02-43 
', N'1', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (49, N'Корнилова
', N'Анэля
', N'Михайловна
', CAST(N'1973-04-02T00:00:00.000' AS DateTime), CAST(N'2016-05-22T00:00:00.000' AS DateTime), N' jonathan@aol.com
', N' 7(20)980-01-60 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (50, N'Ефимова
', N'Магда
', N'Платоновна
', CAST(N'1995-08-16T00:00:00.000' AS DateTime), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N' rbarreira@me.com
', N' 7(9261)386-15-92 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (52, N'Бурова
', N'Светлана
', N'Лукьевна
', CAST(N'1979-01-04T00:00:00.000' AS DateTime), CAST(N'2016-10-13T00:00:00.000' AS DateTime), N' wsnyder@aol.com
', N' 7(358)173-82-21 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (53, N'Сидорова
', N'Татьяна
', N'Михайловна
', CAST(N'1974-04-24T00:00:00.000' AS DateTime), CAST(N'2018-10-03T00:00:00.000' AS DateTime), N' tbeck@mac.com
', N' 7(51)732-91-79 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (55, N'Ершова
', N'Номи
', N'Андреевна
', CAST(N'2001-09-13T00:00:00.000' AS DateTime), CAST(N'2016-06-30T00:00:00.000' AS DateTime), N' miltchev@mac.com
', N' 7(7757)315-90-99 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (57, N'Овчинникова
', N'Лаура
', N'Еремеевна
', CAST(N'1992-04-03T00:00:00.000' AS DateTime), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N' carcus@yahoo.ca
', N' 7(85)829-33-79 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (58, N'Мишина
', N'Иветта
', N'Андреевна
', CAST(N'2002-10-05T00:00:00.000' AS DateTime), CAST(N'2016-01-24T00:00:00.000' AS DateTime), N' aukjan@yahoo.com
', N' 7(3926)244-81-96 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (59, N'Колобова
', N'Злата
', N'Романовна
', CAST(N'1994-08-25T00:00:00.000' AS DateTime), CAST(N'2016-12-03T00:00:00.000' AS DateTime), N' sinkou@aol.com
', N' 7(50)884-07-35 
', N'2', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (60, N'Селиверстов
', N'Глеб
', N'Максимович
', CAST(N'1999-06-20T00:00:00.000' AS DateTime), CAST(N'2016-01-07T00:00:00.000' AS DateTime), N' jigsaw@sbcglobal.net
', N' 7(20)554-28-68 
', N'1', NULL)
INSERT [dbo].[Clients] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (61, N'Дмитриева
', N'Элина
', N'Даниловна
', CAST(N'1988-12-10T00:00:00.000' AS DateTime), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N' vmalik@live.com
', N' 7(787)140-48-84 
', N'2', NULL)
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientServices] ON 

INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 32, 45, CAST(N'2019-04-27T13:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 45, 41, CAST(N'2019-05-31T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 36, 59, CAST(N'2019-09-20T17:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 38, 75, CAST(N'2019-10-17T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 7, 26, CAST(N'2019-07-12T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 6, 39, CAST(N'2019-09-06T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 34, 89, CAST(N'2019-09-28T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 20, 67, CAST(N'2019-09-11T13:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 10, 40, CAST(N'2019-06-21T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 4, 29, CAST(N'2019-12-20T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 20, 71, CAST(N'2019-03-19T12:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 36, 79, CAST(N'2019-12-23T17:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 38, 55, CAST(N'2019-01-17T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 53, 11, CAST(N'2019-12-18T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 15, 75, CAST(N'2019-01-22T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 34, 12, CAST(N'2019-09-07T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 38, 8, CAST(N'2019-01-01T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 33, 39, CAST(N'2019-06-24T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 1, 89, CAST(N'2019-04-28T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 4, 55, CAST(N'2019-06-13T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 55, 67, CAST(N'2019-12-25T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 53, 86, CAST(N'2019-10-07T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 61, 40, CAST(N'2019-05-22T15:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 37, 71, CAST(N'2019-10-05T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 25, 87, CAST(N'2019-01-27T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 33, 30, CAST(N'2019-11-15T17:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 20, 23, CAST(N'2019-05-06T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 4, 37, CAST(N'2019-02-13T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 13, 64, CAST(N'2019-05-20T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 41, 5, CAST(N'2019-01-19T13:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 31, 92, CAST(N'2019-06-07T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 1, 59, CAST(N'2019-03-21T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 32, 95, CAST(N'2019-08-04T12:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 3, 24, CAST(N'2019-01-11T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 6, 92, CAST(N'2019-05-26T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 1, 29, CAST(N'2019-05-04T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 27, 11, CAST(N'2019-07-23T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 38, 72, CAST(N'2019-01-04T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 2, 39, CAST(N'2019-10-12T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 4, 30, CAST(N'2019-10-24T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 38, 22, CAST(N'2019-05-29T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 1, 78, CAST(N'2019-09-20T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 2, 81, CAST(N'2019-05-07T15:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 25, 70, CAST(N'2019-09-11T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 49, 96, CAST(N'2019-11-26T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 2, 86, CAST(N'2019-03-28T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 3, 29, CAST(N'2019-01-17T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 61, 26, CAST(N'2019-01-28T15:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 19, 40, CAST(N'2019-06-22T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 58, 21, CAST(N'2019-12-15T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 49, 41, CAST(N'2019-06-07T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 19, 96, CAST(N'2019-09-14T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 11, 10, CAST(N'2019-11-04T12:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 50, 91, CAST(N'2019-02-26T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 42, 82, CAST(N'2019-09-13T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 12, 86, CAST(N'2019-11-22T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 45, 78, CAST(N'2019-12-09T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 61, 5, CAST(N'2019-10-31T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 7, 10, CAST(N'2019-08-31T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 41, 37, CAST(N'2019-06-24T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 39, 23, CAST(N'2019-11-29T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 57, 10, CAST(N'2019-08-25T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 25, 92, CAST(N'2019-11-13T11:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 45, 26, CAST(N'2019-07-30T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 55, 26, CAST(N'2019-05-25T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 31, 55, CAST(N'2019-06-26T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 59, 10, CAST(N'2019-11-06T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 4, 37, CAST(N'2019-04-29T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 57, 45, CAST(N'2019-10-21T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 13, 14, CAST(N'2019-06-23T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 29, 32, CAST(N'2019-11-09T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 50, 42, CAST(N'2019-10-02T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 36, 92, CAST(N'2019-06-07T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 42, 82, CAST(N'2019-01-17T11:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 61, 95, CAST(N'2019-01-11T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 45, 71, CAST(N'2019-11-13T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 39, 78, CAST(N'2019-10-10T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 6, 40, CAST(N'2019-03-01T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 31, 15, CAST(N'2019-07-21T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 47, 30, CAST(N'2019-12-21T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 49, 92, CAST(N'2019-10-01T12:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 58, 67, CAST(N'2019-08-19T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 11, 89, CAST(N'2019-03-01T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 47, 23, CAST(N'2019-05-11T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 4, 8, CAST(N'2019-12-21T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 31, 64, CAST(N'2019-01-30T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 26, 65, CAST(N'2019-03-09T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 25, 37, CAST(N'2019-08-08T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 45, 92, CAST(N'2019-03-04T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 50, 79, CAST(N'2019-06-17T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 13, 52, CAST(N'2019-02-11T09:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 50, 79, CAST(N'2019-02-01T12:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 57, 81, CAST(N'2019-12-11T09:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 30, 81, CAST(N'2019-01-13T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 15, 82, CAST(N'2019-03-23T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 11, 14, CAST(N'2019-10-02T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 33, 8, CAST(N'2019-01-20T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 12, 82, CAST(N'2019-01-27T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (101, 57, 48, CAST(N'2019-05-19T08:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ClientServices] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (102, 8, 75, CAST(N'2019-11-30T19:10:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClientServices] OFF
GO
INSERT [dbo].[Genders] ([Code], [Name]) VALUES (N'1', N'мужской')
INSERT [dbo].[Genders] ([Code], [Name]) VALUES (N'2', N'женский')
GO
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���騢���� �᭨�', CAST(1430.0000 AS Decimal(19, 4)), 2400, NULL, N'0,05', N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������஢���� �᭨�+����', CAST(1390.0000 AS Decimal(19, 4)), 2100, NULL, N'0,1', N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������஢���� �᭨�', CAST(1740.0000 AS Decimal(19, 4)), 3300, NULL, N'0,25', N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���᪨� ᯠ ���ᠦ', CAST(2540.0000 AS Decimal(19, 4)), 3000, NULL, N'0,2', N'��㣨 ᠫ��� �����\���ᠦ.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����࠯��', CAST(2040.0000 AS Decimal(19, 4)), 2400, NULL, N'0,2', N'��㣨 ᠫ��� �����\�����࠯��.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���㯥ଠ���⭠� ����', CAST(2340.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������ SPA', CAST(2420.0000 AS Decimal(19, 4)), 900, NULL, NULL, N'��㣨 ᠫ��� �����\������ SPA.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���ᨭ�', CAST(1330.0000 AS Decimal(19, 4)), 3300, NULL, NULL, N'��㣨 ᠫ��� �����\�ப�� �襩 ���⮫�⮬.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���ᠦ �����', CAST(1090.0000 AS Decimal(19, 4)), 3000, NULL, NULL, N'��㣨 ᠫ��� �����\���ᠦ.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����࠯��', CAST(2350.0000 AS Decimal(19, 4)), 2400, NULL, NULL, N'��㣨 ᠫ��� �����\�����࠯��.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��ய��᪨� �������', CAST(1990.0000 AS Decimal(19, 4)), 3600, NULL, N'0,05', N'��㣨 ᠫ��� �����\��ய��᪨� �������.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�������� ���ப���⢥���� ��ࠧ������ ����', CAST(1910.0000 AS Decimal(19, 4)), 900, NULL, NULL, N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�ᯠ�᪨� ���ᠦ', CAST(2190.0000 AS Decimal(19, 4)), 2400, NULL, N'0,25', N'��㣨 ᠫ��� �����\���ᠦ.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���騢���� �᭨� �㪮�쭮�� ��䥪�', CAST(2120.0000 AS Decimal(19, 4)), 2100, NULL, NULL, N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��ਦ�� � ����᪮�', CAST(2300.0000 AS Decimal(19, 4)), 1500, NULL, N'0,1', N'��㣨 ᠫ��� �����\��ਦ��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��⮪� ᯠ', CAST(1330.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���-�࠯��', CAST(2100.0000 AS Decimal(19, 4)), 3000, NULL, N'0,25', N'��㣨 ᠫ��� �����\���-�࠯��.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������������� ���⨭�', CAST(1590.0000 AS Decimal(19, 4)), 3000, NULL, N'0,15', N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����᪨� �������', CAST(1090.0000 AS Decimal(19, 4)), 3000, NULL, N'0,2', N'��㣨 ᠫ��� �����\��ਦ��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��죨���� ��᪨', CAST(2370.0000 AS Decimal(19, 4)), 3300, NULL, NULL, N'��㣨 ᠫ��� �����\mask.jpeg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'����⨢�� ���ᠦ', CAST(1650.0000 AS Decimal(19, 4)), 1800, NULL, N'0,15', N'��㣨 ᠫ��� �����\���ᠦ.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��祡��� �����⨥ ���⥩', CAST(1220.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'��㣨 ᠫ��� �����\����.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'����������� � ��祭�� ����� � ���� ������', CAST(2360.0000 AS Decimal(19, 4)), 3300, NULL, N'0,15', N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������᪨� �������', CAST(1680.0000 AS Decimal(19, 4)), 3300, NULL, N'0,2', N'��㣨 ᠫ��� �����\������᪨� �������.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��������� ���', CAST(2120.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'��㣨 ᠫ��� �����\122454.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���騢���� �᭨� ���쥣� ��䥪�', CAST(1370.0000 AS Decimal(19, 4)), 1800, NULL, N'0,25', N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������-�������', CAST(2170.0000 AS Decimal(19, 4)), 1200, NULL, N'0,2', N'��㣨 ᠫ��� �����\������-�������.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'����� ���ᠦ', CAST(1520.0000 AS Decimal(19, 4)), 2400, NULL, N'0,15', N'��㣨 ᠫ��� �����\����� ���ᠦ.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�������஢���� �������', CAST(2390.0000 AS Decimal(19, 4)), 3600, NULL, NULL, N'��㣨 ᠫ��� �����\�������஢���� �������.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����१ ���', CAST(1120.0000 AS Decimal(19, 4)), 1200, NULL, N'0,05', N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��ଠ����� ����� (��㠦)', CAST(1270.0000 AS Decimal(19, 4)), 2400, NULL, N'0,25', N'��㣨 ᠫ��� �����\�஢�.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����᪨� ������', CAST(2880.0000 AS Decimal(19, 4)), 1500, NULL, N'0,15', N'��㣨 ᠫ��� �����\piling.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���������⨭�', CAST(2450.0000 AS Decimal(19, 4)), 900, NULL, N'0,2', N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�ਮ���⨭�', CAST(1090.0000 AS Decimal(19, 4)), 900, NULL, NULL, N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��������� �����孮��� ������ ������', CAST(2230.0000 AS Decimal(19, 4)), 2100, NULL, N'0,1', N'��㣨 ᠫ��� �����\piling.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���訢���� �᭨�', CAST(1100.0000 AS Decimal(19, 4)), 2100, NULL, NULL, N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���४�� ���饭��� �᭨�', CAST(1310.0000 AS Decimal(19, 4)), 2700, NULL, N'0,05', N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�ࠪ樮���� ���������� ����୮� ��⥬�� Palomar', CAST(1140.0000 AS Decimal(19, 4)), 2700, NULL, N'0,05', N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�㤮���⢥���� ��ଫ���� �᭨�', CAST(2040.0000 AS Decimal(19, 4)), 3000, NULL, NULL, N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����᪠� ����ୠ� 諨䮢�� ����', CAST(1750.0000 AS Decimal(19, 4)), 2400, NULL, N'0,25', N'��㣨 ᠫ��� �����\piling.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���ᠦ ����', CAST(2330.0000 AS Decimal(19, 4)), 3300, NULL, N'0,25', N'��㣨 ᠫ��� �����\���ᠦ.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����', CAST(2470.0000 AS Decimal(19, 4)), 1800, NULL, N'0,2', N'��㣨 ᠫ��� �����\makeup.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�६� ����� � ����������', CAST(1850.0000 AS Decimal(19, 4)), 2400, NULL, N'0,1', N'��㣨 ᠫ��� �����\96.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���⨥ �᭨�', CAST(1680.0000 AS Decimal(19, 4)), 2700, NULL, N'0,25', N'��㣨 ᠫ��� �����\���⨥ �᭨�.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��ଫ���� �஢��', CAST(2280.0000 AS Decimal(19, 4)), 2100, NULL, NULL, N'��㣨 ᠫ��� �����\�஢�.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��ਦ�� ��த� ��設���', CAST(1750.0000 AS Decimal(19, 4)), 2700, NULL, N'0,1', N'��㣨 ᠫ��� �����\man.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��᪨ ��� ���', CAST(2250.0000 AS Decimal(19, 4)), 1200, NULL, N'0,1', N'��㣨 ᠫ��� �����\mask.jpeg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���㠦', CAST(1330.0000 AS Decimal(19, 4)), 3600, NULL, N'0,2', N'��㣨 ᠫ��� �����\�஢�.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�室 ��� �஡������ � �������஢����� ����', CAST(2440.0000 AS Decimal(19, 4)), 3600, NULL, N'0,15', N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�ப�� �襩 ���⮫�⮬', CAST(2040.0000 AS Decimal(19, 4)), 1500, NULL, N'0,05', N'��㣨 ᠫ��� �����\�ப�� �襩 ���⮫�⮬.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������ ������ �����', CAST(2340.0000 AS Decimal(19, 4)), 1800, NULL, N'0,25', N'��㣨 ᠫ��� �����\����.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'����஢�� � ��᫮�', CAST(1280.0000 AS Decimal(19, 4)), 1200, NULL, NULL, N'��㣨 ᠫ��� �����\piling.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���������� ���� ����� ����', CAST(2540.0000 AS Decimal(19, 4)), 1800, NULL, N'0,15', N'��㣨 ᠫ��� �����\�஢�.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����⭠� ��ᬥ⮫����', CAST(1180.0000 AS Decimal(19, 4)), 3300, NULL, NULL, N'��㣨 ᠫ��� �����\96.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��������� ���-��ᬥ⮫���', CAST(2350.0000 AS Decimal(19, 4)), 3600, NULL, N'0,05', N'��㣨 ᠫ��� �����\122454.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����', CAST(1260.0000 AS Decimal(19, 4)), 3000, NULL, NULL, N'��㣨 ᠫ��� �����\makeup.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�������', CAST(1470.0000 AS Decimal(19, 4)), 1200, NULL, N'0,15', N'��㣨 ᠫ��� �����\�������.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���४�� �᭨�', CAST(2010.0000 AS Decimal(19, 4)), 1200, NULL, N'0,1', N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���᪠� ��ਦ��', CAST(2330.0000 AS Decimal(19, 4)), 2100, NULL, N'0,2', N'��㣨 ᠫ��� �����\��ਦ��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��᪠� ��ਦ��', CAST(1690.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'��㣨 ᠫ��� �����\man.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������ ���᪠', CAST(2020.0000 AS Decimal(19, 4)), 900, NULL, N'0,25', N'��㣨 ᠫ��� �����\��ਦ��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���騢���� �᭨� �����쥣� ��䥪�', CAST(1010.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������� (�।���⨭�)', CAST(2140.0000 AS Decimal(19, 4)), 1500, NULL, NULL, N'��㣨 ᠫ��� �����\96.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����⨥ ���⥩', CAST(2410.0000 AS Decimal(19, 4)), 2400, NULL, N'0,15', N'��㣨 ᠫ��� �����\����.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����᪨� ���ᠦ ����-����', CAST(1040.0000 AS Decimal(19, 4)), 2100, NULL, N'0,15', N'��㣨 ᠫ��� �����\���ᠦ.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���䨭��࠯��', CAST(1180.0000 AS Decimal(19, 4)), 2100, NULL, N'0,05', N'��㣨 ᠫ��� �����\���䨭��࠯��.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������࠯��', CAST(1740.0000 AS Decimal(19, 4)), 2100, NULL, N'0,2', N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�������� ������', CAST(2430.0000 AS Decimal(19, 4)), 2700, NULL, N'0,15', N'��㣨 ᠫ��� �����\piling.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����⨥ ���⥩ ����-�����', CAST(2100.0000 AS Decimal(19, 4)), 900, NULL, N'0,2', N'��㣨 ᠫ��� �����\�����⨥ ���⥩ ����-�����.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����஢���� �᭨� ��ࠧ���', CAST(1920.0000 AS Decimal(19, 4)), 3000, NULL, N'0,15', N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'����⮪���� �࠯��', CAST(2410.0000 AS Decimal(19, 4)), 2700, NULL, N'0,05', N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��ਦ�� 祫��', CAST(1930.0000 AS Decimal(19, 4)), 2100, NULL, N'0,1', N'��㣨 ᠫ��� �����\��ਦ��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������ ������', CAST(1650.0000 AS Decimal(19, 4)), 1200, NULL, N'0,25', N'��㣨 ᠫ��� �����\piling.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���ᠦ ���', CAST(2370.0000 AS Decimal(19, 4)), 3600, NULL, NULL, N'��㣨 ᠫ��� �����\���ᠦ.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���⨥ ����', CAST(1240.0000 AS Decimal(19, 4)), 2100, NULL, NULL, N'��㣨 ᠫ��� �����\����.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������᪨� �������', CAST(2040.0000 AS Decimal(19, 4)), 2100, NULL, N'0,25', N'��㣨 ᠫ��� �����\������-�������.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������᪨� ���ᠦ', CAST(1120.0000 AS Decimal(19, 4)), 2700, NULL, N'0,15', N'��㣨 ᠫ��� �����\���ᠦ.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���訢���� �஢��', CAST(1120.0000 AS Decimal(19, 4)), 3600, NULL, N'0,1', N'��㣨 ᠫ��� �����\���訢���� �஢��.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���騢���� ���⥩ �����', CAST(1540.0000 AS Decimal(19, 4)), 2400, NULL, N'0,1', N'��㣨 ᠫ��� �����\����.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��⮪�', CAST(1820.0000 AS Decimal(19, 4)), 3000, NULL, N'0,15', N'��㣨 ᠫ��� �����\96.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��ꥪ樮��� ��⮤���', CAST(1660.0000 AS Decimal(19, 4)), 2400, NULL, NULL, N'��㣨 ᠫ��� �����\96.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'����᪠ �᭨�', CAST(2400.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'��㣨 ᠫ��� �����\��᭨��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��������� ���᪠', CAST(2070.0000 AS Decimal(19, 4)), 2700, NULL, NULL, N'��㣨 ᠫ��� �����\��ਦ��.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'������஢���� �᭨�', CAST(2140.0000 AS Decimal(19, 4)), 2700, NULL, NULL, N'��㣨 ᠫ��� �����\������஢���� �᭨�.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'����⨬����', CAST(2380.0000 AS Decimal(19, 4)), 3600, NULL, NULL, N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�㣠ਭ�', CAST(1400.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'��㣨 ᠫ��� �����\�㣠ਭ�.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��९����� ���⥩ �����', CAST(1260.0000 AS Decimal(19, 4)), 2700, NULL, NULL, N'��㣨 ᠫ��� �����\��९����� ���⥩ �����.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'����਩', CAST(1790.0000 AS Decimal(19, 4)), 3000, NULL, N'0,1', N'��㣨 ᠫ��� �����\soliarij.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����⠫�� ���⨭�', CAST(2020.0000 AS Decimal(19, 4)), 3000, NULL, NULL, N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���᪨� �������', CAST(1900.0000 AS Decimal(19, 4)), 2100, NULL, NULL, N'��㣨 ᠫ��� �����\����.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'����ࠧ�㪮��� ������', CAST(1440.0000 AS Decimal(19, 4)), 2700, NULL, N'0,2', N'��㣨 ᠫ��� �����\piling.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��-�㭠', CAST(1160.0000 AS Decimal(19, 4)), 2700, NULL, N'0,2', N'��㣨 ᠫ��� �����\��-�㭠.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����ୠ� ����⨪�', CAST(1550.0000 AS Decimal(19, 4)), 2100, NULL, N'0,2', N'��㣨 ᠫ��� �����\�����ୠ� ����⨪�.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�����஢���� ���饭��� �᭨� ��ࠧ���', CAST(1130.0000 AS Decimal(19, 4)), 2700, NULL, NULL, N'��㣨 ᠫ��� �����\�����஢���� ���饭��� �᭨� ��ࠧ���.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�������� ��᪮�', CAST(2330.0000 AS Decimal(19, 4)), 1800, NULL, N'0,15', N'��㣨 ᠫ��� �����\�������� ��᪮�.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'����஢�� ���⥩', CAST(2310.0000 AS Decimal(19, 4)), 3000, NULL, N'0,15', N'��㣨 ᠫ��� �����\����஢�� ���⥩.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'�ࠪ樮��� ����� Palomar Emerge', CAST(1720.0000 AS Decimal(19, 4)), 1500, NULL, N'0,25', N'��㣨 ᠫ��� �����\face.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���������� � ����������', CAST(2490.0000 AS Decimal(19, 4)), 3300, NULL, NULL, N'��㣨 ᠫ��� �����\96.png')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'���ᠦ ����஢�⥫��', CAST(1440.0000 AS Decimal(19, 4)), 1200, NULL, NULL, N'��㣨 ᠫ��� �����\���ᠦ.jpg')
INSERT [dbo].[service_b_import] ([column1], [column2], [column3], [column4], [column5], [column6]) VALUES (N'��騩 ���ᠦ', CAST(1970.0000 AS Decimal(19, 4)), 2700, NULL, N'0,25', N'��㣨 ᠫ��� �����\���ᠦ.jpg')
GO
SET IDENTITY_INSERT [dbo].[ServicePhotoes] ON 

INSERT [dbo].[ServicePhotoes] ([ID], [ServiceID], [PhotoPath]) VALUES (10, 1, N'Услуги салона красоты\visiblePassword.png')
SET IDENTITY_INSERT [dbo].[ServicePhotoes] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Наращивание ресниц
', CAST(1430.0000 AS Decimal(19, 4)), 2400, NULL, 0.05, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Моделирование ресниц+тушь
', CAST(1390.0000 AS Decimal(19, 4)), 2100, NULL, 0.1, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Ламинирование ресниц
', CAST(1740.0000 AS Decimal(19, 4)), 3300, NULL, 0.25, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Русский спа массаж
', CAST(2540.0000 AS Decimal(19, 4)), 3000, NULL, 0.2, N'Услуги салона красоты\массаж.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Мезотерапия
', CAST(2040.0000 AS Decimal(19, 4)), 2400, NULL, 0.2, N'Услуги салона красоты\Мезотерапия.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Полуперманентная тушь
', CAST(2340.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Экспресс SPA
', CAST(2420.0000 AS Decimal(19, 4)), 900, NULL, NULL, N'Услуги салона красоты\Экспресс SPA.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Пирсинг
', CAST(1330.0000 AS Decimal(19, 4)), 3300, NULL, NULL, N'Услуги салона красоты\Прокол ушей пистолетом.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Массаж масляный
', CAST(1090.0000 AS Decimal(19, 4)), 3000, NULL, NULL, N'Услуги салона красоты\массаж.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Прессотерапия
', CAST(2350.0000 AS Decimal(19, 4)), 2400, NULL, NULL, N'Услуги салона красоты\Прессотерапия.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Европейский маникюр
', CAST(1990.0000 AS Decimal(19, 4)), 3600, NULL, 0.05, N'Услуги салона красоты\Европейский маникюр.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Удаление доброкачественных образований кожи
', CAST(1910.0000 AS Decimal(19, 4)), 900, NULL, NULL, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Испанский массаж
', CAST(2190.0000 AS Decimal(19, 4)), 2400, NULL, 0.25, N'Услуги салона красоты\массаж.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Наращивание ресниц кукольного эффекта
', CAST(2120.0000 AS Decimal(19, 4)), 2100, NULL, NULL, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Стрижка с покраской
', CAST(2300.0000 AS Decimal(19, 4)), 1500, NULL, 0.1, N'Услуги салона красоты\стрижка.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Детокс спа
', CAST(1330.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Стоун-терапия
', CAST(2100.0000 AS Decimal(19, 4)), 3000, NULL, 0.25, N'Услуги салона красоты\Стоун-терапия.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Радиоволновой лифтинг
', CAST(1590.0000 AS Decimal(19, 4)), 3000, NULL, 0.15, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Химические завивки
', CAST(1090.0000 AS Decimal(19, 4)), 3000, NULL, 0.2, N'Услуги салона красоты\стрижка.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Альгинатные маски
', CAST(2370.0000 AS Decimal(19, 4)), 3300, NULL, NULL, N'Услуги салона красоты\mask.jpeg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Спортивный массаж
', CAST(1650.0000 AS Decimal(19, 4)), 1800, NULL, 0.15, N'Услуги салона красоты\массаж.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Лечебное покрытие ногтей
', CAST(1220.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'Услуги салона красоты\ногти.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Реконструкция и лечение волос и кожи головы
', CAST(2360.0000 AS Decimal(19, 4)), 3300, NULL, 0.15, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Классический маникюр
', CAST(1680.0000 AS Decimal(19, 4)), 3300, NULL, 0.2, N'Услуги салона красоты\Классический маникюр.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Консультация врача
', CAST(2120.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'Услуги салона красоты\122454.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Наращивание ресниц лисьего эффекта
', CAST(1370.0000 AS Decimal(19, 4)), 1800, NULL, 0.25, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Экспресс-педикюр
', CAST(2170.0000 AS Decimal(19, 4)), 1200, NULL, 0.2, N'Услуги салона красоты\Экспресс-педикюр.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Гречишный массаж
', CAST(1520.0000 AS Decimal(19, 4)), 2400, NULL, 0.15, N'Услуги салона красоты\Гречишный массаж.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Комбинированный маникюр
', CAST(2390.0000 AS Decimal(19, 4)), 3600, NULL, NULL, N'Услуги салона красоты\Комбинированный маникюр.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Фонофорез лица
', CAST(1120.0000 AS Decimal(19, 4)), 1200, NULL, 0.05, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Перманентный макияж (татуаж)
', CAST(1270.0000 AS Decimal(19, 4)), 2400, NULL, 0.25, N'Услуги салона красоты\брови.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Химический пилинг
', CAST(2880.0000 AS Decimal(19, 4)), 1500, NULL, 0.15, N'Услуги салона красоты\piling.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Плазмолифтинг
', CAST(2450.0000 AS Decimal(19, 4)), 900, NULL, 0.2, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Криолифтинг
', CAST(1090.0000 AS Decimal(19, 4)), 900, NULL, NULL, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Гликолевый поверхностный базовый пилинг
', CAST(2230.0000 AS Decimal(19, 4)), 2100, NULL, 0.1, N'Услуги салона красоты\piling.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Окрашивание ресниц
', CAST(1100.0000 AS Decimal(19, 4)), 2100, NULL, NULL, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Коррекция нарощенных ресниц
', CAST(1310.0000 AS Decimal(19, 4)), 2700, NULL, 0.05, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Фракционное омоложение лазерной системой Palomar
', CAST(1140.0000 AS Decimal(19, 4)), 2700, NULL, 0.05, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Художественное оформление ресниц
', CAST(2040.0000 AS Decimal(19, 4)), 3000, NULL, NULL, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Эстетическая лазерная шлифовка кожи
', CAST(1750.0000 AS Decimal(19, 4)), 2400, NULL, 0.25, N'Услуги салона красоты\piling.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Массаж ЖИВА
', CAST(2330.0000 AS Decimal(19, 4)), 3300, NULL, 0.25, N'Услуги салона красоты\массаж.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Макияж
', CAST(2470.0000 AS Decimal(19, 4)), 1800, NULL, 0.2, N'Услуги салона красоты\makeup.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Время вспять с коллагеном
', CAST(1850.0000 AS Decimal(19, 4)), 2400, NULL, 0.1, N'Услуги салона красоты\96.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Снятие ресниц
', CAST(1680.0000 AS Decimal(19, 4)), 2700, NULL, 0.25, N'Услуги салона красоты\Снятие ресниц.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Оформление бровей
', CAST(2280.0000 AS Decimal(19, 4)), 2100, NULL, NULL, N'Услуги салона красоты\брови.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Стрижка бороды машинкой
', CAST(1750.0000 AS Decimal(19, 4)), 2700, NULL, 0.1, N'Услуги салона красоты\man.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Маски для лица
', CAST(2250.0000 AS Decimal(19, 4)), 1200, NULL, 0.1, N'Услуги салона красоты\mask.jpeg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Татуаж
', CAST(1330.0000 AS Decimal(19, 4)), 3600, NULL, 0.2, N'Услуги салона красоты\брови.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Уход для проблемной и комбинированной кожи
', CAST(2440.0000 AS Decimal(19, 4)), 3600, NULL, 0.15, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Прокол ушей пистолетом
', CAST(2040.0000 AS Decimal(19, 4)), 1500, NULL, 0.05, N'Услуги салона красоты\Прокол ушей пистолетом.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (51, N'Ремонт одного ногтя
', CAST(2340.0000 AS Decimal(19, 4)), 1800, NULL, 0.25, N'Услуги салона красоты\ногти.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (52, N'Полировка с маслом
', CAST(1280.0000 AS Decimal(19, 4)), 1200, NULL, NULL, N'Услуги салона красоты\piling.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (53, N'Омоложение зоны вокруг глаз
', CAST(2540.0000 AS Decimal(19, 4)), 1800, NULL, 0.15, N'Услуги салона красоты\брови.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (54, N'Аппаратная косметология
', CAST(1180.0000 AS Decimal(19, 4)), 3300, NULL, NULL, N'Услуги салона красоты\96.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (55, N'Консультация врача-косметолога
', CAST(2350.0000 AS Decimal(19, 4)), 3600, NULL, 0.05, N'Услуги салона красоты\122454.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (56, N'Визаж
', CAST(1260.0000 AS Decimal(19, 4)), 3000, NULL, NULL, N'Услуги салона красоты\makeup.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (57, N'Демакияж
', CAST(1470.0000 AS Decimal(19, 4)), 1200, NULL, 0.15, N'Услуги салона красоты\Демакияж.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (58, N'Коррекция ресниц
', CAST(2010.0000 AS Decimal(19, 4)), 1200, NULL, 0.1, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (59, N'Детская стрижка
', CAST(2330.0000 AS Decimal(19, 4)), 2100, NULL, 0.2, N'Услуги салона красоты\стрижка.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (60, N'Мужская стрижка
', CAST(1690.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'Услуги салона красоты\man.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (61, N'Вечерняя прическа
', CAST(2020.0000 AS Decimal(19, 4)), 900, NULL, 0.25, N'Услуги салона красоты\стрижка.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (62, N'Наращивание ресниц беличьего эффекта
', CAST(1010.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (63, N'Мезонити (Тредлифтинг)
', CAST(2140.0000 AS Decimal(19, 4)), 1500, NULL, NULL, N'Услуги салона красоты\96.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (64, N'Покрытие ногтей
', CAST(2410.0000 AS Decimal(19, 4)), 2400, NULL, 0.15, N'Услуги салона красоты\ногти.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (65, N'Гавайский массаж Ломи-Ломи
', CAST(1040.0000 AS Decimal(19, 4)), 2100, NULL, 0.15, N'Услуги салона красоты\массаж.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (66, N'Парафинотерапия
', CAST(1180.0000 AS Decimal(19, 4)), 2100, NULL, 0.05, N'Услуги салона красоты\Парафинотерапия.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (67, N'Озонотерапия
', CAST(1740.0000 AS Decimal(19, 4)), 2100, NULL, 0.2, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (68, N'Миндальный пилинг
', CAST(2430.0000 AS Decimal(19, 4)), 2700, NULL, 0.15, N'Услуги салона красоты\piling.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (69, N'Покрытие ногтей гель-лаком
', CAST(2100.0000 AS Decimal(19, 4)), 900, NULL, 0.2, N'Услуги салона красоты\Покрытие ногтей гель-лаком.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (70, N'Декорирование ресниц стразами
', CAST(1920.0000 AS Decimal(19, 4)), 3000, NULL, 0.15, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (71, N'Микротоковая терапия
', CAST(2410.0000 AS Decimal(19, 4)), 2700, NULL, 0.05, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (72, N'Стрижка челки
', CAST(1930.0000 AS Decimal(19, 4)), 2100, NULL, 0.1, N'Услуги салона красоты\стрижка.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (73, N'Лазерный пилинг
', CAST(1650.0000 AS Decimal(19, 4)), 1200, NULL, 0.25, N'Услуги салона красоты\piling.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (74, N'Массаж лица
', CAST(2370.0000 AS Decimal(19, 4)), 3600, NULL, NULL, N'Услуги салона красоты\массаж.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (75, N'Снятие лака
', CAST(1240.0000 AS Decimal(19, 4)), 2100, NULL, NULL, N'Услуги салона красоты\ногти.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (76, N'Классический педикюр
', CAST(2040.0000 AS Decimal(19, 4)), 2100, NULL, 0.25, N'Услуги салона красоты\Экспресс-педикюр.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (77, N'Классический массаж
', CAST(1120.0000 AS Decimal(19, 4)), 2700, NULL, 0.15, N'Услуги салона красоты\массаж.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (78, N'Окрашивание бровей
', CAST(1120.0000 AS Decimal(19, 4)), 3600, NULL, 0.1, N'Услуги салона красоты\Окрашивание бровей.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (79, N'Наращивание ногтей гелем
', CAST(1540.0000 AS Decimal(19, 4)), 2400, NULL, 0.1, N'Услуги салона красоты\ногти.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (80, N'Ботокс
', CAST(1820.0000 AS Decimal(19, 4)), 3000, NULL, 0.15, N'Услуги салона красоты\96.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (81, N'Инъекционные методики
', CAST(1660.0000 AS Decimal(19, 4)), 2400, NULL, NULL, N'Услуги салона красоты\96.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (82, N'Покраска ресниц
', CAST(2400.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'Услуги салона красоты\Ресницы.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (83, N'Свадебная прическа
', CAST(2070.0000 AS Decimal(19, 4)), 2700, NULL, NULL, N'Услуги салона красоты\стрижка.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (84, N'Моделирование ресниц
', CAST(2140.0000 AS Decimal(19, 4)), 2700, NULL, NULL, N'Услуги салона красоты\Моделирование ресниц.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (85, N'Миостимуляция
', CAST(2380.0000 AS Decimal(19, 4)), 3600, NULL, NULL, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (86, N'Шугаринг
', CAST(1400.0000 AS Decimal(19, 4)), 1800, NULL, NULL, N'Услуги салона красоты\Шугаринг.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (87, N'Укрепление ногтей гелем
', CAST(1260.0000 AS Decimal(19, 4)), 2700, NULL, NULL, N'Услуги салона красоты\Укрепление ногтей гелем.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (88, N'Солярий
', CAST(1790.0000 AS Decimal(19, 4)), 3000, NULL, 0.1, N'Услуги салона красоты\soliarij.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (89, N'Моментальный лифтинг
', CAST(2020.0000 AS Decimal(19, 4)), 3000, NULL, NULL, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (90, N'Детский маникюр
', CAST(1900.0000 AS Decimal(19, 4)), 2100, NULL, NULL, N'Услуги салона красоты\ногти.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (91, N'Ультразвуковой пилинг
', CAST(1440.0000 AS Decimal(19, 4)), 2700, NULL, 0.2, N'Услуги салона красоты\piling.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (92, N'ИК-сауна
', CAST(1160.0000 AS Decimal(19, 4)), 2700, NULL, 0.2, N'Услуги салона красоты\ИК-сауна.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (93, N'Контурная пластика
', CAST(1550.0000 AS Decimal(19, 4)), 2100, NULL, 0.2, N'Услуги салона красоты\Контурная пластика.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (94, N'Декорирование нарощенных ресниц стразами
', CAST(1130.0000 AS Decimal(19, 4)), 2700, NULL, NULL, N'Услуги салона красоты\Декорирование нарощенных ресниц стразами.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (95, N'Депиляция воском
', CAST(2330.0000 AS Decimal(19, 4)), 1800, NULL, 0.15, N'Услуги салона красоты\Депиляция воском.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (96, N'Полировка ногтей
', CAST(2310.0000 AS Decimal(19, 4)), 3000, NULL, 0.15, N'Услуги салона красоты\Полировка ногтей.jpg
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (97, N'Фракционный лазер Palomar Emerge
', CAST(1720.0000 AS Decimal(19, 4)), 1500, NULL, 0.25, N'Услуги салона красоты\face.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (98, N'Увлажнение с коллагеном
', CAST(2490.0000 AS Decimal(19, 4)), 3300, NULL, NULL, N'Услуги салона красоты\96.png
')
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (99, N'Массаж оздоровительный
', CAST(1440.0000 AS Decimal(19, 4)), 1200, NULL, NULL, N'Услуги салона красоты\массаж.jpg
')
GO
INSERT [dbo].[Services] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (100, N'Общий массаж
', CAST(1970.0000 AS Decimal(19, 4)), 2700, NULL, 0.25, N'Услуги салона красоты\массаж.jpg
')
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
/****** Object:  Index [IX_FK_AttachedProduct_Product1]    Script Date: 22.06.2022 0:44:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_AttachedProduct_Product1] ON [dbo].[AttachedProduct]
(
	[Product1_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FK_Client_Gender]    Script Date: 22.06.2022 0:44:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Client_Gender] ON [dbo].[Clients]
(
	[GenderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ClientService_Client]    Script Date: 22.06.2022 0:44:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ClientService_Client] ON [dbo].[ClientServices]
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ClientService_Service]    Script Date: 22.06.2022 0:44:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ClientService_Service] ON [dbo].[ClientServices]
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DocumentByService_ClientService]    Script Date: 22.06.2022 0:44:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_DocumentByService_ClientService] ON [dbo].[DocumentByServices]
(
	[ClientServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProductPhoto_Product]    Script Date: 22.06.2022 0:44:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProductPhoto_Product] ON [dbo].[ProductPhotoes]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Product_Manufacturer]    Script Date: 22.06.2022 0:44:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Product_Manufacturer] ON [dbo].[Products]
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProductSale_ClientService]    Script Date: 22.06.2022 0:44:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProductSale_ClientService] ON [dbo].[ProductSales]
(
	[ClientServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProductSale_Product]    Script Date: 22.06.2022 0:44:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProductSale_Product] ON [dbo].[ProductSales]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ServicePhoto_Service]    Script Date: 22.06.2022 0:44:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ServicePhoto_Service] ON [dbo].[ServicePhotoes]
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TagOfClient_Tag]    Script Date: 22.06.2022 0:44:06 ******/
CREATE NONCLUSTERED INDEX [IX_FK_TagOfClient_Tag] ON [dbo].[TagOfClient]
(
	[Tags_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([Products_ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([Product1_ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Genders] ([Code])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientServices]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[ClientServices] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientServices]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[ClientServices] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByServices]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientServices] ([ID])
GO
ALTER TABLE [dbo].[DocumentByServices] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[ProductPhotoes]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[ProductPhotoes] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturers] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductSales]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientServices] ([ID])
GO
ALTER TABLE [dbo].[ProductSales] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSales]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[ProductSales] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhotoes]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ID])
GO
ALTER TABLE [dbo].[ServicePhotoes] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([Clients_ID])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([Tags_ID])
REFERENCES [dbo].[Tags] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [BarhatniyeBrovki] SET  READ_WRITE 
GO
