USE [master]
GO
/****** Object:  Database [demka]    Script Date: 13.09.2022 21:53:13 ******/
CREATE DATABASE [demka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'demka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\demka.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'demka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\demka_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [demka] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [demka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [demka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [demka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [demka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [demka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [demka] SET ARITHABORT OFF 
GO
ALTER DATABASE [demka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [demka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [demka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [demka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [demka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [demka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [demka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [demka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [demka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [demka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [demka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [demka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [demka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [demka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [demka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [demka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [demka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [demka] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [demka] SET  MULTI_USER 
GO
ALTER DATABASE [demka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [demka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [demka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [demka] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [demka] SET DELAYED_DURABILITY = DISABLED 
GO
USE [demka]
GO
/****** Object:  Table [dbo].[Документ_об_образовании]    Script Date: 13.09.2022 21:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Документ_об_образовании](
	[Номер документа] [nchar](13) NOT NULL,
	[Название учебного заявления] [nchar](40) NOT NULL,
	[Дата выдачи] [date] NOT NULL,
	[Оценки] [nchar](10) NOT NULL,
	[Табель] [nchar](10) NOT NULL,
	[Ступень образования] [nchar](45) NOT NULL,
 CONSTRAINT [PK_Документ_об_образовании] PRIMARY KEY CLUSTERED 
(
	[Номер документа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ступень_образования]    Script Date: 13.09.2022 21:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ступень_образования](
	[Ступень] [nchar](45) NOT NULL,
 CONSTRAINT [PK_Ступень_образования] PRIMARY KEY CLUSTERED 
(
	[Ступень] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Табель]    Script Date: 13.09.2022 21:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Табель](
	[Предмет] [nchar](30) NOT NULL,
	[Оценка] [tinyint] NOT NULL,
 CONSTRAINT [PK_Табель] PRIMARY KEY CLUSTERED 
(
	[Предмет] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Документ_об_образовании]  WITH CHECK ADD  CONSTRAINT [FK_Документ_об_образовании_Ступень_образования] FOREIGN KEY([Ступень образования])
REFERENCES [dbo].[Ступень_образования] ([Ступень])
GO
ALTER TABLE [dbo].[Документ_об_образовании] CHECK CONSTRAINT [FK_Документ_об_образовании_Ступень_образования]
GO
USE [master]
GO
ALTER DATABASE [demka] SET  READ_WRITE 
GO

