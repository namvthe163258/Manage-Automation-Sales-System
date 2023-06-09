USE [master]
GO
/****** Object:  Database [FinalProject2]    Script Date: 3/1/2023 2:45:41 PM ******/
CREATE DATABASE [FinalProject2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProject2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FinalProject2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalProject2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FinalProject2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FinalProject2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProject2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProject2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProject2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProject2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProject2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProject2] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProject2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinalProject2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProject2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProject2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProject2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProject2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProject2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProject2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProject2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProject2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FinalProject2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProject2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProject2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProject2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProject2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProject2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalProject2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProject2] SET RECOVERY FULL 
GO
ALTER DATABASE [FinalProject2] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProject2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProject2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProject2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProject2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalProject2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalProject2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FinalProject2] SET QUERY_STORE = OFF
GO
USE [FinalProject2]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 3/1/2023 2:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[accountId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[roleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 3/1/2023 2:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[listInfoCus]    Script Date: 3/1/2023 2:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[listInfoCus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cusname] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_listInfoCus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 3/1/2023 2:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantityOrdered] [int] NULL,
	[productPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 3/1/2023 2:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NULL,
	[orderComment] [nvarchar](255) NULL,
	[userName] [nvarchar](255) NULL,
 CONSTRAINT [PK__orders__0809335DFCCA1932] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 3/1/2023 2:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](255) NOT NULL,
	[productColor] [nvarchar](255) NOT NULL,
	[productDescription] [nvarchar](1000) NOT NULL,
	[productPrice] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
	[Image] [nvarchar](1000) NULL,
	[Image2] [nvarchar](1000) NULL,
	[Image3] [nvarchar](1000) NULL,
	[Image4] [nvarchar](1000) NULL,
 CONSTRAINT [PK__products__2D10D16A21775F18] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 3/1/2023 2:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/1/2023 2:45:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userName] [nvarchar](255) NOT NULL,
	[accountId] [int] NULL,
	[fullName] [nvarchar](255) NULL,
	[phone] [varchar](10) NULL,
	[address] [nvarchar](255) NULL,
	[DoB] [date] NULL,
	[gender] [varchar](10) NULL,
	[email] [varchar](255) NULL,
 CONSTRAINT [PK__users__CB9A1CFF67AFA69D] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[accounts] ON 

