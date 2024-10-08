USE [master]
GO
/****** Object:  Database [ProjectTraceDb]    Script Date: 26.08.2024 13:39:11 ******/
CREATE DATABASE [ProjectTraceDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectTraceDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectTraceDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectTraceDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectTraceDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectTraceDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectTraceDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectTraceDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProjectTraceDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectTraceDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectTraceDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProjectTraceDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectTraceDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ProjectTraceDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectTraceDb] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectTraceDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectTraceDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectTraceDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectTraceDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectTraceDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectTraceDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProjectTraceDb] SET QUERY_STORE = OFF
GO
USE [ProjectTraceDb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 26.08.2024 13:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelInfos]    Script Date: 26.08.2024 13:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelInfos](
	[PersonelInfoId] [int] IDENTITY(1,1) NOT NULL,
	[EMail] [nvarchar](max) NULL,
	[Password] [nvarchar](25) NULL,
	[Authority] [nvarchar](15) NULL,
	[NameSurname] [nvarchar](50) NULL,
	[TCNO] [nvarchar](15) NULL,
	[Department] [nvarchar](25) NULL,
	[Assignment] [nvarchar](25) NULL,
	[PositionDescription] [nvarchar](max) NULL,
	[PersonelTelNo] [nvarchar](15) NULL,
	[PersonelAddress] [nvarchar](max) NULL,
	[MaritialStatus] [nvarchar](15) NULL,
	[YakinBilgisi] [nvarchar](15) NULL,
	[YakinTC] [nvarchar](15) NULL,
	[YakinTelNo] [nvarchar](15) NULL,
	[BirthDate] [datetime] NOT NULL,
	[FirstDayAtWork] [datetime] NOT NULL,
	[PersonelPhoto] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PersonelInfos] PRIMARY KEY CLUSTERED 
(
	[PersonelInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelProjects]    Script Date: 26.08.2024 13:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelProjects](
	[PersonelProjeId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectHeader] [nvarchar](150) NULL,
	[ProjectDescription] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[PriorityStatus] [nvarchar](25) NULL,
	[CompletionPercentage] [int] NOT NULL,
	[CompletionDate] [datetime] NULL,
	[IsCompleted] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PersonelProjects] PRIMARY KEY CLUSTERED 
