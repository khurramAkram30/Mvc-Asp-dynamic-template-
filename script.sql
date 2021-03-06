USE [master]
GO
/****** Object:  Database [ShoppingCart]    Script Date: 4/2/2018 1:06:15 PM ******/
CREATE DATABASE [ShoppingCart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingCart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ShoppingCart.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShoppingCart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ShoppingCart_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShoppingCart] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingCart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingCart] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingCart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingCart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingCart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingCart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingCart] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingCart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingCart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingCart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingCart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingCart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingCart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingCart] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoppingCart] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingCart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingCart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingCart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingCart] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoppingCart', N'ON'
GO
USE [ShoppingCart]
GO
/****** Object:  StoredProcedure [dbo].[Search]    Script Date: 4/2/2018 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Search]
@keyword as varchar(50)
AS
Begin

	Select * from Categories  where Name like '%' + @keyword +'%'

End
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/2/2018 1:06:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/2/2018 1:06:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Price] [float] NULL,
	[Photo] [varchar](50) NULL,
	[Detail] [varchar](max) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted]) VALUES (3, N'Electronics', 1)
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted]) VALUES (4, N'General', 0)
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted]) VALUES (5, N'Cars', 0)
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted]) VALUES (6, N'Mobile', 0)
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted]) VALUES (7, N'New Mobiles', 0)
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted]) VALUES (8, N'Old Cars', 0)
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted]) VALUES (9, N'Old Mobiles', 0)
INSERT [dbo].[Categories] ([Id], [Name], [IsDeleted]) VALUES (10, N'Jahaz', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [ShoppingCart] SET  READ_WRITE 
GO
