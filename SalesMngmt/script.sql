USE [master]
GO
/****** Object:  Database [SaleManager]    Script Date: 21-03-21 3:39:27 PM ******/
CREATE DATABASE [SaleManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaleManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SaleManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SaleManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SaleManager_log.ldf' , SIZE = 6912KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SaleManager] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaleManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaleManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaleManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaleManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaleManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaleManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaleManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SaleManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaleManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaleManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaleManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaleManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaleManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaleManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaleManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaleManager] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SaleManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaleManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaleManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaleManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaleManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaleManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaleManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaleManager] SET RECOVERY FULL 
GO
ALTER DATABASE [SaleManager] SET  MULTI_USER 
GO
ALTER DATABASE [SaleManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaleManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaleManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaleManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SaleManager] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SaleManager', N'ON'
GO
USE [SaleManager]
GO
/****** Object:  Table [dbo].[Adj_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adj_D](
	[RID] [int] NULL,
	[IID] [int] NULL,
	[BNID] [nvarchar](255) NULL,
	[ExpDT] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[Qty2] [float] NULL,
	[PurPrice] [float] NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[SRT] [float] NULL,
	[RCancel] [float] NULL,
	[Adj_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Adj_D] PRIMARY KEY CLUSTERED 
(
	[Adj_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Adj_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adj_M](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[CompID] [int] NULL,
	[EDate] [datetime] NULL,
	[AC_Code] [int] NULL,
	[WID] [int] NULL,
	[RefNo] [nvarchar](255) NULL,
	[Rem] [nvarchar](255) NULL,
	[Posted] [float] NULL,
	[APost] [float] NULL,
	[RCancel] [float] NULL,
	[Create_User_ID] [float] NULL,
	[Create_Date] [datetime] NULL,
	[Edit_User_ID] [float] NULL,
	[Edit_Date] [datetime] NULL,
	[Del_User_ID] [nvarchar](255) NULL,
	[Del_Date] [nvarchar](255) NULL,
 CONSTRAINT [PK_Adj_M] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleTypeID] [int] NULL,
	[StyleID] [int] NULL,
	[BrandID] [int] NULL,
	[ProductName] [nvarchar](500) NULL,
	[ProductImage] [nvarchar](500) NULL,
	[ArticleNo] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[IsDelete] [bit] NULL,
	[BranchID] [int] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifyBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArticleTypes]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleTypes](
	[ArticleTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleTypeName] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ArticleTypes] PRIMARY KEY CLUSTERED 
(
	[ArticleTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COA_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COA_D](
	[CAC_Code] [int] NULL,
	[PType_ID] [int] NULL,
	[ZID] [int] NULL,
	[AC_Code] [int] NOT NULL,
	[AC_Title] [nvarchar](255) NULL,
	[DR] [float] NULL,
	[CR] [float] NULL,
	[Qty] [float] NULL,
	[InActive] [bit] NULL,
 CONSTRAINT [PK_COA_D$] PRIMARY KEY CLUSTERED 
(
	[AC_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COA_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COA_M](
	[MAC_Code] [float] NULL,
	[MTitle] [nvarchar](255) NULL,
	[SubAC_Code] [float] NULL,
	[SubTitle] [nvarchar](255) NULL,
	[CAC_Code] [int] NOT NULL,
	[CATitle] [nvarchar](255) NULL,
 CONSTRAINT [PK_COA_M] PRIMARY KEY CLUSTERED 
(
	[CAC_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Colors]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ShortName] [varchar](50) NULL,
	[BranchID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IID] [int] NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[AC_Code] [int] NOT NULL,
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[CusName] [nvarchar](255) NULL,
	[PType_ID] [int] NULL,
	[Add] [nvarchar](255) NULL,
	[NTN_No] [nvarchar](255) NULL,
	[ContactPerson] [nvarchar](255) NULL,
	[Owner_Name] [nvarchar](255) NULL,
	[Cell] [nvarchar](255) NULL,
	[Eml] [nvarchar](255) NULL,
	[Tel] [nvarchar](255) NULL,
	[SID] [int] NULL,
	[ZID] [int] NULL,
	[AddPer] [nvarchar](255) NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[Black_List] [bit] NULL,
	[War_Cls] [nvarchar](255) NULL,
	[War_DT] [nvarchar](255) NULL,
	[Prn] [nvarchar](255) NULL,
	[InActive] [bit] NULL,
	[Land] [varchar](255) NULL,
	[City] [int] NULL,
	[Village] [int] NULL,
	[CompanyID] [int] NULL,
	[CollectPerMonth] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Customers$] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EV_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EV_D](
	[RID] [int] NULL,
	[Narr] [nvarchar](255) NULL,
	[MOP_ID] [nvarchar](255) NULL,
	[AC_Code] [nvarchar](255) NULL,
	[InvNo] [nvarchar](255) NULL,
	[ChkNo] [nvarchar](255) NULL,
	[SlipNo] [nvarchar](255) NULL,
	[Amt] [nvarchar](255) NULL,
	[SRT] [nvarchar](255) NULL,
	[RCancel] [nvarchar](255) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_EV_D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EV_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EV_M](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[CompID] [float] NULL,
	[EDate] [datetime] NULL,
	[AC_Code] [float] NULL,
	[SID] [float] NULL,
	[AC_Code2] [nvarchar](255) NULL,
	[AC_Code3] [nvarchar](255) NULL,
	[Amt] [nvarchar](255) NULL,
	[Rem] [nvarchar](255) NULL,
	[Posted] [float] NULL,
	[APost] [float] NULL,
	[RCancel] [float] NULL,
	[Create_User_ID] [nvarchar](255) NULL,
	[Create_Date] [nvarchar](255) NULL,
	[Edit_User_ID] [nvarchar](255) NULL,
	[Edit_Date] [nvarchar](255) NULL,
	[Del_User_ID] [nvarchar](255) NULL,
	[Del_Date] [nvarchar](255) NULL,
 CONSTRAINT [PK_EV_M] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Firm$]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firm$](
	[Firm_ID] [float] NULL,
	[FirmNM] [nvarchar](255) NULL,
	[Org_Short] [nvarchar](255) NULL,
	[Addr] [nvarchar](255) NULL,
	[Tel] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[UAN] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[URL] [nvarchar](255) NULL,
	[NTN] [nvarchar](255) NULL,
	[SoftwarePath] [nvarchar](255) NULL,
	[BackupPath] [nvarchar](255) NULL,
	[LogoPath] [nvarchar](255) NULL,
	[ImagesPath] [nvarchar](255) NULL,
	[BCK_Login] [float] NULL,
	[BCK_Eml] [float] NULL,
	[BCK_Eml_AC] [nvarchar](255) NULL,
	[OP_Date] [nvarchar](255) NULL,
	[Comp_OP] [float] NULL,
	[Party_OPBal] [float] NULL,
	[Pre_Pur_His] [float] NULL,
	[Stk_Pur_Ent] [float] NULL,
	[Pre_Sal_His] [float] NULL,
	[Stk_Sal_Ent] [float] NULL,
	[Lock_less_Stk_Sa] [float] NULL,
	[ICP] [float] NULL,
	[AC_Code] [float] NULL,
	[AC_Code2] [nvarchar](255) NULL,
	[AC_Code3] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GL]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GL](
	[SRT] [int] NULL,
	[RID] [int] NULL,
	[RID2] [int] NULL,
	[TypeCode] [int] NULL,
	[GLDate] [date] NULL,
	[DueDT] [date] NULL,
	[CompID] [int] NULL,
	[SID] [int] NULL,
	[AC_Code] [int] NULL,
	[AC_Code2] [int] NULL,
	[Narration] [nvarchar](255) NULL,
	[Rem] [nvarchar](255) NULL,
	[MOP_ID] [int] NULL,
	[ChkNo] [int] NULL,
	[SlipNo] [int] NULL,
	[Qty_IN] [float] NULL,
	[Qty_Out] [float] NULL,
	[IPrice] [float] NULL,
	[PAmt] [float] NULL,
	[DisP] [float] NULL,
	[DisAmt] [float] NULL,
	[DisRs] [float] NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[VehNo] [nvarchar](255) NULL,
	[Post_User_ID] [int] NULL,
	[Post_Date] [date] NULL,
	[GL_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_GL] PRIMARY KEY CLUSTERED 
(
	[GL_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[I_Unit]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[I_Unit](
	[unit_id] [int] IDENTITY(1,1) NOT NULL,
	[IUnit] [varchar](50) NULL,
	[active] [bit] NULL,
	[crtBy] [varchar](50) NULL,
	[crtDate] [datetime] NULL,
	[modBy] [varchar](50) NULL,
	[modDate] [varchar](50) NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IComp_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IComp_M](
	[CompID] [int] IDENTITY(1,1) NOT NULL,
	[Comp] [nvarchar](255) NULL,
	[CShort] [nvarchar](255) NULL,
	[Address] [varchar](50) NULL,
	[Tel] [varchar](50) NULL,
	[Eml] [varchar](50) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_IComp_M] PRIMARY KEY CLUSTERED 
(
	[CompID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item_Maker]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item_Maker](
	[MakerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](max) NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MakerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Itemledger]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itemledger](
	[SRT] [int] NULL,
	[TypeCode] [int] NULL,
	[RID] [int] NULL,
	[EDate] [datetime2](7) NULL,
	[AC_CODE] [int] NULL,
	[WID] [int] NULL,
	[SID] [int] NULL,
	[IID] [int] NULL,
	[BNID] [int] NULL,
	[ExpDT] [datetime2](7) NULL,
	[CTN] [float] NULL,
	[PCS] [float] NULL,
	[OPN] [float] NULL,
	[PJ] [float] NULL,
	[PRJ] [float] NULL,
	[SJ] [float] NULL,
	[SRJ] [float] NULL,
	[SCH_IN] [float] NULL,
	[SCH_Out] [float] NULL,
	[SCH_Out2] [float] NULL,
	[ADJ_IN] [float] NULL,
	[ADJ_OUT] [float] NULL,
	[TR_IN] [float] NULL,
	[TR_OUT] [float] NULL,
	[MFG_IN] [float] NULL,
	[MFG_OUT] [float] NULL,
	[PurPrice] [float] NULL,
	[SalesPriceP] [float] NULL,
	[AddPer] [float] NULL,
	[AddAmt] [float] NULL,
	[SalesPrice] [float] NULL,
	[PAmt] [float] NULL,
	[DisP] [float] NULL,
	[DisAmt] [float] NULL,
	[DisRs] [float] NULL,
	[Amt] [float] NULL,
	[Amt2] [float] NULL,
	[RCancel] [float] NULL,
	[LegderId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Itemledger_1] PRIMARY KEY CLUSTERED 
(
	[LegderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[IID] [int] IDENTITY(1,1) NOT NULL,
	[IName] [nvarchar](255) NULL,
	[Desc] [nvarchar](255) NULL,
	[Unit_ID] [int] NULL,
	[Inv_YN] [bit] NULL,
	[CompID] [int] NULL,
	[BarCode_ID] [nvarchar](255) NULL,
	[SCatID] [int] NULL,
	[CTN_PCK] [float] NULL,
	[PurPrice] [float] NULL,
	[SalesPrice] [float] NULL,
	[RetailPrice] [float] NULL,
	[ICP] [int] NULL,
	[OP_Qty] [float] NULL,
	[OP_Price] [float] NULL,
	[DisContinue] [float] NULL,
	[AC_Code_Inv] [int] NULL,
	[AC_Code_Inc] [int] NULL,
	[AC_Code_Cost] [int] NULL,
	[isDeleted] [bit] NULL,
	[CompanyID] [int] NULL,
	[saleTax] [int] NULL,
	[Color] [int] NULL,
	[Size] [int] NULL,
	[ArticleNoID] [int] NULL,
	[BarcodeNo] [varchar](50) NULL,
	[DisP] [decimal](20, 2) NULL,
	[DisR] [decimal](20, 2) NULL,
	[AveragePrice] [float] NULL,
	[Demand] [float] NULL,
	[ArticleTypeId] [int] NULL,
	[Style] [int] NULL,
 CONSTRAINT [PK_Items$] PRIMARY KEY CLUSTERED 
(
	[IID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items_Cat]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items_Cat](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[Cat] [nvarchar](255) SPARSE  NULL,
	[isDeleted] [bit] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Items_Cat$] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items_SCat$]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items_SCat$](
	[SCatID] [float] NULL,
	[SCat] [nvarchar](255) NULL,
	[CatID] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IUnit]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IUnit](
	[unit_id] [int] IDENTITY(1,1) NOT NULL,
	[IUnit] [varchar](50) NULL,
	[active] [bit] NULL,
	[crtBy] [varchar](50) NULL,
	[crtDate] [datetime] NULL,
	[modBy] [varchar](50) NULL,
	[modDate] [varchar](50) NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_IUnit] PRIMARY KEY CLUSTERED 
(
	[unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JV_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JV_D](
	[RID] [nvarchar](255) NULL,
	[Narr] [nvarchar](255) NULL,
	[MOP_ID] [nvarchar](255) NULL,
	[AC_Code] [nvarchar](255) NULL,
	[AC_Code2] [nvarchar](255) NULL,
	[InvNo] [nvarchar](255) NULL,
	[ChkNo] [nvarchar](255) NULL,
	[SlipNo] [nvarchar](255) NULL,
	[Amt] [nvarchar](255) NULL,
	[SRT] [nvarchar](255) NULL,
	[RCancel] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JV_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JV_M](
	[RID] [float] NULL,
	[CompID] [float] NULL,
	[EDate] [datetime] NULL,
	[SID] [float] NULL,
	[Rem] [nvarchar](255) NULL,
	[APost] [float] NULL,
	[Posted] [float] NULL,
	[RCancel] [float] NULL,
	[Create_User_ID] [nvarchar](255) NULL,
	[Create_Date] [nvarchar](255) NULL,
	[Edit_User_ID] [nvarchar](255) NULL,
	[Edit_Date] [nvarchar](255) NULL,
	[Del_User_ID] [nvarchar](255) NULL,
	[Del_Date] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mon]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mon](
	[MID] [float] NULL,
	[Mon] [nvarchar](255) NULL,
	[Visible_Flag] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Party_Type]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Party_Type](
	[PType_ID] [int] IDENTITY(1,1) NOT NULL,
	[Party_Type] [nvarchar](255) NULL,
	[isDeleted] [bit] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Party_Type] PRIMARY KEY CLUSTERED 
(
	[PType_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PO_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO_D](
	[RID] [nvarchar](255) NULL,
	[IID] [nvarchar](255) NULL,
	[CTN] [nvarchar](255) NULL,
	[PCS] [nvarchar](255) NULL,
	[SCH] [nvarchar](255) NULL,
	[Qty] [nvarchar](255) NULL,
	[PurPrice] [nvarchar](255) NULL,
	[PAmt] [nvarchar](255) NULL,
	[DisP] [nvarchar](255) NULL,
	[DisAmt] [nvarchar](255) NULL,
	[DisRs] [nvarchar](255) NULL,
	[Amt] [nvarchar](255) NULL,
	[SRT] [nvarchar](255) NULL,
	[RCancel] [nvarchar](255) NULL,
	[Pur_D_ID] [int] IDENTITY(1,1) NOT NULL,
	[UnitId] [int] NULL,
 CONSTRAINT [PK_PO_D] PRIMARY KEY CLUSTERED 
(
	[Pur_D_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PO_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO_M](
	[RID] [nvarchar](255) NULL,
	[CompID] [nvarchar](255) NULL,
	[EDate] [nvarchar](255) NULL,
	[AC_Code] [nvarchar](255) NULL,
	[APost] [nvarchar](255) NULL,
	[RefNo] [nvarchar](255) NULL,
	[Rem] [nvarchar](255) NULL,
	[Posted] [nvarchar](255) NULL,
	[RCancel] [nvarchar](255) NULL,
	[Create_User_ID] [nvarchar](255) NULL,
	[Create_Date] [nvarchar](255) NULL,
	[Edit_User_ID] [nvarchar](255) NULL,
	[Edit_Date] [nvarchar](255) NULL,
	[Del_User_ID] [nvarchar](255) NULL,
	[Del_Date] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pur_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pur_D](
	[RID] [float] NULL,
	[IID] [float] NULL,
	[BNID] [float] NULL,
	[ExpDT] [datetime] NULL,
	[CTN] [float] NULL,
	[PCS] [float] NULL,
	[SCH] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[PurPrice] [float] NULL,
	[PAmt] [float] NULL,
	[DisP] [float] NULL,
	[DisAmt] [float] NULL,
	[DisRs] [float] NULL,
	[Amt] [float] NULL,
	[SRT] [float] NULL,
	[RCancel] [float] NULL,
	[Pur_D_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pur_D_UnitID] [int] NULL,
	[SAmt] [float] NULL,
	[SRate] [float] NULL,
 CONSTRAINT [PK_Pur_D] PRIMARY KEY CLUSTERED 
(
	[Pur_D_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pur_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pur_M](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[CompID] [float] NULL,
	[EDate] [datetime] NULL,
	[AC_Code] [float] NULL,
	[RID2] [nvarchar](255) NULL,
	[InvNo] [nvarchar](255) NULL,
	[InvDT] [nvarchar](255) NULL,
	[BiltyNo] [nvarchar](255) NULL,
	[SID] [float] NULL,
	[WID] [float] NULL,
	[Rem] [nvarchar](255) NULL,
	[DisAmt] [nvarchar](255) NULL,
	[Cartage] [nvarchar](255) NULL,
	[NetAmt] [float] NULL,
	[APost] [float] NULL,
	[Posted] [float] NULL,
	[RCancel] [float] NULL,
	[Create_User_ID] [float] NULL,
	[Create_Date] [datetime] NULL,
	[Edit_User_ID] [float] NULL,
	[Edit_Date] [datetime] NULL,
	[Del_User_ID] [nvarchar](255) NULL,
	[Del_Date] [nvarchar](255) NULL,
	[VehicalNo] [varchar](255) NULL,
	[VendorId] [int] NULL,
	[CityId] [int] NULL,
	[Rent] [float] NULL,
	[pashgi] [float] NULL,
	[Bharai_chahti_chunai_khata_kharcha] [float] NULL,
	[OfficeKhata] [float] NULL,
	[Karamat_amat_khata] [float] NULL,
	[gari_Office_kharcha] [float] NULL,
	[TotalAmount] [float] NULL,
	[VenInvNo] [nvarchar](20) NULL,
	[VenInvDate] [nvarchar](20) NULL,
	[InvType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Pur_M] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurR_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurR_D](
	[RID] [float] NULL,
	[IID] [float] NULL,
	[BNID] [float] NULL,
	[ExpDT] [datetime] NULL,
	[CTN] [float] NULL,
	[PCS] [float] NULL,
	[SCH] [float] NULL,
	[Qty1] [float] NULL,
	[Qty] [float] NULL,
	[PurPrice] [float] NULL,
	[PAmt] [float] NULL,
	[DisP] [float] NULL,
	[DisAmt] [float] NULL,
	[DisRs] [float] NULL,
	[Amt] [float] NULL,
	[SRT] [float] NULL,
	[RCancel] [float] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_PurR_D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurR_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurR_M](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[CompID] [float] NULL,
	[EDate] [datetime] NULL,
	[AC_Code] [float] NULL,
	[RID2] [nvarchar](255) NULL,
	[InvDT] [nvarchar](255) NULL,
	[BiltyNo] [nvarchar](255) NULL,
	[SID] [float] NULL,
	[WID] [float] NULL,
	[NetAmt] [float] NULL,
	[Rem] [nvarchar](255) NULL,
	[APost] [float] NULL,
	[Posted] [float] NULL,
	[RCancel] [float] NULL,
	[Create_User_ID] [float] NULL,
	[Create_Date] [datetime] NULL,
	[Edit_User_ID] [float] NULL,
	[Edit_Date] [datetime] NULL,
	[Del_User_ID] [nvarchar](255) NULL,
	[Del_Date] [nvarchar](255) NULL,
	[invRNo] [nvarchar](50) NULL,
	[invNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_PurR_M] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PV_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PV_D](
	[RID] [int] NULL,
	[Narr] [nvarchar](255) NULL,
	[MOP_ID] [int] NULL,
	[AC_Code] [int] NULL,
	[InvNo] [nvarchar](255) NULL,
	[ChkNo] [nvarchar](255) NULL,
	[SlipNo] [nvarchar](255) NULL,
	[PreAmt] [float] NULL,
	[Amt] [float] NULL,
	[DisAmt] [float] NULL,
	[BalAmt] [float] NULL,
	[SRT] [float] NULL,
	[RCancel] [float] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[checkDate] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_PV_D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PV_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PV_M](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[CompID] [int] NULL,
	[EDate] [datetime] NULL,
	[AC_Code] [int] NULL,
	[SID] [int] NULL,
	[Rem] [nvarchar](255) NULL,
	[APost] [int] NULL,
	[Posted] [int] NULL,
	[RCancel] [int] NULL,
	[Create_User_ID] [int] NULL,
	[Create_Date] [datetime] NULL,
	[Edit_User_ID] [int] NULL,
	[Edit_Date] [datetime] NULL,
	[Del_User_ID] [int] NULL,
	[Del_Date] [datetime] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_PV_M] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RP]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RP](
	[Defination] [nvarchar](255) NULL,
	[TypeCode] [float] NULL,
	[TypeCode2] [float] NULL,
	[TypeCode3] [nvarchar](255) NULL,
	[Symbol] [nvarchar](255) NULL,
	[TBL] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RV_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RV_D](
	[RID] [int] NULL,
	[Narr] [nvarchar](255) NULL,
	[MOP_ID] [int] NULL,
	[AC_Code] [varchar](255) NULL,
	[InvNo] [int] NULL,
	[ChkNo] [int] NULL,
	[SlipNo] [int] NULL,
	[PreAmt] [float] NULL,
	[Amt] [float] NULL,
	[DisAmt] [float] NULL,
	[BalAmt] [float] NULL,
	[SRT] [float] NULL,
	[RCancel] [float] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[checkDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_RV_D] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RV_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RV_M](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[CompID] [int] NULL,
	[EDate] [datetime] NULL,
	[AC_Code] [varchar](255) NULL,
	[SID] [int] NULL,
	[Rem] [nvarchar](255) NULL,
	[APost] [int] NULL,
	[Posted] [int] NULL,
	[RCancel] [int] NULL,
	[Create_User_ID] [int] NULL,
	[Create_Date] [datetime] NULL,
	[Edit_User_ID] [int] NULL,
	[Edit_Date] [datetime] NULL,
	[Del_User_ID] [int] NULL,
	[Del_Date] [int] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_RV_M] PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sale_Pur_D_Pur]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_Pur_D_Pur](
	[Pur_ID] [int] IDENTITY(1,1) NOT NULL,
	[RID] [int] NULL,
	[VendorID] [int] NULL,
	[ItemID] [int] NULL,
	[UnitID] [int] NULL,
	[Quantity] [int] NULL,
	[Pur_Price] [decimal](18, 2) NULL,
	[Pur_Total] [decimal](18, 2) NULL,
	[Comm] [decimal](18, 0) NULL,
	[CvenID] [int] NULL,
	[Total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Sale_Pur_D_Pur] PRIMARY KEY CLUSTERED 
(
	[Pur_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sale_Pur_D_Sale]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_Pur_D_Sale](
	[Sale_ID] [int] IDENTITY(1,1) NOT NULL,
	[RID] [int] NULL,
	[CityID] [int] NULL,
	[VillageID] [int] NULL,
	[VendorID] [int] NULL,
	[PukhtaBikri] [decimal](18, 2) NULL,
	[LongerTadat] [int] NULL,
	[KhamBikri] [decimal](18, 0) NULL,
	[Phaliyan] [decimal](18, 0) NULL,
	[CustomerExpense] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Sale_Pur_D_Sale] PRIMARY KEY CLUSTERED 
(
	[Sale_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sale_Pur_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_Pur_M](
	[RId] [int] IDENTITY(1,1) NOT NULL,
	[VehicalNo] [nvarchar](max) NULL,
	[Date] [datetime2](7) NULL,
	[Rent] [decimal](18, 2) NULL,
	[pashgi] [decimal](18, 2) NULL,
	[bharai_chatai_kata_kharacha] [decimal](18, 2) NULL,
	[Office_khata] [decimal](18, 2) NULL,
	[CarAmad_AmadKharcha] [decimal](18, 2) NULL,
	[gari_OfficeKharcha] [decimal](18, 2) NULL,
	[Total_Purchase] [decimal](18, 2) NULL,
	[advanceBuilty] [decimal](18, 2) NULL,
	[OwnBuilty] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Sale_Pur_M] PRIMARY KEY CLUSTERED 
(
	[RId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_D](
	[SD_ID] [int] IDENTITY(1,1) NOT NULL,
	[RID] [float] NULL,
	[IID] [float] NULL,
	[BNID] [float] NULL,
	[ExpDT] [datetime] NULL,
	[CTN] [nvarchar](255) NULL,
	[PCS] [float] NULL,
	[SCH] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[PurPrice] [float] NULL,
	[SalesPriceP] [float] NULL,
	[AddPer] [nvarchar](255) NULL,
	[AddAmt] [nvarchar](255) NULL,
	[SalesPrice] [float] NULL,
	[PAmt] [float] NULL,
	[DisP] [nvarchar](255) NULL,
	[DisAmt] [nvarchar](255) NULL,
	[DisRs] [nvarchar](255) NULL,
	[Amt2] [float] NULL,
	[Amt] [float] NULL,
	[PCK_Det] [float] NULL,
	[SRT] [float] NULL,
	[RCancel] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[SD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales_M](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[CompID] [float] NULL,
	[RID2] [nvarchar](255) NULL,
	[EDate] [datetime] NULL,
	[CAC_Code] [nvarchar](255) NULL,
	[AC_Code] [float] NULL,
	[Ship_To] [nvarchar](255) NULL,
	[Ship_ID] [nvarchar](255) NULL,
	[Trans_ID] [nvarchar](255) NULL,
	[BiltyNo] [nvarchar](255) NULL,
	[SID] [float] NULL,
	[WID] [float] NULL,
	[Rem] [nvarchar](255) NULL,
	[NetAmt2] [float] NULL,
	[DisAmt] [nvarchar](255) NULL,
	[PreBal] [float] NULL,
	[NetAmt] [float] NULL,
	[AC_Code3] [nvarchar](255) NULL,
	[CashAmt] [nvarchar](255) NULL,
	[APost] [float] NULL,
	[Posted] [float] NULL,
	[RCancel] [float] NULL,
	[War_Cls] [float] NULL,
	[Create_User_ID] [float] NULL,
	[Create_Date] [datetime] NULL,
	[Edit_User_ID] [float] NULL,
	[Edit_Date] [datetime] NULL,
	[Del_User_ID] [nvarchar](255) NULL,
	[Del_Date] [nvarchar](255) NULL,
	[InvNo] [nvarchar](25) NULL,
	[InvDT] [datetime] NULL,
	[InvType] [varchar](10) NULL,
	[CstId] [int] NULL,
	[TotalAmount] [decimal](20, 2) NULL,
	[CstInvNo] [nvarchar](25) NULL,
	[VenInvDate] [nvarchar](25) NULL,
	[TransportExpense] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesOfficer$]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOfficer$](
	[SID] [float] NULL,
	[SalesOfficer] [nvarchar](255) NULL,
	[Tel] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesR_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesR_D](
	[RID] [float] NULL,
	[IID] [float] NULL,
	[BNID] [float] NULL,
	[ExpDT] [datetime] NULL,
	[CTN] [nvarchar](255) NULL,
	[PCS] [float] NULL,
	[SCH] [nvarchar](255) NULL,
	[Qty] [float] NULL,
	[PurPrice] [float] NULL,
	[SalesPriceP] [float] NULL,
	[AddPer] [nvarchar](255) NULL,
	[AddAmt] [nvarchar](255) NULL,
	[SalesPrice] [float] NULL,
	[PAmt] [float] NULL,
	[DisP] [nvarchar](255) NULL,
	[DisAmt] [nvarchar](255) NULL,
	[DisRs] [nvarchar](255) NULL,
	[Amt2] [float] NULL,
	[Amt] [float] NULL,
	[PCK_Det] [float] NULL,
	[SRT] [float] NULL,
	[RCancel] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesR_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesR_M](
	[RID] [float] NULL,
	[CompID] [float] NULL,
	[EDate] [datetime] NULL,
	[AC_Code] [float] NULL,
	[Ship_ID] [nvarchar](255) NULL,
	[Ship_To] [nvarchar](255) NULL,
	[RID2] [nvarchar](255) NULL,
	[Trans_ID] [nvarchar](255) NULL,
	[BiltyNo] [nvarchar](255) NULL,
	[SID] [float] NULL,
	[WID] [float] NULL,
	[Rem] [nvarchar](255) NULL,
	[NetAmt2] [float] NULL,
	[PreBal] [float] NULL,
	[DisAmt] [nvarchar](255) NULL,
	[NetAmt] [float] NULL,
	[AC_Code3] [nvarchar](255) NULL,
	[CashAmt] [nvarchar](255) NULL,
	[APost] [float] NULL,
	[Posted] [float] NULL,
	[RCancel] [float] NULL,
	[Create_User_ID] [float] NULL,
	[Create_Date] [datetime] NULL,
	[Edit_User_ID] [float] NULL,
	[Edit_Date] [datetime] NULL,
	[Del_User_ID] [nvarchar](255) NULL,
	[Del_Date] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NULL,
	[BranchID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[IID] [int] NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SO_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SO_D](
	[RID] [nvarchar](255) NULL,
	[IID] [nvarchar](255) NULL,
	[CTN] [nvarchar](255) NULL,
	[PCS] [nvarchar](255) NULL,
	[SCH] [nvarchar](255) NULL,
	[Qty] [nvarchar](255) NULL,
	[PurPrice] [nvarchar](255) NULL,
	[SalesPrice] [nvarchar](255) NULL,
	[PAmt] [nvarchar](255) NULL,
	[DisP] [nvarchar](255) NULL,
	[DisAmt] [nvarchar](255) NULL,
	[DisRs] [nvarchar](255) NULL,
	[Amt] [nvarchar](255) NULL,
	[Amt2] [nvarchar](255) NULL,
	[SRT] [nvarchar](255) NULL,
	[RCancel] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SO_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SO_M](
	[RID] [nvarchar](255) NULL,
	[CompID] [nvarchar](255) NULL,
	[EDate] [nvarchar](255) NULL,
	[AC_Code] [nvarchar](255) NULL,
	[RefNo] [nvarchar](255) NULL,
	[Rem] [nvarchar](255) NULL,
	[Posted] [nvarchar](255) NULL,
	[RCancel] [nvarchar](255) NULL,
	[Create_User_ID] [nvarchar](255) NULL,
	[Create_Date] [nvarchar](255) NULL,
	[Edit_User_ID] [nvarchar](255) NULL,
	[Edit_Date] [nvarchar](255) NULL,
	[Del_User_ID] [nvarchar](255) NULL,
	[Del_Date] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Styles]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Styles](
	[StyleID] [int] IDENTITY(1,1) NOT NULL,
	[StyleName] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Styles] PRIMARY KEY CLUSTERED 
(
	[StyleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[KOTID] [nvarchar](20) NOT NULL,
	[OrderNo] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[isComplete] [bit] NULL,
	[Discount] [decimal](20, 2) NULL,
	[Amount] [decimal](20, 2) NULL,
	[TblID] [int] NULL,
	[WaiterID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_city]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_city](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](255) NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_tbl_city] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Employee]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tbl_Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeName] [varchar](250) NULL,
	[PyteTypeID] [int] NULL,
	[isDeleted] [bit] NULL,
	[ACCode] [int] NULL,
	[companyID] [int] NULL,
 CONSTRAINT [PK_tbl_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_KOT]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_KOT](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KotNo] [nvarchar](20) NOT NULL,
	[OrderID] [nvarchar](20) NOT NULL,
	[iscomplete] [bit] NULL,
	[CatID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_OpeningCash]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OpeningCash](
	[EntryDate] [datetime] NULL,
	[Amount] [float] NULL,
	[BankAccount] [float] NULL,
	[CashOpeningId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbl_OpeningCash] PRIMARY KEY CLUSTERED 
(
	[CashOpeningId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[KOTID] [nvarchar](20) NOT NULL,
	[OrderNo] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[isComplete] [bit] NULL,
	[Discount] [decimal](20, 2) NULL,
	[Amount] [decimal](20, 2) NULL,
	[TblID] [int] NULL,
	[WaiterID] [int] NULL,
	[OrderType] [nvarchar](15) NULL,
	[GST] [decimal](20, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_OrderDetails]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[KOTID] [nvarchar](20) NULL,
	[itemID] [int] NULL,
	[Qty] [int] NULL,
	[Rate] [decimal](20, 2) NULL,
	[CatID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Table]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Table](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](250) NULL,
	[isDeleted] [bit] NULL,
	[companyID] [int] NULL,
 CONSTRAINT [PK_tbl_Table] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Village]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Village](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VillageName] [varchar](255) NULL,
	[CityID] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tbl_Village] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Warehouse]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Warehouse](
	[WID] [int] IDENTITY(1,1) NOT NULL,
	[Warehouse] [varchar](250) NULL,
	[WSht] [varchar](250) NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[WID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStock]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStock](
	[ItemID] [int] NOT NULL,
	[BatchNO] [varchar](50) NULL,
	[Expiry] [datetime] NULL,
	[Quantity] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblWaiter]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblWaiter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transp$]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transp$](
	[Trans_ID] [nvarchar](255) NULL,
	[Trans_Name] [nvarchar](255) NULL,
	[Addr] [nvarchar](255) NULL,
	[Tel] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trn_D]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trn_D](
	[RID] [nvarchar](255) NULL,
	[IID] [nvarchar](255) NULL,
	[BNID] [nvarchar](255) NULL,
	[ExpDT] [nvarchar](255) NULL,
	[CTN] [nvarchar](255) NULL,
	[PCS] [nvarchar](255) NULL,
	[SCH] [nvarchar](255) NULL,
	[Qty] [nvarchar](255) NULL,
	[PurPrice] [nvarchar](255) NULL,
	[PAmt] [nvarchar](255) NULL,
	[DisP] [nvarchar](255) NULL,
	[DisAmt] [nvarchar](255) NULL,
	[DisRs] [nvarchar](255) NULL,
	[Amt] [nvarchar](255) NULL,
	[SRT] [nvarchar](255) NULL,
	[RCancel] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trn_M]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trn_M](
	[RID] [nvarchar](255) NULL,
	[CompID] [nvarchar](255) NULL,
	[EDate] [nvarchar](255) NULL,
	[WID] [nvarchar](255) NULL,
	[WID2] [nvarchar](255) NULL,
	[RefNo] [nvarchar](255) NULL,
	[Rem] [nvarchar](255) NULL,
	[APost] [nvarchar](255) NULL,
	[Posted] [nvarchar](255) NULL,
	[RCancel] [nvarchar](255) NULL,
	[Create_User_ID] [nvarchar](255) NULL,
	[Create_Date] [nvarchar](255) NULL,
	[Edit_User_ID] [nvarchar](255) NULL,
	[Edit_Date] [nvarchar](255) NULL,
	[Del_User_ID] [nvarchar](255) NULL,
	[Del_Date] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendors](
	[VID] [int] IDENTITY(1,1) NOT NULL,
	[VendName] [nvarchar](255) NULL,
	[PType_ID] [int] NULL,
	[Add] [nvarchar](255) NULL,
	[NTN_No] [nvarchar](255) NULL,
	[ContactPerson] [nvarchar](255) NULL,
	[Cell] [nvarchar](255) NULL,
	[Eml] [nvarchar](255) NULL,
	[Tel] [nvarchar](255) NULL,
	[ZID] [int] NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[AC_Code] [int] NULL,
	[InActive] [bit] NULL,
	[Land] [varchar](255) NULL,
	[City] [int] NULL,
	[Village] [int] NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Vendors$] PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zone]    Script Date: 21-03-21 3:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zone](
	[ZID] [int] IDENTITY(1,1) NOT NULL,
	[Zone] [nvarchar](255) NULL,
	[is_Deleted] [bit] NULL,
	[CompanyID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ZID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ProductID], [ArticleTypeID], [StyleID], [BrandID], [ProductName], [ProductImage], [ArticleNo], [Description], [IsDelete], [BranchID], [CreatedBy], [CreatedDate], [ModifyBy], [ModifiedDate]) VALUES (1, 1, 1, NULL, N'', NULL, N'112', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Article] ([ProductID], [ArticleTypeID], [StyleID], [BrandID], [ProductName], [ProductImage], [ArticleNo], [Description], [IsDelete], [BranchID], [CreatedBy], [CreatedDate], [ModifyBy], [ModifiedDate]) VALUES (2, 1, 1, NULL, N'', NULL, N'113', NULL, 0, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[ArticleTypes] ON 

INSERT [dbo].[ArticleTypes] ([ArticleTypeID], [ArticleTypeName], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1, N'Gents', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[ArticleTypes] ([ArticleTypeID], [ArticleTypeName], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (2, N'Ladies', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[ArticleTypes] OFF
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (1, 1, 0, 1000001, N'cash3', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (1, 1, 0, 1000002, N'cash2', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (1, 1, 0, 1000003, N'faraz', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (3, 1, 0, 3000001, N'shahzaib', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (3, 1, 0, 3000002, N'Nayab', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (3, 1, 0, 3000003, N'Irfan', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (3, 1, 0, 3000004, N'hussain', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (3, 1, 0, 3000005, N'shahzaib gohar', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (3, 1, 0, 3000006, N'diamond cro', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (3, 1, 0, 3000007, N'm rafiqe cky', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (3, 1, 0, 3000008, N'kashof steel', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (3, 1, 0, 3000009, N'al shames cky', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000001, N'Panadol', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000002, N'shahzaib', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000003, N'umair', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000004, N'sh', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000005, N'shahz', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000006, N'miltan moment', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000007, N'abc', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000008, N'asdfg', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000009, N'rtyu', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000010, N'mnbvc', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000011, N'jvm', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000012, N'ggg', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000013, N'jjjjj', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000014, N'ssss', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000015, N'sha', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000016, N'fhgfhgf', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000017, N'dhgfhgf', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000018, N'fdgdfg', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000019, N'jlkjlkj', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000020, N'bloom xl', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000021, N'yaris 71 pcs', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000022, N'aqua', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (4, 1, 0, 4000023, N'milton persona 64 pcs', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (9, 1, 0, 9000001, N'zulfi', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (9, 1, 0, 9000002, N'zulfi ahmed', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (9, 1, 0, 9000003, N'dm w', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (10, 2, 0, 10000001, N'abdullah', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000001, N'Panadol', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000002, N'shahzaib', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000003, N'umair', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000004, N'sh', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000005, N'shahz', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000006, N'miltan moment', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000007, N'abc', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000008, N'asdfg', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000009, N'rtyu', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000010, N'mnbvc', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000011, N'jvm', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000012, N'ggg', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000013, N'jjjjj', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000014, N'ssss', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000015, N'sha', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000016, N'fhgfhgf', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000017, N'dhgfhgf', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000018, N'fdgdfg', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000019, N'jlkjlkj', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000020, N'bloom xl', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000021, N'yaris 71 pcs', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000022, N'aqua', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (14, 1, 0, 14000023, N'milton persona 64 pcs', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000001, N'Panadol', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000002, N'shahzaib', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000003, N'umair', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000004, N'sh', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000005, N'shahz', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000006, N'miltan moment', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000007, N'abc', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000008, N'asdfg', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000009, N'rtyu', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000010, N'mnbvc', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000011, N'jvm', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000012, N'ggg', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000013, N'jjjjj', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000014, N'ssss', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000015, N'sha', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000016, N'fhgfhgf', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000017, N'dhgfhgf', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000018, N'fdgdfg', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000019, N'jlkjlkj', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000020, N'bloom xl', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000021, N'yaris 71 pcs', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000022, N'aqua', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (15, 1, 0, 15000023, N'milton persona 64 pcs', 0, 0, 0, NULL)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (16, 1, 0, 16000001, N'ReceivedDisc', 0, 0, 0, 0)
INSERT [dbo].[COA_D] ([CAC_Code], [PType_ID], [ZID], [AC_Code], [AC_Title], [DR], [CR], [Qty], [InActive]) VALUES (16, 1, 0, 16000002, N'chai', 0, 0, 0, 0)
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (1, N'Assets', 1, N'Current Asset', 1, N'Cash')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (1, N'Assets', 1, N'Current Asset', 2, N'Bank')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (1, N'Assets', 1, N'Current Asset', 3, N'Accounts Receivable')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (1, N'Assets', 1, N'Current Asset', 4, N'Inventory')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (1, N'Assets', 1, N'Current Asset', 5, N'Other Receivable')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (1, N'Assets', 2, N'Property & Equipment', 6, N'Fixed Assets')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (1, N'Assets', 2, N'Property & Equipment', 7, N'Accumulated Depreciation')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (1, N'Assets', 3, N'Other Assets', 8, N'Other Assets')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (2, N'Liabilities', 4, N'Current Liabilities', 9, N'Accounts Payables')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (2, N'Liabilities', 4, N'Current Liabilities', 10, N'Salary Payables')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (2, N'Liabilities', 5, N'Long Terms Liabilities', 11, N'Long Terms Liabilities')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (3, N'Capital', 6, N'Capital', 12, N'Capital')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (3, N'Capital', 7, N'Drawing', 13, N'Drawing')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (4, N'Income', 8, N'Income', 14, N'Income')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (5, N'Expenses', 9, N'Expenses', 15, N'Cost of Sales')
INSERT [dbo].[COA_M] ([MAC_Code], [MTitle], [SubAC_Code], [SubTitle], [CAC_Code], [CATitle]) VALUES (5, N'Expenses', 9, N'Expenses', 16, N'Expenses')
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorID], [Name], [ShortName], [BranchID], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsDeleted], [IID]) VALUES (1, N'Red', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Colors] ([ColorID], [Name], [ShortName], [BranchID], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsDeleted], [IID]) VALUES (2, N'Blue', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([AC_Code], [CID], [CusName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Owner_Name], [Cell], [Eml], [Tel], [SID], [ZID], [AddPer], [Debit], [Credit], [Black_List], [War_Cls], [War_DT], [Prn], [InActive], [Land], [City], [Village], [CompanyID], [CollectPerMonth]) VALUES (3000001, 1, N'shahzaib', 1, N'', N'1000', N'', NULL, N'', N'', N'', NULL, NULL, NULL, 40000, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([AC_Code], [CID], [CusName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Owner_Name], [Cell], [Eml], [Tel], [SID], [ZID], [AddPer], [Debit], [Credit], [Black_List], [War_Cls], [War_DT], [Prn], [InActive], [Land], [City], [Village], [CompanyID], [CollectPerMonth]) VALUES (3000002, 2, N'Nayab', 1, N'', N'300', N'', NULL, N'', N'', N'', NULL, 0, NULL, 5000, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([AC_Code], [CID], [CusName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Owner_Name], [Cell], [Eml], [Tel], [SID], [ZID], [AddPer], [Debit], [Credit], [Black_List], [War_Cls], [War_DT], [Prn], [InActive], [Land], [City], [Village], [CompanyID], [CollectPerMonth]) VALUES (3000003, 3, N'Irfan', 1, N'', N'', N'', NULL, N'', N'', N'', NULL, 0, NULL, 78500, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Customers] ([AC_Code], [CID], [CusName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Owner_Name], [Cell], [Eml], [Tel], [SID], [ZID], [AddPer], [Debit], [Credit], [Black_List], [War_Cls], [War_DT], [Prn], [InActive], [Land], [City], [Village], [CompanyID], [CollectPerMonth]) VALUES (3000004, 4, N'hussain', 1, N'abccc', N'', N'', NULL, N'', N'', N'', NULL, 0, NULL, 50000, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([AC_Code], [CID], [CusName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Owner_Name], [Cell], [Eml], [Tel], [SID], [ZID], [AddPer], [Debit], [Credit], [Black_List], [War_Cls], [War_DT], [Prn], [InActive], [Land], [City], [Village], [CompanyID], [CollectPerMonth]) VALUES (3000005, 5, N'shahzaib gohar', 1, N'', N'', N'', NULL, N'', N'', N'090078601', NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([AC_Code], [CID], [CusName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Owner_Name], [Cell], [Eml], [Tel], [SID], [ZID], [AddPer], [Debit], [Credit], [Black_List], [War_Cls], [War_DT], [Prn], [InActive], [Land], [City], [Village], [CompanyID], [CollectPerMonth]) VALUES (3000006, 6, N'diamond cro', 1, N'', N'', N'', NULL, N'', N'', N'', NULL, 0, NULL, 3000, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([AC_Code], [CID], [CusName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Owner_Name], [Cell], [Eml], [Tel], [SID], [ZID], [AddPer], [Debit], [Credit], [Black_List], [War_Cls], [War_DT], [Prn], [InActive], [Land], [City], [Village], [CompanyID], [CollectPerMonth]) VALUES (3000007, 7, N'm rafiqe cky', 1, N'resham bazar', N'', N'', NULL, N'', N'', N'', NULL, 0, NULL, 21000, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([AC_Code], [CID], [CusName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Owner_Name], [Cell], [Eml], [Tel], [SID], [ZID], [AddPer], [Debit], [Credit], [Black_List], [War_Cls], [War_DT], [Prn], [InActive], [Land], [City], [Village], [CompanyID], [CollectPerMonth]) VALUES (3000008, 8, N'kashof steel', 1, N'resham bazar', N'', N'', NULL, N'', N'', N'', NULL, 0, NULL, 100000, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customers] ([AC_Code], [CID], [CusName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Owner_Name], [Cell], [Eml], [Tel], [SID], [ZID], [AddPer], [Debit], [Credit], [Black_List], [War_Cls], [War_DT], [Prn], [InActive], [Land], [City], [Village], [CompanyID], [CollectPerMonth]) VALUES (3000009, 9, N'al shames cky', 1, N'resham bazar', N'', N'', NULL, N'', N'', N'', NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[EV_D] ON 

INSERT [dbo].[EV_D] ([RID], [Narr], [MOP_ID], [AC_Code], [InvNo], [ChkNo], [SlipNo], [Amt], [SRT], [RCancel], [ID]) VALUES (2, N'hello', NULL, N'16000001', NULL, N'0', NULL, N'250', NULL, NULL, 1)
INSERT [dbo].[EV_D] ([RID], [Narr], [MOP_ID], [AC_Code], [InvNo], [ChkNo], [SlipNo], [Amt], [SRT], [RCancel], [ID]) VALUES (3, N'shahzaib k liya', NULL, N'16000002', NULL, N'0', NULL, N'40', NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[EV_D] OFF
SET IDENTITY_INSERT [dbo].[EV_M] ON 

INSERT [dbo].[EV_M] ([RID], [CompID], [EDate], [AC_Code], [SID], [AC_Code2], [AC_Code3], [Amt], [Rem], [Posted], [APost], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (2, 0, CAST(N'2021-01-25 14:31:55.000' AS DateTime), 1000001, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[EV_M] ([RID], [CompID], [EDate], [AC_Code], [SID], [AC_Code2], [AC_Code3], [Amt], [Rem], [Posted], [APost], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (3, 0, CAST(N'2021-01-25 21:27:52.393' AS DateTime), 1000001, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EV_M] OFF
INSERT [dbo].[Firm$] ([Firm_ID], [FirmNM], [Org_Short], [Addr], [Tel], [Fax], [UAN], [Email], [URL], [NTN], [SoftwarePath], [BackupPath], [LogoPath], [ImagesPath], [BCK_Login], [BCK_Eml], [BCK_Eml_AC], [OP_Date], [Comp_OP], [Party_OPBal], [Pre_Pur_His], [Stk_Pur_Ent], [Pre_Sal_His], [Stk_Sal_Ent], [Lock_less_Stk_Sa], [ICP], [AC_Code], [AC_Code2], [AC_Code3]) VALUES (1, N'Vetimed Enterprises', N'VE', N'Jail Road, Behind Bone Care Hospital Hirabad, Hyderabad.', N'022-2113691 & 0300-8370450', N'', N'', N'info@vetimed-enterprises.com.pk', N'www.vetimed-enterprises.com.pk', N'', N'E:\Global-Care-ERP-N-VetEnt\Soft\2020', N'E:\Global-Care-ERP-N-VetEnt\Backup\2020', N'E:\Global-Care-ERP-N-VetEnt\Logo', N'E:\Global-Care-ERP-N-VetEnt\Images', -1, 0, N'', N'31-12-19', 1, 1, 1, 1, 1, 1, 0, 2, 160041, NULL, 160038)
SET IDENTITY_INSERT [dbo].[GL] ON 

INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-25' AS Date), NULL, NULL, NULL, 3000001, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40000, 0, NULL, NULL, NULL, 1)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-25' AS Date), NULL, NULL, NULL, 12000001, 3000001, N'Opening shahzaib', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 40000, NULL, NULL, NULL, 2)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-25' AS Date), NULL, NULL, NULL, 3000002, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5000, 0, NULL, NULL, NULL, 3)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-25' AS Date), NULL, NULL, NULL, 12000001, 3000002, N'Opening Nayab', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 5000, NULL, NULL, NULL, 4)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-21' AS Date), NULL, NULL, NULL, 3000003, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78500, 0, NULL, NULL, NULL, 5)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-21' AS Date), NULL, NULL, NULL, 12000001, 3000003, N'Opening Irfan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 78500, NULL, NULL, NULL, 6)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-21' AS Date), NULL, NULL, NULL, 9000001, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 8000, NULL, NULL, NULL, 7)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-21' AS Date), NULL, NULL, NULL, 12000001, 9000001, N'Opening zulfi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8000, 0, NULL, NULL, NULL, 8)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-21' AS Date), NULL, NULL, NULL, 9000002, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 90000, NULL, NULL, NULL, 9)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-21' AS Date), NULL, NULL, NULL, 12000001, 9000002, N'Opening zulfi ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90000, 0, NULL, NULL, NULL, 10)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-21' AS Date), NULL, NULL, NULL, 4000001, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 600, 0, NULL, NULL, NULL, 11)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-21' AS Date), NULL, NULL, NULL, 12000001, 4000001, N'opening Item :Panadol', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 0, 600, NULL, NULL, NULL, 12)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 16, CAST(N'2021-01-25' AS Date), NULL, 1, 1, 16000001, 1000001, N'cash3:hello', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250, 0, NULL, NULL, NULL, 37)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 16, CAST(N'2021-01-25' AS Date), NULL, 1, 1, 1000001, 16000001, N'hello:ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 250, NULL, NULL, NULL, 38)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 14, CAST(N'2021-02-02' AS Date), NULL, NULL, NULL, 1000001, 3000001, N'', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000, 0, NULL, NULL, NULL, 41)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 14, CAST(N'2021-02-02' AS Date), NULL, NULL, NULL, 3000001, 1000001, N'', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1000, NULL, NULL, NULL, 42)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 16, CAST(N'2021-01-25' AS Date), NULL, 1, 1, 16000002, 1000001, N'cash3:shahzaib k liya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 0, NULL, NULL, NULL, 43)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 16, CAST(N'2021-01-25' AS Date), NULL, 1, 1, 1000001, 16000002, N'shahzaib k liya:chai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 40, NULL, NULL, NULL, 44)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3016, NULL, 2, CAST(N'2021-01-28' AS Date), NULL, NULL, NULL, 9000001, 4000001, N'Panadol', NULL, 2, NULL, NULL, 32, NULL, NULL, 400, 0, 0, 0, 0, 400, NULL, NULL, NULL, 1039)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3016, NULL, 2, CAST(N'2021-01-28' AS Date), NULL, NULL, NULL, 4000001, 9000001, N'zulfi', NULL, 2, NULL, NULL, 32, NULL, NULL, 400, 0, 0, 0, 400, 0, NULL, NULL, NULL, 1040)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-29' AS Date), NULL, NULL, NULL, 4000002, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 2039)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-29' AS Date), NULL, NULL, NULL, 12000001, 4000002, N'opening Item :shahzaib', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 2040)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4016, NULL, 2, CAST(N'2021-01-31' AS Date), NULL, NULL, NULL, 9000001, 4000001, N'Panadol', NULL, 2, NULL, NULL, 32, NULL, NULL, 500, 10, 50, 0, 0, 450, NULL, NULL, NULL, 2041)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4016, NULL, 2, CAST(N'2021-01-31' AS Date), NULL, NULL, NULL, 4000001, 9000001, N'zulfi', NULL, 2, NULL, NULL, 32, NULL, NULL, 500, 10, 50, 0, 450, 0, NULL, NULL, NULL, 2042)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-31' AS Date), NULL, NULL, NULL, 4000003, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 600, 0, NULL, NULL, NULL, 2043)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-01-31' AS Date), NULL, NULL, NULL, 12000001, 4000003, N'opening Item :umair', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 0, 600, NULL, NULL, NULL, 2044)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4017, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 9000002, 4000001, N'Panadol', NULL, 2, NULL, NULL, 32, NULL, NULL, 300, 0, 0, 0, 0, 300, NULL, NULL, NULL, 2045)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4017, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 4000001, 9000002, N'zulfi ahmed', NULL, 2, NULL, NULL, 32, NULL, NULL, 300, 0, 0, 0, 300, 0, NULL, NULL, NULL, 2046)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4017, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 9000002, 4000002, N'shahzaib', NULL, 2, NULL, NULL, 2, NULL, NULL, 400, 0, 0, 0, 0, 400, NULL, NULL, NULL, 2047)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4017, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 4000002, 9000002, N'zulfi ahmed', NULL, 2, NULL, NULL, 2, NULL, NULL, 400, 0, 0, 0, 400, 0, NULL, NULL, NULL, 2048)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4018, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 9000002, 4000001, N'Panadol', NULL, 2, NULL, NULL, 32, NULL, NULL, 9.375, 0, 0, 0, 0, 0.29, NULL, NULL, NULL, 2049)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4018, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 4000001, 9000002, N'zulfi ahmed', NULL, 2, NULL, NULL, 32, NULL, NULL, 9.375, 0, 0, 0, 0.29, 0, NULL, NULL, NULL, 2050)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4018, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 9000002, 4000002, N'shahzaib', NULL, 2, NULL, NULL, 2, NULL, NULL, 200, 0, 0, 0, 0, 100, NULL, NULL, NULL, 2051)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4018, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 4000002, 9000002, N'zulfi ahmed', NULL, 2, NULL, NULL, 2, NULL, NULL, 200, 0, 0, 0, 100, 0, NULL, NULL, NULL, 2052)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4018, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 9000002, 4000003, N'umair', NULL, 2, NULL, NULL, 2, NULL, NULL, 500, 0, 0, 0, 0, 500, NULL, NULL, NULL, 2053)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4018, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 4000003, 9000002, N'zulfi ahmed', NULL, 2, NULL, NULL, 2, NULL, NULL, 500, 0, 0, 0, 500, 0, NULL, NULL, NULL, 2054)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4019, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 9000002, 4000001, N'Panadol', NULL, 2, NULL, NULL, 32, NULL, NULL, 400, 0, 0, 0, 0, 400, NULL, NULL, NULL, 2055)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4019, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 4000001, 9000002, N'zulfi ahmed', NULL, 2, NULL, NULL, 32, NULL, NULL, 400, 0, 0, 0, 400, 0, NULL, NULL, NULL, 2056)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4019, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 9000002, 4000003, N'umair', NULL, 2, NULL, NULL, 2, NULL, NULL, 1000, 0, 0, 0, 0, 1000, NULL, NULL, NULL, 2057)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4019, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 4000003, 9000002, N'zulfi ahmed', NULL, 2, NULL, NULL, 2, NULL, NULL, 1000, 0, 0, 0, 1000, 0, NULL, NULL, NULL, 2058)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4020, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 9000001, 4000001, N'Panadol', NULL, 2, NULL, NULL, 32, NULL, NULL, 0.39, 0, 0, 0, 0, 0.01, NULL, NULL, NULL, 2065)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4020, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 4000001, 9000001, N'zulfi', NULL, 2, NULL, NULL, 32, NULL, NULL, 0.39, 0, 0, 0, 0.01, 0, NULL, NULL, NULL, 2066)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4020, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 9000001, 4000003, N'umair', NULL, 2, NULL, NULL, 2, NULL, NULL, 250, 0, 0, 0, 0, 125, NULL, NULL, NULL, 2067)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4020, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 4000003, 9000001, N'zulfi', NULL, 2, NULL, NULL, 2, NULL, NULL, 250, 0, 0, 0, 125, 0, NULL, NULL, NULL, 2068)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4020, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 9000001, 4000002, N'shahzaib', NULL, 2, NULL, NULL, 2, NULL, NULL, 150, 0, 0, 0, 0, 75, NULL, NULL, NULL, 2069)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4020, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 4000002, 9000001, N'zulfi', NULL, 2, NULL, NULL, 2, NULL, NULL, 150, 0, 0, 0, 75, 0, NULL, NULL, NULL, 2070)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4021, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 9000001, 4000001, N'Panadol', NULL, 2, NULL, NULL, 32, NULL, NULL, 6.9375, 0, 0, 0, 0, 0.11, NULL, NULL, NULL, 2073)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4021, NULL, 2, CAST(N'2021-02-04' AS Date), NULL, NULL, NULL, 4000001, 9000001, N'zulfi', NULL, 2, NULL, NULL, 32, NULL, NULL, 6.9375, 0, 0, 0, 0.11, 0, NULL, NULL, NULL, 2074)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 3000001, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 31, 40, 40, 0, 0, 0, 40, 0, NULL, NULL, NULL, 3045)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 4000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, 1.2938112284024024, 40.1081480804744, 0, 0, 0, 0, 40.1081480804744, NULL, NULL, NULL, 3046)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 14000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, 40, 40, 0, 0, 0, 0, 40, NULL, NULL, NULL, 3047)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 15000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, NULL, 40.1081480804744, 0, 0, 0, 40.1081480804744, 0, NULL, NULL, NULL, 3048)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3049)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3050)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 3000001, 4000002, N'shahzaib', NULL, NULL, NULL, NULL, NULL, 1, 30, 30, 2, 0.6, 2, 27.4, 0, NULL, NULL, NULL, 3051)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 4000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 52.1604938271605, 52.1604938271605, 0, 0, 0, 0, 52.1604938271605, NULL, NULL, NULL, 3052)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 14000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 30, 30, 2, 0.6, 2, 0, 27.4, NULL, NULL, NULL, 3053)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 15000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 52.1604938271605, 0, 0, 0, 52.1604938271605, 0, NULL, NULL, NULL, 3054)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3055)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 5, CAST(N'2021-02-05' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3056)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000002, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 31, 40, 1240, 0, 0, 0, 40, 0, NULL, NULL, NULL, 3057)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 4000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 31, 1.2938112284024024, 40.1081480804744, 0, 0, 0, 0, 40.1081480804744, NULL, NULL, NULL, 3058)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 14000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 31, 40, 1240, 0, 0, 0, 0, 40, NULL, NULL, NULL, 3059)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 15000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 31, NULL, 40.1081480804744, 0, 0, 0, 40.1081480804744, 0, NULL, NULL, NULL, 3060)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 16000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3061)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000002, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3062)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000002, 4000002, N'shahzaib', NULL, NULL, NULL, NULL, NULL, 1, 30, 30, 2, 0.6, 2, 27.4, 0, NULL, NULL, NULL, 3063)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 4000002, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 52.1604938271605, 52.1604938271605, 0, 0, 0, 0, 52.1604938271605, NULL, NULL, NULL, 3064)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 14000002, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 30, 30, 2, 0.6, 2, 0, 27.4, NULL, NULL, NULL, 3065)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 15000002, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 52.1604938271605, 0, 0, 0, 52.1604938271605, 0, NULL, NULL, NULL, 3066)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 16000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3067)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000002, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3068)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000002, 4000003, N'umair', NULL, NULL, NULL, NULL, NULL, 1, 30, 30, 2, 0.6, 2, 27.4, 0, NULL, NULL, NULL, 3069)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 4000003, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 124.22839506172834, 124.228395061728, 0, 0, 0, 0, 124.228395061728, NULL, NULL, NULL, 3070)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 14000003, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 30, 30, 2, 0.6, 2, 0, 27.4, NULL, NULL, NULL, 3071)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 15000003, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 124.228395061728, 0, 0, 0, 124.228395061728, 0, NULL, NULL, NULL, 3072)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 16000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3073)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000002, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3074)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000001, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 31, 40, 1240, 0, 0, 0, 40, 0, NULL, NULL, NULL, 3075)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 4000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, 1.2938112284024024, 40.1081480804744, 0, 0, 0, 0, 40.1081480804744, NULL, NULL, NULL, 3076)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 14000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, 40, 1240, 0, 0, 0, 0, 40, NULL, NULL, NULL, 3077)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 15000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, NULL, 40.1081480804744, 0, 0, 0, 40.1081480804744, 0, NULL, NULL, NULL, 3078)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3079)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3080)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000001, 4000003, N'umair', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 40, 0, NULL, NULL, NULL, 3081)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 4000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 124.22839506172834, 124.228395061728, 0, 0, 0, 0, 124.228395061728, NULL, NULL, NULL, 3082)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 14000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 0, 40, NULL, NULL, NULL, 3083)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 15000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 124.228395061728, 0, 0, 0, 124.228395061728, 0, NULL, NULL, NULL, 3084)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3085)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3086)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000001, 4000002, N'shahzaib', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 40, 0, NULL, NULL, NULL, 3087)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 4000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 52.1604938271605, 52.1604938271605, 0, 0, 0, 0, 52.1604938271605, NULL, NULL, NULL, 3088)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 14000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 0, 40, NULL, NULL, NULL, 3089)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 15000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 52.1604938271605, 0, 0, 0, 52.1604938271605, 0, NULL, NULL, NULL, 3090)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3091)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1, NULL, 5, CAST(N'2021-02-06' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3092)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-08' AS Date), NULL, NULL, NULL, 10000001, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3093)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-08' AS Date), NULL, NULL, NULL, 12000001, 10000001, N'Opening abdullah', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3094)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-10' AS Date), NULL, NULL, NULL, 4000004, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 30, 0, NULL, NULL, NULL, 3095)
GO
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-10' AS Date), NULL, NULL, NULL, 12000001, 4000004, N'opening Item :sh', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30, NULL, NULL, NULL, 3096)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 4000005, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 200, 0, NULL, NULL, NULL, 3097)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 12000001, 4000005, N'opening Item :shahz', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 0, 200, NULL, NULL, NULL, 3098)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5018, NULL, 2, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 9000001, 4000001, N'Panadol', NULL, 2, NULL, NULL, 59, NULL, NULL, 400, 0, 0, 0, 0, 400, NULL, NULL, NULL, 3099)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5018, NULL, 2, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 4000001, 9000001, N'zulfi', NULL, 2, NULL, NULL, 59, NULL, NULL, 400, 0, 0, 0, 400, 0, NULL, NULL, NULL, 3100)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5018, NULL, 2, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 9000001, 4000002, N'shahzaib', NULL, 2, NULL, NULL, 2, NULL, NULL, 500, 0, 0, 0, 0, 500, NULL, NULL, NULL, 3101)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5018, NULL, 2, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 4000002, 9000001, N'zulfi', NULL, 2, NULL, NULL, 2, NULL, NULL, 500, 0, 0, 0, 500, 0, NULL, NULL, NULL, 3102)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5020, NULL, 2, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 9000001, 4000004, N'sh', NULL, 2, NULL, NULL, 32, NULL, NULL, 400, 0, 0, 0, 0, 400, NULL, NULL, NULL, 3103)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5020, NULL, 2, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 4000004, 9000001, N'zulfi', NULL, 2, NULL, NULL, 32, NULL, NULL, 400, 0, 0, 0, 400, 0, NULL, NULL, NULL, 3104)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5020, NULL, 2, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 9000001, 4000005, N'shahz', NULL, 2, NULL, NULL, 31, NULL, NULL, 500, 0, 0, 0, 0, 500, NULL, NULL, NULL, 3105)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5020, NULL, 2, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 4000005, 9000001, N'zulfi', NULL, 2, NULL, NULL, 31, NULL, NULL, 500, 0, 0, 0, 500, 0, NULL, NULL, NULL, 3106)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 3000001, 4000003, N'umair', NULL, NULL, NULL, NULL, NULL, 2, 30, 60, 0, 0, 0, 60, 0, NULL, NULL, NULL, 3107)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 4000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 2, 124.22839506172834, 248.456790123456, 0, 0, 0, 0, 248.456790123456, NULL, NULL, NULL, 3108)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 14000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 2, 30, 60, 0, 0, 0, 0, 60, NULL, NULL, NULL, 3109)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 15000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 2, NULL, 248.456790123456, 0, 0, 0, 248.456790123456, 0, NULL, NULL, NULL, 3110)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3111)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3112)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 3000001, 4000003, N'umair', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 3113)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 4000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 124.22839506172834, 124.228395061728, 0, 0, 0, 0, 124.228395061728, NULL, NULL, NULL, 3114)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 14000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 3115)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 15000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 124.228395061728, 0, 0, 0, 124.228395061728, 0, NULL, NULL, NULL, 3116)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3117)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3118)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 6, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 3000001, 4000002, N'shahzaib', NULL, NULL, NULL, NULL, NULL, 1, 20, 20, 0, 0, 0, 20, 0, NULL, NULL, NULL, 3119)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 6, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 4000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 131.29629629629631, 131.296296296296, 0, 0, 0, 0, 131.296296296296, NULL, NULL, NULL, 3120)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 6, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 14000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 20, 20, 0, 0, 0, 0, 20, NULL, NULL, NULL, 3121)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 6, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 15000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 131.296296296296, 0, 0, 0, 131.296296296296, 0, NULL, NULL, NULL, 3122)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 6, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3123)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 6, NULL, 5, CAST(N'2021-02-11' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3124)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 7, NULL, 5, CAST(N'2021-02-12' AS Date), NULL, NULL, NULL, 3000001, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 31, 40, 1240, 0, 0, 0, 1240, 0, NULL, NULL, NULL, 3125)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 7, NULL, 5, CAST(N'2021-02-12' AS Date), NULL, NULL, NULL, 4000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, 2.8350737880417256, 87.887287429293636, 0, 0, 0, 0, 87.887287429293636, NULL, NULL, NULL, 3126)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 7, NULL, 5, CAST(N'2021-02-12' AS Date), NULL, NULL, NULL, 14000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, 40, 1240, 0, 0, 0, 0, 1240, NULL, NULL, NULL, 3127)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 7, NULL, 5, CAST(N'2021-02-12' AS Date), NULL, NULL, NULL, 15000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, NULL, 87.887287429293636, 0, 0, 0, 87.887287429293636, 0, NULL, NULL, NULL, 3128)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 7, NULL, 5, CAST(N'2021-02-12' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 3129)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 7, NULL, 5, CAST(N'2021-02-12' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 3130)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 3000001, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 31, 40, 1240, 0, 0, 0, 1240, 0, NULL, NULL, NULL, 4045)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 4000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, 2.8350737880417256, 87.887287429293636, 0, 0, 0, 0, 87.887287429293636, NULL, NULL, NULL, 4046)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 14000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, 40, 1240, 0, 0, 0, 0, 1240, NULL, NULL, NULL, 4047)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 15000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 31, NULL, 87.887287429293636, 0, 0, 0, 87.887287429293636, 0, NULL, NULL, NULL, 4048)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 4049)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 4050)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 3000001, 4000003, N'umair', NULL, NULL, NULL, NULL, NULL, 1, 40, 80, 0, 0, 0, 80, 0, NULL, NULL, NULL, 4051)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 4000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 124.22839506172834, 124.228395061728, 0, 0, 0, 0, 124.228395061728, NULL, NULL, NULL, 4052)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 14000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 40, 80, 0, 0, 0, 0, 80, NULL, NULL, NULL, 4053)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 15000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 124.228395061728, 0, 0, 0, 124.228395061728, 0, NULL, NULL, NULL, 4054)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 4055)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 5, CAST(N'2021-02-20' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 4056)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 3000004, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50000, 0, NULL, NULL, NULL, 5045)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 12000001, 3000004, N'Opening hussain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 50000, NULL, NULL, NULL, 5046)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 4000006, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 100000, 0, NULL, NULL, NULL, 5047)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 12000001, 4000006, N'opening Item :miltan moment', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100000, NULL, NULL, NULL, 5048)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2002, NULL, 5, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 3000001, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 40, 0, NULL, NULL, NULL, 5049)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2002, NULL, 5, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 4000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 2.8350737880417256, 2.83507378804173, 0, 0, 0, 0, 2.83507378804173, NULL, NULL, NULL, 5050)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2002, NULL, 5, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 14000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 0, 40, NULL, NULL, NULL, 5051)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2002, NULL, 5, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 15000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 2.83507378804173, 0, 0, 0, 2.83507378804173, 0, NULL, NULL, NULL, 5052)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2002, NULL, 5, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 16000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 5053)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2002, NULL, 5, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 3000001, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 5054)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 9000003, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 30000, NULL, NULL, NULL, 5055)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-23' AS Date), NULL, NULL, NULL, 12000001, 9000003, N'Opening dm w', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30000, 0, NULL, NULL, NULL, 5056)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000007, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 600, 0, NULL, NULL, NULL, 5057)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 12000001, 4000007, N'opening Item :abc', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 0, 600, NULL, NULL, NULL, 5058)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000008, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 800, 0, NULL, NULL, NULL, 5059)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 12000001, 4000008, N'opening Item :asdfg', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 0, 800, NULL, NULL, NULL, 5060)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000009, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 600, 0, NULL, NULL, NULL, 5061)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 12000001, 4000009, N'opening Item :rtyu', NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, 0, 600, NULL, NULL, NULL, 5062)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000010, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, 660, 0, NULL, NULL, NULL, 5063)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 12000001, 4000010, N'opening Item :mnbvc', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, 0, 660, NULL, NULL, NULL, 5064)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000011, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, 726, 0, NULL, NULL, NULL, 5065)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 12000001, 4000011, N'opening Item :jvm', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, 0, 726, NULL, NULL, NULL, 5066)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2003, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 3000002, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 31, 40, 1240, 0, 0, 0, 1240, 0, NULL, NULL, NULL, 5067)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2003, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 31, 2.8350737880417256, 87.887287429293636, 0, 0, 0, 0, 87.887287429293636, NULL, NULL, NULL, 5068)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2003, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 14000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 31, 40, 1240, 0, 0, 0, 0, 1240, NULL, NULL, NULL, 5069)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2003, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 15000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 31, NULL, 87.887287429293636, 0, 0, 0, 87.887287429293636, 0, NULL, NULL, NULL, 5070)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2003, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 16000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 5071)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2003, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 3000002, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 5072)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2004, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 3000002, 4000002, N'shahzaib', NULL, NULL, NULL, NULL, NULL, 1, 300, 600, 0, 0, 0, 600, 0, NULL, NULL, NULL, 5073)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2004, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000002, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 131.29629629629631, 131.296296296296, 0, 0, 0, 0, 131.296296296296, NULL, NULL, NULL, 5074)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2004, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 14000002, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 300, 600, 0, 0, 0, 0, 600, NULL, NULL, NULL, 5075)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2004, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 15000002, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 131.296296296296, 0, 0, 0, 131.296296296296, 0, NULL, NULL, NULL, 5076)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2004, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 16000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, 5077)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2004, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 3000002, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 300, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 5078)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2005, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 3000002, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 40, 0, NULL, NULL, NULL, 5079)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2005, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 2.8350737880417256, 2.83507378804173, 0, 0, 0, 0, 2.83507378804173, NULL, NULL, NULL, 5080)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2005, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 14000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 0, 40, NULL, NULL, NULL, 5081)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2005, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 15000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 2.83507378804173, 0, 0, 0, 2.83507378804173, 0, NULL, NULL, NULL, 5082)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2005, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 16000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 10, 0, NULL, NULL, NULL, 5083)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2005, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 3000002, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 5084)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2007, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 3000002, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 40, 0, NULL, NULL, NULL, 5089)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2007, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 2.8350737880417256, 2.83507378804173, 0, 0, 0, 0, 2.83507378804173, NULL, NULL, NULL, 5090)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2007, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 14000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 0, 40, NULL, NULL, NULL, 5091)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2007, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 15000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 2.83507378804173, 0, 0, 0, 2.83507378804173, 0, NULL, NULL, NULL, 5092)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2008, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 3000002, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 40, 0, NULL, NULL, NULL, 5093)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2008, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 2.8350737880417256, 2.83507378804173, 0, 0, 0, 0, 2.83507378804173, NULL, NULL, NULL, 5094)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2008, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 14000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 0, 40, NULL, NULL, NULL, 5095)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2008, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 15000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 2.83507378804173, 0, 0, 0, 2.83507378804173, 0, NULL, NULL, NULL, 5096)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2009, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 3000002, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 40, 0, NULL, NULL, NULL, 5097)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2009, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 2.8350737880417256, 2.83507378804173, 0, 0, 0, 0, 2.83507378804173, NULL, NULL, NULL, 5098)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2009, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 14000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 0, 40, NULL, NULL, NULL, 5099)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2009, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 15000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 2.83507378804173, 0, 0, 0, 2.83507378804173, 0, NULL, NULL, NULL, 5100)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2009, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 16000001, 3000002, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 10, 0, NULL, NULL, NULL, 5101)
GO
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2009, NULL, 5, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 3000002, 16000001, N'ReceivedDisc', NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, 0, 10, NULL, NULL, NULL, 5102)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 14, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 1000001, 3000001, N'', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3000, 0, NULL, NULL, NULL, 5103)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 1002, NULL, 14, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 3000001, 1000001, N'', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3000, NULL, NULL, NULL, 5104)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 15, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 9000001, 1000001, N'', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, 0, NULL, NULL, NULL, 5105)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2, NULL, 15, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 1000001, 9000001, N'', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 200, NULL, NULL, NULL, 5106)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 4000012, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 5107)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-25' AS Date), NULL, NULL, NULL, 12000001, 4000012, N'opening Item :ggg', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 5108)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-27' AS Date), NULL, NULL, NULL, 4000014, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 5109)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-27' AS Date), NULL, NULL, NULL, 12000001, 4000014, N'opening Item :ssss', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 5110)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-27' AS Date), NULL, NULL, NULL, 4000015, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, 660, 0, NULL, NULL, NULL, 5111)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-02-27' AS Date), NULL, NULL, NULL, 12000001, 4000015, N'opening Item :sha', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, 0, 660, NULL, NULL, NULL, 5112)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 6017, NULL, 2, CAST(N'2021-03-03' AS Date), NULL, NULL, NULL, 9000001, 4000001, N'Panadol', NULL, 2, NULL, NULL, 32, NULL, NULL, 500, 0, 0, 0, 0, 500, NULL, NULL, NULL, 5113)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 6017, NULL, 2, CAST(N'2021-03-03' AS Date), NULL, NULL, NULL, 4000001, 9000001, N'zulfi', NULL, 2, NULL, NULL, 32, NULL, NULL, 500, 0, 0, 0, 500, 0, NULL, NULL, NULL, 5114)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-08' AS Date), NULL, NULL, NULL, 4000016, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, 667.998, 0, NULL, NULL, NULL, 5115)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-08' AS Date), NULL, NULL, NULL, 12000001, 4000016, N'opening Item :fhgfhgf', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, 0, 667.998, NULL, NULL, NULL, 5116)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 3000001, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 4, 40, 160, 0, 0, 0, 160, 0, NULL, NULL, NULL, 5117)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 4000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 4, 4.6984383003486991, 18.7937532013948, 0, 0, 0, 0, 18.7937532013948, NULL, NULL, NULL, 5118)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 14000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 4, 40, 160, 0, 0, 0, 0, 160, NULL, NULL, NULL, 5119)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 15000001, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 4, NULL, 18.7937532013948, 0, 0, 0, 18.7937532013948, 0, NULL, NULL, NULL, 5120)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 3000001, 4000003, N'umair', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5121)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 4000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 124.22839506172834, 124.228395061728, 0, 0, 0, 0, 124.228395061728, NULL, NULL, NULL, 5122)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 14000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, 5123)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 15000003, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 124.228395061728, 0, 0, 0, 124.228395061728, 0, NULL, NULL, NULL, 5124)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 3000001, 4000002, N'shahzaib', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 40, 0, NULL, NULL, NULL, 5125)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 4000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 131.29629629629631, 131.296296296296, 0, 0, 0, 0, 131.296296296296, NULL, NULL, NULL, 5126)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 14000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 0, 40, NULL, NULL, NULL, 5127)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 2010, NULL, 5, CAST(N'2021-03-09' AS Date), NULL, NULL, NULL, 15000002, 3000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 131.296296296296, 0, 0, 0, 131.296296296296, 0, NULL, NULL, NULL, 5128)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-11' AS Date), NULL, NULL, NULL, 4000017, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, 751.41, 0, NULL, NULL, NULL, 6113)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-11' AS Date), NULL, NULL, NULL, 12000001, 4000017, N'opening Item :dhgfhgf', NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, 0, 751.41, NULL, NULL, NULL, 6114)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-11' AS Date), NULL, NULL, NULL, 4000018, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, 496.1, 0, NULL, NULL, NULL, 6115)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-11' AS Date), NULL, NULL, NULL, 12000001, 4000018, N'opening Item :fdgdfg', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, 0, 496.1, NULL, NULL, NULL, 6116)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-11' AS Date), NULL, NULL, NULL, 4000019, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, 668.8, 0, NULL, NULL, NULL, 6117)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-11' AS Date), NULL, NULL, NULL, 12000001, 4000019, N'opening Item :jlkjlkj', NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, 0, 668.8, NULL, NULL, NULL, 6118)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 3000005, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 7113)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 12000001, 3000005, N'Opening shahzaib gohar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 7114)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 3000006, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3000, 0, NULL, NULL, NULL, 7115)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 12000001, 3000006, N'Opening diamond cro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3000, NULL, NULL, NULL, 7116)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 4000020, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, 117500, 0, NULL, NULL, NULL, 7117)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 12000001, 4000020, N'opening Item :bloom xl', NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, 0, 117500, NULL, NULL, NULL, 7118)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 4000021, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, 96250, 0, NULL, NULL, NULL, 7119)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 12000001, 4000021, N'opening Item :yaris 71 pcs', NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, 0, 96250, NULL, NULL, NULL, 7120)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 4000022, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, 20500, 0, NULL, NULL, NULL, 7121)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 12000001, 4000022, N'opening Item :aqua', NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, 0, 20500, NULL, NULL, NULL, 7122)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 4000023, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, 175500, 0, NULL, NULL, NULL, 7123)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 12000001, 4000023, N'opening Item :milton persona 64 pcs', NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, 0, 175500, NULL, NULL, NULL, 7124)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 3000007, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21000, 0, NULL, NULL, NULL, 7125)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 12000001, 3000007, N'Opening m rafiqe cky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 21000, NULL, NULL, NULL, 7126)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 3000008, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100000, 0, NULL, NULL, NULL, 7127)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 12000001, 3000008, N'Opening kashof steel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 100000, NULL, NULL, NULL, 7128)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 3000009, 12000001, N'Opening Entry', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 7129)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 0, 0, 0, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 12000001, 3000009, N'Opening al shames cky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 7130)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3015, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 3, 4000023, N'milton persona 64 pcs', NULL, NULL, NULL, NULL, NULL, 1, 6950, 6950, 0, 0, 0, 6950, 0, NULL, NULL, NULL, 7151)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3015, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 4000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, 5850, 5850, 0, 0, 0, 0, 5850, NULL, NULL, NULL, 7152)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3015, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 14000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, 6950, 6950, 0, 0, 0, 0, 6950, NULL, NULL, NULL, 7153)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3015, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 15000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 5850, 0, 0, 0, 5850, 0, NULL, NULL, NULL, 7154)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3016, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 3, 4000023, N'milton persona 64 pcs', NULL, NULL, NULL, NULL, NULL, 5, 6950, 34750, 0, 0, 0, 34750, 0, NULL, NULL, NULL, 7155)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3016, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 4000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 5, 5850, 29250, 0, 0, 0, 0, 29250, NULL, NULL, NULL, 7156)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3016, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 14000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 5, 6950, 34750, 0, 0, 0, 0, 34750, NULL, NULL, NULL, 7157)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3016, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 15000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 5, NULL, 29250, 0, 0, 0, 29250, 0, NULL, NULL, NULL, 7158)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3016, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 3, 4000020, N'bloom xl', NULL, NULL, NULL, NULL, NULL, 5, 2650, 13250, 0, 0, 0, 13250, 0, NULL, NULL, NULL, 7159)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3016, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 4000020, 3, N'', NULL, NULL, NULL, NULL, NULL, 5, 2350, 11750, 0, 0, 0, 0, 11750, NULL, NULL, NULL, 7160)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3016, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 14000020, 3, N'', NULL, NULL, NULL, NULL, NULL, 5, 2650, 13250, 0, 0, 0, 0, 13250, NULL, NULL, NULL, 7161)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3016, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 15000020, 3, N'', NULL, NULL, NULL, NULL, NULL, 5, NULL, 11750, 0, 0, 0, 11750, 0, NULL, NULL, NULL, 7162)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3017, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 3, 4000006, N'miltan moment', NULL, NULL, NULL, NULL, NULL, 1, 6500, 6500, 0, 0, 20, 6480, 0, NULL, NULL, NULL, 7163)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3017, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 4000006, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, 5000, 5000, 0, 0, 0, 0, 5000, NULL, NULL, NULL, 7164)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3017, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 14000006, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, 6500, 6500, 0, 0, 20, 0, 6480, NULL, NULL, NULL, 7165)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3017, NULL, 5, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 15000006, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 5000, 0, 0, 0, 5000, 0, NULL, NULL, NULL, 7166)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 15, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 9000003, 1000001, N'', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2500, 0, NULL, NULL, NULL, 7167)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3, NULL, 15, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 1000001, 9000003, N'', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2500, NULL, NULL, NULL, 7168)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 7017, NULL, 2, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 9, 4000006, N'miltan moment', NULL, 2, NULL, NULL, 65, NULL, NULL, 5400, 0, 0, 0, 0, 5400, NULL, NULL, NULL, 7169)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 7017, NULL, 2, CAST(N'2021-03-13' AS Date), NULL, NULL, NULL, 4000006, 9, N'dm w', NULL, 2, NULL, NULL, 65, NULL, NULL, 5400, 0, 0, 0, 5400, 0, NULL, NULL, NULL, 7170)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3018, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3, 4000023, N'milton persona 64 pcs', NULL, NULL, NULL, NULL, NULL, 2, 6950, 13900, 0, 0, 0, 13900, 0, NULL, NULL, NULL, 7171)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3018, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 2, 5850, 11700, 0, 0, 0, 0, 11700, NULL, NULL, NULL, 7172)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3018, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 2, 6950, 13900, 0, 0, 0, 0, 13900, NULL, NULL, NULL, 7173)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3018, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 2, NULL, 11700, 0, 0, 0, 11700, 0, NULL, NULL, NULL, 7174)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3019, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3, 4000002, N'shahzaib', NULL, NULL, NULL, NULL, NULL, 1, 230, 230, 0, 0, 0, 230, 0, NULL, NULL, NULL, 7175)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3019, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000002, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, 131.29629629629631, 131.296296296296, 0, 0, 0, 0, 131.296296296296, NULL, NULL, NULL, 7176)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3019, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000002, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, 230, 230, 0, 0, 0, 0, 230, NULL, NULL, NULL, 7177)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3019, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000002, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 131.296296296296, 0, 0, 0, 131.296296296296, 0, NULL, NULL, NULL, 7178)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3019, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 1, 3, N'cash received ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 230, 0, NULL, NULL, NULL, 7179)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3019, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3, 3, N' has paid cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 230, NULL, NULL, NULL, 7180)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3020, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 1, 4000001, N'Panadol', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 40, 0, NULL, NULL, NULL, 7181)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3020, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000001, 1, N'', NULL, NULL, NULL, NULL, NULL, 1, 4.6984383003486991, 4.6984383003487, 0, 0, 0, 0, 4.6984383003487, NULL, NULL, NULL, 7182)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3020, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000001, 1, N'', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 0, 40, NULL, NULL, NULL, 7183)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3020, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000001, 1, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 4.6984383003487, 0, 0, 0, 4.6984383003487, 0, NULL, NULL, NULL, 7184)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3021, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3, 4000002, N'shahzaib', NULL, NULL, NULL, NULL, NULL, 1, 450, 450, 0, 0, 0, 450, 0, NULL, NULL, NULL, 7185)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3021, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000002, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, 131.29629629629631, 131.296296296296, 0, 0, 0, 0, 131.296296296296, NULL, NULL, NULL, 7186)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3021, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000002, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, 450, 450, 0, 0, 0, 0, 450, NULL, NULL, NULL, 7187)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3021, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000002, 3, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 131.296296296296, 0, 0, 0, 131.296296296296, 0, NULL, NULL, NULL, 7188)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3021, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 1000001, 3, N'cash received ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450, 0, NULL, NULL, NULL, 7189)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3021, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3, 3, N' has paid cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 450, NULL, NULL, NULL, 7190)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3022, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3, 4000006, N'miltan moment', NULL, NULL, NULL, NULL, NULL, 2, 6500, 13000, 0, 0, 20, 12980, 0, NULL, NULL, NULL, 7191)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3022, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000006, 3, N'', NULL, NULL, NULL, NULL, NULL, 2, 5020, 10040, 0, 0, 0, 0, 10040, NULL, NULL, NULL, 7192)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3022, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000006, 3, N'', NULL, NULL, NULL, NULL, NULL, 2, 6500, 13000, 0, 0, 20, 0, 12980, NULL, NULL, NULL, 7193)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3022, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000006, 3, N'', NULL, NULL, NULL, NULL, NULL, 2, NULL, 10040, 0, 0, 0, 10040, 0, NULL, NULL, NULL, 7194)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3023, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3, 4000023, N'milton persona 64 pcs', NULL, NULL, NULL, NULL, NULL, 2, 6950, 13900, 0, 0, 0, 13900, 0, NULL, NULL, NULL, 7195)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3023, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 2, 5850, 11700, 0, 0, 0, 0, 11700, NULL, NULL, NULL, 7196)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3023, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 2, 6950, 13900, 0, 0, 0, 0, 13900, NULL, NULL, NULL, 7197)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3023, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000023, 3, N'', NULL, NULL, NULL, NULL, NULL, 2, NULL, 11700, 0, 0, 0, 11700, 0, NULL, NULL, NULL, 7198)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3023, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 1000001, 3, N'cash received ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13900, 0, NULL, NULL, NULL, 7199)
GO
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 3023, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3, 3, N' has paid cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 13900, NULL, NULL, NULL, 7200)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4010, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3000004, 4000023, N'milton persona 64 pcs', NULL, NULL, NULL, NULL, NULL, 3, 6950, 20850, 0, 0, 0, 20850, 0, NULL, NULL, NULL, 8113)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4010, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000023, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 3, 5850, 17550, 0, 0, 0, 0, 17550, NULL, NULL, NULL, 8114)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4010, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000023, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 3, 6950, 20850, 0, 0, 0, 0, 20850, NULL, NULL, NULL, 8115)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4010, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000023, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 3, NULL, 17550, 0, 0, 0, 17550, 0, NULL, NULL, NULL, 8116)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4010, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 1000001, 3000004, N' has paid cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20850, 0, NULL, NULL, NULL, 8117)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4010, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3000004, 1000001, N' has paid cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 20850, NULL, NULL, NULL, 8118)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4011, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3000004, 4000006, N'miltan moment', NULL, NULL, NULL, NULL, NULL, 1, 6500, 6500, 0, 0, 20, 6480, 0, NULL, NULL, NULL, 8119)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4011, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000006, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, 5020, 5020, 0, 0, 0, 0, 5020, NULL, NULL, NULL, 8120)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4011, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000006, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, 6500, 6500, 0, 0, 20, 0, 6480, NULL, NULL, NULL, 8121)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4011, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000006, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 5020, 0, 0, 0, 5020, 0, NULL, NULL, NULL, 8122)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4011, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3000004, 4000008, N'asdfg', NULL, NULL, NULL, NULL, NULL, 1, 6500, 6500, 0, 0, 20, 6480, 0, NULL, NULL, NULL, 8123)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4011, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000008, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, 40, 40, 0, 0, 0, 0, 40, NULL, NULL, NULL, 8124)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4011, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000008, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, 6500, 6500, 0, 0, 20, 0, 6480, NULL, NULL, NULL, 8125)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4011, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000008, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 40, 0, 0, 0, 40, 0, NULL, NULL, NULL, 8126)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4012, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 1000001, 4000023, N'milton persona 64 pcs', NULL, NULL, NULL, NULL, NULL, 1, 6950, 6950, 0, 0, 0, 6950, 0, NULL, NULL, NULL, 8127)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4012, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000023, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 5850, 5850, 0, 0, 0, 0, 5850, NULL, NULL, NULL, 8128)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4012, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000023, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 6950, 6950, 0, 0, 0, 0, 6950, NULL, NULL, NULL, 8129)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4012, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000023, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 5850, 0, 0, 0, 5850, 0, NULL, NULL, NULL, 8130)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4012, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 1000001, 4000010, N'mnbvc', NULL, NULL, NULL, NULL, NULL, 1, 6950, 6950, 0, 0, 0, 6950, 0, NULL, NULL, NULL, 8131)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4012, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000010, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 30, 30, 0, 0, 0, 0, 30, NULL, NULL, NULL, 8132)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4012, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000010, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 6950, 6950, 0, 0, 0, 0, 6950, NULL, NULL, NULL, 8133)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4012, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000010, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 30, 0, 0, 0, 30, 0, NULL, NULL, NULL, 8134)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4013, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3000004, 4000023, N'milton persona 64 pcs', NULL, NULL, NULL, NULL, NULL, 1, 6950, 6950, 0, 0, 0, 6950, 0, NULL, NULL, NULL, 8135)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4013, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000023, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, 5850, 5850, 0, 0, 0, 0, 5850, NULL, NULL, NULL, 8136)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4013, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000023, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, 6950, 6950, 0, 0, 0, 0, 6950, NULL, NULL, NULL, 8137)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4013, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000023, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 5850, 0, 0, 0, 5850, 0, NULL, NULL, NULL, 8138)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4013, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3000004, 4000010, N'mnbvc', NULL, NULL, NULL, NULL, NULL, 1, 6950, 6950, 0, 0, 0, 6950, 0, NULL, NULL, NULL, 8139)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4013, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 4000010, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, 30, 30, 0, 0, 0, 0, 30, NULL, NULL, NULL, 8140)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4013, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 14000010, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, 6950, 6950, 0, 0, 0, 0, 6950, NULL, NULL, NULL, 8141)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4013, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 15000010, 3000004, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 30, 0, 0, 0, 30, 0, NULL, NULL, NULL, 8142)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4013, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 1000001, 3000004, N' has paid cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13900, 0, NULL, NULL, NULL, 8143)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4013, NULL, 5, CAST(N'2021-03-14' AS Date), NULL, NULL, NULL, 3000004, 1000001, N' has paid cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 13900, NULL, NULL, NULL, 8144)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4014, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 1000001, 4000003, N'umair', NULL, NULL, NULL, NULL, NULL, 1, 200, 600, 0, 0, 0, 600, 0, NULL, NULL, NULL, 8145)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4014, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 4000003, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 124.22839506172834, 124.228395061728, 0, 0, 0, 0, 124.228395061728, NULL, NULL, NULL, 8146)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4014, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 14000003, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 1, 200, 600, 0, 0, 0, 0, 600, NULL, NULL, NULL, 8147)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4014, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 15000003, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 124.228395061728, 0, 0, 0, 124.228395061728, 0, NULL, NULL, NULL, 8148)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4017, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 1000001, 4000003, N'umair', NULL, NULL, NULL, NULL, NULL, 1, 200, 400, 0, 0, 0, 400, 0, NULL, NULL, NULL, 8149)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4017, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 4000003, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 2, 124.22839506172834, 124.228395061728, 0, 0, 0, 0, 124.228395061728, NULL, NULL, NULL, 8150)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4017, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 14000003, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 2, 200, 400, 0, 0, 0, 0, 400, NULL, NULL, NULL, 8151)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 4017, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 15000003, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 1, NULL, 248.456790123456, 0, 0, 0, 248.456790123456, 0, NULL, NULL, NULL, 8152)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5010, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 1000001, 4000003, N'umair', NULL, NULL, NULL, NULL, NULL, 2, 200, 400, 0, 0, 0, 400, 0, NULL, NULL, NULL, 9113)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5010, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 4000003, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 2, 124.22839506172834, 248.456790123456, 0, 0, 0, 0, 248.456790123456, NULL, NULL, NULL, 9114)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5010, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 14000003, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 2, 200, 400, 0, 0, 0, 0, 400, NULL, NULL, NULL, 9115)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 5010, NULL, 5, CAST(N'2021-03-16' AS Date), NULL, NULL, NULL, 15000003, 1000001, N'', NULL, NULL, NULL, NULL, NULL, 2, NULL, 248.456790123456, 0, 0, 0, 248.456790123456, 0, NULL, NULL, NULL, 9116)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 8017, NULL, 2, CAST(N'2021-03-17' AS Date), NULL, NULL, NULL, 3, 4000001, N'Panadol', NULL, 2, NULL, NULL, 32, NULL, NULL, 400, 0, 0, 0, 0, 400, NULL, NULL, NULL, 9117)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 8017, NULL, 2, CAST(N'2021-03-17' AS Date), NULL, NULL, NULL, 4000001, 3, N'shahzaib', NULL, 2, NULL, NULL, 32, NULL, NULL, 400, 0, 0, 0, 400, 0, NULL, NULL, NULL, 9118)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 8017, NULL, 2, CAST(N'2021-03-17' AS Date), NULL, NULL, NULL, 1000001, 3, N' has paid cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 400, NULL, NULL, NULL, 9119)
INSERT [dbo].[GL] ([SRT], [RID], [RID2], [TypeCode], [GLDate], [DueDT], [CompID], [SID], [AC_Code], [AC_Code2], [Narration], [Rem], [MOP_ID], [ChkNo], [SlipNo], [Qty_IN], [Qty_Out], [IPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Debit], [Credit], [VehNo], [Post_User_ID], [Post_Date], [GL_id]) VALUES (NULL, 8017, NULL, 2, CAST(N'2021-03-17' AS Date), NULL, NULL, NULL, 3, 1000001, N' has paid cash', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 400, 0, NULL, NULL, NULL, 9120)
SET IDENTITY_INSERT [dbo].[GL] OFF
SET IDENTITY_INSERT [dbo].[I_Unit] ON 

INSERT [dbo].[I_Unit] ([unit_id], [IUnit], [active], [crtBy], [crtDate], [modBy], [modDate], [CompanyID]) VALUES (1, N'KG', 0, N'', CAST(N'2021-01-21 19:51:23.887' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[I_Unit] ([unit_id], [IUnit], [active], [crtBy], [crtDate], [modBy], [modDate], [CompanyID]) VALUES (2, N'Ctn', 0, N'', CAST(N'2021-01-21 19:52:16.723' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[I_Unit] OFF
SET IDENTITY_INSERT [dbo].[IComp_M] ON 

INSERT [dbo].[IComp_M] ([CompID], [Comp], [CShort], [Address], [Tel], [Eml], [isDelete]) VALUES (1, N'shahzaib', N'sh', N'jkjhkjhkjh', N'wewewewe', N'wewewewe', 1)
INSERT [dbo].[IComp_M] ([CompID], [Comp], [CShort], [Address], [Tel], [Eml], [isDelete]) VALUES (2, N'shahzaib222', N'dddd', N'house', NULL, NULL, 1)
INSERT [dbo].[IComp_M] ([CompID], [Comp], [CShort], [Address], [Tel], [Eml], [isDelete]) VALUES (3, N'nayab', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[IComp_M] OFF
SET IDENTITY_INSERT [dbo].[Item_Maker] ON 

INSERT [dbo].[Item_Maker] ([MakerId], [Name], [Address], [CompanyID]) VALUES (1, N'amazil', N'', 0)
SET IDENTITY_INSERT [dbo].[Item_Maker] OFF
SET IDENTITY_INSERT [dbo].[Itemledger] ON 

INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-01-21 21:23:29.9913131' AS DateTime2), 12000001, 1, 1, 1, 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 1)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 3016, CAST(N'2021-01-28 17:43:12.5613614' AS DateTime2), 9000001, 1, NULL, 1, NULL, CAST(N'2021-02-01 00:00:00.0000000' AS DateTime2), 1, 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12.5, NULL, NULL, NULL, NULL, 400, 0, 0, NULL, 400, NULL, NULL, 2)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-01-29 18:42:09.0921158' AS DateTime2), 12000001, 1, 1, 2, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 1002)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4016, CAST(N'2021-01-31 18:31:54.7683956' AS DateTime2), 9000001, 1, NULL, 1, NULL, CAST(N'1900-01-01 00:00:00.0000000' AS DateTime2), 1, 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14.0625, NULL, NULL, NULL, NULL, 500, 10, 50, NULL, 450, NULL, NULL, 1003)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-01-31 18:37:05.6685833' AS DateTime2), 12000001, 1, 1, 3, 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 1004)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4017, CAST(N'2021-02-04 18:07:03.7117734' AS DateTime2), 9000002, 1, NULL, 1, NULL, CAST(N'1900-01-01 00:00:00.0000000' AS DateTime2), 1, 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9.375, NULL, NULL, NULL, NULL, 300, 0, 0, NULL, 300, NULL, NULL, 1005)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4017, CAST(N'2021-02-04 18:07:19.3409112' AS DateTime2), 9000002, 1, NULL, 2, NULL, CAST(N'1900-01-01 00:00:00.0000000' AS DateTime2), 2, 2, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200, NULL, NULL, NULL, NULL, 400, 0, 0, NULL, 400, NULL, NULL, 1006)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4018, CAST(N'2021-02-04 18:15:39.4678375' AS DateTime2), 9000002, 1, NULL, 1, NULL, CAST(N'2021-02-04 18:14:12.0000000' AS DateTime2), 1, 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.29, NULL, NULL, NULL, NULL, 9.375, 0, 0, NULL, 0.29, NULL, NULL, 1007)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4018, CAST(N'2021-02-04 18:16:06.1172609' AS DateTime2), 9000002, 1, NULL, 2, NULL, CAST(N'2021-02-04 18:14:12.0000000' AS DateTime2), 2, 2, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, NULL, 200, 0, 0, NULL, 100, NULL, NULL, 1008)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4018, CAST(N'2021-02-04 18:16:09.0696575' AS DateTime2), 9000002, 1, NULL, 3, NULL, CAST(N'2021-02-04 00:00:00.0000000' AS DateTime2), 2, 2, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250, NULL, NULL, NULL, NULL, 500, 0, 0, NULL, 500, NULL, NULL, 1009)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4019, CAST(N'2021-02-04 18:21:10.8891660' AS DateTime2), 9000002, 1, NULL, 1, NULL, CAST(N'1900-01-01 00:00:00.0000000' AS DateTime2), 1, 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12.5, NULL, NULL, NULL, NULL, 400, 0, 0, NULL, 400, NULL, NULL, 1010)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4019, CAST(N'2021-02-04 18:21:14.1449863' AS DateTime2), 9000002, 1, NULL, 3, NULL, CAST(N'1900-01-01 00:00:00.0000000' AS DateTime2), 3, 2, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500, NULL, NULL, NULL, NULL, 1000, 0, 0, NULL, 1000, NULL, NULL, 1011)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4020, CAST(N'2021-02-04 18:43:38.5719862' AS DateTime2), 9000001, 1, NULL, 1, NULL, CAST(N'2021-02-04 18:41:13.0000000' AS DateTime2), 1, 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.01, NULL, NULL, NULL, NULL, 0.39, 0, 0, NULL, 0.01, NULL, NULL, 1015)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4020, CAST(N'2021-02-04 18:43:54.1839127' AS DateTime2), 9000001, 1, NULL, 3, NULL, CAST(N'2021-02-04 18:41:13.0000000' AS DateTime2), 3, 2, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 125, NULL, NULL, NULL, NULL, 250, 0, 0, NULL, 125, NULL, NULL, 1016)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4020, CAST(N'2021-02-04 18:43:56.3569079' AS DateTime2), 9000001, 1, NULL, 2, NULL, CAST(N'2021-02-04 18:41:13.0000000' AS DateTime2), 3, 2, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL, 150, 0, 0, NULL, 75, NULL, NULL, 1017)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 4021, CAST(N'2021-02-04 20:33:19.2995661' AS DateTime2), 9000001, 1, NULL, 1, NULL, CAST(N'2021-02-04 20:31:59.0000000' AS DateTime2), 2, 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.11, NULL, NULL, NULL, NULL, 6.9375, 0, 0, NULL, 0.11, NULL, NULL, 1019)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2, CAST(N'2021-02-05 20:43:30.6176852' AS DateTime2), 3000001, 1, NULL, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.2938112284024, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 2005)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2, CAST(N'2021-02-05 20:43:30.9926389' AS DateTime2), 3000001, 1, NULL, 2, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52.1604938271605, 30, NULL, NULL, NULL, NULL, 2, 0.6, 2, 27.4, NULL, NULL, 2006)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3, CAST(N'2021-02-06 16:53:47.3009411' AS DateTime2), 3000002, 1, NULL, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.2938112284024, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 2007)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3, CAST(N'2021-02-06 16:53:47.6446651' AS DateTime2), 3000002, 1, NULL, 2, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52.1604938271605, 30, NULL, NULL, NULL, NULL, 2, 0.6, 2, 27.4, NULL, NULL, 2008)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3, CAST(N'2021-02-06 16:53:47.9102746' AS DateTime2), 3000002, 1, NULL, 3, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124.228395061728, 30, NULL, NULL, NULL, NULL, 2, 0.6, 2, 27.4, NULL, NULL, 2009)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 1, CAST(N'2021-02-06 17:07:48.9688424' AS DateTime2), 3000001, 1, NULL, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.2938112284024, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 2010)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 1, CAST(N'2021-02-06 17:07:49.3594314' AS DateTime2), 3000001, 1, NULL, 3, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124.228395061728, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 2011)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 1, CAST(N'2021-02-06 17:07:49.6250550' AS DateTime2), 3000001, 1, NULL, 2, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52.1604938271605, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 2012)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-02-11 16:38:30.5615814' AS DateTime2), 12000001, 1, 1, 5, 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 2013)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 5018, CAST(N'2021-02-11 17:12:04.8992237' AS DateTime2), 9000001, 1, NULL, 1, NULL, CAST(N'1900-01-01 00:00:00.0000000' AS DateTime2), 1, 29, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6.77966101694915, NULL, NULL, NULL, NULL, 400, 0, 0, NULL, 400, NULL, NULL, 2014)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 5018, CAST(N'2021-02-11 17:12:08.0747595' AS DateTime2), 9000001, 1, NULL, 2, NULL, CAST(N'1900-01-01 00:00:00.0000000' AS DateTime2), 2, 2, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250, NULL, NULL, NULL, NULL, 500, 0, 0, NULL, 500, NULL, NULL, 2015)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 5020, CAST(N'2021-02-11 17:18:21.4371370' AS DateTime2), 9000001, 1, NULL, 4, NULL, CAST(N'1900-01-01 00:00:00.0000000' AS DateTime2), 1, 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12.5, NULL, NULL, NULL, NULL, 400, 0, 0, NULL, 400, NULL, NULL, 2016)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 4, CAST(N'2021-02-11 17:25:47.0972150' AS DateTime2), 3000001, 1, NULL, 3, NULL, NULL, 0, 2, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124.228395061728, 30, NULL, NULL, NULL, NULL, 0, 0, 0, 60, NULL, NULL, 2018)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 5, CAST(N'2021-02-11 17:44:11.8662451' AS DateTime2), 3000001, 1, NULL, 3, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124.228395061728, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 2019)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 6, CAST(N'2021-02-11 17:47:11.6728335' AS DateTime2), 3000001, 1, NULL, 2, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 131.296296296296, 20, NULL, NULL, NULL, NULL, 0, 0, 0, 20, NULL, NULL, 2020)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 7, CAST(N'2021-02-12 16:48:25.2729606' AS DateTime2), 3000001, 1, NULL, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.83507378804173, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 1240, NULL, NULL, 2021)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 1002, CAST(N'2021-02-20 18:45:45.3836279' AS DateTime2), 3000001, 1, NULL, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.83507378804173, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 1240, NULL, NULL, 3005)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 1002, CAST(N'2021-02-20 18:45:45.9087806' AS DateTime2), 3000001, 1, NULL, 3, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124.228395061728, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 80, NULL, NULL, 3006)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-02-23 13:37:03.4261181' AS DateTime2), 12000001, 1, 1, 1004, 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 4005)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2002, CAST(N'2021-02-23 13:45:48.8696637' AS DateTime2), 3000001, 1, NULL, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.83507378804173, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 4006)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-02-25 02:38:08.3809581' AS DateTime2), 12000001, 1, 1, 1005, 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 4007)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-02-25 02:40:43.3328634' AS DateTime2), 12000001, 1, 1, 1006, 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 4008)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-02-25 02:44:12.3653098' AS DateTime2), 12000001, 1, 1, 1007, 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 4009)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-02-25 02:53:32.1267176' AS DateTime2), 12000001, 1, 1, 1008, 1, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 4010)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-02-25 03:35:38.7178386' AS DateTime2), 12000001, 1, 1, 1009, 1, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 4011)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2003, CAST(N'2021-02-25 03:37:57.5509939' AS DateTime2), 3000002, 1, NULL, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.83507378804173, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 1240, NULL, NULL, 4012)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2004, CAST(N'2021-02-25 03:42:35.2977713' AS DateTime2), 3000002, 1, NULL, 2, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 131.296296296296, 300, NULL, NULL, NULL, NULL, 0, 0, 0, 600, NULL, NULL, 4013)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2005, CAST(N'2021-02-25 03:43:57.3131889' AS DateTime2), 3000002, 1, NULL, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.83507378804173, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 4014)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2007, CAST(N'2021-02-25 03:46:05.9076639' AS DateTime2), 3000002, 1, NULL, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.83507378804173, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 4016)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2008, CAST(N'2021-02-25 03:46:38.8735076' AS DateTime2), 3000002, 1, NULL, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.83507378804173, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 4017)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2009, CAST(N'2021-02-25 03:49:35.7709222' AS DateTime2), 3000002, 1, NULL, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2.83507378804173, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 4018)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-02-25 04:08:06.4447146' AS DateTime2), 12000001, 1, 1, 1010, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 4019)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-02-27 18:13:09.0982084' AS DateTime2), 12000001, 1, 1, 1011, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 4020)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-02-27 18:15:10.0953524' AS DateTime2), 12000001, 1, 1, 1012, 1, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 4021)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 6017, CAST(N'2021-03-03 17:55:09.0893762' AS DateTime2), 9000001, 1, NULL, 1, NULL, CAST(N'1900-01-01 00:00:00.0000000' AS DateTime2), 2, 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15.625, NULL, NULL, NULL, NULL, 500, 0, 0, NULL, 500, NULL, NULL, 4022)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-03-08 22:24:16.8773587' AS DateTime2), 12000001, 1, 1, 1013, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 4023)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2010, CAST(N'2021-03-09 02:02:12.9902205' AS DateTime2), 3000001, 1, NULL, 1, NULL, NULL, 0, 4, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4.6984383003487, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 160, NULL, NULL, 4024)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2010, CAST(N'2021-03-09 02:02:13.1337839' AS DateTime2), 3000001, 1, NULL, 3, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124.228395061728, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, NULL, 4025)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 2010, CAST(N'2021-03-09 02:02:13.1863482' AS DateTime2), 3000001, 1, NULL, 2, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 131.296296296296, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 4026)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-03-11 17:37:44.1928610' AS DateTime2), 12000001, 1, 1, 2013, 1, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 5022)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-03-11 18:08:22.0166891' AS DateTime2), 12000001, 1, 1, 2014, 1, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 5023)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-03-11 18:10:49.0627384' AS DateTime2), 12000001, 1, 1, 2015, 1, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 5024)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-03-13 14:44:48.6983281' AS DateTime2), 12000001, 1, 1, 3013, 1, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 6022)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-03-13 14:47:14.3808250' AS DateTime2), 12000001, 1, 1, 3014, 1, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 6023)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-03-13 14:47:53.2587614' AS DateTime2), 12000001, 1, 1, 3015, 1, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 6024)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 0, 0, CAST(N'2021-03-13 14:48:43.3602978' AS DateTime2), 12000001, 1, 1, 3016, 1, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, 6025)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3015, CAST(N'2021-03-13 15:01:35.9406377' AS DateTime2), 3, 1, NULL, 3016, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5850, 6950, NULL, NULL, NULL, NULL, 0, 0, 0, 6950, NULL, NULL, 6031)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3016, CAST(N'2021-03-13 15:02:51.6857289' AS DateTime2), 3, 1, NULL, 3016, NULL, NULL, 0, 5, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5850, 6950, NULL, NULL, NULL, NULL, 0, 0, 0, 34750, NULL, NULL, 6032)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3016, CAST(N'2021-03-13 15:02:54.3950755' AS DateTime2), 3, 1, NULL, 3013, NULL, NULL, 0, 5, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2350, 2650, NULL, NULL, NULL, NULL, 0, 0, 0, 13250, NULL, NULL, 6033)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3017, CAST(N'2021-03-13 15:11:32.0072783' AS DateTime2), 3, 1, NULL, 1004, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5000, 6500, NULL, NULL, NULL, NULL, 0, 0, 20, 6480, NULL, NULL, 6034)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 7017, CAST(N'2021-03-13 15:36:21.8842462' AS DateTime2), 9, 1, NULL, 1004, NULL, CAST(N'1900-01-01 00:00:00.0000000' AS DateTime2), 0, 1, NULL, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5400, NULL, NULL, NULL, NULL, 5400, 0, 0, NULL, 5400, NULL, NULL, 6035)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3018, CAST(N'2021-03-14 15:44:18.8747860' AS DateTime2), 3, 1, NULL, 3016, NULL, NULL, 0, 2, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5850, 6950, NULL, NULL, NULL, NULL, 0, 0, 0, 13900, NULL, NULL, 6036)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3019, CAST(N'2021-03-14 15:45:47.8698442' AS DateTime2), 3, 1, NULL, 2, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 131.296296296296, 230, NULL, NULL, NULL, NULL, 0, 0, 0, 230, NULL, NULL, 6037)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3020, CAST(N'2021-03-14 15:52:45.1833869' AS DateTime2), 1, 1, NULL, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4.6984383003487, 40, NULL, NULL, NULL, NULL, 0, 0, 0, 40, NULL, NULL, 6038)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3021, CAST(N'2021-03-14 15:53:44.1698133' AS DateTime2), 3, 1, NULL, 2, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 131.296296296296, 450, NULL, NULL, NULL, NULL, 0, 0, 0, 450, NULL, NULL, 6039)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3022, CAST(N'2021-03-14 16:05:22.7762263' AS DateTime2), 3, 1, NULL, 1004, NULL, NULL, 0, 2, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5020, 6500, NULL, NULL, NULL, NULL, 0, 0, 20, 12980, NULL, NULL, 6040)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 3023, CAST(N'2021-03-14 16:06:18.9047770' AS DateTime2), 3, 1, NULL, 3016, NULL, NULL, 0, 2, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5850, 6950, NULL, NULL, NULL, NULL, 0, 0, 0, 13900, NULL, NULL, 6041)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 4010, CAST(N'2021-03-14 19:04:07.6469114' AS DateTime2), 3000004, 1, NULL, 3016, NULL, NULL, 0, 3, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5850, 6950, NULL, NULL, NULL, NULL, 0, 0, 0, 20850, NULL, NULL, 7022)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 4011, CAST(N'2021-03-14 19:07:29.1493079' AS DateTime2), 3000004, 1, NULL, 1004, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5020, 6500, NULL, NULL, NULL, NULL, 0, 0, 20, 6480, NULL, NULL, 7023)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 4011, CAST(N'2021-03-14 19:07:29.3678778' AS DateTime2), 3000004, 1, NULL, 1006, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, 6500, NULL, NULL, NULL, NULL, 0, 0, 20, 6480, NULL, NULL, 7024)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 4012, CAST(N'2021-03-14 19:09:37.8823726' AS DateTime2), 1000001, 1, NULL, 3016, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5850, 6950, NULL, NULL, NULL, NULL, 0, 0, 0, 6950, NULL, NULL, 7025)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 4012, CAST(N'2021-03-14 19:09:38.0854857' AS DateTime2), 1000001, 1, NULL, 1008, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 6950, NULL, NULL, NULL, NULL, 0, 0, 0, 6950, NULL, NULL, 7026)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 4013, CAST(N'2021-03-14 19:10:47.3452627' AS DateTime2), 3000004, 1, NULL, 3016, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5850, 6950, NULL, NULL, NULL, NULL, 0, 0, 0, 6950, NULL, NULL, 7027)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 4013, CAST(N'2021-03-14 19:10:47.5796024' AS DateTime2), 3000004, 1, NULL, 1008, NULL, NULL, 0, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 6950, NULL, NULL, NULL, NULL, 0, 0, 0, 6950, NULL, NULL, 7028)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 4014, CAST(N'2021-03-16 18:44:01.1060288' AS DateTime2), 1000001, 1, NULL, 3, NULL, NULL, 2, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124.228395061728, 200, NULL, NULL, NULL, NULL, 0, 0, 0, 600, NULL, NULL, 7029)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 4017, CAST(N'2021-03-16 19:02:27.1004103' AS DateTime2), 1000001, 1, NULL, 3, NULL, NULL, 1, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124.228395061728, 200, NULL, NULL, NULL, NULL, 0, 0, 0, 400, NULL, NULL, 7031)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 5, 5010, CAST(N'2021-03-16 20:25:40.1874228' AS DateTime2), 1000001, 1, NULL, 3, NULL, NULL, 1, 1, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124.228395061728, 200, NULL, NULL, NULL, NULL, 0, 0, 0, 400, NULL, NULL, 8022)
INSERT [dbo].[Itemledger] ([SRT], [TypeCode], [RID], [EDate], [AC_CODE], [WID], [SID], [IID], [BNID], [ExpDT], [CTN], [PCS], [OPN], [PJ], [PRJ], [SJ], [SRJ], [SCH_IN], [SCH_Out], [SCH_Out2], [ADJ_IN], [ADJ_OUT], [TR_IN], [TR_OUT], [MFG_IN], [MFG_OUT], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [Amt2], [RCancel], [LegderId]) VALUES (NULL, 2, 8017, CAST(N'2021-03-17 16:40:42.1481735' AS DateTime2), 3, 1, NULL, 1, NULL, CAST(N'1900-01-01 00:00:00.0000000' AS DateTime2), 1, 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12.5, NULL, NULL, NULL, NULL, 400, 0, 0, NULL, 400, NULL, NULL, 8023)
SET IDENTITY_INSERT [dbo].[Itemledger] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (1, N'Panadol', N'', 1, 0, 1, NULL, 1, 30, 30, 40, 30, NULL, 20, 30, NULL, 4000001, 14000001, 15000001, 0, 0, NULL, 1, 1, 1, N'462275', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 6.15837967104368, 22, 1, 1)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (2, N'shahzaib', N'', 0, 0, 0, NULL, 1, 0, 0, 0, 0, NULL, 0, 0, NULL, 4000002, 14000002, 15000002, 0, 0, NULL, 1, 1, 1, N'245109', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 131.29629629629631, 0, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (3, N'umair', N'', 1, 0, 0, NULL, 1, 0, 30, 0, 30, NULL, 20, 30, NULL, 4000003, 14000003, 15000003, 0, 0, NULL, 1, 0, 0, N'803261', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 124.22839506172834, 30, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (4, N'sh', N'', 1, 0, 0, NULL, 1, 30, 30, 100, 100, NULL, 1, 30, NULL, 4000004, 14000004, 15000004, 0, 0, NULL, 1, 0, 1, N'632446', CAST(10.00 AS Decimal(20, 2)), CAST(10.00 AS Decimal(20, 2)), 12.5, 1, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (5, N'shahz', N'', 2, 1, 0, NULL, 0, 30, 10, 30, 10, NULL, 20, 10, NULL, 4000005, 14000005, 15000005, 0, 0, NULL, 1, 0, 0, N'932639', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 10, 10, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (1004, N'miltan moment', N'', 2, 0, 1, NULL, 1, 64, 5000, 6500, 6500, NULL, 20, 5000, NULL, 4000006, 14000006, 15000006, 0, 0, NULL, 1, 1, 1, N'521860', CAST(0.00 AS Decimal(20, 2)), CAST(20.00 AS Decimal(20, 2)), 5020, 5, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (1005, N'abc', N'', 1, 0, 1, NULL, 1, 1, 30, 50, 50, NULL, 20, 30, NULL, 4000007, 14000007, 15000007, 0, 0, NULL, 1, 1, 1, N'519219', CAST(10.00 AS Decimal(20, 2)), CAST(10.00 AS Decimal(20, 2)), 30, 0, 2, 2)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (1006, N'asdfg', N'', 1, 0, 1, NULL, 1, 0, 40, 50, 50, NULL, 20, 40, NULL, 4000008, 14000008, 15000008, 0, 0, NULL, 1, 1, 1, N'986392', CAST(10.00 AS Decimal(20, 2)), CAST(20.00 AS Decimal(20, 2)), 40, 0, 1, 1)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (1007, N'rtyu', N'', 1, 0, 1, NULL, 1, 1, 30, 45, 45, NULL, 20, 30, NULL, 4000009, 14000009, 15000009, 0, 0, NULL, 1, 1, 1, N'227304', CAST(10.00 AS Decimal(20, 2)), CAST(10.00 AS Decimal(20, 2)), 30, 0, 1, 1)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (1008, N'mnbvc', N'', 1, 0, 1, NULL, 1, 1, 30, 45, 45, NULL, 22, 30, NULL, 4000010, 14000010, 15000010, 0, 0, NULL, 1, 1, 1, N'710664', CAST(10.00 AS Decimal(20, 2)), CAST(10.00 AS Decimal(20, 2)), 30, 0, 1, 1)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (1009, N'jvm', N'', 2, 0, 1, NULL, 2, 1, 33, 45, 45, NULL, 22, 33, NULL, 4000011, 14000011, 15000011, 0, 0, NULL, 1, 1, 1, N'119943', CAST(11.00 AS Decimal(20, 2)), CAST(11.00 AS Decimal(20, 2)), 33, 0, 1, 1)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (1010, N'ggg', N'', 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 4000012, 14000012, 15000012, 0, 0, NULL, 1, 0, 0, N'784923', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 0, 0, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (1011, N'ssss', N'', 0, 0, 0, NULL, 0, 0, 0, 0, 0, NULL, 0, 0, NULL, 4000014, 14000014, 15000014, 0, 0, NULL, 1, 0, 0, N'114032', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 0, 0, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (1012, N'sha', N'', 1, 0, 1, NULL, 1, 20, 30, 45, 45, NULL, 22, 30, NULL, 4000015, 14000015, 15000015, 0, 0, NULL, 1, 1, 1, N'840847', CAST(22.00 AS Decimal(20, 2)), CAST(22.00 AS Decimal(20, 2)), 30, 2, 2, 2)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (1013, N'fhgfhgf', N'', 1, 0, 1, NULL, 1, 0, 333.999, 666.98, 333.999, NULL, 2, 333.999, NULL, 4000016, 14000016, 15000016, 0, 0, NULL, 1, 0, 0, N'596907', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 333.999, 0, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (2013, N'dhgfhgf', N'', 1, 0, 1, NULL, 1, 0, 22.66, 222.4, 22.66, NULL, 33, 22.77, NULL, 4000017, 14000017, 15000017, 0, 0, NULL, 1, 0, 1, N'175269', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 22, 0, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (2014, N'fdgdfg', N'', 0, 0, 0, NULL, 0, 0, 22.55, 22.4, 22.4, NULL, 22, 22.55, NULL, 4000018, 14000018, 15000018, 0, 0, NULL, 1, 0, 0, N'779924', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 22.55, 0, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (2015, N'jlkjlkj', N'', 0, 0, 0, NULL, 0, 1, 30.4, 35.55, 30.4, NULL, 22, 30.4, NULL, 4000019, 14000019, 15000019, 0, 0, NULL, 1, 0, 0, N'822004', CAST(45.56 AS Decimal(20, 2)), CAST(45.66 AS Decimal(20, 2)), 30.4, 0, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (3013, N'bloom xl', N'', 2, 0, 1, NULL, 1, 1, 2350, 2650, 2650, NULL, 50, 2350, NULL, 4000020, 14000020, 15000020, 0, 0, NULL, 1, 0, 0, N'498636', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 2350, 25, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (3014, N'yaris 71 pcs', N'', 2, 0, 1, NULL, 0, 0, 3850, 4850, 4850, NULL, 25, 3850, NULL, 4000021, 14000021, 15000021, 0, 0, NULL, 1, 0, 0, N'713482', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 3850, 10, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (3015, N'aqua', N'', 0, 0, 0, NULL, 0, 0, 2050, 2450, 2450, NULL, 10, 2050, NULL, 4000022, 14000022, 15000022, 0, 0, NULL, 1, 0, 0, N'821903', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 2050, 25, 0, 0)
INSERT [dbo].[Items] ([IID], [IName], [Desc], [Unit_ID], [Inv_YN], [CompID], [BarCode_ID], [SCatID], [CTN_PCK], [PurPrice], [SalesPrice], [RetailPrice], [ICP], [OP_Qty], [OP_Price], [DisContinue], [AC_Code_Inv], [AC_Code_Inc], [AC_Code_Cost], [isDeleted], [CompanyID], [saleTax], [Color], [Size], [ArticleNoID], [BarcodeNo], [DisP], [DisR], [AveragePrice], [Demand], [ArticleTypeId], [Style]) VALUES (3016, N'milton persona 64 pcs', N'', 0, 0, 0, NULL, 0, 0, 5850, 6950, 6950, NULL, 30, 5850, NULL, 4000023, 14000023, 15000023, 0, 0, NULL, 1, 0, 0, N'659633', CAST(0.00 AS Decimal(20, 2)), CAST(0.00 AS Decimal(20, 2)), 5850, 10, 0, 0)
SET IDENTITY_INSERT [dbo].[Items] OFF
SET IDENTITY_INSERT [dbo].[Items_Cat] ON 

INSERT [dbo].[Items_Cat] ([CatID], [Cat], [isDeleted], [CompanyID]) VALUES (1, N'General Item', 0, 0)
INSERT [dbo].[Items_Cat] ([CatID], [Cat], [isDeleted], [CompanyID]) VALUES (2, N'Medicians', 0, 0)
SET IDENTITY_INSERT [dbo].[Items_Cat] OFF
INSERT [dbo].[Items_SCat$] ([SCatID], [SCat], [CatID]) VALUES (1, N'Powder', 1)
INSERT [dbo].[Items_SCat$] ([SCatID], [SCat], [CatID]) VALUES (2, N'Injection', 1)
INSERT [dbo].[Items_SCat$] ([SCatID], [SCat], [CatID]) VALUES (3, N'Drench', 1)
INSERT [dbo].[Items_SCat$] ([SCatID], [SCat], [CatID]) VALUES (4, N'Liquid', 1)
INSERT [dbo].[JV_M] ([RID], [CompID], [EDate], [SID], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (1, 1, CAST(N'2020-07-13 00:00:00.000' AS DateTime), 1, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (37, N'Jan 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (38, N'Feb 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (39, N'Mar 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (40, N'Apr 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (41, N'May 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (42, N'Jun 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (43, N'Jul 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (44, N'Aug 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (45, N'Sep 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (46, N'Oct 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (47, N'Nov 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (48, N'Dec 2020', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (49, N'Jan 2021', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (50, N'Feb 2021', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (51, N'Mar 2021', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (52, N'Apr 2021', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (53, N'May 2021', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (54, N'Jun 2021', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (55, N'Jul 2021', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (56, N'Aug 2021', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (57, N'Sep 2021', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (58, N'Oct 2021', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (59, N'Nov 2021', -1)
INSERT [dbo].[Mon] ([MID], [Mon], [Visible_Flag]) VALUES (60, N'Dec 2021', -1)
SET IDENTITY_INSERT [dbo].[Party_Type] ON 

INSERT [dbo].[Party_Type] ([PType_ID], [Party_Type], [isDeleted], [CompanyID]) VALUES (1, N'Customer', 0, 0)
INSERT [dbo].[Party_Type] ([PType_ID], [Party_Type], [isDeleted], [CompanyID]) VALUES (2, N'Vendor', 0, 0)
SET IDENTITY_INSERT [dbo].[Party_Type] OFF
SET IDENTITY_INSERT [dbo].[Pur_D] ON 

INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (3016, 1, NULL, CAST(N'2021-02-01 00:00:00.000' AS DateTime), 1, 2, NULL, 32, 12.5, 400, 0, 0, 0, 400, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4016, 1, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 1, 2, NULL, 32, 14.0625, 500, 10, 50, 0, 450, NULL, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4017, 1, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 1, 2, NULL, 32, 9.375, 300, 0, 0, 0, 300, NULL, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4017, 2, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 2, 2, NULL, 2, 200, 400, 0, 0, 0, 400, NULL, NULL, 4, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4018, 1, NULL, CAST(N'2021-02-04 18:14:12.000' AS DateTime), 1, 2, NULL, 32, 0.29, 9.375, 0, 0, 0, 0.29, NULL, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4018, 2, NULL, CAST(N'2021-02-04 18:14:12.000' AS DateTime), 2, 2, NULL, 2, 100, 200, 0, 0, 0, 100, NULL, NULL, 6, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4018, 3, NULL, CAST(N'2021-02-04 00:00:00.000' AS DateTime), 2, 2, NULL, 2, 250, 500, 0, 0, 0, 500, NULL, NULL, 7, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4019, 1, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 1, 2, NULL, 32, 12.5, 400, 0, 0, 0, 400, NULL, NULL, 8, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4019, 3, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 3, 2, NULL, 2, 500, 1000, 0, 0, 0, 1000, NULL, NULL, 9, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4020, 1, NULL, CAST(N'2021-02-04 18:41:13.000' AS DateTime), 1, 2, NULL, 32, 0.01, 0.39, 0, 0, 0, 0.01, NULL, NULL, 13, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4020, 3, NULL, CAST(N'2021-02-04 18:41:13.000' AS DateTime), 3, 2, NULL, 2, 125, 250, 0, 0, 0, 125, NULL, NULL, 14, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4020, 2, NULL, CAST(N'2021-02-04 18:41:13.000' AS DateTime), 3, 2, NULL, 2, 75, 150, 0, 0, 0, 75, NULL, NULL, 15, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (4021, 1, NULL, CAST(N'2021-02-04 20:31:59.000' AS DateTime), 2, 2, NULL, 32, 0.11, 6.9375, 0, 0, 0, 0.11, NULL, NULL, 17, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (5018, 1, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 1, 29, NULL, 59, 6.77966101694915, 400, 0, 0, 0, 400, NULL, NULL, 1004, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (5018, 2, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 2, 2, NULL, 2, 250, 500, 0, 0, 0, 500, NULL, NULL, 1005, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (5020, 4, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 1, 2, NULL, 32, 12.5, 400, 0, 0, 0, 400, NULL, NULL, 1007, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (5020, 5, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, 1, NULL, 31, 500, 500, 0, 0, 0, 500, NULL, NULL, 1008, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (6017, 1, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 2, 2, NULL, 32, 15.625, 500, 0, 0, 0, 500, NULL, NULL, 2003, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (7017, 1004, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, 1, NULL, 65, 5400, 5400, 0, 0, 0, 5400, NULL, NULL, 3003, NULL, NULL, NULL)
INSERT [dbo].[Pur_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [Pur_D_ID], [Pur_D_UnitID], [SAmt], [SRate]) VALUES (8017, 1, NULL, CAST(N'1900-01-01 00:00:00.000' AS DateTime), 1, 2, NULL, 32, 12.5, 400, 0, 0, 0, 400, NULL, NULL, 4003, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Pur_D] OFF
SET IDENTITY_INSERT [dbo].[Pur_M] ON 

INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (1, 0, CAST(N'2020-10-12 16:40:21.243' AS DateTime), NULL, NULL, N'PI-2010001', N'10/12/2020 4:40:20 PM', N'dsdsad', NULL, NULL, N'dsadasdas', N'3', NULL, 3.23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3.23, N'dasd3424', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2, 0, CAST(N'2020-10-12 17:53:04.910' AS DateTime), NULL, NULL, N'PI-2010002', N'10/12/2020 5:53:02 PM', N'41556', NULL, NULL, N'dsadsa dasd asd asd asdasd asdss', N'0', NULL, -0.14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -0.14, N'5645456456', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (3, 0, CAST(N'2020-10-12 17:56:16.263' AS DateTime), NULL, NULL, N'PI-2010003', N'10/12/2020 5:56:15 PM', N'45646', NULL, NULL, N'dsadasds', N'0', NULL, -0.14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -0.14, N'515156165', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (4, 0, CAST(N'2020-10-12 17:59:56.113' AS DateTime), NULL, NULL, N'PI-2010004', N'10/12/2020 5:59:56 PM', N'', NULL, NULL, N'', N'0', NULL, -0.07, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -0.07, N'', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (5, 0, CAST(N'2020-10-12 18:00:23.160' AS DateTime), NULL, NULL, N'PI-2010005', N'10/12/2020 6:00:23 PM', N'0', NULL, NULL, N'', N'0', NULL, -0.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -0.4, N'', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (6, 0, CAST(N'2020-10-12 18:03:44.310' AS DateTime), NULL, NULL, N'PI-2010006', N'10/12/2020 6:03:44 PM', N'65465', NULL, NULL, N'dsadasd sd', N'1', NULL, -1.07, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1.07, N'45465456', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (7, 0, CAST(N'2020-10-12 18:10:45.977' AS DateTime), NULL, NULL, N'PI-2010007', N'10/12/2020 6:10:45 PM', N'', NULL, NULL, N'', N'0', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (8, 0, CAST(N'2020-10-12 18:10:59.410' AS DateTime), NULL, NULL, N'PI-2010008', N'10/12/2020 6:10:59 PM', N'0', NULL, NULL, N'', N'0', NULL, -2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -2, N'', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (9, 0, CAST(N'2020-10-12 18:49:22.163' AS DateTime), NULL, NULL, N'PI-2010009', N'10/12/2020 6:48:53 PM', N'', NULL, NULL, N'', N'0', NULL, -3.29, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2020-10-12 18:49:22.163' AS DateTime), NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -3.29, N'', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (10, 0, CAST(N'2020-10-14 17:51:45.107' AS DateTime), NULL, NULL, N'PI-2010010', N'10/14/2020 5:51:45 PM', N'5435', NULL, NULL, N'', N'0', NULL, 7.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7.5, N'5435', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (11, 0, CAST(N'2020-11-05 05:02:28.837' AS DateTime), NULL, NULL, N'PI-2011001', N'05-11-20 5:02:24 AM', N'', NULL, NULL, N'', N'0', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (1011, 0, CAST(N'2020-11-27 18:58:53.713' AS DateTime), NULL, NULL, N'PI-2011002', N'27-11-20 6:58:53 PM', N'0', NULL, 1, N'', N'0', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, N'', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (1014, 0, CAST(N'2020-11-28 16:45:50.610' AS DateTime), 0, NULL, N'PI-2011003', N'28-11-20 4:45:50 PM', N'0', NULL, 1, N'', N'0', NULL, 700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, N'', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (1015, 0, CAST(N'2020-11-28 21:05:30.487' AS DateTime), 0, NULL, N'PI-2011004', N'28-11-20 9:05:30 PM', N'0', NULL, 1, N'', N'0', NULL, 260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 260, N'', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2015, 0, CAST(N'2020-12-02 22:07:54.730' AS DateTime), 9000003, NULL, N'PI-2012001', N'02-12-20 10:07:54 PM', N'0', NULL, 1, N'', N'0', NULL, 300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9000003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 300, N'', N'1/1/1990', NULL)
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2016, 0, CAST(N'2020-12-25 15:34:11.827' AS DateTime), NULL, NULL, N'PI-2012002', N'25-12-20 3:34:06 PM', N'0', NULL, NULL, N'', N'100', NULL, 800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 800, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2024, 0, CAST(N'2020-12-25 17:54:03.133' AS DateTime), 0, NULL, N'PI-2012003', N'25-12-20 5:54:02 PM', N'0', NULL, 1, N'', N'0', NULL, 250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2025, 0, CAST(N'2020-12-25 18:05:45.353' AS DateTime), 0, NULL, N'PI-2012004', N'25-12-20 6:05:43 PM', N'0', NULL, 1, N'', N'0', NULL, 250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2030, 0, CAST(N'2020-12-25 18:57:55.177' AS DateTime), 0, NULL, N'PI-2012005', N'25-12-20 6:57:55 PM', N'0', NULL, 1, N'', N'0', NULL, 260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 260, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2031, 0, CAST(N'2020-12-25 18:59:23.950' AS DateTime), 0, NULL, N'PI-2012006', N'25-12-20 6:59:23 PM', N'0', NULL, 1, N'', N'0', NULL, 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 400, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2032, 0, CAST(N'2020-12-25 19:00:28.707' AS DateTime), 0, NULL, N'PI-2012007', N'25-12-20 7:00:28 PM', N'0', NULL, 1, N'', N'0', NULL, 250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2033, 0, CAST(N'2020-12-25 19:45:28.433' AS DateTime), 0, NULL, N'PI-2012008', N'25-12-20 7:45:28 PM', N'0', NULL, 1, N'', N'0', NULL, 260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 260, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2035, 0, CAST(N'2020-12-25 20:10:19.747' AS DateTime), 0, NULL, N'PI-2012009', N'25-12-20 8:10:19 PM', N'0', NULL, 1, N'', N'0', NULL, 250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 250, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2038, 0, CAST(N'2020-12-25 21:02:07.793' AS DateTime), 0, NULL, N'PI-2012010', N'25-12-20 9:02:07 PM', N'0', NULL, 1, N'', N'0', NULL, 260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 260, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2039, 0, CAST(N'2020-12-25 21:21:52.277' AS DateTime), 0, NULL, N'PI-2012011', N'25-12-20 9:21:52 PM', N'0', NULL, 1, N'', N'0', NULL, 170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2040, 0, CAST(N'2020-12-25 21:26:56.457' AS DateTime), 2, NULL, N'PI-2012012', N'25-12-20 9:26:56 PM', N'0', NULL, 1, N'', N'0', NULL, 170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 170, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2041, 0, CAST(N'2020-12-25 21:27:31.207' AS DateTime), 0, NULL, N'PI-2012013', N'25-12-20 9:27:31 PM', N'0', NULL, 1, N'', N'0', NULL, 292, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 292, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2042, 0, CAST(N'2020-12-25 21:29:03.247' AS DateTime), 1, NULL, N'PI-2012014', N'25-12-20 9:29:03 PM', N'0', NULL, 1, N'', N'0', NULL, 222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 222, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2043, 0, CAST(N'2020-12-28 16:31:50.077' AS DateTime), 1, NULL, N'PI-2012015', N'28-12-20 4:31:50 PM', N'0', NULL, 1, N'', N'0', NULL, 260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 260, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2044, 0, CAST(N'2020-12-28 16:48:25.490' AS DateTime), 9000002, NULL, N'PI-2012016', N'28-12-20 4:48:25 PM', N'0', NULL, 1, N'', N'0', NULL, 350, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2045, 0, CAST(N'2020-12-28 17:05:03.367' AS DateTime), 9000003, NULL, N'PI-2012017', N'28-12-20 5:05:03 PM', N'0', NULL, 1, N'', N'0', NULL, 260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 260, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2046, 0, CAST(N'2020-12-31 16:19:00.930' AS DateTime), 9000002, NULL, N'PI-2012018', N'31-12-20 4:19:00 PM', N'0', NULL, 1, N'', N'0', NULL, 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 400, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2047, 0, CAST(N'2020-12-31 16:27:25.470' AS DateTime), 9000001, NULL, N'PI-2012019', N'31-12-20 4:27:25 PM', N'0', NULL, 1, N'', N'0', NULL, 350, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (2048, 0, CAST(N'2020-12-31 16:30:59.867' AS DateTime), 9000003, NULL, N'PI-2012020', N'31-12-20 4:30:59 PM', N'0', NULL, 1, N'', N'0', NULL, 350, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 350, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (3016, 0, CAST(N'2021-01-28 17:43:11.890' AS DateTime), 9000001, NULL, N'PI-2101001', N'28-01-21 5:43:11 PM', N'0', NULL, 1, N'', N'0', NULL, 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 400, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (4016, 0, CAST(N'2021-01-31 18:31:54.080' AS DateTime), 9000001, NULL, N'PI-2101002', N'31-01-21 6:31:54 PM', N'0', NULL, 1, N'', N'0', NULL, 450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 450, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (4017, 0, CAST(N'2021-02-04 18:07:02.633' AS DateTime), 9000002, NULL, N'PI-2102001', N'04-02-21 6:07:02 PM', N'0', NULL, 1, N'', N'0', NULL, 700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (4018, 0, CAST(N'2021-02-04 18:15:39.347' AS DateTime), 9000002, NULL, N'PI-2102002', N'04-02-21 6:15:39 PM', N'0', NULL, 1, N'', N'0', NULL, 600.29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 600.29, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (4019, 0, CAST(N'2021-02-04 18:21:10.760' AS DateTime), 9000002, NULL, N'PI-2102003', N'04-02-21 6:21:10 PM', N'0', NULL, 1, N'', N'0', NULL, 1400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1400, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (4020, 0, CAST(N'2021-02-04 18:42:53.093' AS DateTime), 9000001, NULL, N'PI-2102004', N'04-02-21 6:22:56 PM', N'0', NULL, 1, N'', N'0', NULL, 200.01, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-02-04 18:42:51.740' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 200.01, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (4021, 0, CAST(N'2021-02-04 20:33:17.113' AS DateTime), 9000001, NULL, N'PI-2102005', N'04-02-21 6:47:20 PM', N'0', NULL, 1, N'', N'0', NULL, 0.11, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-02-04 20:33:17.113' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.11, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (5018, 0, CAST(N'2021-02-11 17:08:26.280' AS DateTime), 9000001, NULL, N'PI-2102006', N'11-02-21 5:08:25 PM', N'0', NULL, 1, N'', N'0', NULL, 900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 900, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (5020, 0, CAST(N'2021-02-11 17:17:59.540' AS DateTime), 9000001, NULL, N'PI-2102007', N'11-02-21 5:17:59 PM', N'0', NULL, 1, N'', N'0', NULL, 900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 900, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (6017, 0, CAST(N'2021-03-03 17:51:08.587' AS DateTime), 9000001, NULL, N'PI-2103001', N'03-03-21 5:51:07 PM', N'0', NULL, 1, N'', N'0', NULL, 500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (7017, 0, CAST(N'2021-03-13 15:36:20.553' AS DateTime), 9, NULL, N'PI-2103002', N'13-03-21 3:36:20 PM', N'0', NULL, 1, N'', N'0', NULL, 5400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5400, N'', N'1/1/1990', N'PI')
INSERT [dbo].[Pur_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvNo], [InvDT], [BiltyNo], [SID], [WID], [Rem], [DisAmt], [Cartage], [NetAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [VehicalNo], [VendorId], [CityId], [Rent], [pashgi], [Bharai_chahti_chunai_khata_kharcha], [OfficeKhata], [Karamat_amat_khata], [gari_Office_kharcha], [TotalAmount], [VenInvNo], [VenInvDate], [InvType]) VALUES (8017, 0, CAST(N'2021-03-17 16:40:30.983' AS DateTime), 3, NULL, N'PI-2103003', N'17-03-21 4:40:30 PM', N'0', NULL, 1, N'', N'0', NULL, 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 400, N'', N'1/1/1990', N'PI')
SET IDENTITY_INSERT [dbo].[Pur_M] OFF
SET IDENTITY_INSERT [dbo].[PurR_D] ON 

INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (1, 43, 274, CAST(N'2020-10-30 00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, 1, 190, 190, NULL, NULL, NULL, 190, 3, 0, 1)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (1, 43, 84, CAST(N'2021-01-31 00:00:00.000' AS DateTime), NULL, 57, NULL, NULL, 57, 190, 10830, NULL, NULL, NULL, 10830, 4, 0, 2)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (1, 41, 74, CAST(N'2021-03-30 00:00:00.000' AS DateTime), NULL, 86, NULL, NULL, 86, 2350, 202100, NULL, NULL, NULL, 202100, 5, 0, 3)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (2, 43, 280, CAST(N'2021-12-31 00:00:00.000' AS DateTime), NULL, 2, NULL, NULL, 2, 210, 420, NULL, NULL, NULL, 420, 6, 0, 4)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (2, 43, 281, CAST(N'2021-12-31 00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, 1, 210, 210, NULL, NULL, NULL, 210, 7, 0, 5)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (2, 33, 181, CAST(N'2020-12-31 00:00:00.000' AS DateTime), NULL, 10, NULL, NULL, 10, 205, 2050, NULL, NULL, NULL, 2050, 8, 0, 6)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (3, 43, NULL, NULL, NULL, 104, NULL, NULL, 104, 190, 19760, NULL, NULL, NULL, 19760, 10, 0, 7)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (4, 43, 280, CAST(N'2021-12-31 00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, 1, 210, 210, NULL, NULL, NULL, 210, 14, 0, 8)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (4, 43, 281, CAST(N'2021-12-31 00:00:00.000' AS DateTime), NULL, 1, NULL, NULL, 1, 210, 210, NULL, NULL, NULL, 210, 15, 0, 9)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (4, 27, 253, CAST(N'2021-12-31 00:00:00.000' AS DateTime), NULL, 2, NULL, NULL, 2, 300, 600, NULL, NULL, NULL, 600, 16, 0, 10)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (5, 27, 298, CAST(N'2022-02-28 00:00:00.000' AS DateTime), 1, 2, NULL, NULL, 2, 300, 600, NULL, NULL, NULL, 600, 17, 0, 11)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (5, 43, 281, CAST(N'2021-12-31 00:00:00.000' AS DateTime), 1, 4, NULL, NULL, 4, 210, 840, NULL, NULL, NULL, 840, 18, 0, 12)
INSERT [dbo].[PurR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty1], [Qty], [PurPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt], [SRT], [RCancel], [id]) VALUES (6, 15, NULL, NULL, 1, 1, NULL, NULL, 1, 2500, 2500, NULL, NULL, NULL, 2500, 19, 0, 13)
SET IDENTITY_INSERT [dbo].[PurR_D] OFF
SET IDENTITY_INSERT [dbo].[PurR_M] ON 

INSERT [dbo].[PurR_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvDT], [BiltyNo], [SID], [WID], [NetAmt], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [invRNo], [invNo]) VALUES (1, 1, CAST(N'2020-01-01 00:00:00.000' AS DateTime), 90004, NULL, NULL, NULL, 1, 1, NULL, NULL, 1, 1, 0, 4, CAST(N'2020-01-23 00:00:00.000' AS DateTime), 1, CAST(N'2020-01-23 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PurR_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvDT], [BiltyNo], [SID], [WID], [NetAmt], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [invRNo], [invNo]) VALUES (2, 1, CAST(N'2020-02-04 00:00:00.000' AS DateTime), 90004, NULL, NULL, NULL, 1, 1, 2680, NULL, 1, 1, 0, 3, CAST(N'2020-02-04 00:00:00.000' AS DateTime), 4, CAST(N'2020-04-10 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PurR_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvDT], [BiltyNo], [SID], [WID], [NetAmt], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [invRNo], [invNo]) VALUES (3, 1, CAST(N'2020-03-04 00:00:00.000' AS DateTime), 90004, NULL, NULL, NULL, 1, 1, 19760, NULL, 1, 1, 0, 1, CAST(N'2020-02-19 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PurR_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvDT], [BiltyNo], [SID], [WID], [NetAmt], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [invRNo], [invNo]) VALUES (4, 1, CAST(N'2020-04-04 00:00:00.000' AS DateTime), 90004, NULL, NULL, NULL, 1, 1, 1020, NULL, 1, 1, 0, 1, CAST(N'2020-04-18 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-20 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PurR_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvDT], [BiltyNo], [SID], [WID], [NetAmt], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [invRNo], [invNo]) VALUES (5, 1, CAST(N'2020-04-09 00:00:00.000' AS DateTime), 90004, NULL, NULL, NULL, 1, 1, 1440, NULL, 1, 1, 0, 1, CAST(N'2020-04-20 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-20 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[PurR_M] ([RID], [CompID], [EDate], [AC_Code], [RID2], [InvDT], [BiltyNo], [SID], [WID], [NetAmt], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [invRNo], [invNo]) VALUES (6, 1, CAST(N'2020-04-21 00:00:00.000' AS DateTime), 10001, NULL, NULL, NULL, 1, 1, 2500, N'PUR RETURN REMARKS', 1, 1, 0, 1, CAST(N'2020-04-21 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-21 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PurR_M] OFF
SET IDENTITY_INSERT [dbo].[PV_D] ON 

INSERT [dbo].[PV_D] ([RID], [Narr], [MOP_ID], [AC_Code], [InvNo], [ChkNo], [SlipNo], [PreAmt], [Amt], [DisAmt], [BalAmt], [SRT], [RCancel], [ID], [checkDate], [isDeleted]) VALUES (1, N'', 7, 9000001, N'1', N'0', N'1', NULL, 350, 0, 0, 0, 0, 1, CAST(N'2021-01-24 21:16:13.000' AS DateTime), NULL)
INSERT [dbo].[PV_D] ([RID], [Narr], [MOP_ID], [AC_Code], [InvNo], [ChkNo], [SlipNo], [PreAmt], [Amt], [DisAmt], [BalAmt], [SRT], [RCancel], [ID], [checkDate], [isDeleted]) VALUES (2, N'', 7, 9000001, NULL, N'0', NULL, NULL, 200, NULL, NULL, NULL, NULL, 2, CAST(N'2021-02-25 03:57:57.393' AS DateTime), NULL)
INSERT [dbo].[PV_D] ([RID], [Narr], [MOP_ID], [AC_Code], [InvNo], [ChkNo], [SlipNo], [PreAmt], [Amt], [DisAmt], [BalAmt], [SRT], [RCancel], [ID], [checkDate], [isDeleted]) VALUES (3, N'', 7, 9000003, NULL, N'0', NULL, NULL, 2500, NULL, NULL, NULL, NULL, 3, CAST(N'2021-03-13 15:32:18.010' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PV_D] OFF
SET IDENTITY_INSERT [dbo].[PV_M] ON 

INSERT [dbo].[PV_M] ([RID], [CompID], [EDate], [AC_Code], [SID], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [isDeleted]) VALUES (1, 0, CAST(N'2021-01-24 21:16:13.000' AS DateTime), 1000001, 0, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[PV_M] ([RID], [CompID], [EDate], [AC_Code], [SID], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [isDeleted]) VALUES (2, 0, CAST(N'2021-02-25 03:57:57.293' AS DateTime), 1000001, 0, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[PV_M] ([RID], [CompID], [EDate], [AC_Code], [SID], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [isDeleted]) VALUES (3, 0, CAST(N'2021-03-13 15:32:17.917' AS DateTime), 1000001, 0, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[PV_M] OFF
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Purchase Order', 1, NULL, NULL, N'PO', N'PO_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Purchase', 2, NULL, NULL, N'PJ', N'Pur_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Purchase Return', 3, NULL, NULL, N'PRJ', N'PurR_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Sales Order', 4, NULL, NULL, N'SO', N'SO_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Sales Invoice', 5, NULL, NULL, N'SJ', N'Sales_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Sample Invoice', 51, NULL, NULL, N'SJ', N'Sales_S_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Sales Return', 6, NULL, NULL, N'SRJ', N'SalesR_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Purchase + Sales', 7, 8, NULL, N'PSJ', N'PSJ_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Flock', 9, 90, N'91', N'FLK', N'FLK_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Items Transfer', 10, NULL, NULL, N'TRN', N'Trn_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Items Production', 11, 12, NULL, N'MFG', N'Mfg_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Items Adjustment', 13, NULL, NULL, N'ADJ', N'Adj_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Receipt Voucher', 14, NULL, NULL, N'RV', N'RV_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Payment Voucher', 15, NULL, NULL, N'PV', N'PV_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Expense Voucher', 16, NULL, NULL, N'EV', N'EV_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Journal Voucher', 17, NULL, NULL, N'JV', N'JV_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Journal Voucher (S)', 18, NULL, NULL, N'JVS', N'JVS_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Credit Note', 19, NULL, NULL, N'CN', N'CN_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Credit Note (Item)', 20, NULL, NULL, N'CNI', N'CNI_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Debit Note', 21, NULL, NULL, N'DN', N'DN_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Income Voucher', 22, NULL, NULL, N'IV', N'IV_M')
INSERT [dbo].[RP] ([Defination], [TypeCode], [TypeCode2], [TypeCode3], [Symbol], [TBL]) VALUES (N'Payroll', 23, NULL, NULL, N'PRL', N'Esal_M')
SET IDENTITY_INSERT [dbo].[RV_D] ON 

INSERT [dbo].[RV_D] ([RID], [Narr], [MOP_ID], [AC_Code], [InvNo], [ChkNo], [SlipNo], [PreAmt], [Amt], [DisAmt], [BalAmt], [SRT], [RCancel], [ID], [checkDate], [IsDeleted]) VALUES (1, N'', 7, N'3000001', 1, 0, 1, NULL, 500, 0, 0, 0, 0, 1, CAST(N'2021-01-23 20:46:32.000' AS DateTime), NULL)
INSERT [dbo].[RV_D] ([RID], [Narr], [MOP_ID], [AC_Code], [InvNo], [ChkNo], [SlipNo], [PreAmt], [Amt], [DisAmt], [BalAmt], [SRT], [RCancel], [ID], [checkDate], [IsDeleted]) VALUES (2, N'', 7, N'3000001', 1, 0, 1, NULL, 1000, 0, 0, 0, 0, 2, CAST(N'2021-02-02 21:03:10.000' AS DateTime), NULL)
INSERT [dbo].[RV_D] ([RID], [Narr], [MOP_ID], [AC_Code], [InvNo], [ChkNo], [SlipNo], [PreAmt], [Amt], [DisAmt], [BalAmt], [SRT], [RCancel], [ID], [checkDate], [IsDeleted]) VALUES (1002, N'', 7, N'3000001', NULL, 0, NULL, NULL, 3000, 0, NULL, NULL, NULL, 1002, CAST(N'2021-02-25 03:51:00.747' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[RV_D] OFF
SET IDENTITY_INSERT [dbo].[RV_M] ON 

INSERT [dbo].[RV_M] ([RID], [CompID], [EDate], [AC_Code], [SID], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [isDeleted]) VALUES (1, 0, CAST(N'2021-01-23 20:46:32.000' AS DateTime), N'1000001', 0, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[RV_M] ([RID], [CompID], [EDate], [AC_Code], [SID], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [isDeleted]) VALUES (2, 0, CAST(N'2021-02-02 21:03:10.000' AS DateTime), N'1000001', 0, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[RV_M] ([RID], [CompID], [EDate], [AC_Code], [SID], [Rem], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [isDeleted]) VALUES (1002, 0, CAST(N'2021-02-25 03:51:00.583' AS DateTime), N'1000001', 0, N'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[RV_M] OFF
SET IDENTITY_INSERT [dbo].[Sale_Pur_D_Pur] ON 

INSERT [dbo].[Sale_Pur_D_Pur] ([Pur_ID], [RID], [VendorID], [ItemID], [UnitID], [Quantity], [Pur_Price], [Pur_Total], [Comm], [CvenID], [Total]) VALUES (16, 3, 1, 1, 1, 0, CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)), 1, CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Pur] ([Pur_ID], [RID], [VendorID], [ItemID], [UnitID], [Quantity], [Pur_Price], [Pur_Total], [Comm], [CvenID], [Total]) VALUES (17, 3, 1, 1, 1, 11, CAST(11.00 AS Decimal(18, 2)), CAST(121.00 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)), 1, CAST(122 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Pur] ([Pur_ID], [RID], [VendorID], [ItemID], [UnitID], [Quantity], [Pur_Price], [Pur_Total], [Comm], [CvenID], [Total]) VALUES (18, 1, 1, 1, 1, 12, CAST(12.00 AS Decimal(18, 2)), CAST(144.00 AS Decimal(18, 2)), CAST(33 AS Decimal(18, 0)), 1, CAST(177 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Pur] ([Pur_ID], [RID], [VendorID], [ItemID], [UnitID], [Quantity], [Pur_Price], [Pur_Total], [Comm], [CvenID], [Total]) VALUES (19, 6, 1, 1, 1, 1, CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)), 1, CAST(11 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Pur] ([Pur_ID], [RID], [VendorID], [ItemID], [UnitID], [Quantity], [Pur_Price], [Pur_Total], [Comm], [CvenID], [Total]) VALUES (1008, 1006, 1, 1, 1, 11, CAST(11.00 AS Decimal(18, 2)), CAST(121.00 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)), 1, CAST(122 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Pur] ([Pur_ID], [RID], [VendorID], [ItemID], [UnitID], [Quantity], [Pur_Price], [Pur_Total], [Comm], [CvenID], [Total]) VALUES (1009, 1007, 1, 1, 1, 2, CAST(22.00 AS Decimal(18, 2)), CAST(44.00 AS Decimal(18, 2)), CAST(2 AS Decimal(18, 0)), 1, CAST(46 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Pur] ([Pur_ID], [RID], [VendorID], [ItemID], [UnitID], [Quantity], [Pur_Price], [Pur_Total], [Comm], [CvenID], [Total]) VALUES (1010, 1008, 1, 1, 1, 11, CAST(11.00 AS Decimal(18, 2)), CAST(121.00 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)), 1, CAST(122 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Sale_Pur_D_Pur] OFF
SET IDENTITY_INSERT [dbo].[Sale_Pur_D_Sale] ON 

INSERT [dbo].[Sale_Pur_D_Sale] ([Sale_ID], [RID], [CityID], [VillageID], [VendorID], [PukhtaBikri], [LongerTadat], [KhamBikri], [Phaliyan], [CustomerExpense]) VALUES (1, 1, 3, 3, 1, CAST(1300.00 AS Decimal(18, 2)), 12, CAST(1312 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Sale] ([Sale_ID], [RID], [CityID], [VillageID], [VendorID], [PukhtaBikri], [LongerTadat], [KhamBikri], [Phaliyan], [CustomerExpense]) VALUES (2, 3, 1, 1, 1, CAST(100.00 AS Decimal(18, 2)), 20, CAST(120 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Sale] ([Sale_ID], [RID], [CityID], [VillageID], [VendorID], [PukhtaBikri], [LongerTadat], [KhamBikri], [Phaliyan], [CustomerExpense]) VALUES (3, 4, 1, 1, 1, CAST(209.00 AS Decimal(18, 2)), 0, CAST(220 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Sale] ([Sale_ID], [RID], [CityID], [VillageID], [VendorID], [PukhtaBikri], [LongerTadat], [KhamBikri], [Phaliyan], [CustomerExpense]) VALUES (4, 5, 1, 1, 1, CAST(80.00 AS Decimal(18, 2)), 1, CAST(100 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Sale] ([Sale_ID], [RID], [CityID], [VillageID], [VendorID], [PukhtaBikri], [LongerTadat], [KhamBikri], [Phaliyan], [CustomerExpense]) VALUES (5, 6, 1, 1, 2, CAST(280.00 AS Decimal(18, 2)), 10, CAST(300 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Sale] ([Sale_ID], [RID], [CityID], [VillageID], [VendorID], [PukhtaBikri], [LongerTadat], [KhamBikri], [Phaliyan], [CustomerExpense]) VALUES (1005, 1006, 1, 1, 1, CAST(77.00 AS Decimal(18, 2)), 66, CAST(110 AS Decimal(18, 0)), CAST(4 AS Decimal(18, 0)), CAST(11 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Sale] ([Sale_ID], [RID], [CityID], [VillageID], [VendorID], [PukhtaBikri], [LongerTadat], [KhamBikri], [Phaliyan], [CustomerExpense]) VALUES (1006, 1007, 1, 1, 1, CAST(778.00 AS Decimal(18, 2)), 0, CAST(1000 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), CAST(22 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_D_Sale] ([Sale_ID], [RID], [CityID], [VillageID], [VendorID], [PukhtaBikri], [LongerTadat], [KhamBikri], [Phaliyan], [CustomerExpense]) VALUES (1007, 1008, 1, 1, 1, CAST(198.00 AS Decimal(18, 2)), 2, CAST(222 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Sale_Pur_D_Sale] OFF
SET IDENTITY_INSERT [dbo].[Sale_Pur_M] ON 

INSERT [dbo].[Sale_Pur_M] ([RId], [VehicalNo], [Date], [Rent], [pashgi], [bharai_chatai_kata_kharacha], [Office_khata], [CarAmad_AmadKharcha], [gari_OfficeKharcha], [Total_Purchase], [advanceBuilty], [OwnBuilty]) VALUES (1, N'p001', CAST(N'2020-07-25 00:00:00.0000000' AS DateTime2), CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(214.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_M] ([RId], [VehicalNo], [Date], [Rent], [pashgi], [bharai_chatai_kata_kharacha], [Office_khata], [CarAmad_AmadKharcha], [gari_OfficeKharcha], [Total_Purchase], [advanceBuilty], [OwnBuilty]) VALUES (2, N'xyz', CAST(N'2020-07-26 00:00:00.0000000' AS DateTime2), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(43.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_M] ([RId], [VehicalNo], [Date], [Rent], [pashgi], [bharai_chatai_kata_kharacha], [Office_khata], [CarAmad_AmadKharcha], [gari_OfficeKharcha], [Total_Purchase], [advanceBuilty], [OwnBuilty]) VALUES (3, N'11', CAST(N'2020-07-26 00:00:00.0000000' AS DateTime2), CAST(20.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(127.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_M] ([RId], [VehicalNo], [Date], [Rent], [pashgi], [bharai_chatai_kata_kharacha], [Office_khata], [CarAmad_AmadKharcha], [gari_OfficeKharcha], [Total_Purchase], [advanceBuilty], [OwnBuilty]) VALUES (4, N'111', CAST(N'2020-08-07 00:00:00.0000000' AS DateTime2), CAST(10.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_M] ([RId], [VehicalNo], [Date], [Rent], [pashgi], [bharai_chatai_kata_kharacha], [Office_khata], [CarAmad_AmadKharcha], [gari_OfficeKharcha], [Total_Purchase], [advanceBuilty], [OwnBuilty]) VALUES (5, N'11', CAST(N'2020-08-07 00:00:00.0000000' AS DateTime2), CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1117.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_M] ([RId], [VehicalNo], [Date], [Rent], [pashgi], [bharai_chatai_kata_kharacha], [Office_khata], [CarAmad_AmadKharcha], [gari_OfficeKharcha], [Total_Purchase], [advanceBuilty], [OwnBuilty]) VALUES (6, N'22', CAST(N'2020-08-11 00:00:00.0000000' AS DateTime2), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(61.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_M] ([RId], [VehicalNo], [Date], [Rent], [pashgi], [bharai_chatai_kata_kharacha], [Office_khata], [CarAmad_AmadKharcha], [gari_OfficeKharcha], [Total_Purchase], [advanceBuilty], [OwnBuilty]) VALUES (1006, N'111', CAST(N'2020-08-22 00:00:00.0000000' AS DateTime2), CAST(22.00 AS Decimal(18, 2)), CAST(11.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(162.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_M] ([RId], [VehicalNo], [Date], [Rent], [pashgi], [bharai_chatai_kata_kharacha], [Office_khata], [CarAmad_AmadKharcha], [gari_OfficeKharcha], [Total_Purchase], [advanceBuilty], [OwnBuilty]) VALUES (1007, N'333', CAST(N'2020-08-22 00:00:00.0000000' AS DateTime2), CAST(200.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(45.00 AS Decimal(18, 2)), CAST(6.00 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[Sale_Pur_M] ([RId], [VehicalNo], [Date], [Rent], [pashgi], [bharai_chatai_kata_kharacha], [Office_khata], [CarAmad_AmadKharcha], [gari_OfficeKharcha], [Total_Purchase], [advanceBuilty], [OwnBuilty]) VALUES (1008, N'44', CAST(N'2020-08-22 00:00:00.0000000' AS DateTime2), CAST(22.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(126.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Sale_Pur_M] OFF
SET IDENTITY_INSERT [dbo].[Sales_D] ON 

INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1002, 2, 1, NULL, NULL, N'0', 1, NULL, 31, 1.2938112284024, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 40.1081480804744, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1003, 2, 2, NULL, NULL, N'0', 1, NULL, 1, 52.1604938271605, 30, NULL, NULL, NULL, NULL, N'2', N'0.6', N'2', 52.1604938271605, 27.4, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1004, 3, 1, NULL, NULL, N'0', 1, NULL, 31, 1.2938112284024, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 40.1081480804744, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1005, 3, 2, NULL, NULL, N'0', 1, NULL, 1, 52.1604938271605, 30, NULL, NULL, NULL, NULL, N'2', N'0.6', N'2', 52.1604938271605, 27.4, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1006, 3, 3, NULL, NULL, N'0', 1, NULL, 1, 124.228395061728, 30, NULL, NULL, NULL, NULL, N'2', N'0.6', N'2', 124.228395061728, 27.4, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1007, 1, 1, NULL, NULL, N'0', 1, NULL, 31, 1.2938112284024, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 40.1081480804744, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1008, 1, 3, NULL, NULL, N'0', 1, NULL, 1, 124.228395061728, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 124.228395061728, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1009, 1, 2, NULL, NULL, N'0', 1, NULL, 1, 52.1604938271605, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 52.1604938271605, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1010, 4, 3, NULL, NULL, N'0', 2, NULL, 2, 124.228395061728, 30, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 248.456790123456, 60, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1011, 5, 3, NULL, NULL, N'0', 1, NULL, 1, 124.228395061728, 0, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 124.228395061728, 0, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1012, 6, 2, NULL, NULL, N'0', 1, NULL, 1, 131.296296296296, 20, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 131.296296296296, 20, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1013, 7, 1, NULL, NULL, N'1', 1, NULL, 31, 2.83507378804173, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 87.887287429293636, 1240, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (2002, 1002, 1, NULL, NULL, N'1', 1, NULL, 31, 2.83507378804173, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 87.887287429293636, 1240, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (2003, 1002, 3, NULL, NULL, N'1', 1, NULL, 1, 124.228395061728, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 124.228395061728, 80, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (3002, 2002, 1, NULL, NULL, N'0', 1, NULL, 1, 2.83507378804173, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 2.83507378804173, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (3003, 2003, 1, NULL, NULL, N'1', 1, NULL, 31, 2.83507378804173, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 87.887287429293636, 1240, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (3004, 2004, 2, NULL, NULL, N'1', 1, NULL, 1, 131.296296296296, 300, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 131.296296296296, 600, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (3005, 2005, 1, NULL, NULL, N'0', 1, NULL, 1, 2.83507378804173, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 2.83507378804173, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (3007, 2007, 1, NULL, NULL, N'0', 1, NULL, 1, 2.83507378804173, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 2.83507378804173, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (3008, 2008, 1, NULL, NULL, N'0', 1, NULL, 1, 2.83507378804173, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 2.83507378804173, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (3009, 2009, 1, NULL, NULL, N'0', 1, NULL, 1, 2.83507378804173, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 2.83507378804173, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (3010, 2010, 1, NULL, NULL, N'0', 4, NULL, 4, 4.6984383003487, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 18.7937532013948, 160, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (3011, 2010, 3, NULL, NULL, N'0', 1, NULL, 1, 124.228395061728, 0, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 124.228395061728, 0, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (3012, 2010, 2, NULL, NULL, N'0', 1, NULL, 1, 131.296296296296, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 131.296296296296, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (4015, 3015, 3016, NULL, NULL, N'0', 1, NULL, 1, 5850, 6950, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 5850, 6950, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (4016, 3016, 3016, NULL, NULL, N'0', 5, NULL, 5, 5850, 6950, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 29250, 34750, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (4017, 3016, 3013, NULL, NULL, N'0', 5, NULL, 5, 2350, 2650, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 11750, 13250, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (4018, 3017, 1004, NULL, NULL, N'0', 1, NULL, 1, 5000, 6500, NULL, NULL, NULL, NULL, N'0.00', N'0', N'20.00', 5000, 6480, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (4019, 3018, 3016, NULL, NULL, N'0', 2, NULL, 2, 5850, 6950, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 11700, 13900, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (4020, 3019, 2, NULL, NULL, N'0', 1, NULL, 1, 131.296296296296, 230, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 131.296296296296, 230, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (4021, 3020, 1, NULL, NULL, N'0', 1, NULL, 1, 4.6984383003487, 40, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 4.6984383003487, 40, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (4022, 3021, 2, NULL, NULL, N'0', 1, NULL, 1, 131.296296296296, 450, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 131.296296296296, 450, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (4023, 3022, 1004, NULL, NULL, N'0', 2, NULL, 2, 5020, 6500, NULL, NULL, NULL, NULL, N'0.00', N'0', N'20.00', 10040, 12980, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (4024, 3023, 3016, NULL, NULL, N'0', 2, NULL, 2, 5850, 6950, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 11700, 13900, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (5010, 4010, 3016, NULL, NULL, N'0', 3, NULL, 3, 5850, 6950, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 17550, 20850, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (5011, 4011, 1004, NULL, NULL, N'0', 1, NULL, 1, 5020, 6500, NULL, NULL, NULL, NULL, N'0.00', N'0', N'20.00', 5020, 6480, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (5012, 4011, 1006, NULL, NULL, N'0', 1, NULL, 1, 40, 6500, NULL, NULL, NULL, NULL, N'0.00', N'0', N'20.00', 40, 6480, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (5013, 4012, 3016, NULL, NULL, N'0', 1, NULL, 1, 5850, 6950, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 5850, 6950, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (5014, 4012, 1008, NULL, NULL, N'0', 1, NULL, 1, 30, 6950, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 30, 6950, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (5015, 4013, 3016, NULL, NULL, N'0', 1, NULL, 1, 5850, 6950, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 5850, 6950, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (5016, 4013, 1008, NULL, NULL, N'0', 1, NULL, 1, 30, 6950, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 30, 6950, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (5017, 4014, 3, NULL, NULL, N'2', 1, NULL, 1, 124.228395061728, 200, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 124.228395061728, 600, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (5019, 4017, 3, NULL, NULL, N'1', 1, NULL, 2, 124.228395061728, 200, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 248.456790123456, 400, NULL, NULL, NULL)
INSERT [dbo].[Sales_D] ([SD_ID], [RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (6010, 5010, 3, NULL, NULL, N'1', 1, NULL, 2, 124.228395061728, 200, NULL, NULL, NULL, NULL, N'0.00', N'0', N'0.00', 248.456790123456, 400, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Sales_D] OFF
SET IDENTITY_INSERT [dbo].[Sales_M] ON 

INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (1, 0, NULL, CAST(N'2021-02-06 17:07:47.470' AS DateTime), NULL, 3000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-02-06 17:07:47.470' AS DateTime), NULL, NULL, N'SI-2102001', CAST(N'2021-02-05 17:18:53.950' AS DateTime), N'SI', NULL, CAST(120.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (2, 0, NULL, CAST(N'2021-02-05 20:43:29.820' AS DateTime), NULL, 3000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 67.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102002', CAST(N'2021-02-05 20:43:29.820' AS DateTime), N'SI', NULL, CAST(67.40 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (3, 0, NULL, CAST(N'2021-02-06 16:53:46.520' AS DateTime), NULL, 3000002, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 94.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102003', CAST(N'2021-02-06 16:53:46.520' AS DateTime), N'SI', NULL, CAST(94.80 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (4, 0, NULL, CAST(N'2021-02-11 17:25:46.643' AS DateTime), NULL, 3000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102004', CAST(N'2021-02-11 17:25:46.640' AS DateTime), N'SI', NULL, CAST(60.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (5, 0, NULL, CAST(N'2021-02-11 17:44:11.733' AS DateTime), NULL, 3000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102005', CAST(N'2021-02-11 17:44:11.733' AS DateTime), N'SI', NULL, CAST(0.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (6, 0, NULL, CAST(N'2021-02-11 17:47:11.570' AS DateTime), NULL, 3000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102006', CAST(N'2021-02-11 17:47:11.570' AS DateTime), N'SI', NULL, CAST(20.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (7, 0, NULL, CAST(N'2021-02-12 16:48:15.357' AS DateTime), NULL, 3000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 1240, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102007', CAST(N'2021-02-12 16:48:14.837' AS DateTime), N'SI', NULL, CAST(1240.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (1002, 0, NULL, CAST(N'2021-02-20 18:45:08.273' AS DateTime), NULL, 3000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 1320, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102008', CAST(N'2021-02-20 18:45:07.270' AS DateTime), N'SI', NULL, CAST(1320.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (2002, 0, NULL, CAST(N'2021-02-23 13:45:48.377' AS DateTime), NULL, 3000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102009', CAST(N'2021-02-23 13:45:48.377' AS DateTime), N'SI', NULL, CAST(40.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (2003, 0, NULL, CAST(N'2021-02-25 03:37:57.070' AS DateTime), NULL, 3000002, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 1240, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102010', CAST(N'2021-02-25 03:37:57.070' AS DateTime), N'SI', NULL, CAST(1240.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (2004, 0, NULL, CAST(N'2021-02-25 03:42:35.203' AS DateTime), NULL, 3000002, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102011', CAST(N'2021-02-25 03:42:35.203' AS DateTime), N'SI', NULL, CAST(600.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (2005, 0, NULL, CAST(N'2021-02-25 03:43:57.210' AS DateTime), NULL, 3000002, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'10', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102012', CAST(N'2021-02-25 03:43:57.210' AS DateTime), N'SI', NULL, CAST(40.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (2007, 0, NULL, CAST(N'2021-02-25 03:46:05.807' AS DateTime), NULL, 3000002, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102013', CAST(N'2021-02-25 03:46:05.807' AS DateTime), N'SI', NULL, CAST(40.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (2008, 0, NULL, CAST(N'2021-02-25 03:46:38.757' AS DateTime), NULL, 3000002, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102014', CAST(N'2021-02-25 03:46:38.757' AS DateTime), N'SI', NULL, CAST(40.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (2009, 0, NULL, CAST(N'2021-02-25 03:49:35.327' AS DateTime), NULL, 3000002, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'10', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2102015', CAST(N'2021-02-25 03:49:35.327' AS DateTime), N'SI', NULL, CAST(40.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (2010, 0, NULL, CAST(N'2021-03-09 02:02:11.797' AS DateTime), NULL, 3000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103001', CAST(N'2021-03-09 02:02:11.797' AS DateTime), N'SI', NULL, CAST(200.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (3015, 0, NULL, CAST(N'2021-03-13 15:01:35.483' AS DateTime), NULL, 3, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 6950, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103002', CAST(N'2021-03-13 15:01:35.483' AS DateTime), N'SI', NULL, CAST(6950.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (3016, 0, NULL, CAST(N'2021-03-13 15:02:51.507' AS DateTime), NULL, 3, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 48000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103003', CAST(N'2021-03-13 15:02:51.507' AS DateTime), N'SI', NULL, CAST(48000.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (3017, 0, NULL, CAST(N'2021-03-13 15:11:31.503' AS DateTime), NULL, 3, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 6480, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103004', CAST(N'2021-03-13 15:11:31.503' AS DateTime), N'SI', NULL, CAST(6480.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (3018, 0, NULL, CAST(N'2021-03-14 15:44:18.280' AS DateTime), NULL, 3, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 13900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103005', CAST(N'2021-03-14 15:44:18.280' AS DateTime), N'SI', NULL, CAST(13900.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (3019, 0, NULL, CAST(N'2021-03-14 15:45:47.723' AS DateTime), NULL, 3, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 230, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103006', CAST(N'2021-03-14 15:45:47.723' AS DateTime), N'SI', NULL, CAST(230.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (3020, 0, NULL, CAST(N'2021-03-14 15:52:44.767' AS DateTime), NULL, 1, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103007', CAST(N'2021-03-14 15:52:44.767' AS DateTime), N'SI', NULL, CAST(40.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (3021, 0, NULL, CAST(N'2021-03-14 15:53:44.070' AS DateTime), NULL, 3, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103008', CAST(N'2021-03-14 15:53:44.070' AS DateTime), N'SI', NULL, CAST(450.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (3022, 0, NULL, CAST(N'2021-03-14 16:05:22.127' AS DateTime), NULL, 3, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 12980, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103009', CAST(N'2021-03-14 16:05:22.127' AS DateTime), N'SI', NULL, CAST(12980.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (3023, 0, NULL, CAST(N'2021-03-14 16:06:18.810' AS DateTime), NULL, 3, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 13900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103010', CAST(N'2021-03-14 16:06:18.810' AS DateTime), N'SI', NULL, CAST(13900.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (4010, 0, NULL, CAST(N'2021-03-14 19:04:06.740' AS DateTime), NULL, 3000004, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 20850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103011', CAST(N'2021-03-14 19:04:06.740' AS DateTime), N'SI', NULL, CAST(20850.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (4011, 0, NULL, CAST(N'2021-03-14 19:07:28.733' AS DateTime), NULL, 3000004, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 12960, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103012', CAST(N'2021-03-14 19:07:28.733' AS DateTime), N'SI', NULL, CAST(12960.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (4012, 0, NULL, CAST(N'2021-03-14 19:09:37.790' AS DateTime), NULL, 1000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 13900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103013', CAST(N'2021-03-14 19:09:37.790' AS DateTime), N'SI', NULL, CAST(13900.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (4013, 0, NULL, CAST(N'2021-03-14 19:10:47.250' AS DateTime), NULL, 3000004, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 13900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103014', CAST(N'2021-03-14 19:10:47.250' AS DateTime), N'SI', NULL, CAST(13900.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (4014, 0, NULL, CAST(N'2021-03-16 18:44:00.317' AS DateTime), NULL, 1000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103015', CAST(N'2021-03-16 18:44:00.310' AS DateTime), N'SI', NULL, CAST(600.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (4017, 0, NULL, CAST(N'2021-03-16 19:02:13.347' AS DateTime), NULL, 1000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103016', CAST(N'2021-03-16 19:02:13.347' AS DateTime), N'SI', NULL, CAST(400.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
INSERT [dbo].[Sales_M] ([RID], [CompID], [RID2], [EDate], [CAC_Code], [AC_Code], [Ship_To], [Ship_ID], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [DisAmt], [PreBal], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [War_Cls], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date], [InvNo], [InvDT], [InvType], [CstId], [TotalAmount], [CstInvNo], [VenInvDate], [TransportExpense]) VALUES (5010, 0, NULL, CAST(N'2021-03-16 20:25:39.257' AS DateTime), NULL, 1000001, NULL, NULL, NULL, N'0', NULL, 1, N'', NULL, N'0', NULL, 400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SI-2103017', CAST(N'2021-03-16 20:25:39.257' AS DateTime), N'SI', NULL, CAST(400.00 AS Decimal(20, 2)), N'', N'1/1/1990', NULL)
SET IDENTITY_INSERT [dbo].[Sales_M] OFF
INSERT [dbo].[SalesOfficer$] ([SID], [SalesOfficer], [Tel]) VALUES (1, N'Vetimed', N'')
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1, 46, 64, CAST(N'2020-03-30 00:00:00.000' AS DateTime), NULL, 15, NULL, 15, 0, 1350, NULL, NULL, 1350, 20250, NULL, NULL, NULL, 0, 20250, 0.75, 1, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1, 44, 63, CAST(N'2020-04-30 00:00:00.000' AS DateTime), NULL, 12, NULL, 12, 0, 2400, NULL, NULL, 2400, 28800, NULL, NULL, NULL, 0, 28800, 1, 2, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1, 44, 62, CAST(N'2020-04-30 00:00:00.000' AS DateTime), NULL, 12, NULL, 12, 0, 2400, NULL, NULL, 2400, 28800, NULL, NULL, NULL, 0, 28800, 1, 3, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1, 44, 60, CAST(N'2020-04-30 00:00:00.000' AS DateTime), NULL, 12, NULL, 12, 0, 2400, NULL, NULL, 2400, 28800, NULL, NULL, NULL, 0, 28800, 1, 4, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1, 66, 73, CAST(N'2021-03-30 00:00:00.000' AS DateTime), NULL, 10, NULL, 10, 0, 1800, NULL, NULL, 1800, 18000, NULL, NULL, NULL, 0, 18000, 0.833, 5, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (1, 67, 72, CAST(N'2021-03-30 00:00:00.000' AS DateTime), NULL, 5, NULL, 5, 0, 1000, NULL, NULL, 1000, 5000, NULL, NULL, NULL, 0, 5000, 0.455, 6, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (2, 9, 229, CAST(N'2021-10-30 00:00:00.000' AS DateTime), NULL, 40, NULL, 40, 0, 190, NULL, NULL, 190, 7600, NULL, NULL, NULL, 0, 7600, 0.4, 7, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (3, 21, 80, CAST(N'2020-10-31 00:00:00.000' AS DateTime), NULL, 43, NULL, 43, 0, 60, NULL, NULL, 60, 2580, NULL, NULL, NULL, 0, 2580, 0.43, 8, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (4, 10, 78, CAST(N'2020-10-31 00:00:00.000' AS DateTime), NULL, 19, NULL, 19, 0, 286, NULL, NULL, 286, 5434, NULL, NULL, NULL, 0, 5434, 0.19, 9, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (5, 37, 244, CAST(N'2021-10-31 00:00:00.000' AS DateTime), N'1', NULL, NULL, 10, 0, 1050, NULL, NULL, 1050, 10500, NULL, NULL, NULL, 0, 10500, 1, 10, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (6, 66, 73, CAST(N'2021-03-30 00:00:00.000' AS DateTime), NULL, 3, NULL, 3, 0, 1400, NULL, NULL, 1400, 4200, NULL, NULL, NULL, 0, 4200, 0.25, 12, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (6, 38, 75, CAST(N'2021-03-30 00:00:00.000' AS DateTime), NULL, 6, NULL, 6, 0, 5600, NULL, NULL, 5600, 33600, NULL, NULL, NULL, 0, 33600, 0.5, 13, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (6, 65, 261, CAST(N'2021-12-31 00:00:00.000' AS DateTime), NULL, 8, NULL, 8, 0, 1200, NULL, NULL, 1200, 9600, NULL, NULL, NULL, 0, 9600, 0.615, 14, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (7, 33, 265, CAST(N'2021-11-30 00:00:00.000' AS DateTime), NULL, 3, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.043, 15, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (7, 33, 266, CAST(N'2020-09-30 00:00:00.000' AS DateTime), NULL, 10, NULL, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.143, 16, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (7, 33, 119, CAST(N'2021-03-31 00:00:00.000' AS DateTime), NULL, 7, NULL, 7, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.1, 17, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (8, 1, 108, CAST(N'2021-01-31 00:00:00.000' AS DateTime), NULL, 6, NULL, 6, 0, 1500, NULL, NULL, 1500, 9000, NULL, NULL, NULL, 0, 9000, 0.5, 19, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (9, 12, 118, CAST(N'2020-10-30 00:00:00.000' AS DateTime), NULL, 60, NULL, 60, 0, 140, NULL, NULL, 140, 8400, NULL, NULL, NULL, 0, 8400, 0.638, 20, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (11, 64, 69, CAST(N'2021-02-28 00:00:00.000' AS DateTime), NULL, 40, NULL, 40, 0, 1800, NULL, NULL, 1800, 72000, NULL, NULL, NULL, 0, 72000, 2, 22, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (26, 43, NULL, NULL, NULL, 69, NULL, 69, NULL, 330, NULL, NULL, 330, 22770, NULL, NULL, NULL, NULL, 22770, 0.986, 25, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (10, 71, NULL, NULL, NULL, 1, NULL, 1, 2300, 3650, NULL, NULL, 3650, 3650, NULL, NULL, NULL, 2300, 3650, 0.083, 26, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (14, 44, 246, CAST(N'2021-10-30 00:00:00.000' AS DateTime), NULL, 12, NULL, 12, 0, 2400, NULL, NULL, 2400, 28800, NULL, NULL, NULL, 0, 28800, 1, 27, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (19, 43, 274, CAST(N'2020-10-30 00:00:00.000' AS DateTime), NULL, 99, NULL, 99, 0, 330, NULL, NULL, 330, 32670, NULL, NULL, NULL, 0, 32670, 1.414, 28, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (16, 43, 280, CAST(N'2021-12-31 00:00:00.000' AS DateTime), N'1', NULL, NULL, 70, 0, 330, NULL, NULL, 330, 23100, NULL, NULL, NULL, 0, 23100, 1, 29, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (17, 43, 280, CAST(N'2021-12-31 00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 0, 330, NULL, NULL, 330, 330, NULL, NULL, NULL, 0, 330, 0.014, 30, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (17, 30, 286, CAST(N'2022-01-31 00:00:00.000' AS DateTime), NULL, 2, NULL, 2, 0, 240, NULL, NULL, 240, 480, NULL, NULL, NULL, 0, 480, 0.017, 31, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (17, 39, 234, CAST(N'2021-08-31 00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 0, 550, NULL, NULL, 550, 550, NULL, NULL, NULL, 0, 550, 0.014, 32, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (17, 39, 174, CAST(N'2021-04-30 00:00:00.000' AS DateTime), NULL, 1, NULL, 1, 0, 510, NULL, NULL, 510, 510, NULL, NULL, NULL, 0, 510, 0.014, 33, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (18, 21, 80, CAST(N'2020-10-31 00:00:00.000' AS DateTime), NULL, 95, NULL, 95, 0, 60, NULL, NULL, 60, 5700, NULL, NULL, NULL, 0, 5700, 0.95, 34, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (18, 12, 118, CAST(N'2020-10-30 00:00:00.000' AS DateTime), NULL, 80, NULL, 80, 0, 150, NULL, NULL, 150, 12000, NULL, NULL, NULL, 0, 12000, 0.851, 35, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (22, 7, 77, CAST(N'2020-10-31 00:00:00.000' AS DateTime), NULL, 90, NULL, 90, 0, 150, NULL, NULL, 150, 13500, NULL, NULL, NULL, 0, 13500, 0.9, 36, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (20, 3, 230, CAST(N'2021-10-30 00:00:00.000' AS DateTime), NULL, 3, NULL, 3, 0, 1500, NULL, NULL, 1500, 4500, NULL, NULL, NULL, 0, 4500, 0.3, 37, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (13, 31, 97, CAST(N'2019-10-30 00:00:00.000' AS DateTime), NULL, 60, NULL, 60, 0, 409, NULL, NULL, 409, 24540, NULL, NULL, NULL, 0, 24540, 6, 38, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (13, 37, 100, CAST(N'2019-10-31 00:00:00.000' AS DateTime), NULL, 35, NULL, 35, 0, 696, NULL, NULL, 696, 24360, NULL, NULL, NULL, 0, 24360, 3.5, 39, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (13, 7, 77, CAST(N'2020-10-31 00:00:00.000' AS DateTime), NULL, 90, NULL, 90, 0, 143, NULL, NULL, 143, 12870, NULL, NULL, NULL, 0, 12870, 0.9, 40, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (12, 70, 267, CAST(N'2022-01-31 00:00:00.000' AS DateTime), NULL, 10, NULL, 10, 0, 2383, NULL, NULL, 2383, 23830, NULL, NULL, NULL, 0, 23830, 0.833, 41, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (21, 39, 81, CAST(N'2020-12-31 00:00:00.000' AS DateTime), N'2', NULL, NULL, 140, 0, 550, NULL, NULL, 550, 77000, NULL, NULL, NULL, 0, 77000, 2, 42, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (21, 30, 59, CAST(N'2021-03-30 00:00:00.000' AS DateTime), N'1', NULL, NULL, 120, 0, 240, NULL, NULL, 240, 28800, NULL, NULL, NULL, 0, 28800, 1, 43, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (21, 36, 76, CAST(N'2021-03-30 00:00:00.000' AS DateTime), N'1', NULL, NULL, 120, 0, 220, NULL, NULL, 220, 26400, NULL, NULL, NULL, 0, 26400, 1, 44, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (21, 22, 91, CAST(N'2020-08-31 00:00:00.000' AS DateTime), N'1', NULL, NULL, 100, 0, 95, NULL, NULL, 95, 9500, NULL, NULL, NULL, 0, 9500, 1, 45, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (21, 65, 109, CAST(N'2021-03-31 00:00:00.000' AS DateTime), NULL, 9, NULL, 9, 0, 1100, NULL, NULL, 1100, 9900, NULL, NULL, NULL, 0, 9900, 0.692, 46, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (21, 51, 68, CAST(N'2021-03-30 00:00:00.000' AS DateTime), NULL, 6, NULL, 6, 0, 2600, NULL, NULL, 2600, 15600, NULL, NULL, NULL, 0, 15600, 0.3, 47, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (21, 49, 144, CAST(N'2019-12-20 00:00:00.000' AS DateTime), NULL, 41, NULL, 41, 0, 236.34, NULL, NULL, 236.34, 9689.94, NULL, NULL, NULL, 0, 9689.94, 0.427, 48, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (21, 47, 102, CAST(N'2021-01-31 00:00:00.000' AS DateTime), NULL, 7, NULL, 7, 0, 808, NULL, NULL, 808, 5656, NULL, NULL, NULL, 0, 5656, 0.35, 49, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (21, 44, 60, CAST(N'2020-04-30 00:00:00.000' AS DateTime), NULL, 2, NULL, 2, 0, 2900, NULL, NULL, 2900, 5800, NULL, NULL, NULL, 0, 5800, 0.167, 50, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (21, 48, 67, CAST(N'2020-10-30 00:00:00.000' AS DateTime), NULL, 2, NULL, 2, 0, 5000, NULL, NULL, 5000, 10000, NULL, NULL, NULL, 0, 10000, 0.167, 51, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (21, 69, 157, CAST(N'2021-05-30 00:00:00.000' AS DateTime), NULL, 12, NULL, 12, 0, 130, NULL, NULL, 130, 1560, NULL, NULL, NULL, 0, 1560, 0.107, 52, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (27, 27, 253, CAST(N'2021-12-31 00:00:00.000' AS DateTime), NULL, 48, NULL, 48, 0, 415, NULL, NULL, 415, 19920, NULL, NULL, NULL, 0, 19920, 0.686, 53, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (28, 73, 259, CAST(N'2021-10-30 00:00:00.000' AS DateTime), NULL, 53, NULL, 53, 0, 17, NULL, NULL, 17, 901, NULL, NULL, NULL, 0, 901, 0.076, 54, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (23, 70, 267, CAST(N'2022-01-31 00:00:00.000' AS DateTime), NULL, 10, NULL, 10, 1300, 2400, NULL, NULL, 2400, 24000, NULL, NULL, NULL, 13000, 24000, 0.833, 55, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (15, 10, 78, CAST(N'2020-10-31 00:00:00.000' AS DateTime), NULL, 10, NULL, 10, 0, 300, NULL, NULL, 300, 3000, NULL, NULL, NULL, 0, 3000, 0.1, 56, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (25, 9, 254, CAST(N'2021-11-30 00:00:00.000' AS DateTime), NULL, 8, NULL, 8, 0, 193.75, NULL, NULL, 193.75, 1550, NULL, NULL, NULL, 0, 1550, 0.08, 58, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (29, 30, 286, CAST(N'2022-01-31 00:00:00.000' AS DateTime), NULL, 10, NULL, 10, 0, 240, NULL, NULL, 240, 2400, NULL, NULL, NULL, 0, 2400, 0.083, 59, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (29, 69, 263, CAST(N'2021-12-30 00:00:00.000' AS DateTime), NULL, 20, NULL, 20, 0, 160, NULL, NULL, 160, 3200, NULL, NULL, NULL, 0, 3200, 0.179, 60, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (29, 63, 224, CAST(N'2021-08-31 00:00:00.000' AS DateTime), NULL, 20, NULL, 20, 0, 170, NULL, NULL, 170, 3400, NULL, NULL, NULL, 0, 3400, 0.167, 61, 0)
INSERT [dbo].[SalesR_D] ([RID], [IID], [BNID], [ExpDT], [CTN], [PCS], [SCH], [Qty], [PurPrice], [SalesPriceP], [AddPer], [AddAmt], [SalesPrice], [PAmt], [DisP], [DisAmt], [DisRs], [Amt2], [Amt], [PCK_Det], [SRT], [RCancel]) VALUES (30, 15, NULL, NULL, NULL, 6, NULL, 6, 108.3572, 200, NULL, NULL, 200, 1200, N'1', N'12', N'720', 650.1432, 468, 0.047, 62, 0)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (1, 1, CAST(N'2020-01-01 00:00:00.000' AS DateTime), 30044, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 129650, 1284050, NULL, 1154400, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-01-25 00:00:00.000' AS DateTime), 1, CAST(N'2020-01-25 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (2, 1, CAST(N'2020-01-16 00:00:00.000' AS DateTime), 30052, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 7600, 380788, NULL, 373188, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-01-25 00:00:00.000' AS DateTime), 1, CAST(N'2020-01-26 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (3, 1, CAST(N'2020-01-20 00:00:00.000' AS DateTime), 30058, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 2580, 675208, NULL, 672628, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-01-25 00:00:00.000' AS DateTime), 1, CAST(N'2020-01-25 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (4, 1, CAST(N'2020-01-21 00:00:00.000' AS DateTime), 30003, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 5434, 993567, NULL, 988133, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-01-25 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-19 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (5, 1, CAST(N'2020-01-26 00:00:00.000' AS DateTime), 30052, NULL, NULL, NULL, NULL, NULL, 1, 1, N'As per Dr Tariq Instruction & direct dlvrd to Shams Nabi', 10500, 384108, NULL, 373608, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-01-26 00:00:00.000' AS DateTime), 1, CAST(N'2020-01-26 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (6, 1, CAST(N'2020-02-03 00:00:00.000' AS DateTime), 30152, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 47400, -276150, NULL, -323550, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-02-03 00:00:00.000' AS DateTime), 3, CAST(N'2020-02-04 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (7, 1, CAST(N'2020-02-04 00:00:00.000' AS DateTime), 30052, NULL, NULL, NULL, NULL, NULL, 1, 1, N'Batch fault physical in out made as per system requirmnt', 0, 576288, NULL, 576288, NULL, NULL, 1, 0, 0, 3, CAST(N'2020-02-04 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-20 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (8, 1, CAST(N'2020-02-06 00:00:00.000' AS DateTime), 30060, NULL, NULL, NULL, NULL, NULL, 1, 1, N'As per Dr sb Instruction.', 9000, 81150, NULL, 72150, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-02-06 00:00:00.000' AS DateTime), 1, CAST(N'2020-02-06 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (9, 1, CAST(N'2020-02-11 00:00:00.000' AS DateTime), 30052, NULL, NULL, NULL, NULL, NULL, 1, 1, N'& delivered to Iqbal sanghar.', 8400, 576288, NULL, 567888, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-02-11 00:00:00.000' AS DateTime), 1, CAST(N'2020-02-11 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (10, 1, CAST(N'2020-02-24 00:00:00.000' AS DateTime), 30152, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3650, 189377, NULL, 185727, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-02-17 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (11, 1, CAST(N'2020-02-24 00:00:00.000' AS DateTime), 30032, NULL, NULL, NULL, NULL, NULL, 1, 1, N'direct send to pothar chicks', 72000, 1287001, NULL, 1215001, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-02-17 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-17 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (12, 1, CAST(N'2020-02-24 00:00:00.000' AS DateTime), 30032, NULL, NULL, NULL, NULL, NULL, 1, 1, N'direct send to a&S Rwp', 23830, 1215001, NULL, 1191171, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-18 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (13, 1, CAST(N'2020-02-24 00:00:00.000' AS DateTime), 30032, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 61770, 1348771, NULL, 1287001, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-17 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (14, 1, CAST(N'2020-02-25 00:00:00.000' AS DateTime), 30044, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 28800, 1045400, NULL, 1016600, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-13 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (15, 1, CAST(N'2020-02-15 00:00:00.000' AS DateTime), 30052, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 3000, 567888, NULL, 564888, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-20 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (16, 1, CAST(N'2020-01-03 00:00:00.000' AS DateTime), 30040, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 23100, 678602, NULL, 655502, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-14 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (17, 1, CAST(N'2020-02-03 00:00:00.000' AS DateTime), 30021, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1870, 624112, NULL, 622242, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-17 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (18, 1, CAST(N'2020-03-03 00:00:00.000' AS DateTime), 30042, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 17700, 30560, NULL, 12860, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-14 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (19, 1, CAST(N'2020-03-04 00:00:00.000' AS DateTime), 30002, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 32670, 2184895, NULL, 2152225, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-13 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (20, 1, CAST(N'2020-03-07 00:00:00.000' AS DateTime), 30079, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 4500, 10000, NULL, 5500, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-14 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (21, 1, CAST(N'2020-03-07 00:00:00.000' AS DateTime), 30032, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 199905.94, 1146171, NULL, 946265.06, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-19 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (22, 1, CAST(N'2020-03-07 00:00:00.000' AS DateTime), 30058, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 13500, 699442, NULL, 685942, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-14 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (23, 1, CAST(N'2020-03-14 00:00:00.000' AS DateTime), 30058, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 24000, 825572, NULL, 801572, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-20 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (24, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 10001, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, 0, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (25, 1, CAST(N'2020-01-12 00:00:00.000' AS DateTime), 30052, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1550, 380788, NULL, 379238, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-19 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (26, 1, CAST(N'2020-03-16 00:00:00.000' AS DateTime), 30050, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 22770, 278313, NULL, 255543, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-12 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (27, 1, CAST(N'2020-04-11 00:00:00.000' AS DateTime), 30042, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 19920, 158210, NULL, 138290, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-14 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-17 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (28, 1, CAST(N'2020-04-11 00:00:00.000' AS DateTime), 30038, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 901, 164000, NULL, 163099, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-17 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-17 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (29, 1, CAST(N'2020-04-20 00:00:00.000' AS DateTime), 30064, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 9000, NULL, NULL, -9000, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-04-20 00:00:00.000' AS DateTime), 1, CAST(N'2020-04-20 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[SalesR_M] ([RID], [CompID], [EDate], [AC_Code], [Ship_ID], [Ship_To], [RID2], [Trans_ID], [BiltyNo], [SID], [WID], [Rem], [NetAmt2], [PreBal], [DisAmt], [NetAmt], [AC_Code3], [CashAmt], [APost], [Posted], [RCancel], [Create_User_ID], [Create_Date], [Edit_User_ID], [Edit_Date], [Del_User_ID], [Del_Date]) VALUES (30, 1, CAST(N'2020-05-05 00:00:00.000' AS DateTime), 30001, NULL, NULL, N'295', NULL, NULL, 1, 1, NULL, 468, 26000, N'2000', 27532, NULL, NULL, 1, 1, 0, 1, CAST(N'2020-05-05 00:00:00.000' AS DateTime), 1, CAST(N'2020-05-05 00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([SizeID], [SizeName], [BranchID], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsDeleted], [IID]) VALUES (1, N'8.8', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [BranchID], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsDeleted], [IID]) VALUES (2, N'8.9', NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [BranchID], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsDeleted], [IID]) VALUES (3, N'9.0', NULL, NULL, NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Sizes] OFF
SET IDENTITY_INSERT [dbo].[Styles] ON 

INSERT [dbo].[Styles] ([StyleID], [StyleName], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (1, N'gentsShoes', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Styles] ([StyleID], [StyleName], [CreatedDate], [CreatedBy], [ModifiedBy], [ModifiedDate], [IsDeleted]) VALUES (2, N'LadiesShoes', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Styles] OFF
SET IDENTITY_INSERT [dbo].[tbl_city] ON 

INSERT [dbo].[tbl_city] ([Id], [CityName], [isDeleted]) VALUES (1, N'Karachi', NULL)
INSERT [dbo].[tbl_city] ([Id], [CityName], [isDeleted]) VALUES (2, N'Hyderabad', NULL)
INSERT [dbo].[tbl_city] ([Id], [CityName], [isDeleted]) VALUES (3, N'Lahore', NULL)
INSERT [dbo].[tbl_city] ([Id], [CityName], [isDeleted]) VALUES (4, N'Islamabad', NULL)
INSERT [dbo].[tbl_city] ([Id], [CityName], [isDeleted]) VALUES (5, N'larkana', NULL)
INSERT [dbo].[tbl_city] ([Id], [CityName], [isDeleted]) VALUES (1005, N'kashmir shah', 0)
INSERT [dbo].[tbl_city] ([Id], [CityName], [isDeleted]) VALUES (1006, N'hirabad', 1)
INSERT [dbo].[tbl_city] ([Id], [CityName], [isDeleted]) VALUES (1007, N'lahore', 0)
SET IDENTITY_INSERT [dbo].[tbl_city] OFF
SET IDENTITY_INSERT [dbo].[tbl_Employee] ON 

INSERT [dbo].[tbl_Employee] ([ID], [EmployeName], [PyteTypeID], [isDeleted], [ACCode], [companyID]) VALUES (1, N'abdullah', 2, 0, 10000001, 0)
SET IDENTITY_INSERT [dbo].[tbl_Employee] OFF
SET IDENTITY_INSERT [dbo].[tbl_KOT] ON 

INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (1, N'KOT-H7889', N'1', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (2, N'KOT-T7744', N'2', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (3, N'KOT-T2389', N'3', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (4, N'KOT-T3550', N'4', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (5, N'KOT-T3732', N'5', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (6, N'KOT-T2113', N'6', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (7, N'KOT-T2975', N'7', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (1003, N'KOT-T4519', N'1003', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (1004, N'KOT-T5587', N'1004', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (1005, N'KOT-T6827', N'1005', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (1006, N'KOT-D2172', N'1006', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (2003, N'KOT-D4910', N'2003', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (2004, N'KOT-D4910', N'2003', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (2005, N'KOT-D4514', N'2004', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (2006, N'KOT-D8024', N'2005', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (2007, N'KOT-D5763', N'2006', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (3003, N'KOT-D3159', N'1', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (3004, N'KOT-D6888', N'2', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (3005, N'KOT-T9712', N'3', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (3006, N'KOT-D4172', N'4', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (3007, N'KOT-D1913', N'5', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (3008, N'KOT-D2125', N'6', 1, NULL)
INSERT [dbo].[tbl_KOT] ([Id], [KotNo], [OrderID], [iscomplete], [CatID]) VALUES (3009, N'KOT-D9818', N'7', 1, NULL)
SET IDENTITY_INSERT [dbo].[tbl_KOT] OFF
SET IDENTITY_INSERT [dbo].[tbl_OpeningCash] ON 

INSERT [dbo].[tbl_OpeningCash] ([EntryDate], [Amount], [BankAccount], [CashOpeningId]) VALUES (CAST(N'2020-12-10 18:30:53.597' AS DateTime), 600, NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_OpeningCash] OFF
SET IDENTITY_INSERT [dbo].[tbl_Order] ON 

INSERT [dbo].[tbl_Order] ([OrderId], [KOTID], [OrderNo], [OrderDate], [isComplete], [Discount], [Amount], [TblID], [WaiterID], [OrderType], [GST]) VALUES (1, N'1', N'D3159', CAST(N'2021-01-25 18:49:10.503' AS DateTime), 1, NULL, CAST(40.00 AS Decimal(20, 2)), 2, 0, N'DineIn', NULL)
INSERT [dbo].[tbl_Order] ([OrderId], [KOTID], [OrderNo], [OrderDate], [isComplete], [Discount], [Amount], [TblID], [WaiterID], [OrderType], [GST]) VALUES (2, N'1', N'D6888', CAST(N'2021-01-31 18:39:01.177' AS DateTime), 1, NULL, CAST(40.00 AS Decimal(20, 2)), 2, 0, N'DineIn', NULL)
INSERT [dbo].[tbl_Order] ([OrderId], [KOTID], [OrderNo], [OrderDate], [isComplete], [Discount], [Amount], [TblID], [WaiterID], [OrderType], [GST]) VALUES (3, N'100', N'T9712', CAST(N'2021-02-08 16:22:33.407' AS DateTime), 1, CAST(0.00 AS Decimal(20, 2)), CAST(80.00 AS Decimal(20, 2)), 0, NULL, N'takeAway', CAST(0.00 AS Decimal(20, 2)))
INSERT [dbo].[tbl_Order] ([OrderId], [KOTID], [OrderNo], [OrderDate], [isComplete], [Discount], [Amount], [TblID], [WaiterID], [OrderType], [GST]) VALUES (4, N'1', N'D4172', CAST(N'2021-02-08 16:57:25.807' AS DateTime), 1, NULL, CAST(40.00 AS Decimal(20, 2)), 2, 1, N'DineIn', NULL)
INSERT [dbo].[tbl_Order] ([OrderId], [KOTID], [OrderNo], [OrderDate], [isComplete], [Discount], [Amount], [TblID], [WaiterID], [OrderType], [GST]) VALUES (5, N'1', N'D1913', CAST(N'2021-02-08 18:00:50.283' AS DateTime), 1, NULL, CAST(40.00 AS Decimal(20, 2)), 2, 1, N'DineIn', NULL)
INSERT [dbo].[tbl_Order] ([OrderId], [KOTID], [OrderNo], [OrderDate], [isComplete], [Discount], [Amount], [TblID], [WaiterID], [OrderType], [GST]) VALUES (6, N'1', N'D2125', CAST(N'2021-02-08 18:04:06.433' AS DateTime), 1, NULL, CAST(240.00 AS Decimal(20, 2)), 1, 1, N'DineIn', NULL)
INSERT [dbo].[tbl_Order] ([OrderId], [KOTID], [OrderNo], [OrderDate], [isComplete], [Discount], [Amount], [TblID], [WaiterID], [OrderType], [GST]) VALUES (7, N'1', N'D9818', CAST(N'2021-02-08 18:05:12.240' AS DateTime), 1, NULL, CAST(30.00 AS Decimal(20, 2)), 2, 1, N'DineIn', NULL)
SET IDENTITY_INSERT [dbo].[tbl_Order] OFF
SET IDENTITY_INSERT [dbo].[tbl_OrderDetails] ON 

INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (1, 1, N'3003', 1, 1, CAST(40.00 AS Decimal(20, 2)), 2)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (2, 2, N'3004', 1, 1, CAST(40.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (3, 2, N'3004', 2, 1, CAST(0.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (4, 3, N'3005', 3, 1, CAST(0.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (5, 3, N'3005', 1, 1, CAST(40.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (6, 3, N'3005', 2, 1, CAST(0.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (7, 4, N'3006', 3, 1, CAST(0.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (8, 4, N'3006', 1, 1, CAST(40.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (9, 4, N'3006', 2, 1, CAST(0.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (10, 5, N'3007', 1, 1, CAST(40.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (11, 5, N'3007', 2, 1, CAST(0.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (12, 5, N'3007', 3, 1, CAST(0.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (13, 6, N'3008', 1, 1, CAST(40.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (14, 6, N'3008', 2, 1, CAST(200.00 AS Decimal(20, 2)), 1)
INSERT [dbo].[tbl_OrderDetails] ([Id], [OrderId], [KOTID], [itemID], [Qty], [Rate], [CatID]) VALUES (15, 7, N'3009', 3, 1, CAST(30.00 AS Decimal(20, 2)), 1)
SET IDENTITY_INSERT [dbo].[tbl_OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[tbl_Table] ON 

INSERT [dbo].[tbl_Table] ([ID], [TableName], [isDeleted], [companyID]) VALUES (1, N'Table1', 0, 0)
INSERT [dbo].[tbl_Table] ([ID], [TableName], [isDeleted], [companyID]) VALUES (2, N'Table2', 0, 0)
SET IDENTITY_INSERT [dbo].[tbl_Table] OFF
SET IDENTITY_INSERT [dbo].[tbl_Warehouse] ON 

INSERT [dbo].[tbl_Warehouse] ([WID], [Warehouse], [WSht]) VALUES (1, N'WareHouse1', N'Wh1')
INSERT [dbo].[tbl_Warehouse] ([WID], [Warehouse], [WSht]) VALUES (2, N'Warehouse2', N'wh2')
SET IDENTITY_INSERT [dbo].[tbl_Warehouse] OFF
SET IDENTITY_INSERT [dbo].[tblStock] ON 

INSERT [dbo].[tblStock] ([ItemID], [BatchNO], [Expiry], [Quantity], [Id]) VALUES (0, NULL, NULL, 6, 1)
SET IDENTITY_INSERT [dbo].[tblStock] OFF
SET IDENTITY_INSERT [dbo].[tblWaiter] ON 

INSERT [dbo].[tblWaiter] ([ID], [Name]) VALUES (1, N'Ahmed')
INSERT [dbo].[tblWaiter] ([ID], [Name]) VALUES (2, N'Ali')
INSERT [dbo].[tblWaiter] ([ID], [Name]) VALUES (3, N'Shahbaz')
INSERT [dbo].[tblWaiter] ([ID], [Name]) VALUES (4, N'Arsalan')
SET IDENTITY_INSERT [dbo].[tblWaiter] OFF
SET IDENTITY_INSERT [dbo].[Vendors] ON 

INSERT [dbo].[Vendors] ([VID], [VendName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Cell], [Eml], [Tel], [ZID], [Debit], [Credit], [AC_Code], [InActive], [Land], [City], [Village], [CompanyID]) VALUES (1, N'zulfi', 2, N'', N'', N'', N'', N'', N'', 0, 0, 8000, 9000001, 0, NULL, NULL, NULL, 0)
INSERT [dbo].[Vendors] ([VID], [VendName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Cell], [Eml], [Tel], [ZID], [Debit], [Credit], [AC_Code], [InActive], [Land], [City], [Village], [CompanyID]) VALUES (2, N'zulfi ahmed', NULL, N'', N'', N'', N'', N'', N'', 0, 0, 90000, 9000002, 0, NULL, NULL, NULL, 0)
INSERT [dbo].[Vendors] ([VID], [VendName], [PType_ID], [Add], [NTN_No], [ContactPerson], [Cell], [Eml], [Tel], [ZID], [Debit], [Credit], [AC_Code], [InActive], [Land], [City], [Village], [CompanyID]) VALUES (3, N'dm w', 2, N'karachi', N'', N'', N'', N'', N'', 0, 0, 30000, 9000003, 0, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Vendors] OFF
/****** Object:  StoredProcedure [dbo].[Customer_Select]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Customer_Select](@customerID int)
as
begin

select Cus.*,Village.VillageName,c.CityName from Customers as Cus
INNER JOIN tbl_city as c on c.Id=Cus.City
INNER JOIN tbl_Village as Village on Village.ID=Cus.Village


where Cus.InActive='false';
end









GO
/****** Object:  StoredProcedure [dbo].[ExpenseVoucherCreate]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ExpenseVoucherCreate]
(@RID  int)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select m.*,c.Amt,c.ChkNo,c.InvNo,c.MOP_ID,c.Narr,c.SlipNo,c.SRT,c.AC_Code as RV_CustomerCode,c.ID from EV_M as m
inner join EV_D as c on m.RID=c.RID
where m.RID=@RID
END





GO
/****** Object:  StoredProcedure [dbo].[ExpenseVoucherEdit]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ExpenseVoucherEdit] 
	-- Add the parameters for the stored procedure here
(@RID  int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 1 m.*,c.Amt as amount,c.ChkNo,c.InvNo,c.MOP_ID,c.Narr,c.SlipNo,c.SRT,c.AC_Code as RV_CustomerCode,c.ID from EV_M as m
inner join EV_D as c on m.RID=c.RID
where m.RID=@RID

END





GO
/****** Object:  StoredProcedure [dbo].[ExpenseVoucherIndex]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ExpenseVoucherIndex] 
	-- Add the parameters for the stored procedure here
	
@StartDate datetime,
@EndDate datetime

as
begin
select m.*,c.Amt as amount,rvm.AC_Title as customer,d.AC_Title as cashBAnk,c.ChkNo,c.InvNo,c.MOP_ID,c.Narr,c.SlipNo,c.SRT,c.AC_Code as RV_TransactionCode,c.ID from EV_M as m
inner join EV_D as c on m.RID=c.RID
inner join COA_D as d on d.AC_Code=c.AC_Code
inner join COA_D rvm on rvm.AC_Code=m.AC_Code

where (CAST(m.EDate as Date) >= CAST(@StartDate as Date) and CAST(m.EDate as Date) <= CAST(@EndDate as Date))
END





GO
/****** Object:  StoredProcedure [dbo].[Gen_NewInvNo]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Gen_NewInvNo](@InvType varchar(10))
AS
BEGIN

-----Local Variables

DECLARE @dt varchar(4);
DECLARE @maxID varchar(15);

-----Setup Date YYMM 1510
SET @dt = right(CONVERT(varchar(10),getdate(),10),2) + LEFT(CONVERT(varchar(10),getdate(),10),2);

-----Get max labNo
SELECT TOP(1) @maxID = InvNo from Pur_M WHERE InvNo LIKE @InvType +'-'+ @dt+'%' ORDER BY InvNo DESC

-----Null Fallback, if no labNo for current month
SET @maxID = ISNULL(@maxID,@dt + '000');


-----Increment labNo + 1
SET @maxID = convert(int,Right(@maxID,LEN(@maxID)-7)) + 1;


-----New LabNo
Select @InvType +'-'+ @dt + '' + REPLICATE(0,3 - LEN(@maxID)) + @maxID AS [labNo];

END

GO
/****** Object:  StoredProcedure [dbo].[Gen_NewInvNoSale]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Gen_NewInvNoSale](@InvType varchar(10))
AS
BEGIN

-----Local Variables

DECLARE @dt varchar(4);
DECLARE @maxID varchar(15);

-----Setup Date YYMM 1510
SET @dt = right(CONVERT(varchar(10),getdate(),10),2) + LEFT(CONVERT(varchar(10),getdate(),10),2);

-----Get max labNo
SELECT TOP(1) @maxID = InvNo from Sales_M WHERE InvNo LIKE @InvType +'-'+ @dt+'%' ORDER BY InvNo DESC

-----Null Fallback, if no labNo for current month
SET @maxID = ISNULL(@maxID,@dt + '000');


-----Increment labNo + 1
SET @maxID = convert(int,Right(@maxID,LEN(@maxID)-7)) + 1;


-----New LabNo
Select @InvType +'-'+ @dt + '' + REPLICATE(0,3 - LEN(@maxID)) + @maxID AS [labNo];

END

GO
/****** Object:  StoredProcedure [dbo].[GetAc_Code]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAc_Code]

@AC_Code int
as
begin

if(@AC_Code= 1)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,1000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=1;
    END

	else if(@AC_Code= 2)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,2000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=2;
    END

	else if (@AC_Code= 3)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,3000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=3;
    END

	else if(@AC_Code= 4)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,4000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=4;
    END

	else if(@AC_Code= 5)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,5000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=5;
    END

	if(@AC_Code= 6)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,6000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=6;
    END

	else if(@AC_Code= 7)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,7000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=7;
    END

	else if(@AC_Code= 8)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,8000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=8;
    END

	else if(@AC_Code= 9)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,9000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=9;
    END

	else if(@AC_Code= 10)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,10000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=10;
    END

	else if(@AC_Code= 11)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,11000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=11;
    END

	if(@AC_Code= 12)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,12000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=12;
    END

	if(@AC_Code= 13)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,13000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=13;
    END

	if(@AC_Code= 14)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,14000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=14;
    END

	if(@AC_Code= 15)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,15000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=15;
    END

	if(@AC_Code= 16)
	BEGIN
	SELECT isnull(Max(AC_Code)+1,16000001) as AC_Code FROM COA_D Where COA_D.CAC_Code=16;
    END

end



GO
/****** Object:  StoredProcedure [dbo].[GetAllAc_Code]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllAc_Code]
as
begin

select * from COA_D where CAC_Code =1 or CAC_Code =2 and inActive ='false'

end






GO
/****** Object:  StoredProcedure [dbo].[getCAshBookByDate]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getCAshBookByDate]
	-- Add the parameters for the stored procedure here
	@AcodeMin int,
	@AcodeMax int,
	@StartDate datetime,
@EndDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT gl.GLDate,gl.Debit,gl.Credit,gl.Narration,concat(tt.Symbol, '-',gl.RID  ) as RpCode FROM gl  left join RP tt on gl.TypeCode = tt.TypeCode
WHERE AC_Code BETWEEN @AcodeMin AND @AcodeMax and


(CAST(GLDate as Date) >= CAST(@StartDate as Date) and CAST(GLDate as Date ) <= CAST(@EndDate as Date));

    -- Insert statements for procedure here
	
END

GO
/****** Object:  StoredProcedure [dbo].[getCustomerLedgerBYDate]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





create PROCEDURE [dbo].[getCustomerLedgerBYDate] 
	-- Add the parameters for the stored procedure here
@dtfrom datetime ,@dtto datetime, @acCode int
AS
BEGIN
select GLDate,concat(tt.Symbol, '-',gl.RID  ) as reference,Narration,IPrice,Qty_IN, isnull(debit,0) as debit,isnull(Credit,0) as credit   from GL 
 left join RP tt on gl.TypeCode = tt.TypeCode
 where AC_Code=@acCode and GLDate between @dtfrom AND @dtto order by GLDate;
END
GO
/****** Object:  StoredProcedure [dbo].[getCustomerPreviousBalance]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[getCustomerPreviousBalance] 

@dtFrom datetime, @acCode int
AS
BEGIN


SELECT
  isnull(SUM( debit),0) as debit,ISNULL( sum(Credit),0) as credit
FROM
    GL
WHERE
    GLDate < @dtFrom and AC_Code=@acCode
END

GO
/****** Object:  StoredProcedure [dbo].[GetExpiredItems]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetExpiredItems]
	-- Add the parameters for the stored procedure here
@ToDate datetime, 

@FromDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select Itemledger.ExpDT,Itemledger.CTN
      ,Itemledger.PCS
      ,Itemledger.[OPN] ,Items.IName
       from Itemledger
	   
	    left join Items on Itemledger.IID= Items.IID 
		 where  Itemledger.TypeCode=2 and
		 
		 (CAST(Itemledger.ExpDT as Date) >= CAST(@ToDate as Date) and CAST(Itemledger.ExpDT as Date ) <= CAST(@FromDate as Date))

	
 
END

GO
/****** Object:  StoredProcedure [dbo].[getItemAdjustment]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getItemAdjustment] 
	-- Add the parameters for the stored procedure here
	@dtfrom datetime ,@dtto datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Adj_M.EDate ,COA_D.AC_Title as Account ,COA_D.AC_Code as AccountID,Items.IName as product,Items.AC_Code_Inv as productCode,Items.IID as productID,tbl_Warehouse.Warehouse as warehouse ,tbl_Warehouse.WID as warehouseID ,Adj_M.RID ,Adj_D.Qty as QtyIN , Adj_D.Qty2 as QtyOut


,Adj_D.PurPrice , Adj_D.Debit ,Adj_D.Credit from Adj_M

inner join Adj_D on Adj_M.RID=Adj_D.RID

inner join tbl_Warehouse on tbl_Warehouse.WID=Adj_M.WID

inner join COA_D on COA_D.AC_Code=Adj_M.AC_Code

inner join Items on Items.IID=Adj_D.IID
where

CAST(Adj_M.EDate AS DATE) BETWEEN CAST(@dtfrom AS DATE) AND CAST(@dtto AS DATE)

order by Adj_M.EDate
END

GO
/****** Object:  StoredProcedure [dbo].[getMaxACodeById]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getMaxACodeById]
	-- Add the parameters for the stored procedure here
	@cac_Code int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	select ISNULL(max(AC_Code),0) from COA_D where CAC_Code=@cac_Code

END

GO
/****** Object:  StoredProcedure [dbo].[getMinACodeById]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getMinACodeById]
	-- Add the parameters for the stored procedure here
	@cac_Code int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	select ISNULL(min(AC_Code),0) from COA_D where CAC_Code=@cac_Code

END

GO
/****** Object:  StoredProcedure [dbo].[getMonthDays]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getMonthDays]
	   @Month int,
        @Year int
AS
BEGIN
	




select DATEADD(month,@Month-1,DATEADD(year,@Year-1900,0))as ToDate,DATEADD(day,-1,DATEADD(month,@Month,DATEADD(year,@Year-1900,0))) as FromDate
END

GO
/****** Object:  StoredProcedure [dbo].[getPaidRecordByMonth]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getPaidRecordByMonth]
	-- Add the parameters for the stored procedure here
		@StartDate datetime,
		@EndDate datetime
AS
BEGIN

select c.CusName, SUM(g.Credit) AS [TOTAL AMOUNT],c.AC_Code
from Customers c left join GL g

 ON c.AC_Code= g.AC_Code

 where  g.[GLDate]  between @StartDate and @EndDate
 GROUP BY c.CusName , c.AC_Code
END

GO
/****** Object:  StoredProcedure [dbo].[getStockByID]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getStockByID]
	-- Add the parameters for the stored procedure here
   @id	int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
select ISNULL(sum(OPN),0)+ISNULL(sum(pj),0)-ISNULL(sum(PRJ),0)- ISNULL(sum(SJ),0) +ISNULL(sum(SRJ),0) +  ISNULL(sum(SCH_IN),0) 
   -  ISNULL(sum(SCH_Out),0) +  ISNULL(sum(ADJ_IN),0) -  ISNULL(sum(ADJ_OUT),0) +ISNULL(sum(TR_IN),0) - ISNULL(sum(TR_OUT),0) +
    ISNULL( sum(MFG_IN),0)  -ISNULL( sum(MFG_OUT),0) as total

from  [dbo].[Itemledger] where IID=@id
   
END

GO
/****** Object:  StoredProcedure [dbo].[getVendorLedgerBYDate]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getVendorLedgerBYDate]
	-- Add the parameters for the stored procedure here
@dtfrom datetime ,@dtto datetime, @acCode int
AS
BEGIN
select GLDate,concat(tt.Symbol, '-',gl.RID  ) as reference,Narration,IPrice,Qty_IN, isnull(debit,0) as debit,isnull(Credit,0) as credit   from GL 
 left join RP tt on gl.TypeCode = tt.TypeCode
 where AC_Code=@acCode and GLDate between @dtfrom AND @dtto order by GLDate;
END

GO
/****** Object:  StoredProcedure [dbo].[getVendorPreviousBalance]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create PROCEDURE [dbo].[getVendorPreviousBalance] 
	-- Add the parameters for the stored procedure here
@dtFrom datetime, @acCode int
AS
BEGIN


SELECT
  isnull(SUM( debit),0) as debit,ISNULL( sum(Credit),0) as credit
FROM
    GL
WHERE
    GLDate < @dtFrom and AC_Code=@acCode
END




GO
/****** Object:  StoredProcedure [dbo].[Item_select]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Item_select]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	 select i.AC_Code_Inv,i.IName,c.Cat,u.IUnit,i.IID from Items as i inner join Items_Cat as c on i.SCatID=CatID inner join IUnit as u on i.Unit_ID= u.unit_id where i.isDeleted='false'
END





GO
/****** Object:  StoredProcedure [dbo].[PaymentVoucharEdit]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PaymentVoucharEdit](@RID  int)
as
begin
select top 1 m.*,c.Amt,c.BalAmt,c.checkDate,c.ChkNo,c.DisAmt,c.InvNo,c.MOP_ID,c.Narr,c.PreAmt,c.SlipNo,c.SRT,c.AC_Code as RV_CustomerCode,c.ID from PV_M as m
inner join PV_D as c on m.RID=c.RID
where m.RID=@RID

end






GO
/****** Object:  StoredProcedure [dbo].[PaymentVoucharIndex]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PaymentVoucharIndex]
@StartDate datetime,
@EndDate datetime

as
begin
select m.*,c.Amt,rvm.AC_Title as customer,d.AC_Title as cashBAnk,c.BalAmt,c.checkDate,c.ChkNo,c.DisAmt,c.InvNo,c.MOP_ID,c.Narr,c.PreAmt,c.SlipNo,c.SRT,c.AC_Code as RV_TransactionCode,c.ID from PV_M as m
inner join PV_D as c on m.RID=c.RID
inner join COA_D as d on d.AC_Code=c.AC_Code
inner join COA_D rvm on rvm.AC_Code=m.AC_Code

where (CAST(m.EDate as Date) >= CAST(@StartDate as Date) and CAST(m.EDate as Date) <= CAST(@EndDate as Date))

end






GO
/****** Object:  StoredProcedure [dbo].[PurchaseEDit]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[PurchaseEDit]--1,1
(@rid int,@id int)
as
begin 
select '' as MyJson,'' as PurJson,ch.Comm,ch.Total,ch.CvenID,cV.VendName as cVendName,spds.VillageID as  SaleVillageID,spds.VendorID as cusID,spds.CityID as SalecityID,spds.KhamBikri,spds.LongerTadat,spds.Phaliyan,spds.PukhtaBikri,spds.Sale_ID,spds.CustomerExpense, m.*,ch.Pur_ID,ch.VendorID,ch.ItemID,ch.UnitID,ch.Quantity,ch.Pur_Price,ch.Pur_Total,v.*,i.IName , unit.IUnit as Unites from Sale_Pur_M as m
inner join Sale_Pur_D_Pur as ch on m.RId=ch.RID
inner join Vendors V on v.VID=ch.VendorID
inner join items i on i.IID=ch.ItemID
inner join Sale_Pur_D_Sale spds on m.RId=spds.RID
inner join Vendors cV on cV.VID= ch.CvenID
left join IUnit unit on unit.unit_id = i.Unit_ID
where ch.RID=@rid
end
GO
/****** Object:  StoredProcedure [dbo].[RecivedVoucharEdit]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RecivedVoucharEdit](@RID  int)
as
begin
select top 1  m.*,c.Amt,c.BalAmt,c.checkDate,c.ChkNo,c.DisAmt,c.InvNo,c.MOP_ID,c.Narr,c.PreAmt,c.SlipNo,c.SRT,c.AC_Code as RV_CustomerCode,c.ID from RV_M as m
inner join RV_d as c on m.RID=c.RID
where m.RID=@RID
end






GO
/****** Object:  StoredProcedure [dbo].[RecivedVoucharIndex]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE proc [dbo].[RecivedVoucharIndex]
@StartDate datetime,
@EndDate datetime

as
begin
select m.*,c.Amt,rvm.AC_Title as customer,d.AC_Title as cashBAnk,c.BalAmt,c.checkDate,c.ChkNo,c.DisAmt,c.InvNo,c.MOP_ID,c.Narr,c.PreAmt,c.SlipNo,c.SRT,c.AC_Code as RV_TransactionCode,c.ID from RV_M as m
inner join RV_d as c on m.RID=c.RID
inner join COA_D as d on d.AC_Code=c.AC_Code
inner join COA_D rvm on rvm.AC_Code=m.AC_Code

where (CAST(m.EDate as Date) >= CAST(@StartDate as Date) and CAST(m.EDate as Date) <= CAST(@EndDate as Date))
END

GO
/****** Object:  StoredProcedure [dbo].[SalePurchaseDetails]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SalePurchaseDetails]--1004
(@rid int)
as
begin 
select ch.Pur_ID,ch.VendorID,ch.ItemID,ch.UnitID,ch.Quantity,ch.Pur_Price,ch.Pur_Total,v.*,i.IName, V2.VendName as CVendName,c.CityName,vill.VillageName ,ch.Comm from  Sale_Pur_D_Pur as ch
left join Vendors V on v.VID=ch.VendorID
left join Vendors V2 on V2.VID=ch.CvenID
left join items i on i.IID=ch.ItemID
left join tbl_Village vill on vill.ID=v.Village
left join tbl_city C on C.Id=V.Village
where ch.RID=@rid
end





GO
/****** Object:  StoredProcedure [dbo].[SalePurchaseIndex]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SalePurchaseIndex](@dtfrom datetime,@dtto datetime, @pageNumber int,@pageSize int)

as
begin 
select spds.*, m.[Date], m.[Date]as dtfrom, m.[Date]as dtto, m.VehicalNo,m.Rent,m.Total_Purchase, v.*
	,@pageNumber as [PageNumber]
	,@pageSize as [PageSize]
	,CONVERT(int, COUNT(*) OVER()) AS [PageCount]
	from Sale_Pur_M as m
inner join Sale_Pur_D_Sale as spds on m.RId=spds.RID
inner join customers V on v.CID=spds.VendorID
where m.[Date]>=@dtfrom and m.[Date]<=@dtto

order by m.RId desc OFFSET @PageSize * (@PageNumber - 1) ROWS
FETCH NEXT @PageSize ROWS ONLY OPTION (RECOMPILE);
end








GO
/****** Object:  StoredProcedure [dbo].[sp_AcCode_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AcCode_Insert]
	-- Add the parameters for the stored procedure here
	@CAC_Code int ,@PType_ID int,@ZID int,@AC_Code int,@AC_Title varchar(255),@DR float,@CR float,@Qty int,@InActive bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
insert into COA_D (CAC_Code,PType_ID,ZID,AC_Code,AC_Title,DR,CR,Qty,InActive) values(@CAC_Code,@PType_ID,@ZID,@AC_Code,@AC_Title,@DR,@CR,@Qty,@InActive)

    -- Insert statements for procedure here
	
END





GO
/****** Object:  StoredProcedure [dbo].[sp_catergories_Delete]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_catergories_Delete]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Items_Cat set isDeleted='true' where CatID=@Id;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_catergories_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_catergories_Insert]
	-- Add the parameters for the stored procedure here

@Name varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Items_Cat (Cat,isDeleted) values(@Name,'false');
END





GO
/****** Object:  StoredProcedure [dbo].[sp_catergories_Select]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_catergories_Select]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Items_Cat where isDeleted = 'false';
END





GO
/****** Object:  StoredProcedure [dbo].[sp_catergories_SelectByID]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_catergories_SelectByID]
	-- Add the parameters for the stored procedure here
@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Items_Cat where CatID=@Id;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_catergories_update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_catergories_update]
	-- Add the parameters for the stored procedure here
	@Id int ,
	@Name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Items_Cat set Cat=@Name where CatID=@Id;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_city_Delete]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_city_Delete]
	-- Add the parameters for the stored procedure here
@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		update tbl_city set isDeleted='true' where Id=@Id;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_City_insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_City_insert]
	-- Add the parameters for the stored procedure here
@Name varchar(55)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tbl_city(CityName,isDeleted) values(@Name,'false');
END





GO
/****** Object:  StoredProcedure [dbo].[sp_City_Select]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_City_Select]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tbl_city where isDeleted = 'false';
END





GO
/****** Object:  StoredProcedure [dbo].[sp_city_selectByID]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_city_selectByID]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		select * from tbl_city where Id=@Id;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_City_update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_City_update]-- Add the parameters for the stored procedure here
	@Name varchar(55),
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		update tbl_city set CityName=@Name where Id=@Id;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_COA_D_Delete]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_COA_D_Delete]
	-- Add the parameters for the stored procedure here
	@AC int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
 update COA_D set InActive ='true'   where  AC_Code = @AC;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_coa_d_selectByAcCode]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_coa_d_selectByAcCode]
	-- Add the parameters for the stored procedure here
	@code int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from COA_D where AC_Code=@code
END





GO
/****** Object:  StoredProcedure [dbo].[sp_COA_D_SelectByCode]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_COA_D_SelectByCode]
	-- Add the parameters for the stored procedure here
	@CAC_Code int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select * from COA_D where CAC_Code =@CAC_Code and InActive='false';
END





GO
/****** Object:  StoredProcedure [dbo].[sp_COA_D_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_COA_D_Update]


 @AC_Code int ,@PType_ID int,@ZID int,@AC_Title varchar(255),@DR float,@CR float,@Qty int,@InActive bit
 as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update [dbo].[COA_D] set PType_ID= @PType_ID,ZID=@ZID,AC_Title=@AC_Title,DR=@DR,CR=@CR,Qty=@Qty,InActive=@InActive
	
	 where AC_Code=@AC_Code
	-- Add the parameters for the stored procedure here


END





GO
/****** Object:  StoredProcedure [dbo].[sp_COA_M_Select]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_COA_M_Select] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from COA_M
END





GO
/****** Object:  StoredProcedure [dbo].[sp_company_Delete]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_company_Delete]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update IComp_M set [isDelete] ='true' where CompID =@id
END





GO
/****** Object:  StoredProcedure [dbo].[Sp_company_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_company_Insert] 
	-- Add the parameters for the stored procedure here
	@Comp varchar(255),@CShort varchar(255),@Address varchar(255),@Tel varchar(255),@Eml varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into IComp_M (Comp,CShort,[Address],[Tel],[Eml],[isDelete]) values(@Comp,@CShort,@Address,@Tel,@Eml,'false');
END





GO
/****** Object:  StoredProcedure [dbo].[Sp_company_Select]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_company_Select]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from IComp_M where isDelete ='false'
END





GO
/****** Object:  StoredProcedure [dbo].[Sp_company_SelectByID]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_company_SelectByID]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from IComp_M where CompID = @id
END





GO
/****** Object:  StoredProcedure [dbo].[Sp_company_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_company_Update]
	-- Add the parameters for the stored procedure here
	@Comp varchar(255),@CShort varchar(255),@Address varchar(255),@Tel varchar(255),@Eml varchar(255), @id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update IComp_M set Comp=@Comp,CShort=@CShort,[Address]=@Address,[Tel] =@Tel,[Eml]=@Eml where CompID = @id
END





GO
/****** Object:  StoredProcedure [dbo].[Sp_Crud_Catergories]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Crud_Catergories] 
	-- Add the parameters for the stored procedure here
@Opertion varchar(50),
@Id int ,
@Name varchar(50),
@isDeleted bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@Opertion = 'insert')
	BEGIN
	insert into Items_Cat (Cat,isDeleted) values('shahazaib','false');
    END

	else if(@Opertion = 'select')
	BEGIN
	select * from Items_Cat where isDeleted = 'false';
    END


	else if(@Opertion = 'Delete')
	BEGIN
	update Items_Cat set isDeleted='true' where CatID=@Id;
    END

	else if(@Opertion = 'Update')
	BEGIN
	update Items_Cat set Cat=@Name where CatID=@Id;
    END

	else if(@Opertion = 'SelectByID')
	BEGIN
	select * from Items_Cat where CatID=1;
    END
	


	
END





GO
/****** Object:  StoredProcedure [dbo].[sp_customer_COA_D_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_customer_COA_D_Update] 
	-- Add the parameters for the stored procedure here
	@Name varchar(255),
	@AC_Code int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 update COA_D set
		   [AC_Title]=@Name where AC_Code=@AC_Code;

END





GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_Delete]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Customer_Delete]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 update Customers set
		   InActive='true' where CID=@id
END





GO
/****** Object:  StoredProcedure [dbo].[sp_customer_Gl_insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_customer_Gl_insert]
	-- Add the parameters for the stored procedure here
	@RID int
           ,@RID2 int
           ,@TypeCode int
           ,@GLDate date
           
         
           ,@AC_Code int
           ,@AC_Code2 int
           ,@Narration  nvarchar(255)
  
           ,@Debit float
           ,@Credit float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	   INSERT INTO [dbo].[GL]
           ([RID]
           ,[RID2]
           ,[TypeCode]
           ,[GLDate]
           
         
           ,[AC_Code]
           ,[AC_Code2]
           ,[Narration]
           
         
           
           
           ,[Debit]
           ,[Credit]
         )
     VALUES(@RID 
           ,@RID2 
           ,@TypeCode 
           ,@GLDate 
           
         
           ,@AC_Code 
           ,@AC_Code2 
           ,@Narration  
  
           ,@Debit
           ,@Credit );
         
END





GO
/****** Object:  StoredProcedure [dbo].[sp_customer_Gl_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_customer_Gl_Update]
	-- Add the parameters for the stored procedure here
	@Debit float,
	@Credit float,
	@AC_Code int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	       update GL set
		   Debit=@Debit , Credit=@Credit where AC_Code=@AC_Code and TypeCode=0;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_customer_Gl_Update_Capital]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_customer_Gl_Update_Capital]
	-- Add the parameters for the stored procedure here
		-- Add the parameters for the stored procedure here
	@Debit float,
	@Credit float,
	@AC_Code int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	       update GL set
		   Debit=@Debit , Credit=@Credit where AC_Code2=@AC_Code and TypeCode=0;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Customer_insert]
	-- Add the parameters for the stored procedure here
	
	@AC_Code int,@CusName varchar(55),@PType_ID int,@Add varchar(250),@NTN_No varchar(55),@ContactPerson varchar(55)
   ,@Owner_Name varchar(55),@Cell varchar(55),@Eml varchar(55),@Tel varchar(55),@SID int,
	@ZID int,@AddPer varchar(55),@Debit float
   ,@Credit float,@Black_List bit,@War_Cls varchar(55),@War_DT varchar(55),
    @Prn varchar(55),@InActive bit,@Land varchar(55),@City int,@Village int


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Customers
           (AC_Code,CusName,PType_ID,[Add],NTN_No,ContactPerson,Owner_Name,Cell,Eml,Tel,[SID],ZID,AddPer,Debit
		   ,Credit,Black_List,War_Cls,War_DT,Prn,InActive,Land,City,Village
		   )

		   values(
		   @AC_Code,@CusName,@PType_ID,@Add,@NTN_No,@ContactPerson,@Owner_Name,@Cell,@Eml,@Tel,@SID,@ZID,@AddPer,@Debit
		   ,@Credit,@Black_List,@War_Cls,@War_DT,@Prn,@InActive,@Land,@City,@Village);
    
END





GO
/****** Object:  StoredProcedure [dbo].[sp_customer_selectById]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_customer_selectById] 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Cus.*,Village.VillageName,c.CityName from Customers as Cus
INNER JOIN tbl_city as c on c.Id=Cus.City
INNER JOIN tbl_Village as Village on Village.ID=Cus.Village

where Cus.CID=@id and Cus.InActive='false';
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Customer_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Customer_Update]
	-- Add the parameters for the stored procedure here
	@AC_Code int,@CusName varchar(55),@PType_ID int,@Add varchar(250),@NTN_No varchar(55),
	@ContactPerson varchar(55),@Owner_Name varchar(55),@Cell varchar(55),@Eml varchar(55),
	@Tel varchar(55),@SID int,@ZID int,@AddPer varchar(55),@Debit float,@Credit float,@Black_List bit,
	@War_Cls varchar(55),@War_DT varchar(55),@Prn varchar(55),@InActive bit,@Land varchar(55),@City int,
	@Village int

AS
BEGIN
	
	update Customers set AC_Code=@AC_Code,CusName=@CusName,PType_ID=@PType_ID,
	[Add]=@Add,NTN_No=@NTN_No,ContactPerson=@ContactPerson,Owner_Name=@Owner_Name,
	Cell=@Cell,Eml=@Eml,Tel=@Tel,[SID]=@SID,ZID=@ZID,AddPer=@AddPer,Debit=@Debit
   ,Credit=@Credit,Black_List=@Black_List,War_Cls=@War_Cls,War_DT=@War_DT,Prn=@Prn,InActive=@InActive,Land=@Land,
	City=@City,Village=@Village

    where AC_Code=@AC_Code;

  
END





GO
/****** Object:  StoredProcedure [dbo].[sp_getArticle]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getArticle] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	select ArticleTypes.ArticleTypeID,Styles.StyleID,Styles.StyleName,ArticleTypes.ArticleTypeName,Article.ArticleNo,Article.ProductName,Article.IsDelete,Article.ProductID

	from Article inner join  ArticleTypes on Article.ArticleTypeID=ArticleTypes.ArticleTypeID

	inner join Styles on Styles.StyleID = Article.StyleID;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Item_COA_D_Cost_of_Sale_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Item_COA_D_Cost_of_Sale_Insert]
	-- Add the parameters for the stored procedure here
	@CAC_Code int,@PType_ID int,@ZID int,@AC_Code int,@AC_Title varchar(255),@DR float,@CR float,@Qty float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into COA_D (CAC_Code,PType_ID,ZID,AC_Code,AC_Title,DR,CR,Qty,InActive) values(@CAC_Code ,@PType_ID ,@ZID ,@AC_Code ,@AC_Title,@DR ,@CR ,@Qty,'false' )
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Item_COA_D_Cost_of_Sale_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Item_COA_D_Cost_of_Sale_Update]
	-- Add the parameters for the stored procedure here
	@CostOfSale int,
	@Name varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update COA_D set AC_Title = @Name from COA_D where AC_Code=@CostOfSale
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Item_COA_D_Incomecode_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Item_COA_D_Incomecode_Insert]
	-- Add the parameters for the stored procedure here
	@CAC_Code int,@PType_ID int,@ZID int,@AC_Code int,@AC_Title varchar(255),@DR float,@CR float,@Qty float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into COA_D (CAC_Code,PType_ID,ZID,AC_Code,AC_Title,DR,CR,Qty,InActive) values(@CAC_Code ,@PType_ID ,@ZID ,@AC_Code ,@AC_Title,@DR ,@CR ,@Qty,'false' )
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Item_COA_D_Incomecode_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Item_COA_D_Incomecode_Update]
	-- Add the parameters for the stored procedure here
	@Incomecode int,
	@Name varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update COA_D set AC_Title = @Name from COA_D where AC_Code=@Incomecode
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Item_COA_D_InventoryCode_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Item_COA_D_InventoryCode_Insert]
	-- Add the parameters for the stored procedure here
	@CAC_Code int,@PType_ID int,@ZID int,@AC_Code int,@AC_Title varchar(255),@DR float,@CR float,@Qty float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into COA_D (CAC_Code,PType_ID,ZID,AC_Code,AC_Title,DR,CR,Qty,InActive) values(@CAC_Code ,@PType_ID ,@ZID ,@AC_Code ,@AC_Title,@DR ,@CR ,@Qty,'false' )
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Item_COA_D_Inventorycode_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Item_COA_D_Inventorycode_Update]
	-- Add the parameters for the stored procedure here
	@Inventorycode int,
	@Name varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update COA_D set AC_Title = @Name from COA_D where AC_Code=@Inventorycode
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Item_Delete]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Item_Delete]
	-- Add the parameters for the stored procedure here
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 update Items set isDeleted ='true'   where IID=@id;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Item_Gl_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Item_Gl_Insert]
	-- Add the parameters for the stored procedure here
	@RID int
           ,@RID2 int
           ,@TypeCode int
           ,@GLDate date
           
         
           ,@AC_Code int
           ,@AC_Code2 int
           ,@Narration  nvarchar(255)
         ,@OP_Price float
           ,@Debit float
           ,@Credit float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	   INSERT INTO [dbo].[GL]
           ([RID]
           ,[RID2]
           ,[TypeCode]
           ,[GLDate]
           
         
           ,[AC_Code]
           ,[AC_Code2]
           ,[Narration]
           ,[Qty_IN]
         
           
           
           ,[Debit]
           ,[Credit]
         )
     VALUES(@RID 
           ,@RID2 
           ,@TypeCode 
           ,@GLDate 
            ,@AC_Code 
           ,@AC_Code2 
           ,@Narration  
           ,@OP_Price
           ,@Debit
           ,@Credit );
		   
END



GO
/****** Object:  StoredProcedure [dbo].[sp_Item_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Item_Insert]
	-- Add the parameters for the stored procedure here
	@IName varchar(250) ,@Desc varchar(250),@Unit_ID int,@Inv_YN bit,@CompID int,@BarCode_ID varchar(250),@SCatID int,@CTN_PCK int,@PurPrice float,@SalesPrice float,@RetailPrice float,@ICP int,@OP_Qty int,@OP_Price int,@DisContinue int,@AC_Code_Inv int,@AC_Code_Inc int,@AC_Code_Cost int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Items  (IName,[Desc],Unit_ID,Inv_YN,CompID,BarCode_ID,SCatID,CTN_PCK,PurPrice,SalesPrice,RetailPrice,ICP,OP_Qty,OP_Price,DisContinue,AC_Code_Inv,AC_Code_Inc,AC_Code_Cost,isDeleted) values(@IName,@Desc,@Unit_ID,@Inv_YN,@CompID,@BarCode_ID,@SCatID,@CTN_PCK,@PurPrice,@SalesPrice,@RetailPrice,@ICP,@OP_Qty,@OP_Price,@DisContinue,@AC_Code_Inv,@AC_Code_Inc,@AC_Code_Cost,'false')
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Items_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Items_Update]
	-- Add the parameters for the stored procedure here
	@Name varchar(250) ,@Desc varchar(250),@Unit_ID int,@Inv_YN bit,@CompID int,@BarCode_ID varchar(250),@SCatID int,@CTN_PCK int,@PurPrice float,@SalesPrice float,@RetailPrice float,@ICP int,@OP_Qty int,@OP_Price int,@DisContinue int,@AC_Code_Inv int,@AC_Code_Inc int,@AC_Code_Cost int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Items set IName=@Name,[Desc]=@Desc,Unit_ID=@Unit_ID,Inv_YN=@Inv_YN,CompID=@CompID,BarCode_ID=@BarCode_ID,SCatID=@SCatID,CTN_PCK=@CTN_PCK,PurPrice=@PurPrice,SalesPrice=@SalesPrice,RetailPrice=@RetailPrice,ICP=@ICP,OP_Qty=@OP_Qty,OP_Price=@OP_Price,DisContinue=@DisContinue,AC_Code_Inv=@AC_Code_Inv,AC_Code_Inc=@AC_Code_Inc,AC_Code_Cost=@AC_Code_Cost where AC_Code_Inv=@AC_Code_Inv
END





GO
/****** Object:  StoredProcedure [dbo].[sp_PartyType_Delete]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PartyType_Delete]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Party_Type set isDeleted='true' where PType_ID=@Id;
	
end





GO
/****** Object:  StoredProcedure [dbo].[sp_PartyType_insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PartyType_insert]
	-- Add the parameters for the stored procedure here
	@Name varchar(55)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Party_Type(Party_Type,isDeleted) values(@Name,'false');
END





GO
/****** Object:  StoredProcedure [dbo].[Sp_partyType_Select]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_partyType_Select]
	-- Add the parameters for the stored procedure here
	@PType_ID int, @Party_Type varchar(100), @isDeleted bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Party_Type as a
	WHERE
	(0 = @PType_ID OR a.PType_ID LIKE @PType_ID)
	AND ('' = @Party_Type OR a.Party_Type LIKE @Party_Type)
	AND (1 = @isDeleted OR a.isDeleted LIKE @isDeleted)
END



GO
/****** Object:  StoredProcedure [dbo].[sp_partyType_SelectById]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_partyType_SelectById]
	-- Add the parameters for the stored procedure here
	@PType_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select * from Party_Type where PType_ID=@PType_ID;
END



GO
/****** Object:  StoredProcedure [dbo].[sp_PartyType_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PartyType_Update]
	-- Add the parameters for the stored procedure here
	@id int,
	@Name Varchar(55)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Party_Type set Party_Type=@Name where PType_ID=@Id;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_PV_D_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PV_D_Insert]

@RID int ,@Narr Varchar(250) ,@MOP_ID int,@AC_Code int,@InvNo int,@ChkNo int,@SlipNo int,
@PreAmt float,@Amt float,@DisAmt float,@BalAmt float,@SRT float,@RCancel float,@checkDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into PV_D (RID,Narr,MOP_ID,AC_Code,InvNo,ChkNo,SlipNo,PreAmt,Amt,DisAmt,BalAmt,SRT,RCancel,checkDate,IsDeleted) 
	
	values(@RID,@Narr,@MOP_ID,@AC_Code,@InvNo,@ChkNo,@SlipNo,@PreAmt,@Amt,@DisAmt,@BalAmt,@SRT,@RCancel,@checkDate,'false')
END






GO
/****** Object:  StoredProcedure [dbo].[sp_PV_D_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PV_D_Update]

-- Add the parameters for the stored procedure here
	@RID int ,@Narr Varchar(250) ,@MOP_ID int,@AC_Code int,@InvNo int,@ChkNo int,@SlipNo int,
@PreAmt float,@Amt float,@DisAmt float,@BalAmt float,@SRT float,@RCancel float,@checkDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PV_D set Narr =@Narr,MOP_ID =@MOP_ID,AC_Code=@AC_Code,InvNo=@InvNo,ChkNo=@ChkNo,SlipNo=@SlipNo,PreAmt=PreAmt,
	Amt=@Amt,DisAmt=@DisAmt,BalAmt=@BalAmt,SRT=@SRT,RCancel=@RCancel,checkDate=@checkDate where RID=@RID
end





GO
/****** Object:  StoredProcedure [dbo].[sp_PV_GL_credit]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PV_GL_credit]
	-- Add the parameters for the stored procedure here
	@TypeCode int,@AC_Code int,@AC_Code2 int,@Narration varchar(255),@Debit float,@Credit float,@RID int, @gl datetime ,@MOP_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
insert into GL (TypeCode,AC_Code,AC_Code2,Narration,Debit,Credit,RID,GLDate,MOP_ID) values(@TypeCode,@AC_Code,@AC_Code2,@Narration,@Debit,@Credit,@RID,@gl,@MOP_ID);
END





GO
/****** Object:  StoredProcedure [dbo].[sp_PV_Gl_Credit_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PV_Gl_Credit_Update]
	-- Add the parameters for the stored procedure here
		@TypeCode int,@AC_Code int,@AC_Code2 int,@Narration varchar(250),@Debit float,@Credit float,@RID int, @gldate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update GL set AC_Code=@AC_Code,AC_Code2=@AC_Code2,Narration=@Narration,Debit=@Debit,Credit=@Credit,GLDate=@gldate

	where TypeCode=@TypeCode and RID=@RID and AC_Code=@AC_Code
END





GO
/****** Object:  StoredProcedure [dbo].[sp_PV_GL_Debit]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PV_GL_Debit]
	-- Add the parameters for the stored procedure here
	@TypeCode int,@AC_Code int,@AC_Code2 int,@Narration varchar(255),@Debit float,@Credit float,@RID int , @gl datetime, @MOP_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
insert into GL (TypeCode,AC_Code,AC_Code2,Narration,Debit,Credit,RID,GLDate ,MOP_ID) values(@TypeCode,@AC_Code,@AC_Code2,@Narration,@Debit,@Credit,@RID,@gl,@MOP_ID);
END





GO
/****** Object:  StoredProcedure [dbo].[sp_PV_Gl_Debit_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PV_Gl_Debit_Update]
	-- Add the parameters for the stored procedure here
		@TypeCode int,@AC_Code int,@AC_Code2 int,@Narration varchar(250),@Debit float,@Credit float,@RID int, @gldate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update GL set AC_Code=@AC_Code,AC_Code2=@AC_Code2,Narration=@Narration,Debit=@Debit,Credit=@Credit,GLDate=@gldate

	where TypeCode=@TypeCode and RID=@RID and AC_Code=@AC_Code
END





GO
/****** Object:  StoredProcedure [dbo].[sp_PV_M_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PV_M_Insert]
	-- Add the parameters for the stored procedure here
	@CompID int ,@EDate datetime,@AC_Code int,@SID int ,@Rem varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	
	insert into PV_M (CompID,EDate,AC_Code,[SID],Rem,isDeleted) values (@CompID,@EDate,@AC_Code,@SID,@Rem,'false')

	SELECT SCOPE_IDENTITY()
END





GO
/****** Object:  StoredProcedure [dbo].[sp_PV_M_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_PV_M_Update]
	-- Add the parameters for the stored procedure here
	@CompID int ,@EDate datetime,@AC_Code int,@SID int ,@Rem varchar(250) ,@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update PV_M set
	CompID=@CompID,EDate=@EDate,AC_Code =@AC_Code,[SID]=@SID,Rem=@Rem where RID= @Id
END





GO
/****** Object:  StoredProcedure [dbo].[sp_RV_D_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RV_D_Insert]

@RID int ,@Narr Varchar(250) ,@MOP_ID int,@AC_Code int,@InvNo int,@ChkNo int,@SlipNo int,
@PreAmt float,@Amt float,@DisAmt float,@BalAmt float,@SRT float,@RCancel float,@checkDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into RV_D (RID,Narr,MOP_ID,AC_Code,InvNo,ChkNo,SlipNo,PreAmt,Amt,DisAmt,BalAmt,SRT,RCancel,checkDate,IsDeleted) 
	
	values(@RID,@Narr,@MOP_ID,@AC_Code,@InvNo,@ChkNo,@SlipNo,@PreAmt,@Amt,@DisAmt,@BalAmt,@SRT,@RCancel,@checkDate,'false')
END





GO
/****** Object:  StoredProcedure [dbo].[sp_RV_D_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RV_D_Update]-- Add the parameters for the stored procedure here
	@RID int ,@Narr Varchar(250) ,@MOP_ID int,@AC_Code int,@InvNo int,@ChkNo int,@SlipNo int,
@PreAmt float,@Amt float,@DisAmt float,@BalAmt float,@SRT float,@RCancel float,@checkDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update RV_D set Narr =@Narr,MOP_ID =@MOP_ID,AC_Code=@AC_Code,InvNo=@InvNo,ChkNo=@ChkNo,SlipNo=@SlipNo,PreAmt=PreAmt,
	Amt=@Amt,DisAmt=@DisAmt,BalAmt=@BalAmt,SRT=@SRT,RCancel=@RCancel,checkDate=@checkDate where RID=@RID
END





GO
/****** Object:  StoredProcedure [dbo].[sp_RV_GL_credit]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RV_GL_credit]
	-- Add the parameters for the stored procedure here
	@TypeCode int,@AC_Code int,@AC_Code2 int,@Narration varchar(250),@Debit float,@Credit float,@RID int ,@gl datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
insert into GL (TypeCode,AC_Code,AC_Code2,Narration,Debit,Credit,RID,GLDate) values(@TypeCode,@AC_Code,@AC_Code2,@Narration,@Debit,@Credit,@RID,@gl);
END





GO
/****** Object:  StoredProcedure [dbo].[sp_RV_Gl_Credit_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RV_Gl_Credit_Update]
	-- Add the parameters for the stored procedure here
		@TypeCode int,@AC_Code int,@AC_Code2 int,@Narration varchar(250),@Debit float,@Credit float,@RID int, @gldate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update GL set AC_Code=@AC_Code,AC_Code2=@AC_Code2,Narration=@Narration,Debit=@Debit,Credit=@Credit,GLDate=@gldate

	where TypeCode=@TypeCode and RID=@RID and AC_Code=@AC_Code
END





GO
/****** Object:  StoredProcedure [dbo].[sp_RV_GL_Debit]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RV_GL_Debit] 
	-- Add the parameters for the stored procedure here
	@TypeCode int,@AC_Code int,@AC_Code2 int,@Narration varchar(250),@Debit float,@Credit float,@RID int ,@gl datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
insert into GL (TypeCode,AC_Code,AC_Code2,Narration,Debit,Credit,RID,GLDate) values(@TypeCode,@AC_Code,@AC_Code2,@Narration,@Debit,@Credit,@RID,@gl);
END





GO
/****** Object:  StoredProcedure [dbo].[sp_RV_Gl_Debit_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RV_Gl_Debit_Update]
	-- Add the parameters for the stored procedure here
		@TypeCode int,@AC_Code int,@AC_Code2 int,@Narration varchar(250),@Debit float,@Credit float,@RID int, @gldate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update GL set AC_Code=@AC_Code,AC_Code2=@AC_Code2,Narration=@Narration,Debit=@Debit,Credit=@Credit,GLDate=@gldate

	where TypeCode=@TypeCode and RID=@RID and AC_Code=@AC_Code
END





GO
/****** Object:  StoredProcedure [dbo].[sp_RV_M_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RV_M_Insert]
	-- Add the parameters for the stored procedure here
	@CompID int ,@EDate datetime,@AC_Code int,@SID int ,@Rem varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

insert into RV_M (CompID,EDate,AC_Code,[SID],Rem,isDeleted ) values (@CompID,@EDate,@AC_Code,@SID,@Rem,'false' ) 
	SELECT SCOPE_IDENTITY()
 	
END





GO
/****** Object:  StoredProcedure [dbo].[sp_RV_M_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RV_M_Update]
	-- Add the parameters for the stored procedure here
	@CompID int ,@EDate datetime,@AC_Code int,@SID int ,@Rem varchar(250) ,@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update RV_M set
	CompID=@CompID,EDate=@EDate,AC_Code =@AC_Code,[SID]=@SID,Rem=@Rem where RID= @Id
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Unit_delete]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Unit_delete]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
update IUnit set active='true' where unit_id=@Id;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_unit_insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_unit_insert]
	-- Add the parameters for the stored procedure here
	@Name varchar(55)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into IUnit(IUnit,active) values(@Name,'false');
END





GO
/****** Object:  StoredProcedure [dbo].[sp_unit_select]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_unit_select] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from IUnit where active = 'false';
END





GO
/****** Object:  StoredProcedure [dbo].[sp_unit_selectById]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_unit_selectById]
	-- Add the parameters for the stored procedure here
	
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from IUnit where unit_id=@Id;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_unit_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_unit_Update]
	-- Add the parameters for the stored procedure here
@Id int ,
@Name varchar(55)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update IUnit set IUnit=@Name where unit_id=@Id;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_vendor_coa_d_update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_vendor_coa_d_update]
	-- Add the parameters for the stored procedure here
	@Name varchar(255),
	@AC_Code int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 update COA_D set
		   [AC_Title]=@Name where AC_Code=@AC_Code;

end





GO
/****** Object:  StoredProcedure [dbo].[sp_vendor_delete]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_vendor_delete]
	-- Add the parameters for the stored procedure here
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 update Vendors set
		   InActive='true' where VID=@id

end





GO
/****** Object:  StoredProcedure [dbo].[sp_Vendor_Gl_insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Vendor_Gl_insert]
	-- Add the parameters for the stored procedure here
	
	@RID int
           ,@RID2 int
           ,@TypeCode int
           ,@GLDate date
           
         
           ,@AC_Code int
           ,@AC_Code2 int
           ,@Narration  nvarchar(255)
  
           ,@Debit float
           ,@Credit float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	   INSERT INTO [dbo].[GL]
           ([RID]
           ,[RID2]
           ,[TypeCode]
           ,[GLDate]
           
         
           ,[AC_Code]
           ,[AC_Code2]
           ,[Narration]
           
         
           
           
           ,[Debit]
           ,[Credit]
         )
     VALUES(@RID 
           ,@RID2 
           ,@TypeCode 
           ,@GLDate 
           
         
           ,@AC_Code 
           ,@AC_Code2 
           ,@Narration  
  
           ,@Debit
           ,@Credit );
END





GO
/****** Object:  StoredProcedure [dbo].[sp_vendor_gl_update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_vendor_gl_update]
   @Debit float,
	@Credit float,
	@AC_Code int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	       update GL set
		   Debit=@Debit , Credit=@Credit where AC_Code=@AC_Code and TypeCode=0;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_vendor_Gl_Update_capital]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_vendor_Gl_Update_capital]
	-- Add the parameters for the stored procedure here
	@Debit float,
	@Credit float,
	@AC_Code int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	       update GL set
		   Debit=@Debit , Credit=@Credit where AC_Code2=@AC_Code and TypeCode=0;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_vendor_insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_vendor_insert]
	-- Add the parameters for the stored procedure here
		@AC_Code int,@CusName varchar(55),@PType_ID int,@Add varchar(250),@NTN_No varchar(55),@ContactPerson varchar(55)
   ,@Cell varchar(55),@Eml varchar(55),@Tel varchar(55),
	@ZID int,@Debit float
   ,@Credit float,@InActive bit,@Land varchar(55),@City int,@Village int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO Vendors
           (AC_Code,VendName,PType_ID,[Add],NTN_No,ContactPerson,Cell,Eml,Tel,ZID,Debit
		   ,Credit,InActive,Land,City,Village
		   )

		   values(
		   @AC_Code,@CusName,@PType_ID,@Add,@NTN_No,@ContactPerson,@Cell,@Eml,@Tel,@ZID,@Debit
		   ,@Credit,@InActive,@Land,@City,@Village);


END





GO
/****** Object:  StoredProcedure [dbo].[sp_vendor_selectById]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_vendor_selectById]

	-- Add the parameters for the stored procedure here
	@vendorID int
	as

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select v.*,Village.VillageName,c.CityName from Vendors as V
INNER JOIN tbl_city as c on c.Id=v.City
INNER JOIN tbl_Village as Village on Village.ID=v.Village

where v.VID= @vendorID;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_vendor_update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_vendor_update]
	-- Add the parameters for the stored procedure here
			@AC_Code int,@CusName varchar(55),@PType_ID int,@Add varchar(250),@NTN_No varchar(55),@ContactPerson varchar(55)
   ,@Cell varchar(55),@Eml varchar(55),@Tel varchar(55),
	@ZID int,@Debit float
   ,@Credit float,@InActive bit,@Land varchar(55),@City int,@Village int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
update Vendors set AC_Code=@AC_Code,VendName=@CusName,PType_ID=@PType_ID,
	[Add]=@Add,NTN_No=@NTN_No,ContactPerson=@ContactPerson,
	Cell=@Cell,Eml=@Eml,Tel=@Tel,ZID=@ZID,Debit=@Debit
   ,Credit=@Credit,InActive=@InActive,Land=@Land,
	City=@City,Village=@Village

    where AC_Code=@AC_Code;
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Village_Delete]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Village_Delete]
	-- Add the parameters for the stored procedure here
 @id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tbl_Village set IsDeleted='true' where ID=@id
END





GO
/****** Object:  StoredProcedure [dbo].[sp_Village_Insert]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Village_Insert]
	-- Add the parameters for the stored procedure here
@CityID int,
@VillageName varchar(100),@IsDeleted bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into tbl_Village 

	   ([CityID],[VillageName],[IsDeleted]
         )
     VALUES(@CityID 
           ,@VillageName 
           ,@IsDeleted
		   )

END





GO
/****** Object:  StoredProcedure [dbo].[sp_Village_SelectByID]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Village_SelectByID]
	-- Add the parameters for the stored procedure here
	@ID int 
	
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from tbl_Village where ID=@ID
END





GO
/****** Object:  StoredProcedure [dbo].[sp_village_Update]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_village_Update]
	-- Add the parameters for the stored procedure here
	@City int, @VillageNAme Varchar(250) ,@ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update tbl_Village set [CityID]=@City ,[VillageName] =@VillageNAme where ID =@ID
END





GO
/****** Object:  StoredProcedure [dbo].[Update_EV]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_EV]
	-- Add the parameters for the stored procedure here
@Rid int ,
@EDate datetime,
@Ac_code float,
@CustomerCode varchar(55),
@Amount float,
@checkNO varchar(55),
@Narr varchar(55)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update EV_M set AC_Code=@Ac_code ,EDate=@EDate where RID=@Rid;

	update EV_D set AC_Code=@CustomerCode, ChkNo=@checkNO,Amt=@Amount,Narr=@Narr where RID=RID
END





GO
/****** Object:  StoredProcedure [dbo].[UpdateItemTable]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateItemTable] 
	-- Add the parameters for the stored procedure here
	
	@Name varchar(100), 
	@CatertoryId varchar(100),
	@UnitID varchar(100),
	@ItemID  int,
	@Inventorycode varchar(100),
	@Incomecode varchar(100),
	@CostOfSale varchar (100)
AS
BEGIN
	update Items set IName=@Name , SCatID=@CatertoryId, Unit_ID= @UnitID  from Items where IID = @ItemID

	update COA_D set AC_Title = @Name from COA_D where AC_Code=@Inventorycode

	update COA_D set AC_Title = @Name from COA_D where AC_Code=@Incomecode

	update COA_D set AC_Title = @Name from COA_D where AC_Code=@CostOfSale

END






GO
/****** Object:  StoredProcedure [dbo].[Vendor_Select]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Vendor_Select](@vendorID int)
as
begin

select v.*,Village.VillageName,c.CityName from Vendors as V
INNER JOIN tbl_city as c on c.Id=v.City
INNER JOIN tbl_Village as Village on Village.ID=v.Village

where v.InActive='false';

end





GO
/****** Object:  StoredProcedure [dbo].[Village_Select]    Script Date: 21-03-21 3:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Village_Select] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	select v.ID,v.VillageName,c.CityName  from tbl_Village as v inner join tbl_city as c on v.CityID=c.Id where v.IsDeleted='false'
END





GO
USE [master]
GO
ALTER DATABASE [SaleManager] SET  READ_WRITE 
GO
