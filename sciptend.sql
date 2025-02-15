USE [Record_doc]
GO
/****** Object:  Table [dbo].[Data_And_Time]    Script Date: 11/22/2024 10:00:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data_And_Time](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Free_data_and_time] [datetime] NULL,
	[No_Free_data_and_time] [datetime] NULL,
 CONSTRAINT [PK_Data_And_Time] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 11/22/2024 10:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Full_name] [varchar](50) NOT NULL,
	[reception_hourse] [time](7) NOT NULL,
	[specialnost] [varchar](50) NOT NULL,
	[Kabinet_ID] [int] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kabinet]    Script Date: 11/22/2024 10:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kabinet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Num] [char](10) NOT NULL,
 CONSTRAINT [PK_Kabinet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacient]    Script Date: 11/22/2024 10:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Full_name] [varchar](50) NOT NULL,
	[Num_police] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pacient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[record]    Script Date: 11/22/2024 10:00:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[record](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Patient] [int] NOT NULL,
	[ID_Data_and_Time] [int] NOT NULL,
	[ID_Doctor] [int] NULL,
 CONSTRAINT [PK_record] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Kabinet] FOREIGN KEY([Kabinet_ID])
REFERENCES [dbo].[Kabinet] ([ID])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Kabinet]
GO
ALTER TABLE [dbo].[record]  WITH CHECK ADD  CONSTRAINT [FK_record_Data_And_Time] FOREIGN KEY([ID_Data_and_Time])
REFERENCES [dbo].[Data_And_Time] ([ID])
GO
ALTER TABLE [dbo].[record] CHECK CONSTRAINT [FK_record_Data_And_Time]
GO
ALTER TABLE [dbo].[record]  WITH CHECK ADD  CONSTRAINT [FK_record_Doctor] FOREIGN KEY([ID_Doctor])
REFERENCES [dbo].[Doctor] ([ID])
GO
ALTER TABLE [dbo].[record] CHECK CONSTRAINT [FK_record_Doctor]
GO
ALTER TABLE [dbo].[record]  WITH CHECK ADD  CONSTRAINT [FK_record_Pacient] FOREIGN KEY([ID_Patient])
REFERENCES [dbo].[Pacient] ([ID])
GO
ALTER TABLE [dbo].[record] CHECK CONSTRAINT [FK_record_Pacient]
GO
