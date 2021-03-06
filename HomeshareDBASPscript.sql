USE [master]
GO
/****** Object:  Database [HomeShareDBASP]    Script Date: 3/19/2021 4:21:35 PM ******/
CREATE DATABASE [HomeShareDBASP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeShareDBASP', FILENAME = N'C:\Users\thaob\HomeShareDBASP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HomeShareDBASP_log', FILENAME = N'C:\Users\thaob\HomeShareDBASP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HomeShareDBASP] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeShareDBASP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeShareDBASP] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [HomeShareDBASP] SET ANSI_NULLS ON 
GO
ALTER DATABASE [HomeShareDBASP] SET ANSI_PADDING ON 
GO
ALTER DATABASE [HomeShareDBASP] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [HomeShareDBASP] SET ARITHABORT ON 
GO
ALTER DATABASE [HomeShareDBASP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeShareDBASP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [HomeShareDBASP] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [HomeShareDBASP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [HomeShareDBASP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HomeShareDBASP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeShareDBASP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HomeShareDBASP] SET  MULTI_USER 
GO
ALTER DATABASE [HomeShareDBASP] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [HomeShareDBASP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeShareDBASP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeShareDBASP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HomeShareDBASP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HomeShareDBASP] SET QUERY_STORE = OFF
GO
USE [HomeShareDBASP]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [HomeShareDBASP]
GO
/****** Object:  Table [dbo].[BienEchange]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BienEchange](
	[idBien] [int] IDENTITY(1,1) NOT NULL,
	[titre] [nvarchar](50) NOT NULL,
	[DescCourte] [nvarchar](150) NOT NULL,
	[DescLong] [ntext] NOT NULL,
	[NombrePerson] [int] NOT NULL,
	[Pays] [int] NOT NULL,
	[Ville] [nvarchar](50) NOT NULL,
	[Rue] [nvarchar](50) NOT NULL,
	[Numero] [nvarchar](5) NOT NULL,
	[CodePostal] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[AssuranceObligatoire] [bit] NOT NULL,
	[isEnabled] [bit] NOT NULL,
	[DisabledDate] [date] NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
	[idMembre] [int] NOT NULL,
	[DateCreation] [date] NOT NULL,
 CONSTRAINT [PK_BienEchange] PRIMARY KEY CLUSTERED 
(
	[idBien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vue_CinqDernierBiens]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vue_CinqDernierBiens]
AS
SELECT     TOP (5) idBien, titre, DescCourte, DescLong, NombrePerson, Pays, Ville, Rue, Numero, CodePostal, Photo, AssuranceObligatoire, isEnabled, DisabledDate, Latitude, Longitude, idMembre, 
                      DateCreation
FROM         dbo.BienEchange
ORDER BY DateCreation DESC
GO
/****** Object:  View [dbo].[Vue_BiensParPays]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vue_BiensParPays]
AS
SELECT     TOP (100) PERCENT idBien, titre, DescCourte, DescLong, NombrePerson, Pays, Ville, Rue, Numero, CodePostal, Photo, AssuranceObligatoire, isEnabled, DisabledDate, Latitude, Longitude, 
                      idMembre, DateCreation
FROM         dbo.BienEchange
ORDER BY Pays
GO
/****** Object:  Table [dbo].[AvisMembreBien]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvisMembreBien](
	[idAvis] [int] IDENTITY(1,1) NOT NULL,
	[note] [int] NOT NULL,
	[message] [ntext] NOT NULL,
	[idMembre] [int] NOT NULL,
	[idBien] [int] NOT NULL,
	[DateAvis] [datetime] NOT NULL,
	[Approuve] [bit] NOT NULL,
 CONSTRAINT [PK_AvisMembreBien] PRIMARY KEY CLUSTERED 
(
	[idAvis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vue_MeilleursAvis]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vue_MeilleursAvis]
AS
SELECT     TOP (100) PERCENT dbo.BienEchange.idBien, dbo.BienEchange.titre, dbo.BienEchange.DescCourte, dbo.BienEchange.DescLong, dbo.BienEchange.NombrePerson, dbo.BienEchange.Pays, 
                      dbo.BienEchange.Ville, dbo.BienEchange.Rue, dbo.BienEchange.Numero, dbo.BienEchange.CodePostal, dbo.BienEchange.Photo, dbo.BienEchange.AssuranceObligatoire, 
                      dbo.BienEchange.isEnabled, dbo.BienEchange.DisabledDate, dbo.BienEchange.Latitude, dbo.BienEchange.Longitude, dbo.BienEchange.idMembre, dbo.BienEchange.DateCreation
FROM         dbo.AvisMembreBien INNER JOIN
                      dbo.BienEchange ON dbo.AvisMembreBien.idBien = dbo.BienEchange.idBien
WHERE     (dbo.AvisMembreBien.note > 6)
ORDER BY dbo.AvisMembreBien.note DESC
GO
/****** Object:  Table [dbo].[Membre]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membre](
	[idMembre] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](50) NOT NULL,
	[Prenom] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Pays] [int] NOT NULL,
	[Telephone] [nvarchar](20) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](600) NOT NULL,
	[Salt] [nvarchar](250) NULL,
	[Photo] [varchar](250) NULL,
 CONSTRAINT [PK_membre] PRIMARY KEY CLUSTERED 
(
	[idMembre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembreBienEchange]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembreBienEchange](
	[idMembre] [int] NOT NULL,
	[idBien] [int] NOT NULL,
	[DateDebEchange] [date] NOT NULL,
	[DateFinEchange] [date] NOT NULL,
	[Assurance] [bit] NULL,
	[Valide] [bit] NOT NULL,
 CONSTRAINT [PK_MembreBienEchange] PRIMARY KEY CLUSTERED 
(
	[idMembre] ASC,
	[idBien] ASC,
	[DateDebEchange] ASC,
	[DateFinEchange] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[idOption] [int] IDENTITY(1,1) NOT NULL,
	[Libelle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[idOption] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OptionsBien]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OptionsBien](
	[idOption] [int] NOT NULL,
	[idBien] [int] NOT NULL,
	[Valeur] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OptionsBien] PRIMARY KEY CLUSTERED 
(
	[idOption] ASC,
	[idBien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pays]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pays](
	[idPays] [int] IDENTITY(1,1) NOT NULL,
	[Libelle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pays] PRIMARY KEY CLUSTERED 
(
	[idPays] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AvisMembreBien] ON 

INSERT [dbo].[AvisMembreBien] ([idAvis], [note], [message], [idMembre], [idBien], [DateAvis], [Approuve]) VALUES (2, 4, N'Beaucoup trop humide', 1, 2, CAST(N'2015-03-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AvisMembreBien] ([idAvis], [note], [message], [idMembre], [idBien], [DateAvis], [Approuve]) VALUES (4, 10, N'Quel merveille', 4, 3, CAST(N'2015-03-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AvisMembreBien] ([idAvis], [note], [message], [idMembre], [idBien], [DateAvis], [Approuve]) VALUES (5, 1, N'Vraiment n''importe quoi ce bien', 1, 2, CAST(N'2015-03-06T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[AvisMembreBien] ([idAvis], [note], [message], [idMembre], [idBien], [DateAvis], [Approuve]) VALUES (7, 8, N'It is manific', 5, 7, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AvisMembreBien] ([idAvis], [note], [message], [idMembre], [idBien], [DateAvis], [Approuve]) VALUES (8, 7, N'Wonderful', 9, 8, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AvisMembreBien] ([idAvis], [note], [message], [idMembre], [idBien], [DateAvis], [Approuve]) VALUES (9, 9, N'Perfect', 11, 10, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AvisMembreBien] ([idAvis], [note], [message], [idMembre], [idBien], [DateAvis], [Approuve]) VALUES (10, 7, N'it is comfortable', 4, 11, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AvisMembreBien] ([idAvis], [note], [message], [idMembre], [idBien], [DateAvis], [Approuve]) VALUES (11, 8, N'Wow', 5, 16, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AvisMembreBien] OFF
GO
SET IDENTITY_INSERT [dbo].[BienEchange] ON 

INSERT [dbo].[BienEchange] ([idBien], [titre], [DescCourte], [DescLong], [NombrePerson], [Pays], [Ville], [Rue], [Numero], [CodePostal], [Photo], [AssuranceObligatoire], [isEnabled], [DisabledDate], [Latitude], [Longitude], [idMembre], [DateCreation]) VALUES (2, N'Un peu Humide', N'Petite maison sous-marine tout confort et zen', N'Maison tout confort située au large de Miami. <br /> Possibilité de venir avec votre animal de compagnie si celui-ci adore les longs séjours dans l''eau ou si il est naturellement amphibie. Pas de piscine mais une magnifique serre contenant algues et anémones.', 6, 6, N'Miami', N'UnderStreet', N'8', N'123456', N'16.jpg', 0, 1, NULL, N'25.774', N'36.874', 1, CAST(N'2015-03-06' AS Date))
INSERT [dbo].[BienEchange] ([idBien], [titre], [DescCourte], [DescLong], [NombrePerson], [Pays], [Ville], [Rue], [Numero], [CodePostal], [Photo], [AssuranceObligatoire], [isEnabled], [DisabledDate], [Latitude], [Longitude], [idMembre], [DateCreation]) VALUES (3, N'Vue imprenable', N'Maison perchée sur la falaise offrant une vue imprenable.', N'Vivre comme un aigle et respirer l''air pur.<br > Cette maison est un petit paradis perché offran lt confort moderne.', 2, 7, N'Colorado Sping', N'RockNRoll', N'10', N'784521', N'8.jpg', 1, 1, NULL, N'36.159420', N'-112.202579', 11, CAST(N'2015-03-06' AS Date))
INSERT [dbo].[BienEchange] ([idBien], [titre], [DescCourte], [DescLong], [NombrePerson], [Pays], [Ville], [Rue], [Numero], [CodePostal], [Photo], [AssuranceObligatoire], [isEnabled], [DisabledDate], [Latitude], [Longitude], [idMembre], [DateCreation]) VALUES (7, N'BELVILLA', N'This countryside holiday home is in the Herveld region.', N'It is surrounded by forests and you can take cycling and hiking trips in the region. You can visit the old city centre of Nijmegen which is only a 20 minute drive away.

There is a relaxing private jacuzzi in the bedroom and a heated swimming pool that is shared. Right beside the living room, you will find the the fitness room. The terrace behind the house has a fruit orchard with cherries, apples and raspberries.

The nearest airport to Guelders is Weeze Airport and it is at a distance of 90 KM.

The home owner lives on the same property and some of the amenities are shared.

Please note, babies up to 1 year are welcome. Above this age we cannot guarantee safety.
', 8, 4, N'Amsterdam', N'Hugo', N'78B', N'1278', N'7.jpg', 1, 1, NULL, N'48.365010', N'32.572025', 5, CAST(N'2017-09-12' AS Date))
INSERT [dbo].[BienEchange] ([idBien], [titre], [DescCourte], [DescLong], [NombrePerson], [Pays], [Ville], [Rue], [Numero], [CodePostal], [Photo], [AssuranceObligatoire], [isEnabled], [DisabledDate], [Latitude], [Longitude], [idMembre], [DateCreation]) VALUES (8, N'Romantic cottage sauna', N'This cosy cottage has 1 bedroom and houses 2 people.', N'The home has a steam shower and provides bicycles.

The Goes railway station is 12 km away. The Antwerp international airport is 70 km from here.

Layout: Ground floor: (Kitchen(cooker(ceramic), coffee machine(pads), combination microwave, dishwasher), Living/diningroom(TV(flatscreen), dining table(2 persons), seating area, CD player, stereo unit), bathroom(bath tub, steam shower, sauna), garden(private), bicycle storage, garden furniture(2 persons), BBQ(gas), parasol)

On the 1st floor: (bedroom(double bed(twin duvet)), sanitary facility(washbasin, toilet, bidet))

bicycles available', 6, 1, N'Ghent', N'Merlo', N'75', N'1100', N'19.jpg', 0, 0, NULL, N'49.244861', N'4.780043', 4, CAST(N'2021-03-18' AS Date))
INSERT [dbo].[BienEchange] ([idBien], [titre], [DescCourte], [DescLong], [NombrePerson], [Pays], [Ville], [Rue], [Numero], [CodePostal], [Photo], [AssuranceObligatoire], [isEnabled], [DisabledDate], [Latitude], [Longitude], [idMembre], [DateCreation]) VALUES (10, N'Spacious Holiday Home', N'This countryside holiday home is in the Herveld region', N'It is surrounded by forests and you can take cycling and hiking trips in the region. You can visit the old city centre of Nijmegen which is only a 20 minute drive away.

There is a relaxing private jacuzzi in the bedroom and a heated swimming pool that is shared. Right beside the living room, you will find the the fitness room. The terrace behind the house has a fruit orchard with cherries, apples and raspberries.

The nearest airport to Guelders is Weeze Airport and it is at a distance of 90 KM.

The home owner lives on the same property and some of the amenities are shared.

Please note, babies up to 1 year are welcome. Above this age we cannot guarantee safety.', 4, 5, N'Luxemburg', N'Nanna', N'89', N'6706', N'20.jpg', 1, 1, NULL, N'50.244395', N'10.825174', 9, CAST(N'2021-03-18' AS Date))
INSERT [dbo].[BienEchange] ([idBien], [titre], [DescCourte], [DescLong], [NombrePerson], [Pays], [Ville], [Rue], [Numero], [CodePostal], [Photo], [AssuranceObligatoire], [isEnabled], [DisabledDate], [Latitude], [Longitude], [idMembre], [DateCreation]) VALUES (11, N'A beautiful estate', N'This holiday home is situated in a beautiful estate in Bruges', N'You can enjoy cycling or walking or visit the attractions like Loppem Castle, Zedelgem''s historic monuments, and old villages. You can also explore the historic cities of Bruges, Ghent, Antwerp or Brussels. Sylvies Lodge is a worth a visit. Sea is at 25 km. Supermarket (500 m) and restaurants (1 km) are also nearby.

The house has a warm atmosphere inside with the comfortable electric heating. The open kitchen has all modern amenities like combination microwave, dish washer and fridge-freezer. You can enjoy the beautiful nature relaxing on the terrace with and chit chatting with the family. There is also a barbecue to have a comfy evening and a garden to enjoy the beautiful greenery. You can use the cot and high chair and park on the premises.

Public transport is at 500 m.', 8, 1, N'Brugge', N'Lapin', N'90', N'2278', N'6.jpg', 0, 1, NULL, N'50.914118', N'15.222640', 4, CAST(N'2021-03-18' AS Date))
INSERT [dbo].[BienEchange] ([idBien], [titre], [DescCourte], [DescLong], [NombrePerson], [Pays], [Ville], [Rue], [Numero], [CodePostal], [Photo], [AssuranceObligatoire], [isEnabled], [DisabledDate], [Latitude], [Longitude], [idMembre], [DateCreation]) VALUES (14, N'Elegant Holiday Home ', N'This luxurious 3-bedroom holiday home is in Koksijde', N'This luxurious 3-bedroom holiday home is in Koksijde, resting near the Belgian coast. It is ideal for families or groups and can accommodate 5 guests. This holiday home has an infrared sauna that offers a perfect relaxing holiday.

The forest lies 1 km from the home. The town centre is 2 km from the stay. The local grocery store and restaurants are 2 km from the property.

A childrens bedroom with single bed is available for the little ones. A kitchen with cooker, dishwasher and a refrigerator is there for you to use. You can bring 1 pet for an additional cost of  2/night. There is a garage to park your vehicle.

The nearest airport is 30 km away.

The check in timing are 4-8 PM and check out can be done between 9- 10 AM.', 3, 1, N'Koksijde', N'Vert', N'12', N'5678', N'11.jpg', 0, 1, NULL, N'52.332654', N'6.427709', 11, CAST(N'2021-03-18' AS Date))
INSERT [dbo].[BienEchange] ([idBien], [titre], [DescCourte], [DescLong], [NombrePerson], [Pays], [Ville], [Rue], [Numero], [CodePostal], [Photo], [AssuranceObligatoire], [isEnabled], [DisabledDate], [Latitude], [Longitude], [idMembre], [DateCreation]) VALUES (15, N'Luxurious 3-bedroom', N'The forest lies 1 km from the home and near the station', N'This luxurious 3-bedroom holiday home is in Koksijde, resting near the Belgian coast. It is ideal for families or groups and can accommodate 5 guests. This holiday home has an infrared sauna that offers a perfect relaxing holiday.

The forest lies 1 km from the home. The town centre is 2 km from the stay. The local grocery store and restaurants are 2 km from the property.

A childrens bedroom with single bed is available for the little ones. A kitchen with cooker, dishwasher and a refrigerator is there for you to use. You can bring 1 pet for an additional cost of  2/night. There is a garage to park your vehicle.

The nearest airport is 30 km away.

The check in timing are 4-8 PM and check out can be done between 9- 10 AM.', 6, 2, N'Genk', N'Lala', N'75', N'8890', N'9.jpg', 0, 1, NULL, N'52.332654', N'9.945681', 1, CAST(N'2021-03-18' AS Date))
INSERT [dbo].[BienEchange] ([idBien], [titre], [DescCourte], [DescLong], [NombrePerson], [Pays], [Ville], [Rue], [Numero], [CodePostal], [Photo], [AssuranceObligatoire], [isEnabled], [DisabledDate], [Latitude], [Longitude], [idMembre], [DateCreation]) VALUES (16, N'A bright sea-zen-house', N'The house itself has a rustic charm and peaceful', N'The space
The house itself has a rustic charm to it. It is not newly built. I have re-decorated it in a modern, zen and bright way, all whilst keeping in mind the traditional character. The apartment bathrooms are tidy and clean, but not brand new. There is a bit of a steep staircase to the apartment.

Guest access
There is a private hall way and entering door for the guests

Other things to note
There are 2 lovely dogs in our house but you won’t hear or see them unless you want to', 5, 2, N'Wenduine', N'Kikuk', N'67', N'9087', N'10.jpg', 0, 1, NULL, N'50.356677', N'5.548215', 5, CAST(N'2021-03-18' AS Date))
INSERT [dbo].[BienEchange] ([idBien], [titre], [DescCourte], [DescLong], [NombrePerson], [Pays], [Ville], [Rue], [Numero], [CodePostal], [Photo], [AssuranceObligatoire], [isEnabled], [DisabledDate], [Latitude], [Longitude], [idMembre], [DateCreation]) VALUES (17, N'Villa Pascale', N'Situated on a farm dating from the 16th century', N'
Contact host
Sleeping arrangements
Bedroom 1
2 single beds
Bedroom 2
1 double bed
Common spaces
2 sofa beds
Amenities
TV
Cable TV
Smoke alarm
Wifi
Kitchen
Hangers
Dedicated workspace
Private entrance
Indoor fireplace
Unavailable: Carbon monoxide alarmCarbon monoxide alarm
Show all 18 amenities
Select check-in date
Add your travel dates for exact pricing
SuMoTuWeThFrSa
SuMoTuWeThFrSa

Clear dates
', 7, 1, N'Anwept', N'Moeny', N'25', N'2347', N'15.jpg', 1, 1, NULL, N'48.294890', N'5.020520', 5, CAST(N'2021-03-18' AS Date))
SET IDENTITY_INSERT [dbo].[BienEchange] OFF
GO
SET IDENTITY_INSERT [dbo].[Membre] ON 

INSERT [dbo].[Membre] ([idMembre], [Nom], [Prenom], [Email], [Pays], [Telephone], [Login], [Password], [Salt], [Photo]) VALUES (1, N'Pink', N'Panther', N'pink@panther.com', 7, N'555-456325', N'Pink', N'4pc/0bGINkzA6SNmYU8TNwPCMoumLjla27lXQFEhVox1i763aBYuW7OmJqlrapqx2uFMlSNtKd38tJ+orENAPgNwzuRdaibgHrru|75', N'P4dSm47rfi+TCfExsr98ws9sFIWM', NULL)
INSERT [dbo].[Membre] ([idMembre], [Nom], [Prenom], [Email], [Pays], [Telephone], [Login], [Password], [Salt], [Photo]) VALUES (3, N'Admin', N'Admin', N'admin@HomeShare.be', 1, N'4562325214', N'Admin', N'7cMk4bJlN1ziaWMKbwvBj3aXMPDVwsaHTg87ydUAx8tFw4Wylg6WQfPUYJxyrT8v9jw1V6r7IWrKIFyUj7Rk7SbYbVxjSJ5YaKhSnZUKknkT6AE=|83', N'7cMk4bJlN1ziaWMKbwvBj3aXMPDVwsaHTg87ydUAx8tFw4Wylg6WQfPUYJxyrT8v9jw1V6r7IWrKIFyUj7Rk7SbYbVxjSJ5YaKhSnZUKknkT6AE=|83', NULL)
INSERT [dbo].[Membre] ([idMembre], [Nom], [Prenom], [Email], [Pays], [Telephone], [Login], [Password], [Salt], [Photo]) VALUES (4, N'Dolphin', N'Flipper', N'dolphin.Flip@sea.us', 6, N'0000000000', N'Dol', N'GQAWkQE2J7Cih/ibLGUkdQ5m/7pZfbMT6B+o7FX/FcDBoj16Ra+PCehc8D3RRUyf2fl6RiqDZjkZjd403iYhcyf43XX1H5lMtim0WJiP690++DdSgnh58d7pyptBHV3kaZJ0|99', N'GQAWkQE2J7Cih/ibLGUkdQ5m/7pZfbMT6B+o7FX/FcDBoj16Ra+PCehc8D3RRUyf2fl6RiqDZjkZjd403iYhcyf43XX1H5lMtim0WJiP690++DdSgnh58d7pyptBHV3kaZJ0|99', NULL)
INSERT [dbo].[Membre] ([idMembre], [Nom], [Prenom], [Email], [Pays], [Telephone], [Login], [Password], [Salt], [Photo]) VALUES (5, N'Person', N'Mike', N'michael.person@cognitic.be', 1, N'5890134598', N'Mike', N'oiKRWaahczNlzsuNNSo0FwRF|18', N'2HCVcpXDxh1d7wFtog/IREinoRw=', N'mike.png')
INSERT [dbo].[Membre] ([idMembre], [Nom], [Prenom], [Email], [Pays], [Telephone], [Login], [Password], [Salt], [Photo]) VALUES (9, N'Nguyen', N'Marie', N'marie@gmail.com', 2, N'031483374334', N'marie_ng', N'MhLPeKEUGtqB6QBIQhCugQxjUdHx8xyoQ40ed2e6dCU=|32', N'piidMq0ydTkJzr8g2KmCLywxh7r/A+TuUYdg5rUpS6ohf6vipWoDfx/Ctgc=', N'76.jpg')
INSERT [dbo].[Membre] ([idMembre], [Nom], [Prenom], [Email], [Pays], [Telephone], [Login], [Password], [Salt], [Photo]) VALUES (11, N'Nguyen', N'Thao', N'thaobube@gmail.com', 1, N'0483374334', N'thaobube', N'vhpTSF1o6xY+nA==|10', N'Nq4NrW+NzrVwhO4kfBr+DhMXA6Nfgwvv6XdZF89y9KjrBXs86MJz', NULL)
SET IDENTITY_INSERT [dbo].[Membre] OFF
GO
SET IDENTITY_INSERT [dbo].[Options] ON 

INSERT [dbo].[Options] ([idOption], [Libelle]) VALUES (1, N'Chien admis')
INSERT [dbo].[Options] ([idOption], [Libelle]) VALUES (2, N'Lave Linge')
INSERT [dbo].[Options] ([idOption], [Libelle]) VALUES (3, N'Lave vaisselle')
INSERT [dbo].[Options] ([idOption], [Libelle]) VALUES (4, N'Wifi')
INSERT [dbo].[Options] ([idOption], [Libelle]) VALUES (5, N'Parking')
INSERT [dbo].[Options] ([idOption], [Libelle]) VALUES (6, N'Piscine')
INSERT [dbo].[Options] ([idOption], [Libelle]) VALUES (7, N'Feu ouvert')
INSERT [dbo].[Options] ([idOption], [Libelle]) VALUES (8, N'Lit enfant')
INSERT [dbo].[Options] ([idOption], [Libelle]) VALUES (9, N'WC')
INSERT [dbo].[Options] ([idOption], [Libelle]) VALUES (10, N'Salle de bain')
SET IDENTITY_INSERT [dbo].[Options] OFF
GO
INSERT [dbo].[OptionsBien] ([idOption], [idBien], [Valeur]) VALUES (1, 2, N'Oui')
INSERT [dbo].[OptionsBien] ([idOption], [idBien], [Valeur]) VALUES (1, 3, N'Non')
INSERT [dbo].[OptionsBien] ([idOption], [idBien], [Valeur]) VALUES (2, 2, N'Non')
INSERT [dbo].[OptionsBien] ([idOption], [idBien], [Valeur]) VALUES (3, 3, N'Non')
INSERT [dbo].[OptionsBien] ([idOption], [idBien], [Valeur]) VALUES (4, 2, N'Oui')
INSERT [dbo].[OptionsBien] ([idOption], [idBien], [Valeur]) VALUES (6, 2, N'Oui')
INSERT [dbo].[OptionsBien] ([idOption], [idBien], [Valeur]) VALUES (8, 3, N'1')
INSERT [dbo].[OptionsBien] ([idOption], [idBien], [Valeur]) VALUES (9, 2, N'1')
INSERT [dbo].[OptionsBien] ([idOption], [idBien], [Valeur]) VALUES (10, 2, N'5')
GO
SET IDENTITY_INSERT [dbo].[Pays] ON 

INSERT [dbo].[Pays] ([idPays], [Libelle]) VALUES (1, N'Belgique')
INSERT [dbo].[Pays] ([idPays], [Libelle]) VALUES (2, N'France')
INSERT [dbo].[Pays] ([idPays], [Libelle]) VALUES (3, N'Italie')
INSERT [dbo].[Pays] ([idPays], [Libelle]) VALUES (4, N'Pays-Bas')
INSERT [dbo].[Pays] ([idPays], [Libelle]) VALUES (5, N'Luxembourg')
INSERT [dbo].[Pays] ([idPays], [Libelle]) VALUES (6, N'Austalie')
INSERT [dbo].[Pays] ([idPays], [Libelle]) VALUES (7, N'USA')
INSERT [dbo].[Pays] ([idPays], [Libelle]) VALUES (8, N'Anglettere')
INSERT [dbo].[Pays] ([idPays], [Libelle]) VALUES (9, N'Espagne')
INSERT [dbo].[Pays] ([idPays], [Libelle]) VALUES (10, N'Portugal')
INSERT [dbo].[Pays] ([idPays], [Libelle]) VALUES (11, N'Islande')
SET IDENTITY_INSERT [dbo].[Pays] OFF
GO
ALTER TABLE [dbo].[AvisMembreBien] ADD  CONSTRAINT [DF_AvisMembreBien_Approuve]  DEFAULT ((0)) FOR [Approuve]
GO
ALTER TABLE [dbo].[BienEchange] ADD  CONSTRAINT [DF_BienEchange_Pays]  DEFAULT ((1)) FOR [Pays]
GO
ALTER TABLE [dbo].[BienEchange] ADD  CONSTRAINT [DF_BienEchange_AssuranceObligatoire]  DEFAULT ((0)) FOR [AssuranceObligatoire]
GO
ALTER TABLE [dbo].[BienEchange] ADD  CONSTRAINT [DF_BienEchange_isEnabled]  DEFAULT ((0)) FOR [isEnabled]
GO
ALTER TABLE [dbo].[BienEchange] ADD  CONSTRAINT [DF_BienEchange_DateCreation]  DEFAULT (getdate()) FOR [DateCreation]
GO
ALTER TABLE [dbo].[MembreBienEchange] ADD  CONSTRAINT [DF_MembreBienEchange_Valide]  DEFAULT ((0)) FOR [Valide]
GO
ALTER TABLE [dbo].[AvisMembreBien]  WITH CHECK ADD  CONSTRAINT [FK_AvisMembreBien_BienEchange] FOREIGN KEY([idBien])
REFERENCES [dbo].[BienEchange] ([idBien])
GO
ALTER TABLE [dbo].[AvisMembreBien] CHECK CONSTRAINT [FK_AvisMembreBien_BienEchange]
GO
ALTER TABLE [dbo].[AvisMembreBien]  WITH CHECK ADD  CONSTRAINT [FK_AvisMembreBien_membre] FOREIGN KEY([idMembre])
REFERENCES [dbo].[Membre] ([idMembre])
GO
ALTER TABLE [dbo].[AvisMembreBien] CHECK CONSTRAINT [FK_AvisMembreBien_membre]
GO
ALTER TABLE [dbo].[BienEchange]  WITH CHECK ADD  CONSTRAINT [FK_BienEchange_membre] FOREIGN KEY([idMembre])
REFERENCES [dbo].[Membre] ([idMembre])
GO
ALTER TABLE [dbo].[BienEchange] CHECK CONSTRAINT [FK_BienEchange_membre]
GO
ALTER TABLE [dbo].[BienEchange]  WITH CHECK ADD  CONSTRAINT [FK_BienEchange_Pays] FOREIGN KEY([Pays])
REFERENCES [dbo].[Pays] ([idPays])
GO
ALTER TABLE [dbo].[BienEchange] CHECK CONSTRAINT [FK_BienEchange_Pays]
GO
ALTER TABLE [dbo].[MembreBienEchange]  WITH CHECK ADD  CONSTRAINT [FK_MembreBienEchange_BienEchange] FOREIGN KEY([idBien])
REFERENCES [dbo].[BienEchange] ([idBien])
GO
ALTER TABLE [dbo].[MembreBienEchange] CHECK CONSTRAINT [FK_MembreBienEchange_BienEchange]
GO
ALTER TABLE [dbo].[MembreBienEchange]  WITH CHECK ADD  CONSTRAINT [FK_MembreBienEchange_membre] FOREIGN KEY([idMembre])
REFERENCES [dbo].[Membre] ([idMembre])
GO
ALTER TABLE [dbo].[MembreBienEchange] CHECK CONSTRAINT [FK_MembreBienEchange_membre]
GO
ALTER TABLE [dbo].[OptionsBien]  WITH CHECK ADD  CONSTRAINT [FK_OptionsBien_BienEchange] FOREIGN KEY([idBien])
REFERENCES [dbo].[BienEchange] ([idBien])
GO
ALTER TABLE [dbo].[OptionsBien] CHECK CONSTRAINT [FK_OptionsBien_BienEchange]
GO
ALTER TABLE [dbo].[OptionsBien]  WITH CHECK ADD  CONSTRAINT [FK_OptionsBien_Options] FOREIGN KEY([idOption])
REFERENCES [dbo].[Options] ([idOption])
GO
ALTER TABLE [dbo].[OptionsBien] CHECK CONSTRAINT [FK_OptionsBien_Options]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFeaturedBien]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetFeaturedBien]
	@number int
AS
BEGIN
	DECLARE @skip int
	DECLARE @count int
	SELECT @count = COUNT(*) FROM [BienEchange]
	SET @skip = RAND() * (@count - @number +1) 
EXECUTE
('SELECT * 
FROM [BienEchange]
ORDER BY [idBien]
OFFSET ' + @skip + ' ROWS
FETCH NEXT ' + @number + ' ROWS ONLY')
END


/*
ignore @skip rows then get @number next rows
for example: there are total 20 rows, skip 5 first rows then take 10 next row (from 6-15)
Notes: @skip need to be <= total rows - @number rows
For example: @skip = 5; @number = 10; count(*) = 20
=> 0=< @skip < 11 => @skip = RAND()*11 = RAND()* ((20-10) +1) 
=> @skip = RAND() * (@count - @number +1)
*/
GO
/****** Object:  StoredProcedure [dbo].[sp_RecupBienDispo]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Cognitic 
-- Create date: 28/02/2015
-- Description:	Récupérer les biens disponible entre deux dates
-- =============================================
Create PROCEDURE [dbo].[sp_RecupBienDispo]
	@DateDeb date,
	@DateFin date
AS
BEGIN
	SELECT     *
FROM         BienEchange
where idBien not in (select idBien from MembreBienEchange where 
(@DateDeb >=DateDebEchange and DateFinEchange >= @DateDeb)
or
(DateFinEchange>=@DateFin and DateDebEchange<= @DateFin )
or 
(@DateDeb<=DateDebEchange and DateFinEchange>= @DateFin)
)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RecupBienMembre]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Cognitic 
-- Create date: 28/02/2015
-- Description:	Récupérer les biens d'un membre
-- =============================================
CREATE PROCEDURE [dbo].[sp_RecupBienMembre] 
	@idMembre int
AS
BEGIN
	select * from BienEchange
	where idMembre = @idMembre
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RecupToutesInfosBien]    Script Date: 3/19/2021 4:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Cognitic 
-- Create date: 28/02/2015
-- Description:	Récupérer les infos complètes d'un bien à partir de son id
-- =============================================
CREATE PROCEDURE [dbo].[sp_RecupToutesInfosBien] 
	@idBien int
AS
BEGIN
SELECT     *
FROM        BienEchange  left JOIN
                      AvisMembreBien ON AvisMembreBien.idBien = BienEchange.idBien left JOIN
                      Membre ON AvisMembreBien.idMembre = Membre.idMembre AND BienEchange.idMembre = Membre.idMembre left JOIN
                      MembreBienEchange ON BienEchange.idBien = MembreBienEchange.idBien AND Membre.idMembre = MembreBienEchange.idMembre left JOIN
                      OptionsBien ON BienEchange.idBien = OptionsBien.idBien left JOIN
                      Options ON OptionsBien.idOption = Options.idOption left JOIN
                      Pays ON BienEchange.Pays = Pays.idPays
                      where BienEchange.idBien=@idBien
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BienEchange"
            Begin Extent = 
               Top = 6
               Left = 248
               Bottom = 247
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_BiensParPays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_BiensParPays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BienEchange"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 269
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_CinqDernierBiens'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_CinqDernierBiens'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AvisMembreBien"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 219
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BienEchange"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 126
               Right = 427
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_MeilleursAvis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vue_MeilleursAvis'
GO
USE [master]
GO
ALTER DATABASE [HomeShareDBASP] SET  READ_WRITE 
GO
