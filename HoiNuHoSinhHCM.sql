USE [master]
GO
/****** Object:  Database [HoiNuHoSinhHCM]    Script Date: 10/07/2015 10:35:47 AM ******/
CREATE DATABASE [HoiNuHoSinhHCM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HoiNuHoSinhHCM', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\HoiNuHoSinhHCM.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HoiNuHoSinhHCM_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\HoiNuHoSinhHCM_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HoiNuHoSinhHCM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET ARITHABORT OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET  MULTI_USER 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HoiNuHoSinhHCM]
GO
/****** Object:  Table [dbo].[Common]    Script Date: 10/07/2015 10:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Common](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](500) NULL,
	[GroupID] [varchar](10) NULL,
	[Note] [nvarchar](100) NULL,
 CONSTRAINT [PK_Common] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Conference]    Script Date: 10/07/2015 10:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Conference](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Date] [datetime] NULL,
	[Note] [ntext] NULL,
	[MemberName] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[Gender] [bit] NULL,
	[PhoneNumber] [varchar](50) NULL,
	[ConferenceId] [int] NULL,
 CONSTRAINT [PK_Conference] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Document]    Script Date: 10/07/2015 10:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Note] [nvarchar](1000) NULL,
	[CreatedDate] [datetime] NULL,
	[LinkDownload] [nvarchar](200) NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 10/07/2015 10:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Image] [nvarchar](100) NULL,
	[Summary] [nvarchar](1000) NULL,
	[Content] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CategoryId] [int] NULL,
	[IsFeatured] [bit] NULL,
	[IsDisplay] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsCategory]    Script Date: 10/07/2015 10:35:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewsCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Image] [nvarchar](100) NULL,
	[Content] [ntext] NULL,
	[Note] [nvarchar](200) NULL,
	[Order] [int] NULL,
	[GroupID] [varchar](10) NULL,
 CONSTRAINT [PK_CategoryNews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Common] ON 

INSERT [dbo].[Common] ([Id], [Image], [GroupID], [Note]) VALUES (1, N'http://dummyimage.com/1170x250/000/ebbb1e.jpg&text=First|http://dummyimage.com/1170x250/000/ebbb1e.jpg&text=Second|http://dummyimage.com/1170x250/000/ebbb1e.jpg&text=Third|http://dummyimage.com/1170x250/000/ebbb1e.jpg&text=Fourth|/Images/1.jpg', N'banner', NULL)
INSERT [dbo].[Common] ([Id], [Image], [GroupID], [Note]) VALUES (4, N'http://dummyimage.com/360x200/333/fff/ebbb1e.jpg&text=Slide1|http://dummyimage.com/360x200/70708c/fff/ff0/ebbb1e.jpg&text=Slide2', N'gallery', NULL)
INSERT [dbo].[Common] ([Id], [Image], [GroupID], [Note]) VALUES (5, N'http://dummyimage.com/360x200/333/fff/ebbb1e.jpg&text=Ad1|http://dummyimage.com/360x200/333/fff/ebbb1e.jpg&text=Ad2|http://dummyimage.com/360x200/333/fff/ebbb1e.jpg&text=Ad3', N'ads', NULL)
SET IDENTITY_INSERT [dbo].[Common] OFF
SET IDENTITY_INSERT [dbo].[Conference] ON 

INSERT [dbo].[Conference] ([Id], [Name], [Date], [Note], [MemberName], [Birthday], [Gender], [PhoneNumber], [ConferenceId]) VALUES (1, N'Hội nghị 1', CAST(0x0000A4CD0113883C AS DateTime), N'note hội nghị 1', NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[Conference] ([Id], [Name], [Date], [Note], [MemberName], [Birthday], [Gender], [PhoneNumber], [ConferenceId]) VALUES (2, N'Hội nghị 2', CAST(0x0000A4CD0113883C AS DateTime), N'note hội nghị 2', NULL, NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Conference] OFF
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([Id], [Name], [Note], [CreatedDate], [LinkDownload]) VALUES (1, N'Tài liệu 1', N'note ...', CAST(0x0000A4CD010E7D6F AS DateTime), N'http://dummyimage.com/1170x250/000/ebbb1e.jpg&text=First')
INSERT [dbo].[Document] ([Id], [Name], [Note], [CreatedDate], [LinkDownload]) VALUES (2, N'Tài liệu 2', N'note ...', CAST(0x0000A4CD010E7D6F AS DateTime), N'http://dummyimage.com/1170x250/000/ebbb1e.jpg&text=First')
SET IDENTITY_INSERT [dbo].[Document] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Name], [Image], [Summary], [Content], [CreatedDate], [CategoryId], [IsFeatured], [IsDisplay], [IsDeleted]) VALUES (1, N'News 1', N'http://dummyimage.com/800x400/333/fff/ebbb1e.jpg&text=Featured', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.', N'<p>content heresdfsdf</p>
', CAST(0x0000A4CA0101A0AC AS DateTime), 1, 0, 1, 0)
INSERT [dbo].[News] ([Id], [Name], [Image], [Summary], [Content], [CreatedDate], [CategoryId], [IsFeatured], [IsDisplay], [IsDeleted]) VALUES (2, N'News 2', N'http://dummyimage.com/800x400/333/fff/ebbb1e.jpg&text=Featured', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.', N'<p>content here</p>', CAST(0x0000A4CA0101A0AC AS DateTime), 2, 0, 1, 0)
INSERT [dbo].[News] ([Id], [Name], [Image], [Summary], [Content], [CreatedDate], [CategoryId], [IsFeatured], [IsDisplay], [IsDeleted]) VALUES (3, N'News 3', N'http://dummyimage.com/800x400/333/fff/ebbb1e.jpg&text=Featured', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.', N'<p>content here</p>
', CAST(0x0000A4CA0101A0AC AS DateTime), 1, 0, 1, 0)
INSERT [dbo].[News] ([Id], [Name], [Image], [Summary], [Content], [CreatedDate], [CategoryId], [IsFeatured], [IsDisplay], [IsDeleted]) VALUES (4, N'Hội Thảo ”Vai trò của cán bộ y tế trong công tác Chăm sóc Sức khỏe Bà Mẹ Trẻ em', N'http://dummyimage.com/800x400/333/fff/ebbb1e.jpg&text=Featured', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.', N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>

<p><img alt="" src="/Images/cop-nguyen-khang.jpg" style="width:100%" /><br />
<br />
Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.</p>
', CAST(0x0000A4CA0101A0AC AS DateTime), 5, 0, 1, 0)
INSERT [dbo].[News] ([Id], [Name], [Image], [Summary], [Content], [CreatedDate], [CategoryId], [IsFeatured], [IsDisplay], [IsDeleted]) VALUES (5, N'Chương trình Dự án "“Hợp Tác Song Phương về Đào tạo và Phát triển Hội ”', N'http://dummyimage.com/800x400/333/fff/ebbb1e.jpg&text=Featured', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.', N'<p>content here</p>', CAST(0x0000A4CA0101A0AC AS DateTime), 5, 0, 1, 0)
INSERT [dbo].[News] ([Id], [Name], [Image], [Summary], [Content], [CreatedDate], [CategoryId], [IsFeatured], [IsDisplay], [IsDeleted]) VALUES (6, N'
Chủ tịch Hội và Phó Chủ tịch Hội tham dự Đại hội và Hội Thảo khoa học tại Cộng hòa Czech', N'http://dummyimage.com/800x400/333/fff/ebbb1e.jpg&text=Featured', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.', N'<p>content here</p>', CAST(0x0000A4CA0101A0AC AS DateTime), 5, 0, 1, 0)
INSERT [dbo].[News] ([Id], [Name], [Image], [Summary], [Content], [CreatedDate], [CategoryId], [IsFeatured], [IsDisplay], [IsDeleted]) VALUES (8, N'Tiêu đề tin 222', N'/Images/1.jpg', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.', N'<p>nội dung 222</p>
', CAST(0x0000A4CD00E8F307 AS DateTime), 12, 0, 1, 0)
INSERT [dbo].[News] ([Id], [Name], [Image], [Summary], [Content], [CreatedDate], [CategoryId], [IsFeatured], [IsDisplay], [IsDeleted]) VALUES (11, N'New 4', N'/Images/3.jpg', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.', N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque consequatur, maxime consequuntur unde. Placeat reprehenderit unde ab. Perferendis quas, ducimus maiores nemo quibusdam, repellat optio facere cumque pariatur in non.</p>

<p><img alt="" src="/Images/3.jpg" style="width:100%" /></p>
', CAST(0x0000A4CD00EC7CFB AS DateTime), 1, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[NewsCategory] ON 

INSERT [dbo].[NewsCategory] ([Id], [Name], [Image], [Content], [Note], [Order], [GroupID]) VALUES (1, N'SKSS cho phụ nữ', NULL, NULL, NULL, 1, N'NewsC')
INSERT [dbo].[NewsCategory] ([Id], [Name], [Image], [Content], [Note], [Order], [GroupID]) VALUES (2, N'Phụ nữ mang thai', NULL, NULL, NULL, 2, N'NewsC')
INSERT [dbo].[NewsCategory] ([Id], [Name], [Image], [Content], [Note], [Order], [GroupID]) VALUES (3, N'Phụ nữ sau khi sinh', NULL, NULL, NULL, 3, N'NewsC')
INSERT [dbo].[NewsCategory] ([Id], [Name], [Image], [Content], [Note], [Order], [GroupID]) VALUES (4, N'SKSS vị thành niên - TN', NULL, NULL, NULL, 4, N'NewsC')
INSERT [dbo].[NewsCategory] ([Id], [Name], [Image], [Content], [Note], [Order], [GroupID]) VALUES (5, N'Sự kiện thông báo', NULL, NULL, NULL, 0, N'events')
INSERT [dbo].[NewsCategory] ([Id], [Name], [Image], [Content], [Note], [Order], [GroupID]) VALUES (6, N'Giới thiệu', NULL, N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sdfsd giới thiệu fdfdfd<br />
<br />
<img alt="" src="/Images/cop-nguyen-khang.jpg" style="width:100%" />', NULL, NULL, N'page')
INSERT [dbo].[NewsCategory] ([Id], [Name], [Image], [Content], [Note], [Order], [GroupID]) VALUES (9, N'Dịch vụ', NULL, N'dịch vụ Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod odjc<br />
<img alt="" src="/Images/1.jpg" style="width:100%" />', NULL, NULL, N'page')
INSERT [dbo].[NewsCategory] ([Id], [Name], [Image], [Content], [Note], [Order], [GroupID]) VALUES (12, N'test loại tin', NULL, NULL, NULL, 5, N'NewsC')
SET IDENTITY_INSERT [dbo].[NewsCategory] OFF
USE [master]
GO
ALTER DATABASE [HoiNuHoSinhHCM] SET  READ_WRITE 
GO
