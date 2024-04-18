USE [master]
GO
/****** Object:  Database NhaTro    Script Date: 11/10/2023 4:50:04 PM ******/
CREATE DATABASE NhaTro
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'login', FILENAME = N'D:\Games\MSSQL16.MSSQLSERVER\MSSQL\DATA\login.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'login_log', FILENAME = N'D:\Games\MSSQL16.MSSQLSERVER\MSSQL\DATA\login_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE NhaTro SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC NhaTro.[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE NhaTro SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE NhaTro SET ANSI_NULLS OFF 
GO
ALTER DATABASE NhaTro SET ANSI_PADDING OFF 
GO
ALTER DATABASE NhaTro SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE NhaTro SET ARITHABORT OFF 
GO
ALTER DATABASE NhaTro SET AUTO_CLOSE OFF 
GO
ALTER DATABASE NhaTro SET AUTO_SHRINK OFF 
GO
ALTER DATABASE NhaTro SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE NhaTro SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE NhaTro SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE NhaTro SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE NhaTro SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE NhaTro SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE NhaTro SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE NhaTro SET  DISABLE_BROKER 
GO
ALTER DATABASE NhaTro SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE NhaTro SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE NhaTro SET TRUSTWORTHY OFF 
GO
ALTER DATABASE NhaTro SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE NhaTro SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE NhaTro SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE NhaTro SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE NhaTro SET RECOVERY FULL 
GO
ALTER DATABASE NhaTro SET  MULTI_USER 
GO
ALTER DATABASE NhaTro SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE NhaTro SET DB_CHAINING OFF 
GO
ALTER DATABASE NhaTro SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE NhaTro SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE NhaTro SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE NhaTro SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'login', N'ON'
GO
ALTER DATABASE NhaTro SET QUERY_STORE = ON
GO
ALTER DATABASE NhaTro SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE NhaTro
GO
/****** Object:  Table [dbo].[change_room_request]    Script Date: 11/10/2023 4:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[change_room_request](
	[host] [nvarchar](30) NULL,
	[renter] [nvarchar](30) NULL,
	[from_from] [nvarchar](30) NULL,
	[to_room] [nvarchar](30) NULL,
	[host_response] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[host_message]    Script Date: 11/10/2023 4:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[host_message](
	[username] [nvarchar](30) NULL,
	[message] [nvarchar](1000) NULL,
	[date] [nvarchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 11/10/2023 4:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[username] [nvarchar](30) NOT NULL,
	[password] [nvarchar](30) NOT NULL,
	[fullname] [nvarchar](30) NOT NULL,
	[role] [bit] NULL,
	[so_tang] [int] NULL,
	[so_phong] [int] NULL,
	[max] [int] NULL,
 CONSTRAINT [pk_constraint_name] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[renter]    Script Date: 11/10/2023 4:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[renter](
	[username] [nvarchar](30) NOT NULL,
	[password] [nvarchar](30) NULL,
	[fullName] [nvarchar](30) NULL,
	[room] [varchar](10) NULL,
	[host] [nvarchar](30) NULL,
	[role] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[renter_message]    Script Date: 11/10/2023 4:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[renter_message](
	[room] [nvarchar](30) NULL,
	[host] [nvarchar](30) NULL,
	[message] [nvarchar](1000) NULL,
	[date] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[renters_history]    Script Date: 11/10/2023 4:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[renters_history](
	[host] [nvarchar](30) NULL,
	[fullName] [nvarchar](30) NULL,
	[room] [nvarchar](10) NULL,
	[start_date] [nvarchar](30) NULL,
	[end_date] [nvarchar](30) NULL,
	[username] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[switch_room_request]    Script Date: 11/10/2023 4:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[switch_room_request](
	[username1] [varchar](30) NULL,
	[username2] [varchar](30) NULL,
	[host] [varchar](30) NULL,
	[room1] [varchar](10) NULL,
	[room2] [varchar](10) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[host_message] ([username], [message], [date]) VALUES (N'456', N'ưerewrwerwer', N'2023-10-17')
GO
INSERT [dbo].[host_message] ([username], [message], [date]) VALUES (N'456', N'ưerewrwerwer', N'2023-10-17')
GO
INSERT [dbo].[host_message] ([username], [message], [date]) VALUES (N'456', N'12321312321', N'2023-11-02')
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'12', N'123', N'ưe', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'123', N'123', N'abc', 0, NULL, NULL, NULL)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'234', N'234', N'Lưu Huy Việt', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'456', N'456', N'Lưu Huy Việt', 1, 4, 4, 3)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'567', N'567', N'567', 1, 4, 5, 2)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'789', N'789', N'789', 1, 4, 5, 2)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'abc', N'abc', N'Lưu Huy Việt', 1, 6, 5, NULL)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'ad', N'ad', N'ad', 1, 100, 20, NULL)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'ghj', N'ghj', N'123', 1, 10, 20, NULL)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'lhv', N'123', N'Lưu Huy Việt', 1, 4, 4, NULL)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'v2742003', N'123', N'Lưu Huy Việt', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'vbn', N'vbn', N'vbn', 1, 4, 6, NULL)
GO
INSERT [dbo].[Registration] ([username], [password], [fullname], [role], [so_tang], [so_phong], [max]) VALUES (N'zxc', N'zxc', N'Lưu Huy Việt', 1, 2, 3, NULL)
GO
INSERT [dbo].[renter] ([username], [password], [fullName], [room], [host], [role]) VALUES (N'123', N'123', N'Lưu Huy Việt', N'102', N'456', 0)
GO
INSERT [dbo].[renter] ([username], [password], [fullName], [room], [host], [role]) VALUES (N'1234', N'1234', N'Lưu Huy Việt', N'302', N'456', 0)
GO
INSERT [dbo].[renter] ([username], [password], [fullName], [room], [host], [role]) VALUES (N'12345', N'123', N'Lưu Huy Việt2', N'403', N'456', 0)
GO
INSERT [dbo].[renter] ([username], [password], [fullName], [room], [host], [role]) VALUES (N'234', N'234', N'Lưu Huy Việt2 ', N'601', N'abc', 0)
GO
INSERT [dbo].[renter] ([username], [password], [fullName], [room], [host], [role]) VALUES (N'890', N'890', N'Lưu Huy Việt', N'302', N'456', 0)
GO
INSERT [dbo].[renter] ([username], [password], [fullName], [room], [host], [role]) VALUES (N'rty', N'rty', N'ádasd', N'601', N'abc', 0)
GO
INSERT [dbo].[renter] ([username], [password], [fullName], [room], [host], [role]) VALUES (N'viet', N'123', N'Lưu Huy Việt', N'302', N'456', 0)
GO
INSERT [dbo].[renter_message] ([room], [host], [message], [date]) VALUES (N'401', N'456', N'12321312321', N'2023-10-18')
GO
INSERT [dbo].[renter_message] ([room], [host], [message], [date]) VALUES (N'401', N'456', N'3123213', N'2023-10-18')
GO
INSERT [dbo].[renter_message] ([room], [host], [message], [date]) VALUES (N'401', N'456', N'123123', N'2023-10-18')
GO
INSERT [dbo].[renter_message] ([room], [host], [message], [date]) VALUES (N'402', N'456', N'ưerewrwerwer', N'2023-10-24')
GO
INSERT [dbo].[renter_message] ([room], [host], [message], [date]) VALUES (N'401', N'456', N'sdasdasd', N'2023-11-01')
GO
INSERT [dbo].[renters_history] ([host], [fullName], [room], [start_date], [end_date], [username]) VALUES (N'456', N'Lưu Huy Việt', N'401', N'2023-10-17', N'2023-10-17', NULL)
GO
INSERT [dbo].[renters_history] ([host], [fullName], [room], [start_date], [end_date], [username]) VALUES (N'456', N'13123213', N'401', N'2023-10-17', N'2023-10-17', NULL)
GO
INSERT [dbo].[renters_history] ([host], [fullName], [room], [start_date], [end_date], [username]) VALUES (N'456', N'Lưu Huy Việt', N'402', N'2023-10-24', NULL, N'1234')
GO
INSERT [dbo].[renters_history] ([host], [fullName], [room], [start_date], [end_date], [username]) VALUES (N'456', N'Lưu Huy Việt', N'401', N'2023-11-01', NULL, N'123')
GO
INSERT [dbo].[renters_history] ([host], [fullName], [room], [start_date], [end_date], [username]) VALUES (N'456', N'Lưu Huy Việt2', N'302', N'2023-11-03', NULL, N'12345')
GO
INSERT [dbo].[renters_history] ([host], [fullName], [room], [start_date], [end_date], [username]) VALUES (N'456', N'Lưu Huy Việt', N'302', N'2023-11-03', NULL, N'viet')
GO
INSERT [dbo].[renters_history] ([host], [fullName], [room], [start_date], [end_date], [username]) VALUES (N'456', N'Lưu Huy Việt', N'403', N'2023-11-07', NULL, N'890')
GO
INSERT [dbo].[renters_history] ([host], [fullName], [room], [start_date], [end_date], [username]) VALUES (N'456', N'Lưu Huy Việt', N'401', N'2023-10-17', N'2023-10-24', NULL)
GO
ALTER TABLE [dbo].[renter]  WITH CHECK ADD FOREIGN KEY([host])
REFERENCES [dbo].[Registration] ([username])
GO
USE [master]
GO
ALTER DATABASE NhaTro SET  READ_WRITE 
GO