(
	[PersonelProjeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonelProjectsPersonelInfos]    Script Date: 26.08.2024 13:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonelProjectsPersonelInfos](
	[PersonelProjects_PersonelProjeId] [int] NOT NULL,
	[PersonelInfos_PersonelInfoId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.PersonelProjectsPersonelInfos] PRIMARY KEY CLUSTERED 
(
	[PersonelProjects_PersonelProjeId] ASC,
	[PersonelInfos_PersonelInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202408191402206_AutomaticMigration', N'ProjeTakip.Migrations.Configuration', 0x1F8B0800000000000400E55BDB6EE336107D2FD07F10F4D416592BC9628136B0B7489CA435BAB92076B6EDD3829168875D8972492AB551F4CBFAD04FEA2F74284BB22852173A727681224062F37266381CCE7066987FFFFE67F8FD2A0A9D27CC3889E9C83D1A1CBA0EA67E1C10BA18B98998BFFAD6FDFEED975F0C2F8268E5BCCFC7BD96E36026E523F75188E589E771FF1147880F22E2B398C77331F0E3C84341EC1D1F1E7EE71D1D7918205CC0729CE15D42058970FA05BE8E63EAE3A5485078150738E4593BF44C5354E71A45982F918F47EE2D8B7FC333F4912C07E9E0C139120800045E09D7390D09029EA6389CBB0EA234164800C727F71C4F058BE962BA840614CED64B0CE3E628E4385BC9C97678D7451D1ECB4579DB8939949F701147968047AF332979D5E93BC9DA2DA40872BC00798BB55C752A4B10236C654C7138A1F398BB4E95E2C9386472B441DEF9CC810271E06C071E148A02FA247F0E9C71128A84E111C589602884D1C94348FC9FF07A167FC4744493302C330C2C439FD2004D4062899958DFE1B9611993C0753C15C3AB82141035F3376B9E50F1FAD875AE8129F410E2424F4AF2998A98E11F30C50C091CDC222130836D9E043895B4C64985EEC51522614E0E34138E9BEB5CA1D53B4C17E271E4C247D7B9242B1CE42D190BF794C0E984498225B88DCA2DE2FC8F98050D848EDFF440E734118F314B975D4BE8A80F42F2F7346114FE34907A73D803A9D9F8FA66DFCB39C74BC444042AB3F71DE29C2CE84B50BA8D399127E41C739F91E5C67CED5BCFB3533CC3E175BCEF4DCB899D0601C39CEF7D7157084E16B8AC29589EA4895C2FABFB150C383D23E18270F222B466E39721F312AA7146987884FB48619CE4E71991C64AF325CD48978471718ED6A7E2E7987DB487BB464F64917AAA1AED4DBDB52FA4FEDEE1301DC91FC97273751A54477D507C3DCCB9647174178706C0CAD00F33C416585A9DB8DBF8699C30BFB2A0A1B7BDBF74BAD5E4E076179BCDA419837BA626814F7CBF49893FE7825300BCD40D2713DC8F180598351EBC3EBC7546ED259DCE98E15450BD9CF75B46D20B54AB91EFC5478FE36819E2D43A60386C54A0056ED38CAE88667134CF9EF06C3E2E14F42C066B81680F962E3759FB3573B9D9EA6AE672B3D8C5CCC1E52DF649CA7C8D9DAB32AE8AE882068EE52A36EA6792116823D83AB204EB06AC8EDC6FB41DE94EAEF00D3AB92C2E6DA435F44A92D1FD824C0A2002F64BB511A97D3F3F2B52069A87B8E73873123C3B4ED5F549F42916E6507ABB87E62569D232A36DE55D0BB81D52C12C89A51E5853F6D2AC8EE7A3EABFEC15AD58BD69E1DEEEF8B96619F0CDDBE0A932339CCA429DB6D9296F939ECAD3585E4D1E6B7885964B30E4A5BC56D6E24C3749ADF1ABA97D8E27DA60783E37A47A0A6E0B4AE0CEC1CC577AA5E50E7076DB14E801490B3B0E226D98F9F0D4A8724ED3743EF43DCDB53B9F253F974E6C4DAE6FD008BB15F125AC5AC6BDA90070AD3E68F3D3E4230A116BC9188DE3308968976C54136A960F2A83654DDD31B6D91E85A7A2B53B52299F53862A3577C75252366534A5A33BDE262F5306DAB4744728675DCA38E5760B5995322B8AB04AED167B68CA9E28DB691A6081AF664A4CCA9B75D963160911136AD1D91DB79AF828C356FBBAA3AA098E32A6DA638928D3181A986CB4C5D137A6DCDE1DAD948B2883959ABB6355B31165C06A9F8E3AF42AA6B8EA023CCD07547C73D5B158B99DE23ED1BBE7A943B6703EF5106DA7AD08E84DA7AD265DD088ABC6EB0AAADA658D596FCC0CFDDDD1D500BC8CABF6D8F0AB46E12AAF6A9F059FC6685BE1D73862170A065954FABAA32A51791952E978F9F3AEDED49B0FBD16E4EC78C4359CB603DD76E90D5AF2B23501932EEC671A8932A95AAB2177A460F8F96BC98233CBB5B45DB8553276CBA8867FBADE6951607548A1F545345889FA865904D6FEC4410BC936435C99827E22810CC7A66B2E7094AAEC60FA7B380E497AD1CC075C214AE6988B4DF2D93D3E3C3AAEBC8DF87CDE29789C07A1CD6385CFE6990091226F4D935B6652959701F40931FF11B1AF22B4FABA0CB54BF53F07D3F2C976B05AB1DF887B648D6BA8ED1B9165BDC00EB95CCAEF8959BD72DF9774B5427D4FC00D75F9E76999A9F6DE9394B5E0B1077ECDE5F49E183655CFFB84DE16CB7B45DDC3D669A5F0003E8BFE4AE11DE176AF1C7F46C5DABDF819637DB666F3AD2D6E7D39F65967D75472DD59AFCC25D79EAC6D538535DDCE5EEAABA6B577E1CE506F7D206D4CED7C947ABBBD59042CCD57C0B650C1F2A41A592AEDB556619CD000AF46EE9F29D88933F9E5431BDE8173C3E09C9E3887CE5FF69ADEB8F4DD1835615930D95BA9DB181837140AAD6ADB475AE07E03F727796E9C537F132F8D11F7C182EA1A042C74E5A952996C60B032B2AD120FDA8F99F40F2884B8950B0691AB968D013B487DB244619DC4F438DDDAF549811474AA3D7097C654BAB14EE2B1E6A66386A3E0A2B28F6D32AC7D8460AFCAA6BC88416DEAD5C4A816FF6B25B6D799FAE4D12750E0AE79ADDE95D7FC82467F2B505389D9ED65CC26CD05D79A07198D6C7C4765C83E1ECF3491AD7D62D346B9EBD26BC677E1A95934BBBC012A9EE5583F05AAC94F373AE2BEDEFE1845DD2129DFFD09D0AEE2CC5F21D98BD39C22AF77065DDF397D62415ABCA5D2B3E560CE4AFF3608565766CA0A08F94F8414FB8A212BC6483E732B5BE1281F524D13618120BC42A74C9039F20574FB98F3F439EE7B142632531B3DE060426F12B14C042C19470FA1F23446DAE526FAE9833195E7E14D1A2DF33E96006C121921DED0B3848441C1F7A5E13A5E03210D7E9673907B2964EE61B12E90AE4107BA0165E22BFCD40C43FC0960FC864ED113DE85B77B8EDFE105F2D779D1A31EA47D2354B10FCF095A3014F10C633B1FBE820E07D1EAED7F908BB7653D3B0000, N'6.5.1')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202408201329556_AutomaticMigration', N'ProjeTakip.Migrations.Configuration', 0x1F8B0800000000000400E55BDB6EDC36107D2FD07F10F4D416CECAEB20406BECA6B0D7766B34BEC0BB4EDBA78096E85D3612B52529D746D12FEB433FA9BFD0A16E2B8AD4856BAD13A00890D8247566381C0E3987937FFFFE67F2FD63143A0F987112D3A93B1EEDBB0EA67E1C10BA9CBA89B87FF5ADFBFDDB2FBF989C06D1A3F3BE18F75A8E832F299FBA2B21D6879EC7FD158E101F45C467318FEFC5C88F230F05B177B0BFFF9D371E7B18205CC0729CC94D42058970FA0BFC3A8BA98FD72241E1451CE090E7EDD0334F519D4B1461BE463E9EBAD72CFE0D2FD047B21EA583472748200010F851B8CE514810E834C7E1BDEB204A638104687C78CBF15CB0982EE76B6840E1E2698D61DC3D0A39CE6772B819DE7752FB077252DEE6C302CA4FB888234BC0F1EBDC4A5EFDF3AD6CED9656043B9E82BDC5939C756A4B30232C654C71784EEF63EE3A758987B390C9D1067B175F8E14883D673370AF7414F027F967CF9925A148189E529C088642189DDC85C4FF093F2DE28F984E69128655854165E8531AA00944AC31134F37F8DE308DF3C0753C15C3AB8394100DDF67733EA7E2F581EB5C8252E82EC4A59F54EC331731C33F608A191238B846426006CB7C1EE0D4D29A2635B9A71788848538F04CD86EAE73811EDF61BA14ABA90B3FBACE1979C441D192AB704B09EC4EF848B0047749B9469CFF11B3A045D0C19B01E41C256215B374DA8D82C64308927FCF1346E19F16516FF687B05DEE19D7AB58C43B5FA9C5ECF26AD7C63BC16BC444040EBA737FE09C2CE94B48BA8E3991FBF104739F9175162C77BDAB72CF58E0F0B2CD330659B442D8511030CCF9CE277781601FC30139873897B4891B6476BFC271418F49B8249CBC88ACC5EC65C4BC846B1C13265670FB2943A1FC79416468D44EAE76A433C2B838414F47E2E7987DB487BB440F64999E8B4D4154DE0D7C21FDF70687E948BE22EBECA236AA8FFAA0DC2CE09B33164737716800AC0DFDB0406C8965D489FB8D9FC709F36B139A789BDB52AF3B54016E778DCA3E5A30B8D56A16F8C4B7A954F873AE5325C04BDDA772C3FD88518059EBC61BE46E90497BC94367C6706AA841F6FB3523E975AD33C80F7246CFE2681DE2343A60D86C54A025EEF28CBE886673B47F7DCEF3EF71E9A0C731440B4407887445C8DA6D982BC256DF305784C53E610E2E6FB14F52E51BE25C5D71D544A734702C6791B99FC946E08D10EBC81AA21BA83A75BFD156A4BFB8F26CD0C5E55970ABAC8957B18C7E2E480A0211885F6A8C48E3FBC97149506827C42DC7F921C1F3ED549F9F449F63614EDC376B689E92662D33DAC6DE8D809B2135CC8A599A813567AF7CD5737FD4CF2F7B472B676F9AB8B73D7EE159067CF33278AACD0CBBB274A70D17E6656458419A790DACD9E402ADD710C82B2C5ADEE2CC330A6DF66A6ECF28451986E77303B1546A5B4A82E31CC27CAD5746EE00E7B74D81EE908CB0B320D28699374F832B17324DFB435FD3C2BB8BAFE4CF951DDBC02C8E5A6137263E8359CBBC3735006EF407EDFB94EA4421621DFCD42C0E9388F6E1BEDA5073F6A90A9637F5C7D8704B8A4E656B7FA40A7B5485AA34F7C75208A22A9AD261314B950532993FEFEA8F99713D55A8ACA53F4295C9A9E254DB2DEC5F616B9405A8B45B58CCC4C82876330DB05F913CC536AD48DE658F59922C26D4B2B33F6E9D4CA9C2D6FBFAA3AAA4491553EDB14494D48806261B6D71F485A9B6F747ABF01B55B04A737FAC3AC35105ACF7E9A813AF16DEEBC78AA79D2BB5F3BE7E58591D65E51D65F0D3AC09D9E2406B86E88CA90549608CAA660AA21557E5001454B5CB1AB3399819FAFBA3AB497D1557EDB1D157CDEC555DD53E0B3D8D19BCA2AF71C436120CB6A8F5F5475532FD2AA4D2F1F2FB5DBDFDB76F7A2D71DA728B6B385D1BBAEB221D7470BD0D49986EEC670689AAA8C6A82157A454F8F973C9133ECBB9745DE2553176D3A8A794BADF6999657D48E9F5658659CB24277956D75DA4A1A579D91057D2DA0F249029DEFC890B1CA52E3B9AFF1ECE42925E348B011788927BCC454668BB07FBE3835A75C7E75369E1711E8436E5169F4DA1039126EFA4DE2DD959A5B6813E20E6AF10FB2A428F5F57A1B6A95F28C0348EDA0E562B5730E28EAD710DD5094664F9066169085331C2B34C5B2D381868FA7A7DC150EBA595130C04DC523DF03CBF3555080C64652D1D1D405FF3A3FF400A9BDEF88784DE3CE90F8ABA83A5D31EEC03F8590CF760DF136EFBF7EDCFE84979272797F115B961F1ED6378E3A3F1B3F6AEE961786BBF323F0C0F146DDBDE81D3E51CE415D834F73EDA195E85EF4897525B6FA5C1EE83162950FBA5B22BF9B0DCA946952A6BADBD839ED3003F4EDD3F53B043E7FC970F5D787BCE15837D7AE8EC3B7FD97B7AEBD4B753D48465A1E4600FF2C654BBE539D3EA057EAC510157707F92FBC639F2B30C6C86B80F1154F72050A1AF4EB5F7D316056B23BBEA05C0FB3193E7030A2113E682412EACF13B1007A94FD6286CB2989EF95B1F7DD220A59C7A0FDCA53195C7582FF3586BD3933329B5A8AD63970D1B4B25EC5DD9C4B418DCA6D94D8C6EF1BF76627B9F69A6A33E8103F765CA06775E739D8F5ED1D0F0B6B35DFD4E469CC1B5E64E6623D9D9511BB28B129F36B18D85405D92FB4EBD617C1F9DDA4DB34DA552593C645DB0D4C078B71EC4435528194DDD83E6EF5FA8B4AD398B5A297B739A49F7E6C3A06F35D62736A445C597CEBF4338ABFC574A88BA92292B21E47FACA4D85702593946EA5944D99A46C5903A4D840582F40A1D3141EE912FA0DBC79CA745C3EF519848EE37BAC3C139BD4AC43A1130651CDD854A018F8CCB6DF2D3B23655E7C9559A2DF321A6006A1299215ED1E3848441A9F799E13ADE0021037ECE39C8B514927B583E954897E003FD8072F395E7D40243FE0960FC8ACED103DE46B75B8EDFE125F29F8A67946690EE8550CD3E392168C950C4738CCDF7F02BF870103DBEFD0F95F1EAA0513C0000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[PersonelInfos] ON 

INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (1, N'ahmet@hotmail.com', N'12345', N'Management', N'Ahmet Tekin', N'12345568998', N'Software', N'Software Team Leader', N'description data', N'05554443333', N'istanbul', N'Single', N'x', N'x', N'x', CAST(N'1999-02-09T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), N'https://i.hizliresim.com/aoqagg8.jpg')
INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (3, N'sevil@deneme.com', N'3344444', N'TopManagement', N'Sevil Kalaycı', N'12233456666', N'Quality', N'Quality Responsible', N'test', N'05332222111', N'izmir', N'single', N'x', N'x', N'x', CAST(N'2024-08-23T16:26:00.000' AS DateTime), CAST(N'2024-08-05T16:26:00.000' AS DateTime), N'https://i.hizliresim.com/5bd4fqi.jpg')
INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (4, N'denizkaya@hotmail.com', N'4444444', N'Logistics', N'Deniz Kaya', N'333344444444', N'Logistics', N'store personel', N'test12', N'05332222122', N'izmir', N'Married', N'xx', N'xx', N'xx', CAST(N'1994-11-06T06:56:00.000' AS DateTime), CAST(N'2024-08-01T16:56:00.000' AS DateTime), N'https://i.hizliresim.com/d9h7xc7.jpg')
INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (5, N'elifb@gmail.com', N'ee', N'Management', N'Elif Balcı', N'12345568994', N'HR', N'HR Management', N'testtest', N'05552223311', N'istanbul', N'Single', N'Ali Balcı', N'111111111111', N'05523124411', CAST(N'1988-09-12T08:00:00.000' AS DateTime), CAST(N'2022-08-21T17:56:00.000' AS DateTime), N'https://i.hizliresim.com/mr6ynpz.jpg')
INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (6, N'anil@gmail.com', N'2222222222', N'Management', N'Anıl Yazıcı', N'11111111112222', N'Software', N'Backend Developer', N'test', N'05552223328', N'istanbul', N'Single', N'Aras Yazıcı', N'11111111111111', N'05523124435', CAST(N'2001-01-02T08:00:00.000' AS DateTime), CAST(N'2019-10-30T08:00:00.000' AS DateTime), N'https://i.hizliresim.com/ft4ucsm.jfif')
INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (7, N'atinckayhan@gmail.com', N'111111', N'Choose', N'Atınç Kayhan', N'22222222223333', N'Purchasing', N'Choose', N'desc acc', N'05572223344', NULL, N'Choose', N'xx', N'xx', N'xx', CAST(N'1996-07-01T21:54:00.000' AS DateTime), CAST(N'2024-03-14T19:54:00.000' AS DateTime), N'https://i.hizliresim.com/9tp9ebz.jpg')
INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (8, N't.philips@outlook.com.us', N'233333333', N'Management', N'Terrence Philips', N'33333333', N'Sales', N'Human Resources Personel', N'descc', N'9999999999999', N'Houston,Texas,USA', N'Choose', N'xx', N'xx', N'xx', CAST(N'1997-08-13T17:59:00.000' AS DateTime), CAST(N'2024-02-09T09:00:00.000' AS DateTime), N'https://i.hizliresim.com/deg25be.jpg')
INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (9, N'nesligunduz@hotmail.com', N'4444444', N'Top Management', N'Neslihan Gündüz', N'66666666666666', N'Accounting', N'Accounting Personel', N'test12', N'05533332224', N'Ankara', N'Married', N'xx', N'xx', N'xx', CAST(N'2024-07-04T17:07:00.000' AS DateTime), CAST(N'2024-08-30T17:07:00.000' AS DateTime), N'https://i.hizliresim.com/c78le0h.jfif')
INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (10, N'akolcu@gmail.com', N'222222', N'Choose', N'Asuman Kolcu', N'44444444444555', N'Software', N'IT Specialist', N'desc', N'5554446677', N'İzmir', N'Married', N'xx', N'xx', N'xx', CAST(N'2024-08-02T17:08:00.000' AS DateTime), CAST(N'2024-08-11T17:08:00.000' AS DateTime), N'https://i.hizliresim.com/dejee96.jfif')
INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (11, N'akayra@hotmail.com', N'111111', N'Top Management', N'Avni Kayra', N'2222222222211', N'Management', N'CEO', N'test', N'05552223311', N'istanbul', N'Choose', N'xx', N'xx', N'xx', CAST(N'1977-01-03T08:00:00.000' AS DateTime), CAST(N'2005-01-01T08:00:00.000' AS DateTime), N'https://i.hizliresim.com/gvfhsie.jpg')
INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (12, N'eneskatipoglu@gmail.com', N'1111111', N'Top Management', N'Enes Katipoğlu', N'233311234142', N'Management', N'Deputy General Manager', N'description data', NULL, N'Ankara', N'Choose', N'x', N'x', N'x', CAST(N'1989-04-09T08:00:00.000' AS DateTime), CAST(N'2013-09-12T08:00:00.000' AS DateTime), N'https://i.hizliresim.com/zipbcof.jpg')
INSERT [dbo].[PersonelInfos] ([PersonelInfoId], [EMail], [Password], [Authority], [NameSurname], [TCNO], [Department], [Assignment], [PositionDescription], [PersonelTelNo], [PersonelAddress], [MaritialStatus], [YakinBilgisi], [YakinTC], [YakinTelNo], [BirthDate], [FirstDayAtWork], [PersonelPhoto]) VALUES (13, N'ygonul@outlook.com', N'3222222223', N'Top Management', N'Yeliz Gönül', N'34444444444422', N'Management', N'General Manager', N'xx', N'05551122212', N'İzmir', N'Married', N'xx', N'xx', N'xx', CAST(N'1988-06-09T08:00:00.000' AS DateTime), CAST(N'2012-03-10T08:00:00.000' AS DateTime), N'https://i.hizliresim.com/gftl195.jpg')
SET IDENTITY_INSERT [dbo].[PersonelInfos] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonelProjects] ON 

INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (1, N'Java', N'test', CAST(N'2024-08-21T11:40:27.733' AS DateTime), N'Mid-priority', 61, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (2, N'.NET', N'text1', CAST(N'2024-08-21T13:14:00.337' AS DateTime), N'High priority', 100, NULL, 1)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (3, N'Phyton', N'test2', CAST(N'2024-08-21T13:14:41.060' AS DateTime), N'Low priority', 85, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (4, N'Database', N'test3', CAST(N'2024-08-21T16:10:55.343' AS DateTime), N'Mid-priority', 100, NULL, 1)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (5, N'Machine maintenance', N'weekly maintenance', CAST(N'2024-08-21T16:20:57.513' AS DateTime), N'Low priority', 33, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (6, N'Documentation software', N'test', CAST(N'2024-08-21T16:21:35.540' AS DateTime), N'High priority', 54, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (7, N'Education and Support', N'montly event', CAST(N'2024-08-21T16:22:09.573' AS DateTime), N'High priority', 100, NULL, 1)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (8, N'Customer Relation Management', N'test3', CAST(N'2024-08-21T16:22:44.207' AS DateTime), N'Low priority', 100, NULL, 1)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (9, N'Field work', N'text1', CAST(N'2024-08-21T16:23:16.667' AS DateTime), N'Mid-priority', 91, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (10, N'Effective Presentation', N'test', CAST(N'2024-08-21T16:23:59.077' AS DateTime), N'High priority', 30, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (11, N'Product Development', N'product', CAST(N'2024-08-21T16:27:49.037' AS DateTime), N'Low priority', 31, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (12, N'Advertisement', N'Producing advertisement ideas and meeting with advertisers', CAST(N'2024-08-22T09:39:41.783' AS DateTime), N'Mid-priority', 58, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (13, N'Supply Chain Management', N'text', CAST(N'2024-08-22T09:40:36.673' AS DateTime), N'High priority', 0, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (14, N'Enterprise Resource Planning', N'test', CAST(N'2024-08-22T09:41:45.297' AS DateTime), N'Mid-priority', 25, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (15, N'Internal audit ', N'test', CAST(N'2024-08-22T09:43:49.537' AS DateTime), N'High priority', 85, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (16, N'Recruitment', N'test', CAST(N'2024-08-22T09:44:44.370' AS DateTime), N'Mid-priority', 31, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (17, N'Public-relations campaign ', N'deneme', CAST(N'2024-08-22T09:47:06.913' AS DateTime), N'Mid-priority', 81, NULL, 0)
INSERT [dbo].[PersonelProjects] ([PersonelProjeId], [ProjectHeader], [ProjectDescription], [CreationDate], [PriorityStatus], [CompletionPercentage], [CompletionDate], [IsCompleted]) VALUES (18, N'Budget allocation ', N'te', CAST(N'2024-08-22T09:49:01.250' AS DateTime), N'High priority', 100, NULL, 1)
SET IDENTITY_INSERT [dbo].[PersonelProjects] OFF
GO
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (1, 1)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (2, 1)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (3, 1)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (4, 1)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (5, 1)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (7, 1)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (11, 1)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (13, 1)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (2, 3)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (3, 3)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (4, 3)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (7, 3)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (8, 3)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (11, 3)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (17, 3)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (4, 4)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (5, 4)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (8, 4)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (9, 4)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (6, 5)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (16, 5)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (2, 6)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (6, 6)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (10, 6)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (14, 6)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (12, 7)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (14, 7)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (18, 7)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (13, 8)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (12, 9)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (15, 9)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (16, 9)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (17, 9)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (12, 10)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (15, 10)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (16, 10)
INSERT [dbo].[PersonelProjectsPersonelInfos] ([PersonelProjects_PersonelProjeId], [PersonelInfos_PersonelInfoId]) VALUES (18, 10)
GO
/****** Object:  Index [IX_PersonelInfos_PersonelInfoId]    Script Date: 26.08.2024 13:39:11 ******/
CREATE NONCLUSTERED INDEX [IX_PersonelInfos_PersonelInfoId] ON [dbo].[PersonelProjectsPersonelInfos]
(
	[PersonelInfos_PersonelInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PersonelProjects_PersonelProjeId]    Script Date: 26.08.2024 13:39:11 ******/
CREATE NONCLUSTERED INDEX [IX_PersonelProjects_PersonelProjeId] ON [dbo].[PersonelProjectsPersonelInfos]
(
	[PersonelProjects_PersonelProjeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PersonelProjectsPersonelInfos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PersonelProjectsPersonelInfos_dbo.PersonelInfos_PersonelInfos_PersonelInfoId] FOREIGN KEY([PersonelInfos_PersonelInfoId])
REFERENCES [dbo].[PersonelInfos] ([PersonelInfoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonelProjectsPersonelInfos] CHECK CONSTRAINT [FK_dbo.PersonelProjectsPersonelInfos_dbo.PersonelInfos_PersonelInfos_PersonelInfoId]
GO
ALTER TABLE [dbo].[PersonelProjectsPersonelInfos]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PersonelProjectsPersonelInfos_dbo.PersonelProjects_PersonelProjects_PersonelProjeId] FOREIGN KEY([PersonelProjects_PersonelProjeId])
REFERENCES [dbo].[PersonelProjects] ([PersonelProjeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonelProjectsPersonelInfos] CHECK CONSTRAINT [FK_dbo.PersonelProjectsPersonelInfos_dbo.PersonelProjects_PersonelProjects_PersonelProjeId]
GO
USE [master]
GO
ALTER DATABASE [ProjectTraceDb] SET  READ_WRITE 
GO
