USE [master]
GO
/****** Object:  Database [Covid19DataVaultForAzure]    Script Date: 5/19/2020 1:45:21 PM ******/
CREATE DATABASE [Covid19DataVaultForAzure]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Covid19DataVault', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\Covid19DataVaultForAzure.mdf' , SIZE = 79360KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Covid19DataVault_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER2019\MSSQL\DATA\Covid19DataVaultForAzure_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Covid19DataVaultForAzure].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET ARITHABORT OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET  MULTI_USER 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Covid19DataVaultForAzure', N'ON'
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET QUERY_STORE = OFF
GO
USE [Covid19DataVaultForAzure]
GO
/****** Object:  Schema [Core]    Script Date: 5/19/2020 1:45:21 PM ******/
CREATE SCHEMA [Core]
GO
/****** Object:  Schema [Item]    Script Date: 5/19/2020 1:45:21 PM ******/
CREATE SCHEMA [Item]
GO
/****** Object:  Schema [Link]    Script Date: 5/19/2020 1:45:21 PM ******/
CREATE SCHEMA [Link]
GO
/****** Object:  Schema [Message]    Script Date: 5/19/2020 1:45:21 PM ******/
CREATE SCHEMA [Message]
GO
/****** Object:  Schema [Reference]    Script Date: 5/19/2020 1:45:21 PM ******/
CREATE SCHEMA [Reference]
GO
/****** Object:  Schema [Report]    Script Date: 5/19/2020 1:45:21 PM ******/
CREATE SCHEMA [Report]
GO
/****** Object:  Schema [Stage]    Script Date: 5/19/2020 1:45:21 PM ******/
CREATE SCHEMA [Stage]
GO
/****** Object:  Schema [Utility]    Script Date: 5/19/2020 1:45:21 PM ******/
CREATE SCHEMA [Utility]
GO
/****** Object:  UserDefinedTableType [dbo].[statement]    Script Date: 5/19/2020 1:45:21 PM ******/
CREATE TYPE [dbo].[statement] AS TABLE(
	[ID] [int] NOT NULL,
	[sqlString] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[statementBlock]    Script Date: 5/19/2020 1:45:21 PM ******/
CREATE TYPE [dbo].[statementBlock] AS TABLE(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[procedureName] [nvarchar](128) NULL,
	[sqlBlock] [nvarchar](max) NULL
)
GO
/****** Object:  Table [Item].[ProvinceStateDetail]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Item].[ProvinceStateDetail](
	[ProvinceStateDetailID] [int] NOT NULL,
	[ProvinceStateID] [int] NOT NULL,
	[MonitorDate] [datetime2](7) NOT NULL,
	[StateAbbreviation] [nvarchar](2) NOT NULL,
	[PositiveToDate] [int] NOT NULL,
	[NegativeToDate] [int] NOT NULL,
	[DeathCountToDate] [int] NOT NULL,
	[PopulationYear] [smallint] NOT NULL,
	[Population] [bigint] NOT NULL,
	[PopulationDensity] [int] NOT NULL,
	[LandArea] [decimal](10, 2) NOT NULL,
	[HashValue] [varbinary](32) NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
 CONSTRAINT [pkStateDetailLinkID] PRIMARY KEY CLUSTERED 
(
	[ProvinceStateDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[CountryRegion]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[CountryRegion](
	[CountryRegionID] [int] NOT NULL,
	[SourceReferenceKey] [nvarchar](64) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
 CONSTRAINT [CountryRegionPK] PRIMARY KEY CLUSTERED 
(
	[CountryRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[CountrySubRegion]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[CountrySubRegion](
	[CountrySubRegionID] [int] NOT NULL,
	[SourceReferenceKey] [nvarchar](64) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
 CONSTRAINT [CountrySubRegionPK] PRIMARY KEY CLUSTERED 
(
	[CountrySubRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[ProvinceState]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[ProvinceState](
	[ProvinceStateID] [int] NOT NULL,
	[SourceReferenceKey] [nvarchar](64) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
 CONSTRAINT [ProvinceStatePK] PRIMARY KEY CLUSTERED 
(
	[ProvinceStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Link].[ProvinceStateDetailToProvinceStateCore]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Link].[ProvinceStateDetailToProvinceStateCore](
	[ProvinceStateDetailLinkID] [int] NOT NULL,
	[ProvinceStateDetailID] [int] NOT NULL,
	[CountryRegionID] [int] NULL,
	[CountrySubRegionID] [int] NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
 CONSTRAINT [pkProvinceStateDetailLinkID] PRIMARY KEY CLUSTERED 
(
	[ProvinceStateDetailLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Report].[vwProvinceStateDetail]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Report].[vwProvinceStateDetail]
AS
     SELECT b.[MonitorDate], 
            a.SourceReferenceKey AS 'StateName',             
			d.SourceReferenceKey AS 'Country Region', 
            e.SourceReferenceKey AS 'Country Sub Region', 
            b.[StateAbbreviation], 
            b.[PositiveToDate], 
            b.[NegativeToDate], 
            b.[DeathCountToDate], 
            b.[PopulationYear], 
            b.[Population], 
            b.[PopulationDensity] as PopulationDensityPerSquareMile, 
            b.[LandArea], 
            b.[Source],
			a.ProvinceStateID
     FROM Core.ProvinceState AS a
          INNER JOIN [Item].[ProvinceStateDetail] AS b ON b.ProvinceStateID = a.ProvinceStateID
          INNER JOIN LINK.ProvinceStateDetailToProvinceStateCore AS c ON b.ProvinceStateDetailID = c.ProvinceStateDetailID
          INNER JOIN Core.CountryRegion AS d ON d.CountryRegionID = c.CountryRegionID
          INNER JOIN Core.CountrySubRegion AS e ON e.CountrySubRegionID = c.CountrySubRegionID;
GO
/****** Object:  Table [Core].[Country]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Country](
	[CountryID] [int] NOT NULL,
	[SourceReferenceKey] [nvarchar](64) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
 CONSTRAINT [CountryPK] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Reference].[WorldRegionCountryCode]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reference].[WorldRegionCountryCode](
	[CountryCode] [nvarchar](4) NOT NULL,
	[WorldRegion] [nvarchar](64) NULL,
	[WorldSubRegion] [nvarchar](64) NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
 CONSTRAINT [pkCountryDetailLinkID] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Item].[CountryDetail]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Item].[CountryDetail](
	[CountryDetailID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[MonitorDate] [datetime2](7) NULL,
	[CaseCount] [int] NOT NULL,
	[DeathCount] [int] NOT NULL,
	[PeriodToDateCaseCount] [int] NOT NULL,
	[PeriodToDateDeathCount] [int] NOT NULL,
	[Population] [bigint] NOT NULL,
	[CaseCountPerPopulationPercent] [decimal](29, 13) NOT NULL,
	[DeathCountPerPopulationPercent] [decimal](29, 13) NOT NULL,
	[IncomePerCapita2018] [decimal](12, 2) NOT NULL,
	[PopulationDensityPerKilometer] [decimal](12, 2) NOT NULL,
	[CaseThirtyDayMovingAverage] [int] NOT NULL,
	[DeathThirtyDayMovingAverage] [int] NOT NULL,
	[CountryCode] [nvarchar](8) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
 CONSTRAINT [CountryDetailPK] PRIMARY KEY CLUSTERED 
(
	[CountryDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Report].[vwCountryDetail]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Report].[vwCountryDetail] as
SELECT b.[MonitorDate],
       a.SourceReferenceKey AS 'Country', 
       c.WorldRegion, 
       c.WorldSubRegion, 
       b.[CaseCount], 
       b.[DeathCount], 
       b.[PeriodToDateCaseCount], 
       b.[PeriodToDateDeathCount], 
       b.[Population], 
       b.[CaseCountPerPopulationPercent], 
       b.[DeathCountPerPopulationPercent], 
       b.[IncomePerCapita2018], 
       b.[PopulationDensityPerKilometer], 
       b.[CaseThirtyDayMovingAverage], 
       b.[DeathThirtyDayMovingAverage], 
       b.[CountryCode],
	   b.[Source],
	   a.CountryID
FROM Core.Country AS a
     INNER JOIN [Item].[CountryDetail] AS b ON b.CountryID = a.CountryID
     INNER JOIN [Reference].[WorldRegionCountryCode] AS c ON c.CountryCode = b.CountryCode;
GO
/****** Object:  Table [Item].[CounTYDetail]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Item].[CounTYDetail](
	[CounTYDetailID] [int] NOT NULL,
	[CounTYID] [int] NOT NULL,
	[MonitorDate] [datetime2](7) NOT NULL,
	[FIPS] [nvarchar](8) NULL,
	[CaseCount] [int] NULL,
	[DeathCount] [int] NULL,
	[PopulationYear] [smallint] NULL,
	[Population] [bigint] NULL,
	[BirthPerPopulation] [int] NULL,
	[DeathPerPopulation] [bigint] NULL,
	[CaseMovingAverage] [int] NULL,
	[DeathMovingAverage] [int] NULL,
	[MovingAverageFactor] [smallint] NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
 CONSTRAINT [CounTYDetailPK] PRIMARY KEY CLUSTERED 
(
	[CounTYDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[County]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[County](
	[CountyID] [int] NOT NULL,
	[SourceReferenceKey] [nvarchar](64) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
 CONSTRAINT [CountyPK] PRIMARY KEY CLUSTERED 
(
	[CountyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Link].[CounTYDetailToCounTYCore]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Link].[CounTYDetailToCounTYCore](
	[CounTYDetailLinkID] [int] NOT NULL,
	[CounTYDetailID] [int] NOT NULL,
	[CountryRegionID] [int] NOT NULL,
	[CountrySubRegionID] [int] NOT NULL,
	[ProvinceStateID] [int] NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
 CONSTRAINT [pkCounTYDetailLinkID] PRIMARY KEY CLUSTERED 
(
	[CounTYDetailLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Report].[vwCounTYDetail]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [Report].[vwCounTYDetail]
AS
SELECT b.[MonitorDate], 
       a.SourceReferenceKey AS 'CounTYName', 
       f.SourceReferenceKey AS 'StateName', 
       d.SourceReferenceKey AS 'Country Region', 
       e.SourceReferenceKey AS 'Country Sub Region', 
       b.[FIPS], 
       b.[CaseCount], 
       b.[DeathCount], 
       b.[CaseMovingAverage], 
       b.[DeathMovingAverage], 
       b.[MovingAverageFactor], 
       b.[BirthPerPopulation], 
       b.[DeathPerPopulation], 
       b.[PopulationYear], 
       b.[Population], 
       b.[Source],
	   a.CountyID
FROM Core.County AS a
     INNER JOIN [Item].[CounTYDetail] AS b ON b.CounTYID = a.CounTYID
     INNER JOIN LINK.CounTYDetailToCounTYCore AS c ON b.CounTYDetailID = c.CounTYDetailID
     INNER JOIN Core.CountryRegion AS d ON d.CountryRegionID = c.CountryRegionID
     INNER JOIN Core.CountrySubRegion AS e ON e.CountrySubRegionID = c.CountrySubRegionID
     INNER JOIN Core.ProvinceState AS f ON f.ProvinceStateID = c.ProvinceStateID;

GO
/****** Object:  Table [Core].[City]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[City](
	[CityID] [int] NOT NULL,
	[SourceReferenceKey] [nvarchar](64) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
 CONSTRAINT [CityPK] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[CountyRegion]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[CountyRegion](
	[CountyRegionID] [int] NOT NULL,
	[SourceReferenceKey] [nvarchar](64) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
 CONSTRAINT [CountyRegionPK] PRIMARY KEY CLUSTERED 
(
	[CountyRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[WorldRegion]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[WorldRegion](
	[WorldRegionID] [int] NOT NULL,
	[SourceReferenceKey] [nvarchar](64) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
 CONSTRAINT [WorldRegionPK] PRIMARY KEY CLUSTERED 
(
	[WorldRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Core].[WorldSubRegion]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[WorldSubRegion](
	[WorldSubRegionID] [int] NOT NULL,
	[SourceReferenceKey] [nvarchar](64) NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
	[HashValue] [varbinary](32) NOT NULL,
 CONSTRAINT [WorldSubRegionPK] PRIMARY KEY CLUSTERED 
(
	[WorldSubRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Link].[CountryDetailToCountryCore]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Link].[CountryDetailToCountryCore](
	[CountryDetailLinkID] [int] NOT NULL,
	[CountryDetailID] [int] NOT NULL,
	[Source] [nvarchar](108) NOT NULL,
	[EffectiveStartDate] [datetime2](7) NOT NULL,
	[EffectiveEndDate] [datetime2](7) NOT NULL,
 CONSTRAINT [pkCountryDetailLinkID] PRIMARY KEY CLUSTERED 
(
	[CountryDetailLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Item].[CountryDetail]  WITH CHECK ADD  CONSTRAINT [CountryID003] FOREIGN KEY([CountryID])
REFERENCES [Core].[Country] ([CountryID])
GO
ALTER TABLE [Item].[CountryDetail] CHECK CONSTRAINT [CountryID003]
GO
ALTER TABLE [Item].[CounTYDetail]  WITH CHECK ADD  CONSTRAINT [CounTYID010] FOREIGN KEY([CounTYID])
REFERENCES [Core].[County] ([CountyID])
GO
ALTER TABLE [Item].[CounTYDetail] CHECK CONSTRAINT [CounTYID010]
GO
ALTER TABLE [Item].[ProvinceStateDetail]  WITH CHECK ADD  CONSTRAINT [ProvinceStateID014] FOREIGN KEY([ProvinceStateID])
REFERENCES [Core].[ProvinceState] ([ProvinceStateID])
GO
ALTER TABLE [Item].[ProvinceStateDetail] CHECK CONSTRAINT [ProvinceStateID014]
GO
ALTER TABLE [Link].[CountryDetailToCountryCore]  WITH CHECK ADD  CONSTRAINT [CountryDetailID001] FOREIGN KEY([CountryDetailID])
REFERENCES [Item].[CountryDetail] ([CountryDetailID])
GO
ALTER TABLE [Link].[CountryDetailToCountryCore] CHECK CONSTRAINT [CountryDetailID001]
GO
ALTER TABLE [Link].[CounTYDetailToCounTYCore]  WITH CHECK ADD  CONSTRAINT [CountryRegionID004] FOREIGN KEY([CountryRegionID])
REFERENCES [Core].[CountryRegion] ([CountryRegionID])
GO
ALTER TABLE [Link].[CounTYDetailToCounTYCore] CHECK CONSTRAINT [CountryRegionID004]
GO
ALTER TABLE [Link].[CounTYDetailToCounTYCore]  WITH CHECK ADD  CONSTRAINT [CountrySubRegionID007] FOREIGN KEY([CountrySubRegionID])
REFERENCES [Core].[CountrySubRegion] ([CountrySubRegionID])
GO
ALTER TABLE [Link].[CounTYDetailToCounTYCore] CHECK CONSTRAINT [CountrySubRegionID007]
GO
ALTER TABLE [Link].[CounTYDetailToCounTYCore]  WITH CHECK ADD  CONSTRAINT [CounTYDetailID008] FOREIGN KEY([CounTYDetailID])
REFERENCES [Item].[CounTYDetail] ([CounTYDetailID])
GO
ALTER TABLE [Link].[CounTYDetailToCounTYCore] CHECK CONSTRAINT [CounTYDetailID008]
GO
ALTER TABLE [Link].[CounTYDetailToCounTYCore]  WITH CHECK ADD  CONSTRAINT [ProvinceStateID013] FOREIGN KEY([ProvinceStateID])
REFERENCES [Core].[ProvinceState] ([ProvinceStateID])
GO
ALTER TABLE [Link].[CounTYDetailToCounTYCore] CHECK CONSTRAINT [ProvinceStateID013]
GO
ALTER TABLE [Link].[ProvinceStateDetailToProvinceStateCore]  WITH CHECK ADD  CONSTRAINT [CountryRegionID005] FOREIGN KEY([CountryRegionID])
REFERENCES [Core].[CountryRegion] ([CountryRegionID])
GO
ALTER TABLE [Link].[ProvinceStateDetailToProvinceStateCore] CHECK CONSTRAINT [CountryRegionID005]
GO
ALTER TABLE [Link].[ProvinceStateDetailToProvinceStateCore]  WITH CHECK ADD  CONSTRAINT [CountrySubRegionID006] FOREIGN KEY([CountrySubRegionID])
REFERENCES [Core].[CountrySubRegion] ([CountrySubRegionID])
GO
ALTER TABLE [Link].[ProvinceStateDetailToProvinceStateCore] CHECK CONSTRAINT [CountrySubRegionID006]
GO
ALTER TABLE [Link].[ProvinceStateDetailToProvinceStateCore]  WITH CHECK ADD  CONSTRAINT [ProvinceStateDetailID011] FOREIGN KEY([ProvinceStateDetailID])
REFERENCES [Item].[ProvinceStateDetail] ([ProvinceStateDetailID])
GO
ALTER TABLE [Link].[ProvinceStateDetailToProvinceStateCore] CHECK CONSTRAINT [ProvinceStateDetailID011]
GO
/****** Object:  StoredProcedure [Message].[upFlagCountryDetailItem]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Message].[upFlagCountryDetailItem]  (@ID int)
AS
UPDATE Stage.DailyChangeByCountryJSON Set JSONFileCreateDate = GETDATE()WHERE ID = @ID;
RETURN
GO
/****** Object:  StoredProcedure [Message].[upFlagCounTYDetailItem]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Message].[upFlagCounTYDetailItem]  (@ID int)
AS
UPDATE Stage.DailyChangeByCounTYJSON Set JSONFileCreateDate = GETDATE()WHERE ID = @ID;
RETURN
GO
/****** Object:  StoredProcedure [Message].[upFlagMissingCountryDetailItem]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Message].[upFlagMissingCountryDetailItem]
as
INSERT INTO Stage.MissingDailyChangeCountry 
SELECT * from Stage.DailyChangeByCountryJSON WHERE BulkColumn is NULL;
UPDATE Stage.DailyChangeByCountryJSON set JSONFileCreateDate  = ProcessDate WHERE BulkColumn is NULL;
RETURN(@@ROWCOUNT)
GO
/****** Object:  StoredProcedure [Message].[upFlagProvinceStateDetailItem]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Message].[upFlagProvinceStateDetailItem]  (@ID int)
AS
UPDATE Stage.DailyChangeByProvinceStateJSON Set JSONFileCreateDate = GETDATE()WHERE ID = @ID;
RETURN
GO
/****** Object:  StoredProcedure [Message].[upGetCountryDetailItem]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Message].[upGetCountryDetailItem]
AS
select TOP 1(BulkColumn),ID, FileNumber from Stage.DailyChangeByCountryJSON WHERE JSONFileCreateDate is NULL;
GO
/****** Object:  StoredProcedure [Message].[upGetCounTYDetailItem]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Message].[upGetCounTYDetailItem]
AS
select TOP 1(BulkColumn),ID, FileNumber from Stage.DailyChangeByCounTYJSON WHERE JSONFileCreateDate is NULL;
GO
/****** Object:  StoredProcedure [Message].[upGetProvinceStateDetailItem]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Message].[upGetProvinceStateDetailItem]
AS
select TOP 1(BulkColumn),ID, FileNumber from Stage.DailyChangeByProvinceStateJSON WHERE JSONFileCreateDate is NULL;
GO
/****** Object:  StoredProcedure [Message].[upInsertCountryJSON]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
CREATE PROCEDURE [Message].[upInsertCountryJSON] @message NVARCHAR(MAX)
AS
     DECLARE @nextID INT, @itemCount INT, @startEffectiveDate DATETIME2, @maxID INT, @counter INT;

     IF OBJECT_ID('tempdb.dbo.#inbound') IS NOT NULL
         DROP TABLE #inBound;
     IF OBJECT_ID('tempdb.dbo.#add') IS NOT NULL
         DROP TABLE #add;
     IF OBJECT_ID('tempdb.dbo.#error') IS NOT NULL
         DROP TABLE #error;

     --create table #JSONMessage (BulkColumn nvarchar(max))
	  CREATE TABLE #error
     ([ID]                 [INT] NOT NULL, 
      [ErrorMessage]	   NVARCHAR(MAX) NULL, 
      [EffectiveStartDate] [DATETIME2](7) NULL);
     
     
	 CREATE TABLE #inBound
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
     
	 CREATE TABLE #add
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
	      --insert json	
     INSERT INTO #inBound
     (ID, 
      SourceReferenceKey, 
      [Source], 
      EffectiveStartDate, 
      EffectiveEndDate, 
      HashValue, 
      [NewID]
     )
            SELECT ROW_NUMBER() OVER(
                   ORDER BY SourceReferenceKey), 
                   SourceReferenceKey, 
                   [Source], 
                   GETDATE(), 
                   '9999/01/01', 
                   HASHBYTES('SHA2_256', CAST([SourceReferenceKey] AS NVARCHAR(27))), 
                   0
            FROM OPENJSON(@message) WITH(SourceReferenceKey NVARCHAR(32) '$.location',
			[Source] NVARCHAR(108) '$.Source' )
            GROUP BY SourceReferenceKey, [Source];

     --compare items from Core.table and insert into #add
     INSERT INTO #add
            SELECT ROW_NUMBER() OVER(
                   ORDER BY a.SourceReferenceKey), 
                   a.SourceReferenceKey, 
                   a.Source, 
                   a.EffectiveStartDate, 
                   a.EffectiveEndDate, 
                   a.HashValue, 
                   0
            FROM #inBound AS a
                 LEFT OUTER JOIN Core.Country AS b ON a.SourceReferenceKey = b.SourceReferenceKey
            WHERE b.SourceReferenceKey IS NULL;
     SET @itemCount = @@ROWCOUNT;
     SET @maxID = 0;
     SELECT @maxID = MAX(CountryID)
     FROM Core.Country;
     --table is empty
     IF @maxID IS NULL
         SELECT @maxID = 0, 
                @nextID = 1;
     SELECT @counter = 1;
     --assign ID
     WHILE(@counter <= @itemCount)
         BEGIN
             UPDATE #add
               SET 
                   [NewID] = @nextID
             WHERE ID = @counter;
             SELECT @counter = @counter + 1, 
                    @nextID = @nextID + 1;
         END;

     --insert #add to Core.Table
     INSERT INTO Core.Country
            SELECT [NewId], 
                   SourceReferenceKey, 
                   [Source], 
                   EffectiveStartDate, 
                   EffectiveEndDate, 
                   HashValue
            FROM #add;
     RETURN(@itemCount);
	 
GO
/****** Object:  StoredProcedure [Message].[upInsertCountryRegionJSON]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
CREATE PROCEDURE [Message].[upInsertCountryRegionJSON] @message NVARCHAR(MAX)
AS
--table Name Core.CountryRegion
-- primary key Core.CountryRegion.CountryRegionID
--JSON column $.REGION

     DECLARE @nextID INT, @itemCount INT, @startEffectiveDate DATETIME2, @maxID INT, @counter INT;

     IF OBJECT_ID('tempdb.dbo.#inbound') IS NOT NULL
         DROP TABLE #inBound;
     IF OBJECT_ID('tempdb.dbo.#add') IS NOT NULL
         DROP TABLE #add;
     IF OBJECT_ID('tempdb.dbo.#error') IS NOT NULL
         DROP TABLE #error;

     --create table #JSONMessage (BulkColumn nvarchar(max))
	  CREATE TABLE #error
     ([ID]                 [INT] NOT NULL, 
      [ErrorMessage]	   NVARCHAR(MAX) NULL, 
      [EffectiveStartDate] [DATETIME2](7) NULL);
     
     
	 CREATE TABLE #inBound
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
     
	 CREATE TABLE #add
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
	      --insert json	
     INSERT INTO #inBound
     (ID, 
      SourceReferenceKey, 
      [Source], 
      EffectiveStartDate, 
      EffectiveEndDate, 
      HashValue, 
      [NewID]
     )
            SELECT ROW_NUMBER() OVER(
                   ORDER BY SourceReferenceKey), 
                   SourceReferenceKey, 
                   [Source], 
                   GETDATE(), 
                   '9999/01/01', 
                   HASHBYTES('SHA2_256', CAST([SourceReferenceKey] AS NVARCHAR(27))), 
                   0
             FROM OPENJSON(@message) WITH(SourceReferenceKey NVARCHAR(32) '$.RegionName',
			[Source] NVARCHAR(108) '$.Source') GROUP BY SourceReferenceKey, 
                   [Source];

     --compare items from Core.table and insert into #add
     INSERT INTO #add
            SELECT ROW_NUMBER() OVER(
                   ORDER BY a.SourceReferenceKey), 
                   a.SourceReferenceKey, 
                   a.Source, 
                   a.EffectiveStartDate, 
                   a.EffectiveEndDate, 
                   a.HashValue, 
                   0
            FROM #inBound AS a
                 LEFT OUTER JOIN Core.Country AS b ON a.SourceReferenceKey = b.SourceReferenceKey
            WHERE b.SourceReferenceKey IS NULL;
     SET @itemCount = @@ROWCOUNT;
     SET @maxID = 0;
	 SELECT @maxID = MAX(CountryRegionID)
     FROM Core.CountryRegion;
     --table is empty
     IF @maxID IS NULL
         SELECT @maxID = 0, 
                @nextID = 1;
     SELECT @counter = 1;
     --assign ID
     WHILE(@counter <= @itemCount)
         BEGIN
             UPDATE #add
               SET 
                   [NewID] = @nextID
             WHERE ID = @counter;
             SELECT @counter = @counter + 1, 
                    @nextID = @nextID + 1;
         END;

     --insert #add to Core.Table
     INSERT INTO Core.CountryRegion
            SELECT [NewId], 
                   SourceReferenceKey, 
                   [Source], 
                   EffectiveStartDate, 
                   EffectiveEndDate, 
                   HashValue
            FROM #add;
     RETURN(@itemCount);
	 
GO
/****** Object:  StoredProcedure [Message].[upInsertCountrySubRegionJSON]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
CREATE PROCEDURE [Message].[upInsertCountrySubRegionJSON] @message NVARCHAR(MAX)
AS
--table Name Core.CountrySubRegion
-- primary key Core.CountrySubRegion.CountrySubRegionID
--JSON column $.DivisionName

     DECLARE @nextID INT, @itemCount INT, @startEffectiveDate DATETIME2, @maxID INT, @counter INT;

     IF OBJECT_ID('tempdb.dbo.#inbound') IS NOT NULL
         DROP TABLE #inBound;
     IF OBJECT_ID('tempdb.dbo.#add') IS NOT NULL
         DROP TABLE #add;
     IF OBJECT_ID('tempdb.dbo.#error') IS NOT NULL
         DROP TABLE #error;

     --create table #JSONMessage (BulkColumn nvarchar(max))
	  CREATE TABLE #error
     ([ID]                 [INT] NOT NULL, 
      [ErrorMessage]	   NVARCHAR(MAX) NULL, 
      [EffectiveStartDate] [DATETIME2](7) NULL);
     
     
	 CREATE TABLE #inBound
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
     
	 CREATE TABLE #add
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
	      --insert json	
     INSERT INTO #inBound
     (ID, 
      SourceReferenceKey, 
      [Source], 
      EffectiveStartDate, 
      EffectiveEndDate, 
      HashValue, 
      [NewID]
     )
            SELECT ROW_NUMBER() OVER(
                   ORDER BY SourceReferenceKey), 
                   SourceReferenceKey, 
                   [Source], 
                   GETDATE(), 
                   '9999/01/01', 
                   HASHBYTES('SHA2_256', CAST([SourceReferenceKey] AS NVARCHAR(27))), 
                   0
            FROM OPENJSON(@message) WITH(SourceReferenceKey NVARCHAR(32) '$.DivisionName',
			[Source] NVARCHAR(108) '$.Source')
            GROUP BY SourceReferenceKey, [Source];

     --compare items from Core.table and insert into #add
     INSERT INTO #add
            SELECT ROW_NUMBER() OVER(
                   ORDER BY a.SourceReferenceKey), 
                   a.SourceReferenceKey, 
                   a.Source, 
                   a.EffectiveStartDate, 
                   a.EffectiveEndDate, 
                   a.HashValue, 
                   0
            FROM #inBound AS a
                 LEFT OUTER JOIN Core.Country AS b ON a.SourceReferenceKey = b.SourceReferenceKey
            WHERE b.SourceReferenceKey IS NULL;
     SET @itemCount = @@ROWCOUNT;
     SET @maxID = 0;
	 SELECT @maxID = MAX(CountrySubRegionID)
     FROM Core.CountrySubRegion;
     --table is empty
     IF @maxID IS NULL
         SELECT @maxID = 0, 
                @nextID = 1;
     SELECT @counter = 1;
     --assign ID
     WHILE(@counter <= @itemCount)
         BEGIN
             UPDATE #add
               SET 
                   [NewID] = @nextID
             WHERE ID = @counter;
             SELECT @counter = @counter + 1, 
                    @nextID = @nextID + 1;
         END;

     --insert #add to Core.Table
     INSERT INTO Core.CountrySubRegion
            SELECT [NewId], 
                   SourceReferenceKey, 
                   [Source], 
                   EffectiveStartDate, 
                   EffectiveEndDate, 
                   HashValue
            FROM #add;
     RETURN(@itemCount);
	 
GO
/****** Object:  StoredProcedure [Message].[upInsertCountyJSON]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
CREATE PROCEDURE [Message].[upInsertCountyJSON] @message NVARCHAR(MAX)
AS
--table Name Core.County
-- primary key Core.County.CountyID
--JSON column $.CTYNAME

     DECLARE @nextID INT, @itemCount INT, @startEffectiveDate DATETIME2, @maxID INT, @counter INT;

     IF OBJECT_ID('tempdb.dbo.#inbound') IS NOT NULL
         DROP TABLE #inBound;
     IF OBJECT_ID('tempdb.dbo.#add') IS NOT NULL
         DROP TABLE #add;
     IF OBJECT_ID('tempdb.dbo.#error') IS NOT NULL
         DROP TABLE #error;

     --create table #JSONMessage (BulkColumn nvarchar(max))
	  CREATE TABLE #error
     ([ID]                 [INT] NOT NULL, 
      [ErrorMessage]	   NVARCHAR(MAX) NULL, 
      [EffectiveStartDate] [DATETIME2](7) NULL);
     
     
	 CREATE TABLE #inBound
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
     
	 CREATE TABLE #add
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
	      --insert json	
     INSERT INTO #inBound
     (ID, 
      SourceReferenceKey, 
      [Source], 
      EffectiveStartDate, 
      EffectiveEndDate, 
      HashValue, 
      [NewID]
     )
            SELECT ROW_NUMBER() OVER(
                   ORDER BY SourceReferenceKey), 
                   SourceReferenceKey, 
                   [Source], 
                   GETDATE(), 
                   '9999/01/01', 
                   HASHBYTES('SHA2_256', CAST([SourceReferenceKey] AS NVARCHAR(27))), 
                   0
            FROM OPENJSON(@message) WITH(SourceReferenceKey NVARCHAR(32) '$.CTYNAME',
			[Source] NVARCHAR(108) '$.Source')
            GROUP BY SourceReferenceKey, [Source];

     --compare items from Core.table and insert into #add
     INSERT INTO #add
            SELECT ROW_NUMBER() OVER(
                   ORDER BY a.SourceReferenceKey), 
                   a.SourceReferenceKey, 
                   a.Source, 
                   a.EffectiveStartDate, 
                   a.EffectiveEndDate, 
                   a.HashValue, 
                   0
            FROM #inBound AS a
                 LEFT OUTER JOIN Core.Country AS b ON a.SourceReferenceKey = b.SourceReferenceKey
            WHERE b.SourceReferenceKey IS NULL;
     SET @itemCount = @@ROWCOUNT;
     SET @maxID = 0;
	 SELECT @maxID = MAX(CountyID)
     FROM Core.County;
     --table is empty
     IF @maxID IS NULL
         SELECT @maxID = 0, 
                @nextID = 1;
     SELECT @counter = 1;
     --assign ID
     WHILE(@counter <= @itemCount)
         BEGIN
             UPDATE #add
               SET 
                   [NewID] = @nextID
             WHERE ID = @counter;
             SELECT @counter = @counter + 1, 
                    @nextID = @nextID + 1;
         END;

     --insert #add to Core.Table
     INSERT INTO Core.County
            SELECT [NewId], 
                   SourceReferenceKey, 
                   [Source], 
                   EffectiveStartDate, 
                   EffectiveEndDate, 
                   HashValue
            FROM #add;
     RETURN(@itemCount);
	 
GO
/****** Object:  StoredProcedure [Message].[upInsertProvinceStateJSON]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Message].[upInsertProvinceStateJSON] @message NVARCHAR(MAX)
AS
--table Name Core.ProvinceState
-- primary key Core.ProvinceState.ProvinceStateID
--JSON column $.STNAME

     DECLARE @nextID INT, @itemCount INT, @startEffectiveDate DATETIME2, @maxID INT, @counter INT;

     IF OBJECT_ID('tempdb.dbo.#inbound') IS NOT NULL
         DROP TABLE #inBound;
     IF OBJECT_ID('tempdb.dbo.#add') IS NOT NULL
         DROP TABLE #add;
     IF OBJECT_ID('tempdb.dbo.#error') IS NOT NULL
         DROP TABLE #error;

     --create table #JSONMessage (BulkColumn nvarchar(max))
	  CREATE TABLE #error
     ([ID]                 [INT] NOT NULL, 
      [ErrorMessage]	   NVARCHAR(MAX) NULL, 
      [EffectiveStartDate] [DATETIME2](7) NULL);
     
     
	 CREATE TABLE #inBound
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
     
	 CREATE TABLE #add
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
	      --insert json	
     INSERT INTO #inBound
     (ID, 
      SourceReferenceKey, 
      [Source], 
      EffectiveStartDate, 
      EffectiveEndDate, 
      HashValue, 
      [NewID]
     )
            SELECT ROW_NUMBER() OVER(
                   ORDER BY SourceReferenceKey), 
                   SourceReferenceKey, 
                   [Source], 
                   GETDATE(), 
                   '9999/01/01', 
                   HASHBYTES('SHA2_256', CAST([SourceReferenceKey] AS NVARCHAR(27))), 
                   0
            FROM OPENJSON(@message) WITH(SourceReferenceKey NVARCHAR(32) '$.state', 
			[Source] NVARCHAR(108) '$.Source')
            GROUP BY SourceReferenceKey, [Source];

     --compare items from Core.table and insert into #add
     INSERT INTO #add
            SELECT ROW_NUMBER() OVER(
                   ORDER BY a.SourceReferenceKey), 
                   a.SourceReferenceKey, 
                   a.Source, 
                   a.EffectiveStartDate, 
                   a.EffectiveEndDate, 
                   a.HashValue, 
                   0
            FROM #inBound AS a
                 LEFT OUTER JOIN Core.ProvinceState AS b ON a.SourceReferenceKey = b.SourceReferenceKey
            WHERE b.SourceReferenceKey IS NULL;
     SET @itemCount = @@ROWCOUNT;
     SET @maxID = 0;
	 SELECT @maxID = MAX(ProvinceStateID)
     FROM Core.ProvinceState;
     --table is empty
     IF @maxID IS NULL
         SELECT @maxID = 0, 
                @nextID = 1;
     SELECT @counter = 1;
     --assign ID
     WHILE(@counter <= @itemCount)
         BEGIN
             UPDATE #add
               SET 
                   [NewID] = @nextID
             WHERE ID = @counter;
             SELECT @counter = @counter + 1, 
                    @nextID = @nextID + 1;
         END;

     --insert #add to Core.Table
     INSERT INTO Core.ProvinceState
            SELECT [NewId], 
                   SourceReferenceKey, 
                   [Source], 
                   EffectiveStartDate, 
                   EffectiveEndDate, 
                   HashValue
            FROM #add;
     RETURN(@itemCount);
	 
GO
/****** Object:  StoredProcedure [Message].[upInsertWorldRegionJSON]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Message].[upInsertWorldRegionJSON]
   @message nvarchar(max)
   as 
 
  declare @nextID int
  , @itemCount int
  , @startEffectiveDate DATETIME2
  , @maxID int
  , @counter int

  IF OBJECT_ID('tempdb.dbo.#inbound') IS NOT NULL
   DROP TABLE #inBound;

  IF OBJECT_ID('tempdb.dbo.#add') IS NOT NULL
   DROP TABLE #add;

   IF OBJECT_ID('tempdb.dbo.#error') IS NOT NULL
   DROP TABLE #error;

   --create table #JSONMessage (BulkColumn nvarchar(max))
   select * into #error from Core.WorldRegion WHERE 1 = 1

   CREATE TABLE #inBound (
		[ID] [int] NOT NULL,
		[SourceReferenceKey] [nvarchar](64) NOT NULL,
		[Source] [nvarchar](108) NOT NULL,
		[EffectiveStartDate] [datetime2](7) NOT NULL,
		[EffectiveEndDate] [datetime2](7) NOT NULL,
		[HashValue] [varbinary](32) NOT NULL,
		[NewID] int )

	CREATE TABLE #add (
		[ID] [int] NOT NULL,
		[SourceReferenceKey] [nvarchar](64) NOT NULL,
		[Source] [nvarchar](108) NOT NULL,
		[EffectiveStartDate] [datetime2](7) NOT NULL,
		[EffectiveEndDate] [datetime2](7) NOT NULL,
		[HashValue] [varbinary](32) NOT NULL,
		[NewID] int )
	
	--insert json	
	INSERT INTO #inBound  (ID, SourceReferenceKey, [Source], EffectiveStartDate, EffectiveEndDate, HashValue, [NewID])
	SELECT  ROW_NUMBER() OVER(ORDER BY SourceReferenceKey), SourceReferenceKey, 'Covid19DataVault' ,  getdate(), '9999/01/01', 
	HASHBYTES( 'SHA2_256' , CAST([SourceReferenceKey] AS NVARCHAR(27))), 0
	FROM OPENJSON(@message) WITH (SourceReferenceKey  NVARCHAR(32) '$.WorldRegion'  ) Group BY SourceReferenceKey;
	
	
	--compare items from Core.table and insert into #add
	insert into #add 
	select ROW_NUMBER() OVER(ORDER BY a.SourceReferenceKey), a.SourceReferenceKey, 
	a.Source, a.EffectiveStartDate, a.EffectiveEndDate, a.HashValue, 0
	from #inBound  as a LEFT OUTER JOIN  
	Core.WorldRegion as b on  
	a.SourceReferenceKey = b.SourceReferenceKey 
	WHERE b.SourceReferenceKey is NULL
		
	set @itemCount = @@ROWCOUNT
	
	set @maxID = 0
	select @maxID= max(WorldRegionID) from Core.WorldRegion
	--table is empty
	if @maxID is NULL
		select @maxID  = 0, @nextID = 1 
	select @counter = 1
	--assign ID
	WHILE(@counter <= @itemCount)
    BEGIN
        UPDATE #add
          SET 
              [NewID] = @nextID 
        WHERE ID = @counter;
		SELECT @counter = @counter + 1, @nextID = @nextID + 1;
    END;

	--insert #add to Core.Table
	INSERT INTO Core.WorldRegion
	select [NewId], SourceReferenceKey, [Source], EffectiveStartDate, EffectiveEndDate, HashValue from #add 
	RETURN(@itemCount)
GO
/****** Object:  StoredProcedure [Message].[upInsertWorldSubRegionJSON]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
   
CREATE PROCEDURE [Message].[upInsertWorldSubRegionJSON] @message NVARCHAR(MAX)
AS
     DECLARE @nextID INT, @itemCount INT, @startEffectiveDate DATETIME2, @maxID INT, @counter INT;

     IF OBJECT_ID('tempdb.dbo.#inbound') IS NOT NULL
         DROP TABLE #inBound;
     IF OBJECT_ID('tempdb.dbo.#add') IS NOT NULL
         DROP TABLE #add;
     IF OBJECT_ID('tempdb.dbo.#error') IS NOT NULL
         DROP TABLE #error;

     --create table #JSONMessage (BulkColumn nvarchar(max))
     SELECT *
     INTO #error
     FROM Core.WorldSubRegion
     WHERE 1 = 1;
     
	 CREATE TABLE #inBound
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
     
	 CREATE TABLE #add
     ([ID]                 [INT] NOT NULL, 
      [SourceReferenceKey] [NVARCHAR](64) NOT NULL, 
      [Source]             [NVARCHAR](108) NOT NULL, 
      [EffectiveStartDate] [DATETIME2](7) NOT NULL, 
      [EffectiveEndDate]   [DATETIME2](7) NOT NULL, 
      [HashValue]          [VARBINARY](32) NOT NULL, 
      [NewID]              INT
     );
	      --insert json	
     INSERT INTO #inBound
     (ID, 
      SourceReferenceKey, 
      [Source], 
      EffectiveStartDate, 
      EffectiveEndDate, 
      HashValue, 
      [NewID]
     )
            SELECT ROW_NUMBER() OVER(
                   ORDER BY SourceReferenceKey), 
                   SourceReferenceKey, 
                   'Covid19DataVault', 
                   GETDATE(), 
                   '9999/01/01', 
                   HASHBYTES('SHA2_256', CAST([SourceReferenceKey] AS NVARCHAR(27))), 
                   0
            FROM OPENJSON(@message) WITH(SourceReferenceKey NVARCHAR(32) '$.WorldSubRegion')
            GROUP BY SourceReferenceKey;

     --compare items from Core.table and insert into #add
     INSERT INTO #add
            SELECT ROW_NUMBER() OVER(
                   ORDER BY a.SourceReferenceKey), 
                   a.SourceReferenceKey, 
                   a.Source, 
                   a.EffectiveStartDate, 
                   a.EffectiveEndDate, 
                   a.HashValue, 
                   0
            FROM #inBound AS a
                 LEFT OUTER JOIN Core.WorldSubRegion AS b ON a.SourceReferenceKey = b.SourceReferenceKey
            WHERE b.SourceReferenceKey IS NULL;
     SET @itemCount = @@ROWCOUNT;
     SET @maxID = 0;
     SELECT @maxID = MAX(WorldSubRegionID)
     FROM Core.WorldSubRegion;
     --table is empty
     IF @maxID IS NULL
         SELECT @maxID = 0, 
                @nextID = 1;
     SELECT @counter = 1;
     --assign ID
     WHILE(@counter <= @itemCount)
         BEGIN
             UPDATE #add
               SET 
                   [NewID] = @nextID
             WHERE ID = @counter;
             SELECT @counter = @counter + 1, 
                    @nextID = @nextID + 1;
         END;

     --insert #add to Core.Table
     INSERT INTO Core.WorldSubRegion
            SELECT [NewId], 
                   SourceReferenceKey, 
                   [Source], 
                   EffectiveStartDate, 
                   EffectiveEndDate, 
                   HashValue
            FROM #add;
     RETURN(@itemCount);
	 
GO
/****** Object:  StoredProcedure [Message].[upItemCountryDetail]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Message].[upItemCountryDetail] @message NVARCHAR(MAX)
AS

/*--for testing
DECLARE @message NVARCHAR(MAX), @x INT;
SELECT @message = BulkColumn
FROM Stage.JsonDocument;
--SELECT @message
*/
--removed CountryID from LInk.CountryDetailToCountryCore 2020-04-30

    BEGIN TRY
        BEGIN TRANSACTION;
        DECLARE @nextID INT, @itemCount INT, @startEffectiveDate DATETIME2, @maxID INT, @maxLinkID INT, @nextLinkID INT, @counter INT;
        IF OBJECT_ID('tempdb.dbo.#inbound') IS NOT NULL
            DROP TABLE #inBound;
        IF OBJECT_ID('tempdb.dbo.#add') IS NOT NULL
            DROP TABLE #add;
        IF OBJECT_ID('tempdb.dbo.#error') IS NOT NULL
            DROP TABLE #error;

        --create table #JSONMessage (BulkColumn nvarchar(max))
        CREATE TABLE #error
        ([ID]                 [INT] NOT NULL, 
         [ErrorMessage]       NVARCHAR(MAX) NULL, 
         [EffectiveStartDate] [DATETIME2](7) NULL
        );
        CREATE TABLE #inBound
        (ID                               [INT] NOT NULL, 
         [MonitorDate]                    [DATETIME2] NOT NULL, 
         [Country]                        [NVARCHAR](48), 
         [CaseCount]                      [INT] NOT NULL, 
         [DeathCount]                     [INT] NOT NULL, 
         [PeriodToDateCaseCount]          [INT] NOT NULL, 
         [PeriodToDateDeathCount]         [INT] NOT NULL, 
         [Population]                     [BIGINT] NOT NULL, 
         [CaseCountPerPopulationPercent]  [DECIMAL](29, 13) NOT NULL, 
         [DeathCountPerPopulationPercent] [DECIMAL](29, 13) NOT NULL, 
         [IncomePerCapita2018]            [DECIMAL](12, 2) NOT NULL, 
         [PopulationDensityPerKilometer]  [DECIMAL](12, 2) NOT NULL, 
         [CaseThirtyDayMovingAverage]     [INT] NOT NULL, 
         [DeathThirtyDayMovingAverage]    [INT] NOT NULL, 
         [CountryCode]                    [NVARCHAR](8) NOT NULL, 
         [WorldRegion]                    [NVARCHAR](64) NULL, 
         [WorldSubRegion]                 [NVARCHAR](64) NULL, 
         EffectiveStartDate               DATETIME2 NOT NULL, 
         EffectiveEndDate                 DATETIME2 NOT NULL, 
         [HashValue]                      [VARBINARY](32) NULL, 
         [Source]                         [NVARCHAR](108) NOT NULL
        );
        CREATE TABLE #add
        (ID                               [INT] NOT NULL, 
         CountryID                        [INT] NULL, 
         [MonitorDate]                    [DATETIME2], 
         [CaseCount]                      [INT] NOT NULL, 
         [DeathCount]                     [INT] NOT NULL, 
         [PeriodToDateCaseCount]          [INT] NOT NULL, 
         [PeriodToDateDeathCount]         [INT] NOT NULL, 
         [Population]                     [BIGINT] NOT NULL, 
         [CaseCountPerPopulationPercent]  [DECIMAL](29, 13) NOT NULL, 
         [DeathCountPerPopulationPercent] [DECIMAL](29, 13) NOT NULL, 
         [IncomePerCapita2018]            [DECIMAL](12, 2) NOT NULL, 
         [PopulationDensityPerKilometer]  [DECIMAL](12, 2) NOT NULL, 
         [CaseThirtyDayMovingAverage]     [INT] NOT NULL, 
         [DeathThirtyDayMovingAverage]    [INT] NOT NULL, 
         [CountryCode]                    [NVARCHAR](8) NOT NULL, 
         [WorldRegion]                    [NVARCHAR](64) NULL, 
         [WorldSubRegion]                 [NVARCHAR](64) NULL, 
         EffectiveStartDate               DATETIME2 NOT NULL, 
         EffectiveEndDate                 DATETIME2 NOT NULL, 
         [HashValue]                      VARBINARY(32) NOT NULL, 
         [Source]                         [NVARCHAR](108) NOT NULL, 
         [NewCountryDetailID]             INT, 
         [NewLinkID]                      INT
        );
        --insert json	

        INSERT INTO #inBound
        (ID, 
         [MonitorDate], --[Date]
         [Country], --[location]
         [CaseCount], --[new_cases]
         [DeathCount], --[new_deaths]
         [PeriodToDateCaseCount], --[total_cases]
         [PeriodToDateDeathCount], --[total_deaths]
         [Population], 
         [CaseCountPerPopulationPercent], 
         [DeathCountPerPopulationPercent], 
         [IncomePerCapita2018], 
         [PopulationDensityPerKilometer], 
         [CaseThirtyDayMovingAverage], 
         [DeathThirtyDayMovingAverage], 
         [CountryCode], 
         [WorldRegion], 
         [WorldSubRegion], 
         EffectiveStartDate, --getdate()
         EffectiveEndDate, --'9999/01/01'
         [HashValue], --[Hash]
         [Source]
        )
               SELECT ROW_NUMBER() OVER(
                      ORDER BY [date]), 
                      [date], 
                      [location], 
                      [new_cases], 
                      [new_deaths], 
                      [total_cases], 
                      [total_deaths], 
                      [Population], 
                      [CaseCountPerPopulationPercent], 
                      [DeathCountPerPopulationPercent], 
                      [IncomePerCapita2018], 
                      [PopulationDensityPerKilometer], 
                      [CaseThirtyDayMovingAverage], 
                      [DeathThirtyDayMovingAverage], 
                      [CountryCode], 
                      [WorldRegion], 
                      [WorldSubRegion], 
                      GETDATE(), 
                      '9999/01/01', 
                      [Hash], 
                      [Source]
               FROM OPENJSON(@message) WITH([date] DATETIME2 '$.date', [location] NVARCHAR(32) '$.location', [new_cases] INT '$.new_cases', [new_deaths] INT '$.new_deaths', [total_cases] INT '$.total_cases', [total_deaths] INT '$.total_deaths', [Population] BIGINT '$.Population', [CaseCountPerPopulationPercent] [DECIMAL](16, 8) '$.CaseCountPerPopulationPercent', [DeathCountPerPopulationPercent] [DECIMAL](16, 8) '$.DeathCountPerPopulationPercent', [IncomePerCapita2018] [DECIMAL](12, 2) '$.IncomePerCapita2018', [PopulationDensityPerKilometer] [DECIMAL](12, 2) '$.PopulationDensityPerKilometer', [CaseThirtyDayMovingAverage] [INT] '$.CaseThirtyDayMovingAverage', [DeathThirtyDayMovingAverage] [INT] '$.DeathThirtyDayMovingAverage', [CountryCode] NVARCHAR(8) '$.CountryCode', [WorldRegion] NVARCHAR(8) '$.WorldRegion', [WorldSubRegion] NVARCHAR(8) '$.WorldSubRegion', [Hash] VARBINARY(32) '$.Hash', [Source] NVARCHAR(108) '$.Source');
        INSERT INTO #add
               SELECT ROW_NUMBER() OVER(
                      ORDER BY a.MonitorDate), 
                      b.CountryID, 
                      a.[MonitorDate], --[Date]
                      a.[CaseCount], --[new_cases]
                       a.[DeathCount], --[new_deaths]
                      a.[PeriodToDateCaseCount], --[total_cases]
                      a.[PeriodToDateDeathCount], --[total_deaths]
                      a.[Population], 
                      a.[CaseCountPerPopulationPercent], 
                      a.[DeathCountPerPopulationPercent], 
                      a.[IncomePerCapita2018], 
                      a.[PopulationDensityPerKilometer], 
                      a.[CaseThirtyDayMovingAverage], 
                      a.[DeathThirtyDayMovingAverage], 
                      a.[CountryCode], 
                      a.[WorldRegion], 
                      a.[WorldSubRegion], 
                      a.EffectiveStartDate, --getdate()
                      a.EffectiveEndDate, --'9999/01/01'
                      a.[HashValue], --[Hash]
                      a.[Source], 
                      0, 
                      0
               FROM #inBound AS a
                    INNER JOIN Core.Country AS b ON a.Country = b.SourceReferenceKey
                    LEFT OUTER JOIN Item.CountryDetail AS c ON c.MonitorDate = a.MonitorDate  AND a.CountryCode = c.CountryCode  --needed to load UNIQUE items per country
					WHERE c.MonitorDate IS NULL and c.CountryCode is NULL;
        SET @itemCount = @@ROWCOUNT;
        SELECT @maxID = 0, 
               @maxLinkID = 0;
        SELECT @maxID = MAX(CountryDetailID)
        FROM Item.CountryDetail;

        --table is empty
        IF @maxID IS NULL
            SELECT @maxID = 0, 
                   @nextID = 1;
            ELSE
            SET @nextID = @maxID + 1;
        SELECT @maxLinkID = MAX(CountryDetailLinkID)
        FROM Link.CountryDetailToCountryCore;

        --table is empty
        IF @maxLinkID IS NULL
            SELECT @maxLinkID = 0, 
                   @nextLinkID = 1;
            ELSE  --table not empty calculate next ID
            SET @nextLinkID = @maxLinkID + 1;
        SELECT @counter = 1;

        --assign ID
        WHILE(@counter <= @itemCount)
            BEGIN
                UPDATE #add
                  SET 
                      [NewCountryDetailID] = @nextID, 
                      [NewLinkID] = @nextLinkID
                WHERE ID = @counter;
                SELECT @counter = @counter + 1, 
                       @nextID = @nextID + 1, 
                       @nextLinkID = @nextLinkID + 1;
            END;

        --insert #add to Item 
        INSERT INTO Item.CountryDetail
               SELECT a.[NewCountryDetailID], 
                      a.CountryID, 
                      a.[MonitorDate], 
                      a.[CaseCount], 
                      a.[DeathCount], 
                      a.[PeriodToDateCaseCount], 
                      a.[PeriodToDateDeathCount], 
                      a.[Population], 
                      a.[CaseCountPerPopulationPercent], 
                      a.[DeathCountPerPopulationPercent], 
                      a.[IncomePerCapita2018], 
                      a.[PopulationDensityPerKilometer], 
                      a.[CaseThirtyDayMovingAverage], 
                      a.[DeathThirtyDayMovingAverage], 
                      a.[CountryCode], 
                      a.EffectiveStartDate, 
                      a.EffectiveEndDate, 
                      a.[HashValue], 
                      a.[Source]
               FROM #add AS a;

        INSERT INTO Link.CountryDetailToCountryCore
               SELECT [NewLinkID], 
                      [NewCountryDetailID], 
                       
                      [Source], 
                      EffectiveStartDate, 
                      EffectiveEndDate
               FROM #add;

        --load REFERENCE Table where country code is missing
        INSERT INTO Reference.WorldRegionCountryCode
               SELECT a.CountryCode, 
                      ISNULL(a.WorldRegion, 'Unknown'), 
                      ISNULL(a.WorldSubRegion, 'Unknown'), 
                      'Covid19DataVault', 
                      GETDATE(), 
                      '9999/01/01'
               FROM #add AS a
                    LEFT OUTER JOIN Reference.WorldRegionCountryCode AS b ON b.CountryCode = a.CountryCode
               WHERE b.CountryCode IS NULL
               GROUP BY a.CountryCode, 
                        a.WorldRegion, 
                        a.WorldSubRegion;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        PRINT 'error'; -- log error to error log
        ROLLBACK TRANSACTION;
        SET @itemCount = -1;
    END CATCH;
        RETURN(@itemCount);
GO
/****** Object:  StoredProcedure [Message].[upItemCounTYDetail]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Message].[upItemCounTYDetail] @message NVARCHAR(MAX)
AS

    --for testing
/*DECLARE @message NVARCHAR(MAX), @x INT;
SELECT @message = BulkColumn
FROM Stage.JsonDocument;
SELECT @message;
*/

--EXEC Message.upItemCounTYDetail @m
--removed CounTYID from Link.CounTYDetailToCountyCore 2020-04-30

    BEGIN TRY
        BEGIN TRANSACTION;
        DECLARE @nextID INT, @itemCount INT, @startEffectiveDate DATETIME2, @maxID INT, @counter INT, @maxLinkID INT, @nextLinkID INT;
        IF OBJECT_ID('tempdb.dbo.#inbound') IS NOT NULL
            DROP TABLE #inBound;
        IF OBJECT_ID('tempdb.dbo.#add') IS NOT NULL
            DROP TABLE #add;
        IF OBJECT_ID('tempdb.dbo.#error') IS NOT NULL
            DROP TABLE #error;

        --create table #JSONMessage (BulkColumn nvarchar(max))
        CREATE TABLE #error
        ([ID]                 [INT] NOT NULL, 
         [ErrorMessage]       NVARCHAR(MAX) NULL, 
         [EffectiveStartDate] [DATETIME2](7) NULL
        );
        CREATE TABLE #inBound
        (ID                    [INT] NOT NULL, 
         [MonitorDate]         [DATETIME2] NOT NULL, 
         [USCensusCounty]      [NVARCHAR](64), 
         [State]               [NVARCHAR](48), 
         [FIPS]                [NVARCHAR](8) NULL, 
         [CaseCount]           INT NULL, 
         [DeathCount]          INT NULL, 
         [PopulationYear]      [SMALLINT] NULL, 
         [Population]          [BIGINT] NULL, 
         [BirthPerPopulation]  [INT] NULL, 
         [DeathsPerPopulation] [BIGINT] NULL, 
         [CaseMovingAverage]   INT NULL, 
         [DeathMovingAverage]  INT NULL, 
         [MovingAverageFactor] SMALLINT NULL, 
         [RegionName]          [NVARCHAR](32), 
         [DivisionName]        [NVARCHAR](32), 
         EffectiveStartDate    DATETIME2 NOT NULL, 
         EffectiveEndDate      DATETIME2 NOT NULL, 
         [HashValue]           [VARBINARY](32) NULL, 
         [Source]              [NVARCHAR](108) NOT NULL
        );
        CREATE TABLE #add
        (ID                    [INT] NOT NULL, 
         CounTYID              [INT] NULL, 
         [MonitorDate]         DATETIME2 NOT NULL, 
		 [USCensusCounty]      [NVARCHAR](64), 
         [FIPS]                [NVARCHAR](8) NULL, 
         [CaseCount]           INT NULL, 
         [DeathCount]          INT NULL, 
         [PopulationYear]      [SMALLINT] NULL, 
         [Population]          [BIGINT] NULL, 
         [BirthPerPopulation]  [INT] NULL, 
         [DeathsPerPopulation] [BIGINT] NULL, 
         [CaseMovingAverage]   INT NULL, 
         [DeathMovingAverage]  INT NULL, 
         [MovingAverageFactor] SMALLINT NULL, 
         [RegionName]          [NVARCHAR](32), 
         [DivisionName]        [NVARCHAR](32), 
         [State]               [NVARCHAR](48), 
         ProvinceStateID       [INT] NULL, 
         CountryRegionID       [INT] NULL, 
         CountrySubRegionID    [INT] NULL, 
         EffectiveStartDate    DATETIME2 NOT NULL, 
         EffectiveEndDate      DATETIME2 NOT NULL, 
         [HashValue]           VARBINARY(32) NOT NULL, 
         [Source]              [NVARCHAR](108) NOT NULL, 
         [NewCounTYDetailID]   INT, 
         [NewLinkID]           INT
        );

        --insert json	
        INSERT INTO #inBound
        (ID, 
         [MonitorDate], --[Date]
         [USCensusCounty], --[county]             
         [State], 
         [FIPS], --[fips]    
         [CaseCount], --[cases]              
         [DeathCount], --[deaths]             
         [PopulationYear], 
         [Population], --[POPESTIMATE2019]    
         [BirthPerPopulation], --[BIRTHS2019] 
         [DeathsPerPopulation], 
         [CaseMovingAverage], 
         [DeathMovingAverage], 
         [MovingAverageFactor], 
         [RegionName], 
         [DivisionName], 
         EffectiveStartDate, 
         EffectiveEndDate, --'9999/01/01'
         [HashValue], --[Hash]
         [Source]
        )
               SELECT ROW_NUMBER() OVER(
                      ORDER BY [date]), 
                      [date], 
                      [USCensusCounty], 
                      [state], 
                      [fips], 
                      [cases], 
                      [deaths], 
                      [PopulationYear], 
                      [POPESTIMATE2019], 
                      [BIRTHS2019], 
                      [DEATHS2019], 
                      [CaseMovingAverage], 
                      [DeathMovingAverage], 
                      [MovingAverageFactor], 
                      [RegionName], 
                      [DivisionName], 
                      GETDATE(), 
                      '9999/01/01', 
                      [Hash], 
                      [Source]
               FROM OPENJSON(@message) WITH([date] DATETIME2 '$.date', [USCensusCounty] NVARCHAR(64) '$.USCensusCounty', 
			   [state] NVARCHAR(64) '$.state', [fips] NVARCHAR(8) '$.fips', [cases] INT '$.cases', 
			   [deaths] INT '$.deaths', [PopulationYear] SMALLINT '$.PopulationYear', 
			   [POPESTIMATE2019] INT '$.POPESTIMATE2019', [BIRTHS2019] INT '$.BIRTHS2019', 
			   [DEATHS2019] BIGINT '$.DEATHS2019', 
			   [CaseMovingAverage] [INT] '$.CaseMovingAverage', [DeathMovingAverage] [INT] '$.DeathMovingAverage', 
			   [MovingAverageFactor] [SMALLINT] '$.MovingAverageFactor', [RegionName] NVARCHAR(32) '$.RegionName', 
			   [DivisionName] NVARCHAR(32) '$.DivisionName', [Hash] VARBINARY(32) '$.Hash', [Source] NVARCHAR(108) '$.Source');
        INSERT INTO #add
               SELECT ROW_NUMBER() OVER(
                      ORDER BY a.MonitorDate), 
                      b.CounTYID, 
                      a.[MonitorDate], 
					  a.USCensusCounty,
                      a.[FIPS], --[fips]    
                      a.[CaseCount], --[cases]              
                      a.[DeathCount], --[deaths]             
                      a.[PopulationYear], 
                      a.[Population], --[POPESTIMATE2019]    
                      a.[BirthPerPopulation], --[BIRTHS2019] 
                      a.[DeathsPerPopulation], 
                      a.[CaseMovingAverage], 
                      a.[DeathMovingAverage], 
                      a.[MovingAverageFactor], 
                      a.[RegionName], 
                      a.[DivisionName], 
                      a.[state], 
                      c.ProvinceStateID, 
                      d.CountryRegionID, 
                      e.CountrySubRegionID, 
                      a.EffectiveStartDate, 
                      a.EffectiveEndDate, 
                      a.[HashValue], --[Hash]
                      a.[Source], 
                      0, 
                      0
               FROM #inBound AS a
                    INNER JOIN Core.CounTY AS b ON a.USCensusCounty = b.SourceReferenceKey
                    INNER JOIN Core.ProvinceState AS c ON a.State = c.SourceReferenceKey
                    INNER JOIN Core.CountryRegion AS d ON a.RegionName = d.SourceReferenceKey
                    INNER JOIN Core.CountrySubRegion AS e ON a.DivisionName = e.SourceReferenceKey
                    LEFT OUTER JOIN ITEM.CounTYDetail AS f ON a.MonitorDate = f.MonitorDate AND a.FIPS = f.FIPS  
					WHERE f.MonitorDate IS NULL AND f.FIPS is NULL ;  --makes sure rows for monitordate and FIPS dont exist 

        SET @itemCount = @@ROWCOUNT;
        --assign ID 
        SELECT @maxID = 0, 
               @maxLinkID = 0;
        SELECT @maxID = MAX(CounTYDetailID)
        FROM Item.CounTYDetail;

		--table is empty
        IF @maxID IS NULL
            SELECT @maxID = 0, 
                   @nextID = 1;
            ELSE  --table not empty calculate next ID
            SET @nextID = @maxID + 1;

        SELECT @maxLinkID = MAX(CounTYDetailLinkID)
        FROM Link.CounTYDetailToCountyCore;
		        
        --table is empty
        IF @maxLinkID IS NULL
            SELECT @maxLinkID = 0, 
                   @nextLinkID = 1;
            ELSE  --table not empty calculate next ID
            SET @nextLinkID = @maxLinkID + 1;
        
		SELECT @counter = 1;

        --assign ID
        WHILE(@counter <= @itemCount)
            BEGIN
                UPDATE #add
                  SET 
                      [NewCountyDetailID] = @nextID, 
                      [NewLinkID] = @nextLinkID
                WHERE ID = @counter;
                SELECT @counter = @counter + 1, 
                       @nextID = @nextID + 1, 
                       @nextLinkID = @nextLinkID + 1;
            END;

        --insert #add to Item 
        INSERT INTO Item.CounTYDetail
               SELECT a.[NewCountyDetailID], 
                      a.[CounTYID], 
                      a.[MonitorDate], 
                      a.[FIPS], --[fips]   
                      a.[CaseCount], --[cases]              
                      a.[DeathCount], --[deaths]             
                      a.[PopulationYear], 
                      a.[Population], --[POPESTIMATE2019]    
                      a.[BirthPerPopulation], --[BIRTHS2019] 
                      a.[DeathsPerPopulation], 
                      a.[CaseMovingAverage], 
                      a.[DeathMovingAverage], 
                      a.[MovingAverageFactor], 
                      a.EffectiveStartDate, 
                      a.EffectiveEndDate, 
                      a.[HashValue], --[Hash]
                      a.[Source]
					  
               FROM #add AS a;
        --#add link here
		
		INSERT INTO Link.CounTYDetailToCounTYCore
        SELECT [NewLinkID], 
               [NewCountyDetailID], 
			   CountryRegionID, 
			   CountrySubRegionID,
               
               ProvinceStateID, 
			   [Source],
			   EffectiveStartDate, 
               EffectiveEndDate,
			   [HashValue]
               --RegionName, 
                --DivisionName, 
          FROM #add;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        PRINT 'error'; -- log error to error log
        ROLLBACK TRANSACTION;
        SET @itemCount = -1;
    END CATCH;
        RETURN(@itemCount);
 --end of procecedure


GO
/****** Object:  StoredProcedure [Message].[upItemProvinceStateDetail]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Message].[upItemProvinceStateDetail] @message NVARCHAR(MAX)
AS

    --for testing
    --EXEC Message.upItemProvinceStateDetail @m
	--removed ProvisionID from Link.ProvisionStateDetailtoCoreProvisionState 2020-04-30
    BEGIN TRY
        BEGIN TRANSACTION;
        DECLARE @nextID INT, @itemCount INT, @startEffectiveDate DATETIME2, @maxID INT, @counter INT, @maxLinkID INT, @nextLinkID INT;
        IF OBJECT_ID('tempdb.dbo.#inbound') IS NOT NULL
            DROP TABLE #inBound;
        IF OBJECT_ID('tempdb.dbo.#add') IS NOT NULL
            DROP TABLE #add;
        IF OBJECT_ID('tempdb.dbo.#error') IS NOT NULL
            DROP TABLE #error;

        --create table #JSONMessage (BulkColumn nvarchar(max))
        CREATE TABLE #error
        ([ID]                 [INT] NOT NULL, 
         [ErrorMessage]       NVARCHAR(MAX) NULL, 
         [EffectiveStartDate] [DATETIME2](7) NULL
        );
        CREATE TABLE #inBound
        (ID                  [INT] NOT NULL, 
         [MonitorDate]       [DATETIME2] NOT NULL, 
         [StateAbbreviation] [NVARCHAR](2) NOT NULL, 
         [PositiveToDate]    [INT] NOT NULL, 
         [NegativeToDate]    [INT] NOT NULL, 
         [DeathCountToDate]  [INT] NOT NULL, 
         [PopulationYear]    SMALLINT NOT NULL, 
         [Population]        BIGINT NOT NULL, 
         [PopulationDensity] INT NOT NULL, 
         [LandArea]          DECIMAL(10, 2) NOT NULL, 
         [StateName]         NVARCHAR(48) NULL, 
         CountryRegion       [NVARCHAR](64) NULL, 
         CountrySubRegion    [NVARCHAR](64) NULL, 
         EffectiveStartDate  DATETIME2 NOT NULL, 
         EffectiveEndDate    DATETIME2 NOT NULL, 
         [Hash]              [NVARCHAR](40) NULL, 
         [Source]            [NVARCHAR](108) NOT NULL
        );
        CREATE TABLE #add
        (ID                         [INT] NOT NULL, 
         ProvinceStateID            [INT] NULL, 
         [MonitorDate]              DATETIME2 NOT NULL, 
         [StateAbbreviation]        [NVARCHAR](2) NOT NULL, 
         [PositiveToDate]           [INT] NOT NULL, 
         [NegativeToDate]           [INT] NOT NULL, 
         [DeathCountToDate]         [INT] NOT NULL, 
         [PopulationYear]           SMALLINT NOT NULL, 
         [Population]               BIGINT NOT NULL, 
         [PopulationDensity]        INT NOT NULL, 
         [LandArea]                 DECIMAL(10, 2) NOT NULL, 
         [StateName]                NVARCHAR(48) NULL, 
         CountryRegion              [NVARCHAR](64) NULL, 
         CountrySubRegion           [NVARCHAR](64) NULL, 
         CountryRegionID            [INT] NULL, 
         CountrySubRegionID         [INT] NULL, 
         EffectiveStartDate         DATETIME2 NOT NULL, 
         EffectiveEndDate           DATETIME2 NOT NULL, 
         [HashValue]                VARBINARY(32) NOT NULL, 
         [Source]                   [NVARCHAR](108) NOT NULL, 
         [NewProvinceStateDetailID] INT, 
         [NewLinkID]                INT
        );

        --insert json	
        INSERT INTO #inBound
        (ID, 
         [MonitorDate], --[Date]
         [StateAbbreviation], 
         [PositiveToDate], 
         [NegativeToDate], 
         [DeathCountToDate], 
         [PopulationYear], 
         [Population], 
         [PopulationDensity], 
         [LandArea], 
         [StateName], 
         CountryRegion, 
         CountrySubRegion, 
         EffectiveStartDate, 
         EffectiveEndDate, --'9999/01/01'
         [Hash], --[Hash]
         [Source]
        )
               SELECT ROW_NUMBER() OVER(
                      ORDER BY [date]), 
                      [Date], 
                      [State], 
                      [PositiveToDate], 
                      [NegativeToDate], 
                      [DeathCountToDate], 
                      [PopulationYear], 
                      [Population], 
                      [PopulationDensity], 
                      [LandArea], 
                      [StateName], 
                      CountryRegion, 
                      CountrySubRegion, 
                      GETDATE(), 
                      '9999/01/01', 
                      [Hash], 
                      [Source]
               FROM OPENJSON(@message) WITH([Date] DATETIME2 '$.Date', [State] NVARCHAR(2) '$.State', 
			   [PositiveToDate] INT '$.Positive', [NegativeToDate] INT '$.Negative', [DeathCountToDate] INT '$.Death', 
			   [PopulationYear] SMALLINT '$.PopulationYear', [Population] BIGINT '$.Population', 
			   [PopulationDensity] INT '$.PopulationDensity', [LandArea] DECIMAL(10, 2) '$.LandArea', 
			   [StateName] NVARCHAR(48) '$.StateName', [CountryRegion] NVARCHAR(64) '$.CountryRegion', 
			   [CountrySubRegion] NVARCHAR(64) '$.CountrySubRegion', 
			   [Hash] VARCHAR(40) '$.Hash', [Source] NVARCHAR(108) '$.Source');
        INSERT INTO #add
               SELECT ROW_NUMBER() OVER(
                      ORDER BY a.MonitorDate), 
                      b.[ProvinceStateID], 
                      a.[MonitorDate], 
                      a.[StateAbbreviation], 
                      a.[PositiveToDate], 
                      a.[NegativeToDate], 
                      a.[DeathCountToDate], 
                      a.[PopulationYear], 
                      a.[Population], 
                      a.[PopulationDensity], 
                      a.[LandArea], 
                      a.[StateName], 
                      a.CountryRegion, 
                      a.CountrySubRegion, 
                      c.CountryRegionID, 
                      d.CountrySubRegionID, 
                      a.EffectiveStartDate, 
                      a.EffectiveEndDate, 
                      HASHBYTES('SHA2_256', a.[Hash]), -- converts vendor has to varbinary version
                      a.[Source], 
                      0, 
                      0
               FROM #inBound AS a
                    INNER JOIN Core.ProvinceState AS b ON a.StateName = b.SourceReferenceKey
                    INNER JOIN Core.CountryRegion AS c ON a.CountryRegion = c.SourceReferenceKey
                    INNER JOIN Core.CountrySubRegion AS d ON a.CountrySubRegion = d.SourceReferenceKey
                    LEFT OUTER JOIN ITEM.ProvinceStateDetail AS e ON a.MonitorDate = e.MonitorDate 
					AND e.StateAbbreviation = a.StateAbbreviation
               WHERE e.MonitorDate IS NULL and e.StateAbbreviation is NULL ;  --makes sure rows for monitordate and dont exist 

        SET @itemCount = @@ROWCOUNT;
        --assign ID 
        SELECT @maxID = 0, 
               @maxLinkID = 0;
        SELECT @maxID = MAX(ProvinceStateDetailID)
        FROM Item.ProvinceStateDetail;

        --table is empty
        IF @maxID IS NULL
            SELECT @maxID = 0, 
                   @nextID = 1;
            ELSE  --table not empty calculate next ID
            SET @nextID = @maxID + 1;
        SELECT @maxLinkID = MAX(ProvinceStateDetailLinkID)
        FROM Link.ProvinceStateDetailToProvinceStateCore;

        --table is empty
        IF @maxLinkID IS NULL
            SELECT @maxLinkID = 0, 
                   @nextLinkID = 1;
            ELSE  --table not empty calculate next ID
            SET @nextLinkID = @maxLinkID + 1;
        SELECT @counter = 1;

        --assign ID
        WHILE(@counter <= @itemCount)
            BEGIN
                UPDATE #add
                  SET 
                      [NewProvinceStateDetailID] = @nextID, 
                      [NewLinkID] = @nextLinkID
                WHERE ID = @counter;
                SELECT @counter = @counter + 1, 
                       @nextID = @nextID + 1, 
                       @nextLinkID = @nextLinkID + 1;
            END;

        --insert #add to Item 
        INSERT INTO Item.ProvinceStateDetail
               SELECT a.[NewProvinceStateDetailID], 
                      a.[ProvinceStateID], 
                      a.[MonitorDate], 
                      a.[StateAbbreviation], 
                      a.[PositiveToDate], 
                      a.[NegativeToDate], 
                      a.[DeathCountToDate], 
                      a.[PopulationYear], 
                      a.[Population], --[POPESTIMATE2019]    
                      a.[PopulationDensity], --[BIRTHS2019] 
                      a.[LandArea], 
                      a.[HashValue], --[Hash]
                      a.EffectiveStartDate, 
                      a.EffectiveEndDate, 
                      a.[Source]
               FROM #add AS a;
        --#add link insert here

        INSERT INTO Link.ProvinceStateDetailToProvinceStateCore
               SELECT [NewLinkID], 
                      [NewProvinceStateDetailID], 
                      
                      CountryRegionID, 
                      CountrySubRegionID, 
                      [Source], 
                      EffectiveStartDate, 
                      EffectiveEndDate, 
                      [HashValue]
               --CountryRegion, 
               --CountrySubRegion 
               FROM #add;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        PRINT 'error'; -- log error to error log
        ROLLBACK TRANSACTION;
        SET @itemCount = -1;
    END CATCH;
        RETURN(@itemCount);
GO
/****** Object:  StoredProcedure [Utility].[upGenerateDataVaultForeignKey]    Script Date: 5/19/2020 1:45:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [Utility].[upGenerateDataVaultForeignKey] 
as

DECLARE @nextID INT, @itemCount INT, @startEffectiveDate DATETIME2, @maxID INT, @counter INT, @maxLinkID INT, @nextLinkID INT;

IF OBJECT_ID('tempdb.dbo.#inBound') IS NOT NULL
    DROP TABLE #inBound;
IF OBJECT_ID('tempdb.dbo.#add') IS NOT NULL
    DROP TABLE #add;

SELECT ROW_NUMBER() OVER(
       ORDER BY b.[COLUMN_NAME]) AS ID, 
       b.TABLE_SCHEMA as [Schema], 
       a.TABLE_NAME as [Table], 
       b.COLUMN_NAME as [ForeignKeyColumn], 
       [NewID] = 0
INTO #inBound
FROM INFORMATION_SCHEMA.TABLES AS a
     INNER JOIN information_schema.COLUMNS AS b ON a.TABLE_NAME = b.TABLE_NAME
WHERE b.TABLE_SCHEMA IN('Link', 'ITEM')
     AND RIGHT(b.COLUMN_NAME, 2) = 'ID'
     AND b.ORDINAL_POSITION > 1; 

SELECT *
INTO #add
FROM #inbound;
SET @itemCount = @@ROWCOUNT;

--assign ID 
SELECT @maxID = 0, 
       @maxLinkID = 0;
SELECT @maxID = COUNT(name)
FROM sys.foreign_keys;

--table is empty
IF @maxID IS NULL
    SELECT @maxID = 0, 
           @nextID = 1;
    ELSE  --table not empty calculate next ID
    SET @nextID = @maxID + 1;
SELECT @counter = 1;

--assign ID
WHILE(@counter <= @itemCount)
    BEGIN
        UPDATE #add
          SET 
              [NewID] = @nextID
        WHERE ID = @counter;
        SELECT @counter = @counter + 1, 
               @nextID = @nextID + 1;
    END;
ALTER TABLE #add
ADD ConstraintName NVARCHAR(64);
ALTER TABLE #add
ADD ReferenceTableColumn NVARCHAR(128);
UPDATE #add
  SET 
      ConstraintName = ForeignKeyColumn + STUFF('000', 3, 1, CAST(NewID AS NVARCHAR(4)))
FROM #add
WHERE LEN(NewID) = 1;
UPDATE #add
  SET 
      ConstraintName = ForeignKeyColumn + STUFF('000', 2, 2, CAST(NewID AS NVARCHAR(4)))
FROM #add
WHERE LEN(NewID) > 1;
UPDATE #add
  SET 
      ReferenceTableColumn = 'Core.' + SUBSTRING(ForeignKeyColumn, 1, LEN(ForeignKeyColumn) - 2) + '(' + ForeignKeyColumn + ')';

UPDATE #add
  SET 
      ReferenceTableColumn = 'Item.' + SUBSTRING(ForeignKeyColumn, 1, LEN(ForeignKeyColumn) - 2) + '(' + ForeignKeyColumn + ')' WHERE ForeignKeyColumn like '%Detail%';

SELECT *
FROM #add;
GO
USE [master]
GO
ALTER DATABASE [Covid19DataVaultForAzure] SET  READ_WRITE 
GO
