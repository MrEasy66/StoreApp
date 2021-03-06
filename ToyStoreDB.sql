USE [master]
GO
/****** Object:  Database [ToyStoreDB]    Script Date: 17.05.2022 16:55:24 ******/
CREATE DATABASE [ToyStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToyStoreDB', FILENAME = N'C:\Programs\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ToyStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToyStoreDB_log', FILENAME = N'C:\Programs\SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ToyStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ToyStoreDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToyStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToyStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToyStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToyStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToyStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToyStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToyStoreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToyStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToyStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToyStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToyStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToyStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToyStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToyStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToyStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToyStoreDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToyStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToyStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToyStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToyStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToyStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToyStoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToyStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToyStoreDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ToyStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [ToyStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToyStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToyStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToyStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToyStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ToyStoreDB', N'ON'
GO
ALTER DATABASE [ToyStoreDB] SET QUERY_STORE = OFF
GO
USE [ToyStoreDB]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17.05.2022 16:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryOfEnter]    Script Date: 17.05.2022 16:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryOfEnter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastEnter] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_HistoryOfEnter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17.05.2022 16:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductCount] [int] NOT NULL,
	[OrderPrice] [money] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderRequest]    Script Date: 17.05.2022 16:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product] [nvarchar](50) NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_OrderRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalOffer]    Script Date: 17.05.2022 16:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalOffer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_PersonalOffer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17.05.2022 16:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Cost] [money] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfUser]    Script Date: 17.05.2022 16:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeOfUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17.05.2022 16:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[TypeId] [int] NOT NULL,
	[ClientId] [int] NULL,
	[WorkerId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 17.05.2022 16:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [Name], [Surname]) VALUES (1, N'Тарас', N'Сергеев')
INSERT [dbo].[Client] ([ID], [Name], [Surname]) VALUES (2, N'Пётр', N'Бирюков')
INSERT [dbo].[Client] ([ID], [Name], [Surname]) VALUES (3, N'Григорий', N'Лопатин')
INSERT [dbo].[Client] ([ID], [Name], [Surname]) VALUES (4, N'Роман', N'Беликов')
INSERT [dbo].[Client] ([ID], [Name], [Surname]) VALUES (5, N'Герман', N'Козаков')
INSERT [dbo].[Client] ([ID], [Name], [Surname]) VALUES (6, N'Альберт', N'Сорокин')
INSERT [dbo].[Client] ([ID], [Name], [Surname]) VALUES (7, N'Георгий', N'Богомазов')
INSERT [dbo].[Client] ([ID], [Name], [Surname]) VALUES (8, N'Ростислав', N'Гурковский')
INSERT [dbo].[Client] ([ID], [Name], [Surname]) VALUES (9, N'Степан', N'Горбачёв')
INSERT [dbo].[Client] ([ID], [Name], [Surname]) VALUES (10, N'Максим', N'Шаров')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryOfEnter] ON 

INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1, CAST(N'2021-05-09T16:34:28.817' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (3, CAST(N'2021-05-10T16:50:46.563' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (4, CAST(N'2021-05-10T17:06:00.527' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (5, CAST(N'2021-05-10T17:06:20.347' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (6, CAST(N'2021-05-10T17:11:15.710' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (7, CAST(N'2021-05-10T17:12:18.007' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (8, CAST(N'2021-05-10T17:36:31.707' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (11, CAST(N'2021-05-10T18:01:29.787' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (12, CAST(N'2021-05-10T18:51:31.863' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (13, CAST(N'2021-05-10T18:56:23.873' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (14, CAST(N'2021-05-10T18:58:26.143' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (15, CAST(N'2021-05-10T19:00:17.767' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (16, CAST(N'2021-05-11T18:17:40.833' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (17, CAST(N'2021-05-11T18:21:50.653' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (18, CAST(N'2021-05-11T18:23:10.623' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (19, CAST(N'2021-05-11T18:40:24.553' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (20, CAST(N'2021-05-11T18:43:32.137' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (21, CAST(N'2021-05-22T14:03:33.717' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (22, CAST(N'2021-05-22T14:04:35.347' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (31, CAST(N'2021-05-22T17:19:41.037' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (32, CAST(N'2021-05-22T17:23:24.163' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (33, CAST(N'2021-05-22T17:26:49.777' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (34, CAST(N'2021-05-22T17:29:35.517' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (35, CAST(N'2021-05-22T17:30:06.213' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (36, CAST(N'2021-05-30T15:13:07.220' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (37, CAST(N'2021-05-30T15:15:05.177' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (38, CAST(N'2021-05-30T15:16:39.863' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (39, CAST(N'2021-05-30T15:18:13.093' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (40, CAST(N'2021-05-30T15:21:52.747' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (41, CAST(N'2021-05-30T15:23:56.050' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (42, CAST(N'2021-05-30T15:25:11.773' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (43, CAST(N'2021-05-30T15:26:32.020' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (44, CAST(N'2021-05-30T15:37:10.933' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (45, CAST(N'2021-05-30T15:38:59.270' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (46, CAST(N'2021-05-30T15:41:10.393' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1036, CAST(N'2021-06-03T18:58:24.180' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1037, CAST(N'2021-06-03T19:16:52.753' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1038, CAST(N'2021-06-06T19:25:44.287' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1039, CAST(N'2021-06-06T19:26:58.037' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1040, CAST(N'2021-06-17T17:21:55.783' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1041, CAST(N'2021-06-17T17:58:28.283' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1042, CAST(N'2021-06-17T18:01:44.637' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1043, CAST(N'2021-06-17T18:09:10.703' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1044, CAST(N'2021-06-17T21:13:31.457' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1045, CAST(N'2022-05-06T14:54:45.267' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1046, CAST(N'2022-05-06T14:57:51.363' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1047, CAST(N'2022-05-08T14:22:30.720' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1048, CAST(N'2022-05-08T14:27:57.580' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1049, CAST(N'2022-05-10T19:21:14.227' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1050, CAST(N'2022-05-10T19:25:56.917' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1051, CAST(N'2022-05-10T19:27:26.727' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1052, CAST(N'2022-05-10T19:30:14.333' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1053, CAST(N'2022-05-10T19:33:45.263' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1054, CAST(N'2022-05-12T10:53:31.423' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1055, CAST(N'2022-05-12T11:01:26.333' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1056, CAST(N'2022-05-12T11:10:36.463' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1057, CAST(N'2022-05-12T11:14:39.557' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1058, CAST(N'2022-05-12T11:15:57.500' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1059, CAST(N'2022-05-12T11:17:40.423' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1060, CAST(N'2022-05-12T11:20:14.117' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1061, CAST(N'2022-05-12T11:20:47.660' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1062, CAST(N'2022-05-14T16:32:03.693' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1063, CAST(N'2022-05-14T16:37:25.203' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1064, CAST(N'2022-05-15T10:26:39.073' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1065, CAST(N'2022-05-15T11:50:54.880' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1066, CAST(N'2022-05-15T11:52:45.643' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1067, CAST(N'2022-05-15T12:04:08.597' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1068, CAST(N'2022-05-15T16:23:56.827' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1069, CAST(N'2022-05-15T18:06:32.227' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1070, CAST(N'2022-05-15T18:08:13.533' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1071, CAST(N'2022-05-15T18:20:03.940' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1072, CAST(N'2022-05-16T19:17:18.240' AS DateTime), N'success', 2)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1073, CAST(N'2022-05-16T19:38:37.377' AS DateTime), N'success', 1)
INSERT [dbo].[HistoryOfEnter] ([ID], [LastEnter], [Status], [UserId]) VALUES (1074, CAST(N'2022-05-16T19:41:30.153' AS DateTime), N'success', 1)
SET IDENTITY_INSERT [dbo].[HistoryOfEnter] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [ClientId], [ProductId], [ProductCount], [OrderPrice]) VALUES (1, 1, 2, 3, 1527.0000)
INSERT [dbo].[Order] ([ID], [ClientId], [ProductId], [ProductCount], [OrderPrice]) VALUES (2, 7, 3, 2, 5438.0000)
INSERT [dbo].[Order] ([ID], [ClientId], [ProductId], [ProductCount], [OrderPrice]) VALUES (3, 7, 4, 2, 2498.0000)
INSERT [dbo].[Order] ([ID], [ClientId], [ProductId], [ProductCount], [OrderPrice]) VALUES (4, 4, 1, 1, 1259.0000)
INSERT [dbo].[Order] ([ID], [ClientId], [ProductId], [ProductCount], [OrderPrice]) VALUES (5, 8, 6, 2, 2738.0000)
INSERT [dbo].[Order] ([ID], [ClientId], [ProductId], [ProductCount], [OrderPrice]) VALUES (6, 8, 7, 1, 939.0000)
INSERT [dbo].[Order] ([ID], [ClientId], [ProductId], [ProductCount], [OrderPrice]) VALUES (7, 3, 2, 1, 509.0000)
INSERT [dbo].[Order] ([ID], [ClientId], [ProductId], [ProductCount], [OrderPrice]) VALUES (8, 3, 5, 1, 5299.0000)
INSERT [dbo].[Order] ([ID], [ClientId], [ProductId], [ProductCount], [OrderPrice]) VALUES (9, 5, 8, 4, 5596.0000)
INSERT [dbo].[Order] ([ID], [ClientId], [ProductId], [ProductCount], [OrderPrice]) VALUES (10, 2, 10, 1, 2189.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderRequest] ON 

INSERT [dbo].[OrderRequest] ([ID], [Product], [ProductCount]) VALUES (1, N'Уно', 2)
INSERT [dbo].[OrderRequest] ([ID], [Product], [ProductCount]) VALUES (2, N'Монополия', 1)
SET IDENTITY_INSERT [dbo].[OrderRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonalOffer] ON 

INSERT [dbo].[PersonalOffer] ([ID], [Name], [ClientId], [Description]) VALUES (1, N'Скидка на следующую покупку', 2, NULL)
INSERT [dbo].[PersonalOffer] ([ID], [Name], [ClientId], [Description]) VALUES (2, N'Скидка на покупку от 2000 рублей', 1, NULL)
SET IDENTITY_INSERT [dbo].[PersonalOffer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Manufacturer], [Cost]) VALUES (1, N'Монополия', N'Hasbro', 1259.0000)
INSERT [dbo].[Product] ([ID], [Name], [Manufacturer], [Cost]) VALUES (2, N'Уно', N'Mattel Games', 509.0000)
INSERT [dbo].[Product] ([ID], [Name], [Manufacturer], [Cost]) VALUES (3, N'Nerf Zombie Strike', N'Hasbro', 2719.0000)
INSERT [dbo].[Product] ([ID], [Name], [Manufacturer], [Cost]) VALUES (4, N'Nerf стрелы', N'Hasbro', 1249.0000)
INSERT [dbo].[Product] ([ID], [Name], [Manufacturer], [Cost]) VALUES (5, N'Lego Movie набор', N'Lego', 5299.0000)
INSERT [dbo].[Product] ([ID], [Name], [Manufacturer], [Cost]) VALUES (6, N'Плюшевы медведь чёрный', N'Softoy', 1369.0000)
INSERT [dbo].[Product] ([ID], [Name], [Manufacturer], [Cost]) VALUES (7, N'Плюшевая собака', N'Softoy', 939.0000)
INSERT [dbo].[Product] ([ID], [Name], [Manufacturer], [Cost]) VALUES (8, N'Hot Wheels фрагменты трассы', N'Mattel', 1399.0000)
INSERT [dbo].[Product] ([ID], [Name], [Manufacturer], [Cost]) VALUES (9, N'Hot Wheels набор машин', N'Mattel Games', 1689.0000)
INSERT [dbo].[Product] ([ID], [Name], [Manufacturer], [Cost]) VALUES (10, N'Пожарная машина', N'Wincars', 2189.0000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfUser] ON 

INSERT [dbo].[TypeOfUser] ([ID], [Name]) VALUES (1, N'Administrator')
INSERT [dbo].[TypeOfUser] ([ID], [Name]) VALUES (2, N'Manager')
INSERT [dbo].[TypeOfUser] ([ID], [Name]) VALUES (3, N'Client')
SET IDENTITY_INSERT [dbo].[TypeOfUser] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Login], [Password], [TypeId], [ClientId], [WorkerId]) VALUES (1, N'Admin', N'Admin', 1, NULL, 1)
INSERT [dbo].[User] ([ID], [Login], [Password], [TypeId], [ClientId], [WorkerId]) VALUES (2, N'Manager', N'Manager', 2, NULL, 2)
INSERT [dbo].[User] ([ID], [Login], [Password], [TypeId], [ClientId], [WorkerId]) VALUES (3, N'Client1', N'Client1', 3, 1, NULL)
INSERT [dbo].[User] ([ID], [Login], [Password], [TypeId], [ClientId], [WorkerId]) VALUES (1003, N'Client2', N'Client2', 3, 2, NULL)
INSERT [dbo].[User] ([ID], [Login], [Password], [TypeId], [ClientId], [WorkerId]) VALUES (1005, N'Client3', N'Client3', 3, 3, NULL)
INSERT [dbo].[User] ([ID], [Login], [Password], [TypeId], [ClientId], [WorkerId]) VALUES (1006, N'Client4', N'Client4', 3, 4, NULL)
INSERT [dbo].[User] ([ID], [Login], [Password], [TypeId], [ClientId], [WorkerId]) VALUES (1007, N'Client5', N'Client5', 3, 5, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Worker] ON 

INSERT [dbo].[Worker] ([ID], [Name], [Surname]) VALUES (1, N'Владимир', N'Перевалов')
INSERT [dbo].[Worker] ([ID], [Name], [Surname]) VALUES (2, N'Степан', N'Широков')
SET IDENTITY_INSERT [dbo].[Worker] OFF
GO
ALTER TABLE [dbo].[HistoryOfEnter]  WITH CHECK ADD  CONSTRAINT [FK_HistoryOfEnter_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HistoryOfEnter] CHECK CONSTRAINT [FK_HistoryOfEnter_User1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[PersonalOffer]  WITH CHECK ADD  CONSTRAINT [FK_PersonalOffer_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonalOffer] CHECK CONSTRAINT [FK_PersonalOffer_Client]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Client]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_TypeOfUser1] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypeOfUser] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_TypeOfUser1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Worker] FOREIGN KEY([WorkerId])
REFERENCES [dbo].[Worker] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Worker]
GO
USE [master]
GO
ALTER DATABASE [ToyStoreDB] SET  READ_WRITE 
GO
