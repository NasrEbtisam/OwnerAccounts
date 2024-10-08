USE [master]
GO
/****** Object:  Database [accountowner]    Script Date: 2024-08-07 6:20:20 AM ******/
CREATE DATABASE [accountowner]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'accountowner', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER2022\MSSQL\DATA\accountowner.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'accountowner_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER2022\MSSQL\DATA\accountowner_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [accountowner] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [accountowner].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [accountowner] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [accountowner] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [accountowner] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [accountowner] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [accountowner] SET ARITHABORT OFF 
GO
ALTER DATABASE [accountowner] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [accountowner] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [accountowner] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [accountowner] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [accountowner] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [accountowner] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [accountowner] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [accountowner] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [accountowner] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [accountowner] SET  DISABLE_BROKER 
GO
ALTER DATABASE [accountowner] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [accountowner] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [accountowner] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [accountowner] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [accountowner] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [accountowner] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [accountowner] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [accountowner] SET RECOVERY FULL 
GO
ALTER DATABASE [accountowner] SET  MULTI_USER 
GO
ALTER DATABASE [accountowner] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [accountowner] SET DB_CHAINING OFF 
GO
ALTER DATABASE [accountowner] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [accountowner] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [accountowner] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [accountowner] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'accountowner', N'ON'
GO
ALTER DATABASE [accountowner] SET QUERY_STORE = ON
GO
ALTER DATABASE [accountowner] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [accountowner]
GO
/****** Object:  Table [dbo].[account]    Script Date: 2024-08-07 6:20:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[dateCreated] [datetime2](7) NOT NULL,
	[accountType] [nvarchar](50) NOT NULL,
	[ownerId] [int] NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[owner]    Script Date: 2024-08-07 6:20:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[owner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[dateOfBirth] [datetime2](7) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_owner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (1, CAST(N'2024-01-02' AS Date), N'Bouna', 1)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (2, CAST(N'2023-11-22' AS Date), N'Lewoleba-Lembata Island', 2)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (4, CAST(N'2024-01-25' AS Date), N'Natitingou', 2)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (5, CAST(N'2023-04-24' AS Date), N'Rodez/Marcillac', 3)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (6, CAST(N'2023-05-11' AS Date), N'Beroroha', 6)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (7, CAST(N'2023-06-30' AS Date), N'Alert Bay', 3)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (8, CAST(N'2023-07-18' AS Date), N'Batna', 8)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (9, CAST(N'2023-07-22' AS Date), N'Fairview', 3)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (10, CAST(N'2023-06-08' AS Date), N'Nassau', 12)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (11, CAST(N'2023-03-18' AS Date), N'Mekambo', 30)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (12, CAST(N'2024-01-25' AS Date), N'Dubuque', 12)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (13, CAST(N'2023-09-30' AS Date), N'Erzincan', 12)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (14, CAST(N'2023-12-31' AS Date), N'Rakanda', 1)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (15, CAST(N'2023-12-24' AS Date), N'Semonkong', 15)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (16, CAST(N'2023-04-02' AS Date), N'Lopez', 15)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (17, CAST(N'2023-08-28' AS Date), N'Collie', 17)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (18, CAST(N'2023-04-24' AS Date), N'Penticton', 18)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (21, CAST(N'2023-06-24' AS Date), N'Urgench', 22)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (22, CAST(N'2023-09-04' AS Date), N'Rio de Janeiro', 22)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (23, CAST(N'2023-04-06' AS Date), N'Loralai', 23)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (24, CAST(N'2023-04-03' AS Date), N'Port Amboim', 24)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (25, CAST(N'2023-10-03' AS Date), N'Mc Alester', 25)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (26, CAST(N'2023-09-22' AS Date), N'Balemartine', 30)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (27, CAST(N'2023-12-14' AS Date), N'Limbang', 27)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (28, CAST(N'2023-11-25' AS Date), N'Prince Albert', 28)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (29, CAST(N'2023-10-09' AS Date), N'Glendive', 29)
INSERT [dbo].[account] ([Id], [dateCreated], [accountType], [ownerId]) VALUES (30, CAST(N'2023-11-20' AS Date), N'Yam Island', 30)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[owner] ON 

INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (1, N'Ursa Philott', CAST(N'2023-07-24' AS Date), N'658 Sheridan Center')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (2, N'Cooper Dennistoun', CAST(N'2023-12-17' AS Date), N'54448 Amoth Hill')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (3, N'Wendeline Bassindale', CAST(N'2023-04-12' AS Date), N'1448 Fairview Circle')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (4, N'Arlen Worgan', CAST(N'2023-10-18' AS Date), N'681 Scoville Way')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (5, N'Burk Neate', CAST(N'2023-03-02' AS Date), N'60087 Claremont Road')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (6, N'Nikita Schneidau', CAST(N'2023-06-27' AS Date), N'2876 Kedzie Plaza')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (7, N'Errol Cullen', CAST(N'2023-09-02' AS Date), N'0 Old Shore Hill')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (8, N'Lanny McGrirl', CAST(N'2023-09-05' AS Date), N'9 Boyd Alley')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (9, N'Fitzgerald Pescod', CAST(N'2023-07-29' AS Date), N'7155 Stoughton Alley')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (10, N'Murielle McKimm', CAST(N'2023-11-29' AS Date), N'182 Dayton Park')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (11, N'Claudina Gowrich', CAST(N'2023-03-25' AS Date), N'9 Fieldstone Hill')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (12, N'Lacy Snailham', CAST(N'2023-08-02' AS Date), N'1702 Dwight Point')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (13, N'Rozanne Boomes', CAST(N'2024-01-12' AS Date), N'39547 Nova Plaza')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (14, N'Arlyne Allenson', CAST(N'2023-02-19' AS Date), N'5255 Golden Leaf Point')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (15, N'Isabel Ramsden', CAST(N'2023-03-18' AS Date), N'042 Lillian Center')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (16, N'Nickie Dearan', CAST(N'2023-08-29' AS Date), N'854 Golf Terrace')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (17, N'Gillie Celloni', CAST(N'2023-05-12' AS Date), N'54 Scofield Street')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (18, N'Ruggiero Mapes', CAST(N'2023-07-17' AS Date), N'55 Brentwood Center')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (19, N'Libbi Heinsen', CAST(N'2023-05-13' AS Date), N'1 Lighthouse Bay Way')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (20, N'Gardie Rosenbloom', CAST(N'2023-06-06' AS Date), N'8 Upham Plaza')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (21, N'Bron Ogan', CAST(N'2023-04-26' AS Date), N'64314 Fallview Terrace')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (22, N'Merill Berntssen', CAST(N'2023-09-27' AS Date), N'72 Starling Crossing')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (23, N'Cyrus Bayliss', CAST(N'2023-06-16' AS Date), N'153 Redwing Way')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (24, N'Abbot Kosel', CAST(N'2023-12-31' AS Date), N'97822 Derek Avenue')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (25, N'Putnam Thurstance', CAST(N'2023-10-26' AS Date), N'91 Eagan Plaza')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (26, N'Zea Rankmore', CAST(N'2023-08-12' AS Date), N'22 Walton Alley')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (27, N'Heriberto Crim', CAST(N'2023-09-27' AS Date), N'1 Messerschmidt Junction')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (28, N'Berkly Jamison', CAST(N'2023-03-29' AS Date), N'08 Buena Vista Circle')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (29, N'Mandel Fodden', CAST(N'2023-05-20' AS Date), N'02254 Buhler Point')
INSERT [dbo].[owner] ([Id], [name], [dateOfBirth], [address]) VALUES (30, N'Theobald Cansdall', CAST(N'2023-10-22' AS Date), N'0 Thackeray Hill')
SET IDENTITY_INSERT [dbo].[owner] OFF
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_owner] FOREIGN KEY([ownerId])
REFERENCES [dbo].[owner] ([Id])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_owner]
GO
USE [master]
GO
ALTER DATABASE [accountowner] SET  READ_WRITE 
GO
