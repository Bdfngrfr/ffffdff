USE [Праздники_№]
GO
/****** Object:  Table [dbo].[Agencies]    Script Date: 22.05.2023 3:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agencies](
	[Id_Agency] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Agencies_1] PRIMARY KEY CLUSTERED 
(
	[Id_Agency] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animators]    Script Date: 22.05.2023 3:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animators](
	[Id_Animator] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Id_Agency] [int] NOT NULL,
 CONSTRAINT [PK_Animators] PRIMARY KEY CLUSTERED 
(
	[Id_Animator] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 22.05.2023 3:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[Id_Holiday] [int] IDENTITY(1,1) NOT NULL,
	[Id_Animator] [int] NOT NULL,
	[Date_Holiday] [date] NOT NULL,
	[Start_Time] [time](5) NOT NULL,
	[Garland] [int] NULL,
	[PriceGarland] [money] NOT NULL,
	[Firework] [int] NULL,
	[PriceFirework] [money] NOT NULL,
	[Petard] [int] NULL,
	[PricePetard] [money] NOT NULL,
	[Event] [nchar](35) NOT NULL,
	[Service_animator] [int] NOT NULL,
 CONSTRAINT [PK_Holidays] PRIMARY KEY CLUSTERED 
(
	[Id_Holiday] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types_Events]    Script Date: 22.05.2023 3:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types_Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Event] [nchar](35) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Сost] [money] NOT NULL,
 CONSTRAINT [PK_Types_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22.05.2023 3:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Mail] [nvarchar](30) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Holidays]  WITH CHECK ADD  CONSTRAINT [FK_Holidays_Animators] FOREIGN KEY([Id_Animator])
REFERENCES [dbo].[Animators] ([Id_Animator])
GO
ALTER TABLE [dbo].[Holidays] CHECK CONSTRAINT [FK_Holidays_Animators]
GO