INSERT [dbo].[accounts] ([accountId], [userName], [password], [roleId]) VALUES (1, N'admin1', N'admin123', 1)
INSERT [dbo].[accounts] ([accountId], [userName], [password], [roleId]) VALUES (2, N'manager1', N'manager1', 2)
INSERT [dbo].[accounts] ([accountId], [userName], [password], [roleId]) VALUES (3, N'customer1', N'customer1', 3)
INSERT [dbo].[accounts] ([accountId], [userName], [password], [roleId]) VALUES (1002, N'customer2', N'customer2', 3)
INSERT [dbo].[accounts] ([accountId], [userName], [password], [roleId]) VALUES (1003, N'admin2', N'admin12', 3)
INSERT [dbo].[accounts] ([accountId], [userName], [password], [roleId]) VALUES (1004, N'admin12', N'admin12', 3)
INSERT [dbo].[accounts] ([accountId], [userName], [password], [roleId]) VALUES (1005, N'1', N'1', 3)
INSERT [dbo].[accounts] ([accountId], [userName], [password], [roleId]) VALUES (1006, N'dat123', N'1', 3)
SET IDENTITY_INSERT [dbo].[accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([categoryId], [categoryName]) VALUES (1, N'Hatchback')
INSERT [dbo].[categories] ([categoryId], [categoryName]) VALUES (2, N'Sedan')
INSERT [dbo].[categories] ([categoryId], [categoryName]) VALUES (3, N'CUV-Crossover Utility Vehicle')
INSERT [dbo].[categories] ([categoryId], [categoryName]) VALUES (4, N'SUV-Sport Utility Vehicle')
INSERT [dbo].[categories] ([categoryId], [categoryName]) VALUES (5, N'Limousine')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[listInfoCus] ON 

INSERT [dbo].[listInfoCus] ([Id], [Cusname], [Phone], [Address], [Email]) VALUES (21, N'jdhsa', N'8723742', N'ajhda@hsdjhf', N'ádfsa')
INSERT [dbo].[listInfoCus] ([Id], [Cusname], [Phone], [Address], [Email]) VALUES (22, N'jdhsa', N'872673742', N'ajhda@hsdjhf', N'ádfsa')
INSERT [dbo].[listInfoCus] ([Id], [Cusname], [Phone], [Address], [Email]) VALUES (23, N'dh', N'32987698', N'jhggu', N'dgsh@dhsj')
INSERT [dbo].[listInfoCus] ([Id], [Cusname], [Phone], [Address], [Email]) VALUES (24, N'datdzvc', N'7289900', N'dáh', N'sdgf@kjfs')
SET IDENTITY_INSERT [dbo].[listInfoCus] OFF
GO
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (2, 1, 1, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (2, 2, 2, 779000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (3, 3, 1, 1029000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (4, 5, 1, 1869000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (10, 1, 1, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (11, 1, 1, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (12, 1, 1, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (12, 2, 1, 779000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (13, 1, 1, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (13, 2, 1, 779000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (20, 1, 1, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (21, 1, 1, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (21, 2, 2, 779000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (22, 2, 1, 779000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (23, 1, 3, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (23, 2, 2, 779000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (24, 1, 1, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (25, 1, 4, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (25, 3, 2, 1029000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (26, 1, 1, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (26, 2, 1, 779000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (27, 3, 1, 1029000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (30, 1, 1, 449000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (30, 2, 1, 779000000)
INSERT [dbo].[orderDetails] ([orderId], [productId], [quantityOrdered], [productPrice]) VALUES (30, 3, 1, 1029000000)
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (2, CAST(N'2022-10-09' AS Date), N'khi nao thi nhan duoc xe?', N'2')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (3, CAST(N'2022-09-09' AS Date), N'gia khi lan banh la bao nhieu?', N'2')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (4, CAST(N'2022-10-10' AS Date), N'xe co mau khac khong vay?', N'3')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (7, CAST(N'2022-09-09' AS Date), N'', N'employee1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (8, CAST(N'2022-09-09' AS Date), N'', N'employee1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (9, CAST(N'2022-09-09' AS Date), N'', N'employee1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (10, CAST(N'2022-09-09' AS Date), N'', N'employee1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (11, CAST(N'2022-09-09' AS Date), N'', N'employee1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (12, CAST(N'2022-09-09' AS Date), N'', N'employee1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (13, CAST(N'2022-09-09' AS Date), N'', N'employee1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (17, CAST(N'2022-11-01' AS Date), N'Mua Hang', NULL)
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (18, CAST(N'2022-11-01' AS Date), N'Mua Hang', NULL)
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (19, CAST(N'2022-11-01' AS Date), N'Mua Hang', NULL)
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (20, CAST(N'2022-11-01' AS Date), N'Mua Hang', N'employee1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (21, CAST(N'2022-11-01' AS Date), N'Mua Hang', N'employee1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (22, CAST(N'2022-11-01' AS Date), N'Mua Hang', N'admin1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (23, CAST(N'2022-11-01' AS Date), N'Mua Hang', N'admin1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (24, CAST(N'2023-02-14' AS Date), N'Mua Hang', N'admin1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (25, CAST(N'2023-02-15' AS Date), N'Mua Hang', N'admin1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (26, CAST(N'2023-02-15' AS Date), N'Mua Hang', N'admin1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (27, CAST(N'2023-02-27' AS Date), N'Mua Hang', N'admin1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (28, CAST(N'2023-02-28' AS Date), N'Mua Hang', N'admin1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (29, CAST(N'2023-02-28' AS Date), N'Mua Hang', N'admin1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (30, CAST(N'2023-02-28' AS Date), N'Mua Hang', N'admin1')
INSERT [dbo].[orders] ([orderId], [orderDate], [orderComment], [userName]) VALUES (31, CAST(N'2023-02-28' AS Date), N'Mua Hang', NULL)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([productId], [productName], [productColor], [productDescription], [productPrice], [categoryId], [Image], [Image2], [Image3], [Image4]) VALUES (1, N'New KIA Morning X-Line', N'Red', N'Sau thời gian dài im hơi lặng tiếng, Thaco Trường Hải đã chính thức giới thiệu KIA Morning thế hệ mới nhất 2021. Mẫu xe này sẽ được ra mắt trong thời gian tới với hai phiên bản X-Line. Bước sang thế hệ mới, Morning nhận được rất nhiều cải tiến từ ngoại thất, nội thất giúp Morning khẳng định lại kỷ nguyên huy hoàng năm xưa.', 449000000, 1, N'https://drive.gianhangvn.com/image/r9bbndq-2203174j32236.jpg', N'https://i1-vnexpress.vnecdn.net/2022/10/06/z3393580700393-e63935e79440f48-6905-2228-1651827012.jpg?w=2400&h=0&q=100&dpr=1&fit=crop&s=Si5qgHzDaflMjbNUEuvFhA&t=image', N'https://i1-vnexpress.vnecdn.net/2022/10/06/Kia-Morning-2-6218-1605366136.jpg?w=2400&h=0&q=100&dpr=1&fit=crop&s=MAJAF9-KkB9SutAGsIMHJw&t=image', N'https://i1-vnexpress.vnecdn.net/2022/10/06/Kia-Morning-4-6766-1605366136.jpg?w=2400&h=0&q=100&dpr=1&fit=crop&s=Dq5WAVC5mnsv62kPoU7ckw&t=image')
INSERT [dbo].[products] ([productId], [productName], [productColor], [productDescription], [productPrice], [categoryId], [Image], [Image2], [Image3], [Image4]) VALUES (2, N'KIA K3 1.6 Turbo GT', N'Black', N'Hiện tại, KIA K3 1.6 Turbo GT sẽ là phiên bản cao cấp nhất của dòng xe này, trên cả bản 2.0 Premium. Động thái bổ sung thêm phiên bản mới với hệ truyền động mới chính là cách hữu ích giúp Kia K3 dễ dàng cạnh tranh với các đối thủ vừa bước sang thế hệ mới như Honda Civic và Toyota Corolla Altis.', 779000000, 1, N'https://drive.gianhangvn.com/image/2c58rnx-2203234j32236.jpg', N'https://drive.gianhangvn.com/image/2540pg4-2203235j32236.jpg', N'https://drive.gianhangvn.com/image/2i36qoa-2203236j32236.jpg', N'https://drive.gianhangvn.com/image/rgaeqoc-2203237j32236.jpg')
INSERT [dbo].[products] ([productId], [productName], [productColor], [productDescription], [productPrice], [categoryId], [Image], [Image2], [Image3], [Image4]) VALUES (3, N'KIA K5 2.5 GT-Line', N'Sapphire Blue', N'KIA K5 chính thức được ra mắt tại Việt Nam ngày 09-10-2021 với 03 phiên bản 2.0 Luxury, 2.0 Premium và 2.5 GT-Line. Xe được lắp ráp tại Việt Nam. Đây là thế hệ mới của Optima nhưng được đổi tiên để đồng bộ với thị trường quốc tế.', 1029000000, 3, N'https://drive.gianhangvn.com/image/r4u0pp4-2203276j32236.jpg', N'https://drive.gianhangvn.com/image/2o6oppi-2203278j32236.jpg', N'https://drive.gianhangvn.com/image/24v9ppj-2203279j32236.jpg', N'https://drive.gianhangvn.com/image/2gowppq-2203282j32236.jpg')
INSERT [dbo].[products] ([productId], [productName], [productColor], [productDescription], [productPrice], [categoryId], [Image], [Image2], [Image3], [Image4]) VALUES (4, N'KIA Sportage 1.6T Signature AWD', N'White', N'KIA Sportage trở lại Việt Nam vào tháng 6 tới đây với 8 phiên bản, giá từ 899-1,099 triệu đồng. Giới tư vấn bán hàng KIA toàn quốc đang nhận đặt cọc Sportage thế hệ mới với 8 phiên bản: Luxury, Premium và Signature, Với phiên bản Sportage Luxury giá bán từ 899 triệu đồng, bản Sportage Premium 939 triệu đồng và bản cáo cấp nhất Sportage Signature 1,099 triệu đồng. Xe ra mắt trong tháng 5, bắt đầu đến tay khách hàng trong tháng 6 hoặc tháng 7. Năm 2021, phía THACO có công bố kế hoạch phân phối Sportage 2022 vào tháng 6 năm nay.', 1099000000, 4, N'https://drive.gianhangvn.com/image/9lj5rn8-2203369j32236.jpg', N'https://drive.gianhangvn.com/image/96q0q7v-2203370j32236.jpg', N'https://drive.gianhangvn.com/image/2kdkq7w-2203371j32236.jpg', N'https://drive.gianhangvn.com/image/o8udq70-2203372j32236.jpg')
INSERT [dbo].[products] ([productId], [productName], [productColor], [productDescription], [productPrice], [categoryId], [Image], [Image2], [Image3], [Image4]) VALUES (5, N'KIA Carnival 3.5G Signature 7 slot', N'Black', N'Carnival thế hệ mới có kích thước và khoảng sáng gầm xe lớn hơn so với thế hệ cũ. Xe dài hơn 40 mm, rộng hơn 10 mm và cao hơn 20 mm. Trục cơ sở cũng tăng thêm 30 mm. Khoảng sáng gầm xe 172 mm, tức tăng thêm 9 mm. Tất cả các thay đổi này giúp Carnival to lớn hơn và nội thất rộng rãi hơn.', 1869000000, 5, N'https://drive.gianhangvn.com/image/oentple-2203530j32236.jpg', N'https://drive.gianhangvn.com/image/bhj0pk1-2203531j32236.jpg', N'https://drive.gianhangvn.com/image/29dhpk4-2203532j32236.jpg', N'https://drive.gianhangvn.com/image/26n0plb-2203534j32236.jpg')
INSERT [dbo].[products] ([productId], [productName], [productColor], [productDescription], [productPrice], [categoryId], [Image], [Image2], [Image3], [Image4]) VALUES (6, N'New KIA Sorento Signature D2.2 Diesel (7 Ghế Máy dầu)', N'Sapphire Blue', N'KIA Sorento 2021 là thế hệ hoàn toàn mới đã ra mắt thị trường Việt Nam vào trưa ngày 14/09/2020. KIA tự hào về mẫu Sorento thế hệ mới và tự tin khẳng định đây là chiếc xe có không gian rộng rãi bậc nhất so với những chiếc xe có 3 hàng ghế cùng phân khúc.

Không chỉ thế, Sorento 2021 còn đem đến rất nhiều cải tiến về công nghệ vận hành cũng như hệ thống giải trí tiên tiến. KIA Sorento mới tự tin khi được trang bị những công nghệ giải trí và hỗ trợ người dùng thế hệ mới nhất của KIA trong thời điểm hiện tại.', 1349000000, 4, N'https://drive.gianhangvn.com/image/r4dloy1-2203483j32236.jpg', N'https://drive.gianhangvn.com/image/ongloy0-2203482j32236.jpg', N'https://drive.gianhangvn.com/image/blzfoy2-2203484j32236.jpg', N'https://drive.gianhangvn.com/image/2e1tozc-2203486j32236.jpg')
INSERT [dbo].[products] ([productId], [productName], [productColor], [productDescription], [productPrice], [categoryId], [Image], [Image2], [Image3], [Image4]) VALUES (7, N'KIA Carens 1.5D Signature', N'White', N'Tại Việt Nam, thương hiệu Kia do THACO AUTO phân phối luôn mang đến cho khách hàng nhiều sự lựa chọn đa dạng. Kia Carens C-SUV thế hệ mới với 7 phiên bản: 3 phiên bản động cơ xăng 1.5L gồm: Luxury, IVT, MT Deluxe; 02 phiên bản động cơ xăng tăng áp 1.4L Turbo: Signature và Premium và 02 phiên bản động cơ Diesel 1.5L: Signature và Premium. Tất cả các phiên bản đều được trang bị 7 ghế, riêng các phiên bản Signature sẽ có thêm tùy chọn 6 ghế.', 859000000, 4, N'https://drive.gianhangvn.com/image/2cksr3h-2292139j32236.jpg', N'https://drive.gianhangvn.com/image/rkyhr3f-2292140j32236.jpg', N'https://drive.gianhangvn.com/image/9wcqr3g-2292141j32236.jpg', N'https://drive.gianhangvn.com/image/223yr3i-2292142j32236.jpg')
INSERT [dbo].[products] ([productId], [productName], [productColor], [productDescription], [productPrice], [categoryId], [Image], [Image2], [Image3], [Image4]) VALUES (8, N'KIA Sonet AT Premium', N'Gold', N'KIA Sonet bất ngờ được giới thiệu tại sự kiện ngày 09/10. Thaco cũng bắt đầu nhận đặt cọc mẫu SUV cỡ nhỏ và sẽ giao xe vào tháng 11 này. Xe ô tô Sonet được phân phối với 4 phiên bản gồm Deluxe MT, Deluxe, Luxury và Premium. Tại Việt Nam, KIA Sonet không có cấu hình 7 chỗ như ở thị trường nước ngoài. Xe Sonet mở ra một phân khúc mới, nằm giữa hạng A và B. Mẫu xe này xếp dưới KIA Seltos. Đây sẽ là đối thủ cạnh tranh trực tiếp với Toyota Raize, mẫu SUV này cũng được xác nhận sẽ ra mắt vào đầu tháng 11.', 624000000, 3, N'https://drive.gianhangvn.com/image/2z0rpo6-2203302j32236.jpg', N'https://drive.gianhangvn.com/image/rhpfpo0-2203303j32236.jpg', N'https://drive.gianhangvn.com/image/9n7kpo2-2203304j32236.jpg', N'https://drive.gianhangvn.com/image/29zgpo4-2203305j32236.jpg')
INSERT [dbo].[products] ([productId], [productName], [productColor], [productDescription], [productPrice], [categoryId], [Image], [Image2], [Image3], [Image4]) VALUES (9, N'KIA Soluto AT Luxury', N'Red', N'KIA Soluto AT Luxury hay còn gọi là KIA Pegas là mẫu sedan hạng B xuất hiện lần đầu tiên trước công chúng trong triển lãm ô tô Thượng Hải 2017. Soluto được sản xuất dựa trên nền tảng của mẫu xe KIA K2 hướng tới khách hàng trẻ. Khi Soluto được bán chính thức tại Việt Nam nó sẽ thay thế cho KIA Rio và sẽ chám trán các đối thủ cực mạnh như Toyota Vios, Hyundai Accent, Honda City,...', 489000000, 2, N'https://drive.gianhangvn.com/image/r4dyll6-2203208j32236.jpg', N'https://drive.gianhangvn.com/image/2qhgll8-2203210j32236.jpg', N'NULLhttps://drive.gianhangvn.com/image/9516lma-2203212j32236.jpg', N'https://drive.gianhangvn.com/image/rx3elmb-2203213j32236.jpg')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (1, N'admin')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (2, N'manager')
INSERT [dbo].[roles] ([roleId], [roleName]) VALUES (3, N'customer')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
INSERT [dbo].[users] ([userName], [accountId], [fullName], [phone], [address], [DoB], [gender], [email]) VALUES (N'1', 1, N'nguyen ba hung', N'0987654321', N'ha noi', CAST(N'1999-05-17' AS Date), N'male', N'nguyenbahung@gmail.com')
INSERT [dbo].[users] ([userName], [accountId], [fullName], [phone], [address], [DoB], [gender], [email]) VALUES (N'2', 2, N'nguyen van A', N'0143765174', N'ha noi', CAST(N'1999-05-20' AS Date), N'male', N'hungnbhe160009@fpt.edu.vn')
INSERT [dbo].[users] ([userName], [accountId], [fullName], [phone], [address], [DoB], [gender], [email]) VALUES (N'3', 3, N'nguyen hoang C', N'0143766674', N'ho chi minh', CAST(N'1997-08-20' AS Date), N'male', N'hungnbhe1600009@fpt.edu.vn')
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD  CONSTRAINT [FK_accountRole] FOREIGN KEY([roleId])
REFERENCES [dbo].[roles] ([roleId])
GO
ALTER TABLE [dbo].[accounts] CHECK CONSTRAINT [FK_accountRole]
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD  CONSTRAINT [FK_orderDetailOrder] FOREIGN KEY([orderId])
REFERENCES [dbo].[orders] ([orderId])
GO
ALTER TABLE [dbo].[orderDetails] CHECK CONSTRAINT [FK_orderDetailOrder]
GO
ALTER TABLE [dbo].[orderDetails]  WITH CHECK ADD  CONSTRAINT [FK_orderDetailProduct] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([productId])
GO
ALTER TABLE [dbo].[orderDetails] CHECK CONSTRAINT [FK_orderDetailProduct]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_productCategory] FOREIGN KEY([categoryId])
REFERENCES [dbo].[categories] ([categoryId])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_productCategory]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_userAcount] FOREIGN KEY([accountId])
REFERENCES [dbo].[accounts] ([accountId])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_userAcount]
GO
USE [master]
GO
ALTER DATABASE [FinalProject2] SET  READ_WRITE 
GO
