/****** Object:  Database [ZipMarkets]    Script Date: 8/9/2020 10:42:48 AM ******/
CREATE DATABASE [ZipMarkets]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [ZipMarkets] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [ZipMarkets] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ZipMarkets] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ZipMarkets] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ZipMarkets] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ZipMarkets] SET ARITHABORT OFF 
GO
ALTER DATABASE [ZipMarkets] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ZipMarkets] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ZipMarkets] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ZipMarkets] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ZipMarkets] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ZipMarkets] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ZipMarkets] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ZipMarkets] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ZipMarkets] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ZipMarkets] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ZipMarkets] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ZipMarkets] SET  MULTI_USER 
GO
ALTER DATABASE [ZipMarkets] SET ENCRYPTION ON
GO
ALTER DATABASE [ZipMarkets] SET QUERY_STORE = ON
GO
ALTER DATABASE [ZipMarkets] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/****** Object:  Table [dbo].[AllHPIs]    Script Date: 8/9/2020 10:42:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllHPIs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NULL,
	[HPI] [decimal](6, 2) NULL,
	[ZipCodeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllZips]    Script Date: 8/9/2020 10:42:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllZips](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ZipCode] [int] NULL,
	[City] [nvarchar](100) NULL,
	[County] [nvarchar](100) NULL,
	[ForecastYoYPctChange] [decimal](3, 1) NULL,
	[StateId] [int] NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AllZVHIs]    Script Date: 8/9/2020 10:42:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllZVHIs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Value] [int] NULL,
	[ZipCodeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MessageCategory]    Script Date: 8/9/2020 10:42:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 8/9/2020 10:42:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ZipCodeId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PinnedMarkets]    Script Date: 8/9/2020 10:42:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PinnedMarkets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ZipCodeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 8/9/2020 10:42:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StateAbbr] [nvarchar](3) NOT NULL,
	[StateName] [nvarchar](20) NOT NULL,
	[costIndex] [decimal](4, 1) NOT NULL,
	[costRank] [int] NOT NULL,
	[groceryCost] [decimal](4, 1) NOT NULL,
	[housingCost] [decimal](4, 1) NOT NULL,
	[utilitiesCost] [decimal](4, 1) NOT NULL,
	[transportationCost] [decimal](4, 1) NOT NULL,
	[miscCost] [decimal](4, 1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/9/2020 10:42:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirebaseUserId] [nvarchar](28) NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](555) NOT NULL,
	[HomeZipId] [int] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[MinHomePrice] [int] NOT NULL,
	[MaxHomePrice] [int] NOT NULL,
	[FilterByPrice] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_FirebaseUserId] UNIQUE NONCLUSTERED 
(
	[FirebaseUserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 8/9/2020 10:42:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('FALSE') FOR [FilterByPrice]
GO
ALTER TABLE [dbo].[AllHPIs]  WITH CHECK ADD FOREIGN KEY([ZipCodeId])
REFERENCES [dbo].[AllZips] ([Id])
GO
ALTER TABLE [dbo].[AllZips]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([Id])
GO
ALTER TABLE [dbo].[AllZVHIs]  WITH CHECK ADD  CONSTRAINT [FK_Zip_ZVHI] FOREIGN KEY([ZipCodeId])
REFERENCES [dbo].[AllZips] ([Id])
GO
ALTER TABLE [dbo].[AllZVHIs] CHECK CONSTRAINT [FK_Zip_ZVHI]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Message_Cat] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[MessageCategory] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Message_Cat]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Users_Messages] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Users_Messages]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Zip_Messages] FOREIGN KEY([ZipCodeId])
REFERENCES [dbo].[AllZips] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Zip_Messages]
GO
ALTER TABLE [dbo].[PinnedMarkets]  WITH CHECK ADD  CONSTRAINT [FK_Pinned_Zips] FOREIGN KEY([ZipCodeId])
REFERENCES [dbo].[AllZips] ([Id])
GO
ALTER TABLE [dbo].[PinnedMarkets] CHECK CONSTRAINT [FK_Pinned_Zips]
GO
ALTER TABLE [dbo].[PinnedMarkets]  WITH CHECK ADD  CONSTRAINT [FK_User_Pins] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[PinnedMarkets] CHECK CONSTRAINT [FK_User_Pins]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_User_HomeZip] FOREIGN KEY([HomeZipId])
REFERENCES [dbo].[AllZips] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_User_HomeZip]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserType] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserType] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserType]
GO
ALTER DATABASE [ZipMarkets] SET  READ_WRITE 
GO
