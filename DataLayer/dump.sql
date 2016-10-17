USE [TheWineCellar]
GO
/****** Object:  Table [dbo].[platform_user]    Script Date: 10/17/2016 2:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[platform_user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](25) NOT NULL,
	[surname] [varchar](25) NOT NULL,
	[shipping_address] [varchar](100) NOT NULL,
	[city] [varchar](25) NOT NULL,
	[zip] [varchar](10) NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](25) NOT NULL,
	[password] [varchar](25) NOT NULL,
 CONSTRAINT [PK_platform_iser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/17/2016 2:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_group_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[info] [varchar](150) NULL,
	[price] [money] NOT NULL,
	[pic] [varchar](50) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_group]    Script Date: 10/17/2016 2:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_product_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transaction]    Script Date: 10/17/2016 2:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[platform_user_id] [bigint] NULL,
	[date] [timestamp] NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[transaction_product]    Script Date: 10/17/2016 2:08:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NOT NULL,
	[transaction_id] [bigint] NOT NULL,
 CONSTRAINT [PK_transaction_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[platform_user] ON 

INSERT [dbo].[platform_user] ([id], [name], [surname], [shipping_address], [city], [zip], [phone], [email], [password]) VALUES (1, N'luke', N'duncan', N'id dar please', N'il mosta', N'', N'', N'luke@gmail.com', N'Abcd1234?!')
INSERT [dbo].[platform_user] ([id], [name], [surname], [shipping_address], [city], [zip], [phone], [email], [password]) VALUES (2, N'Kenneth', N'Mizzi', N'id dar please', N'il mosta', N'', N'', N'kenneth@gmail.com', N'Abcd1234?!')
SET IDENTITY_INSERT [dbo].[platform_user] OFF
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_product_group] FOREIGN KEY([product_group_id])
REFERENCES [dbo].[product_group] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_product_group]
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK_platform_user_id] FOREIGN KEY([platform_user_id])
REFERENCES [dbo].[platform_user] ([id])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK_platform_user_id]
GO
ALTER TABLE [dbo].[transaction_product]  WITH CHECK ADD  CONSTRAINT [FK_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[transaction_product] CHECK CONSTRAINT [FK_product_id]
GO
ALTER TABLE [dbo].[transaction_product]  WITH CHECK ADD  CONSTRAINT [FK_transaction_id] FOREIGN KEY([transaction_id])
REFERENCES [dbo].[transaction] ([id])
GO
ALTER TABLE [dbo].[transaction_product] CHECK CONSTRAINT [FK_transaction_id]
GO
