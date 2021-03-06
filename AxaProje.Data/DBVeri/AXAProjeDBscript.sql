USE [AxaProjeDB]
GO
/****** Object:  User [sb]    Script Date: 6.12.2021 10:57:30 ******/
CREATE USER [sb] FOR LOGIN [sb] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [sm]    Script Date: 6.12.2021 10:57:30 ******/
CREATE USER [sm] FOR LOGIN [sm] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ActionLog]    Script Date: 6.12.2021 10:57:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[AcLog] [nvarchar](max) NULL,
	[ActionInfo] [nvarchar](max) NULL,
 CONSTRAINT [PK_ActionLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6.12.2021 10:57:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CostumerCategoriesId] [int] NULL,
	[Adress] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerCategories]    Script Date: 6.12.2021 10:57:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6.12.2021 10:57:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[TokenKey] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActionLog] ON 

INSERT [dbo].[ActionLog] ([Id], [Date], [AcLog], [ActionInfo]) VALUES (41, CAST(N'2021-12-06T10:36:40.543' AS DateTime), N'{"Password":"123","UserName":"Sami"}', N'Giriş/Login')
INSERT [dbo].[ActionLog] ([Id], [Date], [AcLog], [ActionInfo]) VALUES (42, CAST(N'2021-12-06T10:36:41.287' AS DateTime), N'[{"Id":1,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"deotest","FullName":"wfer erve"},{"Id":7,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"istanbul","FullName":"wf wefw1"},{"Id":8,"CategoriesId":1,"CategoriesName":"Üye","Adress":"wefw","FullName":"wefwef"},{"Id":10,"CategoriesId":1,"CategoriesName":"Üye","Adress":"erver","FullName":"dve111111"},{"Id":12,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"wefwe","FullName":"wewe"}]', N'Müşter Listelendi')
INSERT [dbo].[ActionLog] ([Id], [Date], [AcLog], [ActionInfo]) VALUES (43, CAST(N'2021-12-06T10:37:06.390' AS DateTime), N'{"Id":13,"CostumerCategoriesId":2,"Adress":"qwdq","FullName":"qwdq","CostumerCategories":null}', N' Müşter Düzenlendi')
INSERT [dbo].[ActionLog] ([Id], [Date], [AcLog], [ActionInfo]) VALUES (44, CAST(N'2021-12-06T10:37:06.423' AS DateTime), N'[{"Id":1,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"deotest","FullName":"wfer erve"},{"Id":7,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"istanbul","FullName":"wf wefw1"},{"Id":8,"CategoriesId":1,"CategoriesName":"Üye","Adress":"wefw","FullName":"wefwef"},{"Id":10,"CategoriesId":1,"CategoriesName":"Üye","Adress":"erver","FullName":"dve111111"},{"Id":12,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"wefwe","FullName":"wewe"},{"Id":13,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"qwdq","FullName":"qwdq"}]', N'Müşter Listelendi')
INSERT [dbo].[ActionLog] ([Id], [Date], [AcLog], [ActionInfo]) VALUES (45, CAST(N'2021-12-06T10:37:40.637' AS DateTime), N'{"Id":13,"CostumerCategoriesId":2,"Adress":"qwdq","FullName":"qwdq","CostumerCategories":null}', N' Müşter Silindi')
INSERT [dbo].[ActionLog] ([Id], [Date], [AcLog], [ActionInfo]) VALUES (46, CAST(N'2021-12-06T10:37:42.057' AS DateTime), N'[{"Id":1,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"deotest","FullName":"wfer erve"},{"Id":7,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"istanbul","FullName":"wf wefw1"},{"Id":8,"CategoriesId":1,"CategoriesName":"Üye","Adress":"wefw","FullName":"wefwef"},{"Id":10,"CategoriesId":1,"CategoriesName":"Üye","Adress":"erver","FullName":"dve111111"},{"Id":12,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"wefwe","FullName":"wewe"}]', N'Müşter Listelendi')
INSERT [dbo].[ActionLog] ([Id], [Date], [AcLog], [ActionInfo]) VALUES (47, CAST(N'2021-12-06T10:37:59.657' AS DateTime), N'{"Id":12,"CostumerCategoriesId":2,"Adress":"wefwe","FullName":"wewe11","CostumerCategories":null}', N' Müşter Düzenlendi')
INSERT [dbo].[ActionLog] ([Id], [Date], [AcLog], [ActionInfo]) VALUES (48, CAST(N'2021-12-06T10:37:59.673' AS DateTime), N'[{"Id":1,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"deotest","FullName":"wfer erve"},{"Id":7,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"istanbul","FullName":"wf wefw1"},{"Id":8,"CategoriesId":1,"CategoriesName":"Üye","Adress":"wefw","FullName":"wefwef"},{"Id":10,"CategoriesId":1,"CategoriesName":"Üye","Adress":"erver","FullName":"dve111111"},{"Id":12,"CategoriesId":2,"CategoriesName":"Misafir","Adress":"wefwe","FullName":"wewe11"}]', N'Müşter Listelendi')
SET IDENTITY_INSERT [dbo].[ActionLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [CostumerCategoriesId], [Adress], [FullName]) VALUES (1, 2, N'deotest', N'wfer erve')
INSERT [dbo].[Customer] ([Id], [CostumerCategoriesId], [Adress], [FullName]) VALUES (7, 2, N'istanbul', N'wf wefw1')
INSERT [dbo].[Customer] ([Id], [CostumerCategoriesId], [Adress], [FullName]) VALUES (8, 1, N'wefw', N'wefwef')
INSERT [dbo].[Customer] ([Id], [CostumerCategoriesId], [Adress], [FullName]) VALUES (10, 1, N'erver', N'dve111111')
INSERT [dbo].[Customer] ([Id], [CostumerCategoriesId], [Adress], [FullName]) VALUES (12, 2, N'wefwe', N'wewe11')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerCategories] ON 

INSERT [dbo].[CustomerCategories] ([Id], [Name]) VALUES (1, N'Üye')
INSERT [dbo].[CustomerCategories] ([Id], [Name]) VALUES (2, N'Misafir')
SET IDENTITY_INSERT [dbo].[CustomerCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Password], [UserName], [TokenKey]) VALUES (1, N'123', N'Sami', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJTYW1pIiwianRpIjoiYmFkYzQzYTctNzk4ZS00OTMwLTlhYmMtOWQyYWEwYmFjZDNkIiwibmJmIjoxNjM4Nzc2MjAwLCJleHAiOjE2NDEzNjgyMDAsImlzcyI6Ind3dy5heGEuY29tLnRyIiwiYXVkIjoidXNlclNhbWlCYXlyYWtkYXIifQ.uTDlx7nrlRZAOtFOXFGln_doSYQGluTJgNDi_yZpYfw')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Customer] FOREIGN KEY([CostumerCategoriesId])
REFERENCES [dbo].[CustomerCategories] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Customer]
GO
