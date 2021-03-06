USE [master]
GO
/****** Object:  Database [ShopGames]    Script Date: 06.04.2022 18:48:39 ******/
CREATE DATABASE [ShopGames]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopGames', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopGames.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopGames_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopGames_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopGames] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopGames].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopGames] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopGames] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopGames] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopGames] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopGames] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopGames] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopGames] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopGames] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopGames] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopGames] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopGames] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopGames] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopGames] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopGames] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopGames] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopGames] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopGames] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopGames] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopGames] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopGames] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopGames] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopGames] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopGames] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopGames] SET  MULTI_USER 
GO
ALTER DATABASE [ShopGames] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopGames] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopGames] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopGames] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopGames] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopGames] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopGames', N'ON'
GO
ALTER DATABASE [ShopGames] SET QUERY_STORE = OFF
GO
USE [ShopGames]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[IDCart] [int] IDENTITY(1,1) NOT NULL,
	[iduser] [int] NOT NULL,
	[idgame] [int] NOT NULL,
 CONSTRAINT [PK_GamesUsers] PRIMARY KEY CLUSTERED 
(
	[IDCart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[IDComment] [int] IDENTITY(1,1) NOT NULL,
	[iduser] [int] NOT NULL,
	[Rating] [nvarchar](max) NULL,
	[idgame] [int] NOT NULL,
 CONSTRAINT [PK_Table_Cometari] PRIMARY KEY CLUSTERED 
(
	[IDComment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Developer]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developer](
	[IDDeveloper] [int] IDENTITY(1,1) NOT NULL,
	[NazvaniaDeveloper] [nvarchar](50) NULL,
 CONSTRAINT [PK_Developer] PRIMARY KEY CLUSTERED 
(
	[IDDeveloper] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[IDGames] [int] IDENTITY(1,1) NOT NULL,
	[Nazvanie] [nvarchar](50) NULL,
	[idDeveloper] [int] NOT NULL,
	[idPublisher] [int] NOT NULL,
	[Pablicationdate] [date] NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[idSystemrequirements] [int] NULL,
	[Picture] [nvarchar](255) NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[IDGames] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[IDGenre] [int] IDENTITY(1,1) NOT NULL,
	[NazvaniaGenre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Genere] PRIMARY KEY CLUSTERED 
(
	[IDGenre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenreGames]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenreGames](
	[IDGenreGames] [int] IDENTITY(1,1) NOT NULL,
	[idgenre] [int] NOT NULL,
	[idgame] [int] NOT NULL,
 CONSTRAINT [PK_GenersGames] PRIMARY KEY CLUSTERED 
(
	[IDGenreGames] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keys]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keys](
	[IDKey] [int] IDENTITY(1,1) NOT NULL,
	[cdKey] [nvarchar](20) NULL,
	[gameId] [int] NULL,
 CONSTRAINT [PK_KeyGames] PRIMARY KEY CLUSTERED 
(
	[IDKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[IDReceipt] [int] IDENTITY(1,1) NOT NULL,
	[iduser] [int] NOT NULL,
	[idgame] [int] NOT NULL,
	[idkey] [int] NOT NULL,
	[DataBuying] [date] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[IDReceipt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[IDPublisher] [int] IDENTITY(1,1) NOT NULL,
	[NazvaniePublisher] [nvarchar](50) NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[IDPublisher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemRequirements]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemRequirements](
	[IDSystemRequirements] [int] IDENTITY(1,1) NOT NULL,
	[OS] [nvarchar](50) NULL,
	[CPU] [nvarchar](150) NULL,
	[RAM] [nvarchar](50) NULL,
	[GPU] [nvarchar](150) NULL,
	[Storage] [nvarchar](50) NULL,
 CONSTRAINT [PK_SystemRequirements] PRIMARY KEY CLUSTERED 
(
	[IDSystemRequirements] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Adminisrator] [tinyint] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 06.04.2022 18:48:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[IDWishlist] [int] IDENTITY(1,1) NOT NULL,
	[iduser] [int] NOT NULL,
	[idgame] [int] NOT NULL,
 CONSTRAINT [PK_Wihlist] PRIMARY KEY CLUSTERED 
(
	[IDWishlist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([IDCart], [iduser], [idgame]) VALUES (23, 4, 6)
INSERT [dbo].[Cart] ([IDCart], [iduser], [idgame]) VALUES (24, 4, 10)
INSERT [dbo].[Cart] ([IDCart], [iduser], [idgame]) VALUES (25, 4, 3)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([IDComment], [iduser], [Rating], [idgame]) VALUES (1, 4, N'Круто! Кодзима гений! Как обычно!', 17)
INSERT [dbo].[Comments] ([IDComment], [iduser], [Rating], [idgame]) VALUES (2, 2, N'Скучная игра, ожидал большего...', 17)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Developer] ON 

INSERT [dbo].[Developer] ([IDDeveloper], [NazvaniaDeveloper]) VALUES (1, N'DICE')
INSERT [dbo].[Developer] ([IDDeveloper], [NazvaniaDeveloper]) VALUES (2, N'FromSoftware')
INSERT [dbo].[Developer] ([IDDeveloper], [NazvaniaDeveloper]) VALUES (3, N'Tango Gameworks')
INSERT [dbo].[Developer] ([IDDeveloper], [NazvaniaDeveloper]) VALUES (4, N'Infinity Ward')
INSERT [dbo].[Developer] ([IDDeveloper], [NazvaniaDeveloper]) VALUES (5, N'VOID Interactive')
INSERT [dbo].[Developer] ([IDDeveloper], [NazvaniaDeveloper]) VALUES (6, N'Kojima Productions')
INSERT [dbo].[Developer] ([IDDeveloper], [NazvaniaDeveloper]) VALUES (7, N'idSoftware')
SET IDENTITY_INSERT [dbo].[Developer] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (1, N'Battlefield 1', 1, 1, CAST(N'2016-10-21' AS Date), N'Как и предыдущие части игры, Battlefield 1 — шутер от первого лица, ориентированный на многопользовательский режим. Мультиплеер поддерживает до 64 игроков.

В игре доступно оружие времён Первой мировой войны, в том числе винтовки, автоматические и полуавтоматические ружья, пистолеты, ручные пулемёты, помповые дробовики и горчичный газ. Переработана система ближнего боя. В Battlefield 1 можно управлять транспортом: бронемашинами, лёгкими и тяжёлыми танками, легковыми автомобилями, мотоциклами, катерами, аэропланами, бронепоездами, разведывательными машинами, дредноутом, дирижаблями и лошадьми.

В игре представлено шесть основных игровых режимов. Режим «Захват» подразумевает удержание контрольных точек и накопление очков. Режим «Превосходство» отличается от предыдущего только отсутствием военной техники. В режиме «Операции» одна сторона последовательно захватывает вражеские точки, двигаясь вперёд, а другая — обороняет их. Режим «Штурм» предполагает уничтожение телеграфов. Режим «Схватка команд» представляет собой классический deathmatch. Новый режим Battlefield 1 называется «Военные голуби». В этом режиме необходимо захватить голубя и удерживать его некоторое время, чтобы с его помощью отправить депешу в штаб.

Ещё одно нововведение мультиплеера — помощь проигрывающей стороне. Если одна из команд проигрывает, ей предоставляется гигантская боевая машина: дирижабль, корабль, бронепоезд или сверхтяжёлый танк. Такая машина способна изменить ход сражения.', 649.0000, 1, N'/GamePics/2641305_detail.jpg')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (3, N'Battlefield 4', 1, 1, CAST(N'2013-10-29' AS Date), N'Battlefield 4 - кроссплатформеная игра в жанре шутера от первого лица, одиннадцатая по счету из серии игр Battlefield. В сетевых баталиях смогут участвовать до 64 человек, а окружение поддастся динамическому разрушению. Игра располагает тремя сторонами конфликта - Россией, США и Китаем, а так же полутора десятком карт и множеством вариантов оружия. Кроме того, в BF4 в наличии есть огромное количество боевой техники и практически полная разрушаемость окружения.', 349.0000, 18, N'/GamePics/Battlefield_4_Cover.png')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (4, N'Battlefield 2042', 1, 1, CAST(N'2021-10-08' AS Date), N'Тотальная война нового поколения началась — сыграйте в Battlefield™ 2042 уже сегодня. Адаптируйтесь и процветайте на постоянно меняющихся полях боя благодаря своему отряду и арсеналу новейших технологий.', 2499.0000, 12, N'/GamePics/Battlefield_2042_Cover_Art.png')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (6, N'Call of Duty: Infinite Warfare', 4, 4, CAST(N'2016-04-11' AS Date), N'Мультиплатформенный фантастический шутер от первого лица, в сеттинге недалекого будущего, разработанный американской компанией Infinity Ward и изданный компанией Activision. Является тринадцатой по счёту основной игрой серии Call of Duty.', 1299.0000, 17, N'/GamePics/c61e4935-a6ea-4ca6-adec-b811bc7f436d.jpg')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (7, N'Call of Duty: Modern Warfare 3', 4, 4, CAST(N'2011-08-11' AS Date), N'Call of Duty: Modern Warfare 3 - очередное продолжение пиротехнического экшена в альтернативной реальности, и финальная часть подсерии Modern Warfare. Игра посвящена завершению Третьей мировой войны, которую развязали Имран Захаев и Владимир Макаров. Игрок выступает в роли бойцов различных мировых подразделений, ликвидируя важных сообщников Макарова, чтобы вместе с другими державами одержать верх в борьбе с Макаровым и его сообщниками.', 649.0000, 19, N'/GamePics/Call_of_Duty_Modern_Warfare_3_box_art.jpg')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (9, N'GhostWire: Tokyo', 3, 5, CAST(N'2022-03-25' AS Date), N'Ghostwire: Tokyo — это приключенческая игра в жанре экшн и хоррор от первого лица. Игрок может использовать различные паранормальные способности, чтобы победить призраков и духов по всему Токио.', 3499.0000, 13, N'/GamePics/cover.ghostwire-tokyo.1602x2000.2020-06-12.9.jpg')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (10, N'Dark Souls 3', 2, 2, CAST(N'2016-03-24' AS Date), N'Dark Souls 3 представляет собой хардкорную экшен-RPG, основой которой является исследование мира путём перемещения по разнообразным локациям, населённым не менее разнообразными мобами и боссами.', 1299.0000, 20, N'/GamePics/Dark_souls_3_cover_art.jpg')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (12, N'Dark Souls: Remastered', 2, 2, CAST(N'2018-05-24' AS Date), N'Dark Souls Remastered - это переиздание самой первой части культовой ролевой серии, которое предлагает игрокам подтянутую графику, увеличенное количество кадров в секунду, различные балансные правки,', 899.0000, 20, N'/GamePics/dark-souls-remastered-box-art_dwq2.1080.png')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (14, N'Dark Souls 2: Scholar of the First Sin', 2, 2, CAST(N'2014-11-03' AS Date), N'Dark Souls II — action/RPG с открытым миром, являющаяся непрямым продолжением Dark Souls. События игры разворачиваются в мрачном королевстве Дранглик, земли которого поразило проклятие нежити. Главный герой игры, один из множества пораженных проклятием, скитается по землям королевства, сражаясь с опасными врагами и пытаясь постичь секрет Дранглика. ', 399.0000, 20, N'/GamePics/ds2.png')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (15, N'Elden Ring', 2, 2, CAST(N'2022-02-25' AS Date), N'Игра с открытым миром; по словам Хидэтаки Миядзаки, в его понимании это «большое открытое пространство», которое можно свободно исследовать. Этот открытый мир должен содержать различные опасности и области, которые можно исследовать, в том числе многоуровневые замки с запутанной планировкой.', 3499.0000, 2, N'/GamePics/eldenring_3501763.jpg')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (16, N'Ready or Not', 5, 3, CAST(N'2021-12-17' AS Date), N'Ready или Not представляет собой кооперативный тактический шутер. Игроки окажутся в роли членов элитного отряда SWAT, которым поручено разрешать опасные ситуации в современной Америке, где неравенство в доходах между классами привело к нестабильности, и страна погрузилась в хаос.', 1199.0000, 3, N'/GamePics/thumb-1920-476311.jpg')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (17, N'Death Stranding', 6, 6, CAST(N'2019-11-08' AS Date), N'Death Stranding - это совершенно новый проект знаменитого японского геймдизайнера Хидео Кодзимы. Игра рассказывает историю постапокалиптической Америки, которая - как и весь мир, впрочем - оказалась фактически уничтожена после катаклизма, получившего название Выход Смерти.', 2999.0000, 4, N'/GamePics/deathstr.png')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (18, N'Metal Gear Solid V: The Phantom Pain', 6, 7, CAST(N'2015-09-01' AS Date), N'Metal Gear Solid V: The Phantom Pain – это стелс-экшен-приключение в открытом мире с элементами менеджмента и ролевой игры, где основной акцент сделан на сборе ресурсов и развитии способностей главного героя.', 299.0000, 5, N'/GamePics/mgs5.png')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (24, N'Battlefield 3', 1, 1, CAST(N'2011-10-25' AS Date), N'Battlefield 3 - продолжение популярной серии сетевых шутеров, которое создан на движке Frostbite 2.0, который призван отвечать за тотальное изничтожение всего и вся на карте.  В сетевой части Battlefield 3 смогут сойтись до 64 человек, реализованы 24 вида транспорта и 17 видов оружия, которые игроки могут задействовать на десятке разных карт, от больших до маленьких. Игроки могут сражаться как пешком, так и используя различную военную технику - от броневиков и до танков.', 249.0000, 9, N'/GamePics/Battlefield_3_Game_Cover.jpg')
INSERT [dbo].[Games] ([IDGames], [Nazvanie], [idDeveloper], [idPublisher], [Pablicationdate], [Description], [Price], [idSystemrequirements], [Picture]) VALUES (25, N'DOOM', 7, 5, CAST(N'2016-05-13' AS Date), N'Doom (2016) - это очередная часть знаменитой серии, в которой игрок в роли космического десантника пройдет длинный путь по коридорам заброшенной космической базы на Марсе, чтобы дойти до самого Ада и уничтожить там как можно больше демонов.', 499.0000, 10, N'/GamePics/doom.png')
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (1, N'Экшн')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (2, N'Хоррор')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (3, N'Шутер')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (4, N'Файтинг')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (5, N'Стелс')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (6, N'Аркада')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (7, N'Симулятор')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (8, N'Спорт')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (9, N'Приключение')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (10, N'Стратегия')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (11, N'Мультиплеер')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (12, N'Одиночная игра')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (13, N'Кооператив')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (14, N'Реализм')
INSERT [dbo].[Genre] ([IDGenre], [NazvaniaGenre]) VALUES (15, N'Шутер от третьего лица')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[GenreGames] ON 

INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (1, 1, 1)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (2, 3, 1)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (3, 11, 1)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (4, 1, 10)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (5, 9, 10)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (6, 12, 10)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (7, 13, 10)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (8, 11, 10)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (9, 1, 16)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (10, 3, 16)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (11, 14, 16)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (12, 1, 18)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (13, 5, 18)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (14, 3, 18)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (15, 9, 18)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (16, 15, 18)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (26, 1, 24)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (27, 3, 24)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (28, 11, 24)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (29, 1, 25)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (30, 3, 25)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (31, 12, 25)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (32, 1, 4)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (33, 11, 4)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (34, 3, 4)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (35, 1, 9)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (36, 11, 9)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (37, 3, 9)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (38, 1, 6)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (39, 11, 6)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (40, 3, 6)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (41, 1, 3)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (42, 3, 3)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (43, 11, 3)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (44, 1, 7)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (45, 3, 7)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (46, 11, 7)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (47, 1, 12)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (48, 3, 12)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (49, 11, 12)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (50, 1, 14)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (51, 9, 14)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (52, 12, 14)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (53, 13, 14)
INSERT [dbo].[GenreGames] ([IDGenreGames], [idgenre], [idgame]) VALUES (54, 11, 14)
SET IDENTITY_INSERT [dbo].[GenreGames] OFF
GO
SET IDENTITY_INSERT [dbo].[Keys] ON 

INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (7, N'5SKXKRWNUYTCRA1YLDQX', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (8, N'CW8JKUT7OENJ2FQBNKKY', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (9, N'FJC4L2U0TVVNVXFOZZM8', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (10, N'9YTCD6KJOEWC6QX2AA11', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (11, N'9YTCD6KJOEWC6QX2AA11', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (12, N'W4L17X962CXTV75UO4Y6', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (13, N'3Q478RPVLPMD9JF2W2DY', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (14, N'EJZJC81AB5FCB5E02YFF', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (15, N'LMN5CBXT5K9JNA3D36AF', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (16, N'LMN5CBXT5K9JNA3D36AF', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (17, N'1WN7TNRGKGY8707GHK36', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (18, N'RA019M3IJ9I77NMFXFZK', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (19, N'RA019M3IJ9I77NMFXFZK', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (20, N'RA019M3IJ9I77NMFXFZK', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (21, N'RIC737C45A7F9PG5QX42', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (22, N'BHYJCYSBV535FZY2LY2C', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (23, N'PGBJXV7LA6831U99EFYX', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (24, N'HGD6HCRS3J1Z5S0ENW8V', NULL)
INSERT [dbo].[Keys] ([IDKey], [cdKey], [gameId]) VALUES (25, N'QPR8VOQH2SYTFI3F5R92', NULL)
SET IDENTITY_INSERT [dbo].[Keys] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (7, 4, 15, 7, CAST(N'2022-04-05' AS Date), 3499.0000)
INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (8, 4, 17, 8, CAST(N'2022-04-05' AS Date), 2999.0000)
INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (9, 2, 1, 9, CAST(N'2022-04-05' AS Date), 649.0000)
INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (10, 2, 3, 10, CAST(N'2022-04-05' AS Date), 349.0000)
INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (11, 2, 14, 11, CAST(N'2022-04-05' AS Date), 399.0000)
INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (12, 2, 12, 12, CAST(N'2022-04-05' AS Date), 899.0000)
INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (13, 2, 17, 13, CAST(N'2022-04-05' AS Date), 2999.0000)
INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (21, 5, 1, 21, CAST(N'2022-04-05' AS Date), 649.0000)
INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (22, 5, 4, 22, CAST(N'2022-04-05' AS Date), 2499.0000)
INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (23, 5, 24, 23, CAST(N'2022-04-05' AS Date), 249.0000)
INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (24, 5, 3, 24, CAST(N'2022-04-05' AS Date), 349.0000)
INSERT [dbo].[Payment] ([IDReceipt], [iduser], [idgame], [idkey], [DataBuying], [Price]) VALUES (25, 5, 7, 25, CAST(N'2022-04-05' AS Date), 649.0000)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([IDPublisher], [NazvaniePublisher]) VALUES (1, N'EA')
INSERT [dbo].[Publisher] ([IDPublisher], [NazvaniePublisher]) VALUES (2, N'Bandai Namco')
INSERT [dbo].[Publisher] ([IDPublisher], [NazvaniePublisher]) VALUES (3, N'VOID Interactive')
INSERT [dbo].[Publisher] ([IDPublisher], [NazvaniePublisher]) VALUES (4, N'Activision')
INSERT [dbo].[Publisher] ([IDPublisher], [NazvaniePublisher]) VALUES (5, N'Bethesda')
INSERT [dbo].[Publisher] ([IDPublisher], [NazvaniePublisher]) VALUES (6, N'Sony Interactive')
INSERT [dbo].[Publisher] ([IDPublisher], [NazvaniePublisher]) VALUES (7, N'Konami')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemRequirements] ON 

INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (1, N'Windows', N'Core i5 6600K / AMD FX-6350', N' 8 GB', N'AMD Radeon HD 7850 / nVidia GeForce GTX 660', N'70 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (2, N'Windows 10', N'Intel Core i5-8400 or AMD Ryzen 3 3300X', N'12 GB', N'Nvidia GeForce GTX 1060 3GB or AMD Radeon RX 580 4GB', N'60 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (3, N'Windows 10', N'Intel Core i5-4430 / AMD FX-6300', N'8 GB', N' NVIDIA GeForce GTX 960 2GB / AMD Radeon R7 370 2GB', N'20 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (4, N'Windows 10', N'Intel® Core™ i5-3470 or AMD Ryzen™ 3 1200', N'8 GB', N'GeForce GTX 1050 3 GB or AMD Radeon™ RX 560 4 GB', N'80 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (5, N'Windows 10', N'Intel Core i5-4460 (3.40 GHz)', N'4 GB', N'NVIDIA GeForce GTX 650 (2GB)', N'28 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (6, N'Windows 7', N'Quad Core CPU', N'4 GB', N'Nvidia GeForce GTX 560 / ATI Radeon 6950', N'20 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (7, N'Windows 7', N'Quad Core CPU', N'4 GB', N'Nvidia GeForce GTX 560 или ATI Radeon 6950', N'20 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (8, N'Windows 7', N'Quad Core CPU', N'4 GB', N'Nvidia GeForce GTX 560 or ATI Radeon 6950', N'20 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (9, N'Windows 7', N'Quad Core CPU', N'4GB', N'Nvidia GeForce GTX 560 or ATI Radeon 6950', N'20 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (10, N'Windows 10', N'Intel Core i5-2400', N'8 GB', N'AMD Radeon HD 7870', N'60 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (11, N'Windows 10', N'Intel Core i5-2400', N'8 GB', N'AMD Radeon HD 7870', N'60 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (12, N'Windows 10', N'AMD Ryzen 5 1600', N'8GB', N'Intel Core i5 6600K', N'40 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (13, N'Windows 10', N'Core i7 4770K @ 3.5GHZ or AMD Ryzen 5 2600', N'12 GB', N'Nvidia GTX 1060 or AMD RX 5500 XT (VRAM 6 GB+)', N'20 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (17, N'Windows 10', N'Intel Core i3-3225 @ 3.30GHz', N'8 GB', N'NVIDIA GeForce GTX 660 @ 2GB / ATI Radeon HD 7850 @ 2GB', N'60 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (18, N'Windows 8', N'Athlon X2 2.8 GHz Processor (Intel): Core 2 Duo 2.4 GHz', N'4 GB', N'AMD Radeon HD 3870 Graphics card (NVIDIA): Nvidia GeForce 8800 GT', N'60 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (19, N'Windows 7', N'Intel Core 2 Duo E6600 or AMD Phenom X38750 processor or better', N'2 GB', N'NVIDIA GeForce 8600GT or ATI Radeon X1950', N'16 GB')
INSERT [dbo].[SystemRequirements] ([IDSystemRequirements], [OS], [CPU], [RAM], [GPU], [Storage]) VALUES (20, N'Windows 10', N'AMD FX-8150 / AMD Ryzen 3 1300X or Intel Core I5-2500K.', N'4 GB', N'Minimum 2GB VRAM (AMD Radeon HD7870, etc) or Nvidia GeForce GTX760', N'10 GB')
SET IDENTITY_INSERT [dbo].[SystemRequirements] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IDUser], [Login], [Password], [Adminisrator]) VALUES (1, N'admin', N'admin123', 1)
INSERT [dbo].[Users] ([IDUser], [Login], [Password], [Adminisrator]) VALUES (2, N'ruffus', N'ussr1122', 0)
INSERT [dbo].[Users] ([IDUser], [Login], [Password], [Adminisrator]) VALUES (3, N'andrew10115', N'iAmApexLegend', 0)
INSERT [dbo].[Users] ([IDUser], [Login], [Password], [Adminisrator]) VALUES (4, N'alivanity', N'kemran123', NULL)
INSERT [dbo].[Users] ([IDUser], [Login], [Password], [Adminisrator]) VALUES (5, N'milway', N'slavamarlow', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([IDWishlist], [iduser], [idgame]) VALUES (2, 2, 9)
INSERT [dbo].[Wishlist] ([IDWishlist], [iduser], [idgame]) VALUES (8, 4, 1)
INSERT [dbo].[Wishlist] ([IDWishlist], [iduser], [idgame]) VALUES (9, 4, 7)
INSERT [dbo].[Wishlist] ([IDWishlist], [iduser], [idgame]) VALUES (10, 4, 12)
INSERT [dbo].[Wishlist] ([IDWishlist], [iduser], [idgame]) VALUES (11, 5, 4)
INSERT [dbo].[Wishlist] ([IDWishlist], [iduser], [idgame]) VALUES (12, 5, 14)
INSERT [dbo].[Wishlist] ([IDWishlist], [iduser], [idgame]) VALUES (13, 5, 9)
INSERT [dbo].[Wishlist] ([IDWishlist], [iduser], [idgame]) VALUES (14, 5, 15)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Bascet_Games] FOREIGN KEY([idgame])
REFERENCES [dbo].[Games] ([IDGames])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Bascet_Games]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Bascet_Users] FOREIGN KEY([iduser])
REFERENCES [dbo].[Users] ([IDUser])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Bascet_Users]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Table_Cometari_Games] FOREIGN KEY([idgame])
REFERENCES [dbo].[Games] ([IDGames])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Table_Cometari_Games]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Table_Cometari_Users] FOREIGN KEY([iduser])
REFERENCES [dbo].[Users] ([IDUser])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Table_Cometari_Users]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Developer] FOREIGN KEY([idDeveloper])
REFERENCES [dbo].[Developer] ([IDDeveloper])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Developer]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_Publisher] FOREIGN KEY([idPublisher])
REFERENCES [dbo].[Publisher] ([IDPublisher])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_Publisher]
GO
ALTER TABLE [dbo].[Games]  WITH CHECK ADD  CONSTRAINT [FK_Games_SystemRequirements] FOREIGN KEY([idSystemrequirements])
REFERENCES [dbo].[SystemRequirements] ([IDSystemRequirements])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Games] CHECK CONSTRAINT [FK_Games_SystemRequirements]
GO
ALTER TABLE [dbo].[GenreGames]  WITH CHECK ADD  CONSTRAINT [FK_GenersGames_Games] FOREIGN KEY([idgame])
REFERENCES [dbo].[Games] ([IDGames])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenreGames] CHECK CONSTRAINT [FK_GenersGames_Games]
GO
ALTER TABLE [dbo].[GenreGames]  WITH CHECK ADD  CONSTRAINT [FK_GenersGames_Genere] FOREIGN KEY([idgenre])
REFERENCES [dbo].[Genre] ([IDGenre])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenreGames] CHECK CONSTRAINT [FK_GenersGames_Genere]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Games] FOREIGN KEY([idgame])
REFERENCES [dbo].[Games] ([IDGames])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Games]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_KeyGames] FOREIGN KEY([idkey])
REFERENCES [dbo].[Keys] ([IDKey])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_KeyGames]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Users] FOREIGN KEY([iduser])
REFERENCES [dbo].[Users] ([IDUser])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Users]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wihlist_Games] FOREIGN KEY([idgame])
REFERENCES [dbo].[Games] ([IDGames])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wihlist_Games]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wihlist_Users] FOREIGN KEY([iduser])
REFERENCES [dbo].[Users] ([IDUser])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wihlist_Users]
GO
USE [master]
GO
ALTER DATABASE [ShopGames] SET  READ_WRITE 
GO
