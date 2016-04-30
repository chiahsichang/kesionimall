/****** Object:  Table [dbo].[KS_ProComment]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [varchar](50) NULL,
	[ProID] [int] NULL,
	[UserName] [varchar](50) NULL,
	[UserID] [int] NULL,
	[UserIP] [varchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Content] [text] NULL,
	[StarNum] [int] NULL,
	[CmtType] [tinyint] NULL,
	[Support] [int] NULL,
	[CmtNum] [int] NULL,
	[BuyDate] [datetime] NULL,
	[ProAttr] [varchar](255) NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_KS_ProComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_BlogMessage]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogMessage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [varchar](255) NULL,
	[SenderId] [int] NULL,
	[UserId] [varchar](255) NULL,
	[Title] [varchar](500) NULL,
	[Message] [text] NULL,
	[AddDate] [datetime] NULL,
	[Flag] [tinyint] NULL,
	[ReplayDate] [datetime] NULL,
	[Replay] [text] NULL,
 CONSTRAINT [PK_KS_BLOGMESSAGE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProCouponUser]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProCouponUser](
	[CouponUserID] [int] IDENTITY(1,1) NOT NULL,
	[CouponId] [int] NULL,
	[CouponNum] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[OrderID] [nvarchar](50) NULL,
	[UseTime] [datetime] NULL,
	[UseFlag] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[MailTF] [tinyint] NULL,
	[AvailableMoney] [money] NULL,
	[Note] [nvarchar](1000) NULL,
 CONSTRAINT [PK_KS_ProCouponUser] PRIMARY KEY CLUSTERED 
(
	[CouponUserID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_BlogInfo]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogInfo](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserName] [varchar](255) NULL,
	[TypeID] [int] NULL,
	[ClassID] [int] NULL,
	[Title] [varchar](255) NULL,
	[Tags] [varchar](255) NULL,
	[Contents] [text] NULL,
	[PassWord] [varchar](255) NULL,
	[Hit] [int] NULL,
	[AddDate] [datetime] NULL,
	[Face] [int] NULL,
	[Weather] [varchar](255) NULL,
	[Status] [tinyint] NULL,
	[Best] [tinyint] NULL,
	[Hot] [tinyint] NULL,
	[TopList] [tinyint] NULL,
	[TotalPut] [int] NULL,
	[PhotoUrl] [varchar](255) NULL,
	[SinaWeiboID] [varchar](255) NULL,
	[AffixFile] [varchar](255) NULL,
 CONSTRAINT [PK_KS_BLOGINFO] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetProFromLimitBuy]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProGetProFromLimitBuy] 
@NUM INT=0,
@TaskID INT=0
AS
 DECLARE @SQL Nvarchar(2200)
 Set @SQL='SELECT  top '+Cast(@num as varchar(20))+'  I.Title,I.LinkUrl,i.DefaultPic,I.Price_market,I.Price_member,I.Price,I.LimitBuyPrice,I.LimitBuyAmount,I.Unit,L.LimitBuyBeginTime,L.LimitBuyEndTime,L.TaskType FROM KS_ProductList I Inner Join KS_ProLimitBuy L ON I.LimitBuyTaskID=L.Taskid Where L.Status=1 and L.taskid='+Cast(@TaskID as varchar(20))+' Order BY I.InfoID Desc'
 Exec (@SQL)
GO
/****** Object:  Table [dbo].[KS_ProLimitBuy]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProLimitBuy](
	[taskid] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](255) NOT NULL,
	[TaskType] [int] NULL,
	[LimitBuyBeginTime] [datetime] NULL,
	[LimitBuyEndTime] [datetime] NULL,
	[LimitBuyPayTime] [int] NULL,
	[Intro] [ntext] NULL,
	[Status] [tinyint] NULL,
	[AddDate] [smalldatetime] NULL,
	[TemplateFile] [nvarchar](255) NULL,
	[Recommend] [tinyint] NULL,
	[PhotoUrl] [varchar](255) NULL,
	[JGRange] [varchar](255) NULL,
 CONSTRAINT [PK_KS_ProLimitBuy] PRIMARY KEY CLUSTERED 
(
	[taskid] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_BlogComment]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogComment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LogID] [int] NULL,
	[Title] [varchar](255) NULL,
	[Content] [text] NULL,
	[UserID] [int] NULL,
	[UserName] [varchar](255) NULL,
	[AnounID] [int] NULL,
	[AnounName] [varchar](255) NULL,
	[AddTime] [datetime] NULL,
	[HomePage] [varchar](255) NULL,
	[Replay] [text] NULL,
	[ReplayDate] [datetime] NULL,
	[Flag] [tinyint] NULL,
	[Ext] [varchar](255) NULL,
 CONSTRAINT [PK_KS_BLOGCOMMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_UserRechargeCard]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserRechargeCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RechargeWay] [tinyint] NULL,
	[AddWay] [tinyint] NULL,
        [Cardnumber] [varchar](200) NULL,
	[password] [varchar](200) NULL,
	[Name] [varchar](250) NULL,
	[FaceValue] [money] NULL,
	[PointNumber] [int] NULL,
	[PointType] [int] NULL,
	[UseDate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[IsSell] [tinyint] NULL,
	[IsUse] [tinyint] NULL,
	[Users] [varchar](100) NULL,
	[RechargeDate] [datetime] NULL,
	[GroupId] [varchar](100) NULL,
	[UsedGroupId] [int] NULL,
	[EndGroupId] [int] NULL,
	[adddate] [datetime] NULL,
	[Inputer] [varchar](100) NULL,
        [ItemID] [int] default 0,
 CONSTRAINT [PK_KS_UserRechargeCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProImages]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProImages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[PhotoUrl] [nvarchar](255) NULL,
	[BigPhoto] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_KS_ProImages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_BlogClassify]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogClassify](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_KS_BLOGCLASSIFY] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProGroupPrice]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProGroupPrice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[GroupID] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_KS_ProGroupPrice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_BlogClass]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[OrderID] [int] NOT NULL,
	[IsDefault] [tinyint] NULL,
 CONSTRAINT [PK_KS_BLOGCLASS] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProGroupBuyClass]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProGroupBuyClass](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[className] [nvarchar](50) NOT NULL,
	[rootid] [int] NULL,
	[orders] [int] NULL,
	[parentid] [int] NULL,
	[child] [int] NULL,
	[IsLock] [tinyint] NOT NULL,
	[InfoNum] [int] NULL,
 CONSTRAINT [PK_KS_ProGroupBuyClass] PRIMARY KEY CLUSTERED 
(
	[classID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_Blog]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [varchar](50) NULL,
	[BlogName] [varchar](200) NULL,
	[Domain] [varchar](100) NULL,
	[Logo] [varchar](200) NULL,
	[ClassID] [int] NOT NULL,
	[Descript] [text] NULL,
	[Announce] [text] NULL,
	[ContentLen] [int] NOT NULL,
	[ListBlogNum] [int] NOT NULL,
	[ListLogNum] [int] NOT NULL,
	[ListReplayNum] [int] NOT NULL,
	[ListGuestNum] [int] NOT NULL,
	[TemplateID] [int] NULL,
	[AddDate] [datetime] NULL,
	[Best] [tinyint] NULL,
	[TopList] [tinyint] NULL,
	[Hot] [tinyint] NULL,
	[Status] [tinyint] NOT NULL,
	[Hits] [int] NOT NULL,
	[Banner] [varchar](200) NULL,
 CONSTRAINT [PK_KS_BLOG] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProGroupBuy]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProGroupBuy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](255) NULL,
	[PhotoUrl] [nvarchar](200) NULL,
	[BigPhoto] [nvarchar](250) NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[BigClassID] [int] NULL,
	[ClassID] [int] NULL,
	[Intro] [ntext] NULL,
	[Highlights] [ntext] NULL,
	[Protection] [ntext] NULL,
	[Notes] [ntext] NULL,
	[Locked] [tinyint] NULL,
	[EndTF] [tinyint] NULL,
	[AllowBMFlag] [tinyint] NULL,
	[AllowArrGroupID] [nvarchar](200) NULL,
	[minnum] [int] NULL,
	[minnumtime] [datetime] NULL,
	[IsSuccess] [tinyint] NULL,
	[Price_Original] [money] NULL,
	[Price] [money] NULL,
	[Discount] [real] NULL,
	[Weight] [real] NULL,
	[Unit] [varchar](50) NULL,
	[LimitBuyNum] [int] NULL,
	[Recommend] [tinyint] NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[HasSellNum] [int] NULL,
	[RealSellNum] [int] NULL,
	[CleanCart] [tinyint] NULL,
	[ShowDelivery] [tinyint] NULL,
	[ShowPayMent] [tinyint] NULL,
	[Comment] [tinyint] NULL,
	[ChangesUrl] [nvarchar](255) NULL,
	[TemplateID] [nvarchar](255) NULL,
	[MapMarker] [nvarchar](255) NULL,
	[inputer] [varchar](100) NULL,
	[IsBusiness] [tinyint] NULL,
	[FreightType] [tinyint] NULL,
	[Freight] [money] NULL,
	[Amount] [int] NULL,
	[AmountNum] [int] NULL,
	[payId] [int] NULL,
 CONSTRAINT [PK_KS_ProGroupBuy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Author]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Author](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](50) NOT NULL,
	[Sex] [nvarchar](2) NULL,
	[Birthday] [nvarchar](100) NULL,
	[WorkUnits] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Telphone] [nvarchar](50) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NULL,
	[QQ] [nvarchar](15) NULL,
	[HomePage] [nvarchar](100) NULL,
	[Resume] [ntext] NULL,
	[AddDate] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_KS_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGetGDList]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKGetGDList] 
@num int=0,
@pkid int=0,
@role int=1
as
 declare @SQL Nvarchar(3000)
 SET @SQL='select top ' +convert(nvarchar(50),@num) +'  * from [KS_PKGD] Where pkid='+convert(nvarchar(50),@pkid)+' and role='+convert(nvarchar(50),@role)+' Order by id desc'
 Exec (@SQL)
GO
/****** Object:  Table [dbo].[KS_AskZJType]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_AskZJType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](100) NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_KS_AskZJType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProSpecificationPrice]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProSpecificationPrice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemNo] [nvarchar](250) NULL,
	[proid] [int] NULL,
	[attr1] [nvarchar](255) NULL,
	[attr2] [nvarchar](255) NULL,
	[attr3] [nvarchar](255) NULL,
	[price] [money] NULL,
	[amount] [int] NULL,
	[weight] [float] NULL,
	[price_market] [money] NULL,
 CONSTRAINT [PK_KS_ShopSpecificationPrice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_Model]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Model](
	[ChannelID] [int] NOT NULL,
	[ModelType] [tinyint] NULL,
	[ModelName] [nvarchar](50) NOT NULL,
	[ModelTable] [nvarchar](255) NOT NULL,
	[ModelItem] [nvarchar](50) NULL,
	[ModelItemUnit] [nvarchar](50) NULL,
	[ModelStatus] [tinyint] NULL,
	[ModelFolder] [nvarchar](50) NULL,
	[ModelFsoFolder] [nvarchar](255) NULL,
	[FsoListNum] [int] NULL,
	[Intro] [nvarchar](255) NULL,
	[SeoOption] [tinyint] NULL,
	[ChargesOption] [tinyint] NULL,
	[AttributeOption] [tinyint] NULL,
	[ReceiptOption] [tinyint] NULL,
	[PKOption] [tinyint] NULL,
	[FieldsXML] [ntext] NULL,
	[BasicType] [int] NULL,
	[AdminUpFilesTF] [tinyint] NULL,
	[AdminUpFilesDir] [nvarchar](100) NULL,
	[UserUpFilesTF] [int] NULL,
	[UserUpFilesDir] [nvarchar](255) NULL,
	[AllowUpFilesSize] [int] NULL,
	[AllowUpPhotoType] [nvarchar](200) NULL,
	[AllowUpFlashType] [nvarchar](200) NULL,
	[AllowUpMediaType] [nvarchar](200) NULL,
	[AllowUpRealType] [nvarchar](200) NULL,
	[AllowUpOtherType] [nvarchar](200) NULL,
	[AllowPublication] [int] NULL,
	[RecycleBin] [tinyint] NULL,
	[PublicationVerify] [tinyint] NULL,
	[PublicationRefreshHtmlOption] [nvarchar](50) NULL,
	[PublicationModifyVerify] [tinyint] NULL,
	[CommentType] [int] NULL,
	[CommentLen] [int] NULL,
	[NewestDay] [int] NULL,
	[CommentTemplate] [nvarchar](255) NULL,
	[SearchTemplate] [nvarchar](255) NULL,
	[FsoHtmlType] [int] NULL,
	[DiggByVisitor] [tinyint] NULL,
	[DiggRepeat] [tinyint] NULL,
	[DiggPerTimes] [int] NULL,
	[ShowOption] [varchar](255) NULL,
	[SearchTF] [int] NULL,
	[Setting] [text] NULL,
	[ModelOrderId] [int] NULL,
 CONSTRAINT [PK_KS_Model] PRIMARY KEY CLUSTERED 
(
	[ChannelID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_UserPhotos]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserPhotos](
	[PicID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserName] [varchar](255) NULL,
	[TypeID] [int] NULL,
	[ClassID] [int] NULL,
	[Title] [varchar](255) NULL,
	[Tags] [varchar](255) NULL,
	[Content] [text] NULL,
	[Source] [varchar](255) NULL,
	[Author] [varchar](255) NULL,
	[Hit] [int] NULL,
	[AddDate] [datetime] NULL,
	[PhotoUrl] [varchar](255) NULL,
	[PicUrls] [text] NULL,
	[Status] [tinyint] NULL,
	[Fund] [int] NULL,
	[PageSize] [int] NULL,
	[Hot] [tinyint] NULL,
	[TopList] [tinyint] NULL,
	[Best] [tinyint] NULL,
	[Model] [int] NULL,
 CONSTRAINT [PK_KS_USERPHOTOS] PRIMARY KEY CLUSTERED 
(
	[PicID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Message]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectID] [int] NULL,
	[ToUserName] [nvarchar](20) NULL,
	[FromUserName] [nvarchar](50) NULL,
	[MsgTitle] [nvarchar](255) NULL,
	[MsgContactMan] [nvarchar](50) NULL,
	[MsgTel] [nvarchar](50) NULL,
	[MsgMail] [nvarchar](50) NULL,
	[MsgContent] [ntext] NULL,
	[RequestInfo] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
	[Verify] [int] NULL,
	[ReadTF] [int] NULL,
	[DelTf] [tinyint] NULL,
	[PMsgID] [int] NULL,
 CONSTRAINT [PK_KS_B2B_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProOrderLog]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProOrderLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [varchar](50) NULL,
	[Inputer] [varchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Remark] [ntext] NULL,
	[UserName] [varchar](50) NULL,
	[statusCode] [int] NULL,
 CONSTRAINT [PK_KS_ProOrderLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_UserGroup]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserGroup](
	[GroupID] [int] NOT NULL,
	[GroupName] [nvarchar](100) NOT NULL,
	[PowerList] [ntext] NULL,
	[Descript] [ntext] NULL,
	[Type] [int] NULL,
	[ChargeType] [int] NULL,
	[GroupPoint] [int] NULL,
	[ValidDays] [int] NULL,
	[FormID] [int] NULL,
	[IsReg] [int] NULL,
	[SpaceSize] [float] NULL,
	[UpfilesDir] [varchar](255) NULL,
	[Settings] [ntext] NULL,
 CONSTRAINT [PK_KS_UserGroup] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_LogScore]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_LogScore](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[AddDate] [smalldatetime] NULL,
	[IP] [nvarchar](50) NULL,
	[InOrOutFlag] [tinyint] NULL,
	[Score] [int] NULL,
	[NowScore] [int] NULL,
	[AvailableScore] [int] NULL,
	[inputer] [nvarchar](50) NULL,
	[remark] [nvarchar](255) NULL,
	[ChannelID] [int] NULL,
	[infoid] [int] NULL,
 CONSTRAINT [PK_KS_LogScore] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_UserForm]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UserForm](
	[FormID] [int] IDENTITY(1,1) NOT NULL,
	[FormName] [nvarchar](200) NOT NULL,
	[FieldNameList] [ntext] NULL,
	[Template] [ntext] NULL,
	[Note] [ntext] NULL,
 CONSTRAINT [PK_KS_UserForm] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_LogPoint]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_LogPoint](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[ChannelID] [int] NULL,
	[InfoID] [int] NULL,
	[AddDate] [datetime] NULL,
	[IP] [nvarchar](50) NULL,
	[InOrOutFlag] [int] NULL,
	[Point] [money] NULL,
	[NowPoint] [money] NULL,
	[Times] [int] NULL,
	[Inputer] [nvarchar](50) NULL,
	[Remark] [nvarchar](255) NULL,
 CONSTRAINT [PK_KS_LogPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ADClass]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ADClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](255) NULL,
	[Descript] [ntext] NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_KS_ADClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_UserFeeSell]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserFeeSell](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
	[PackID] [int] NOT NULL,
	[PackBeginDate] [datetime] NULL,
	[PackDays] [int] NULL,
	[Limit] [int] NULL,
	[ExamTF] [int] NULL,
	[ContentTF] [int] NULL,
	[ContentClassIds] [text] NULL,
	[ExamClassIds] [text] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_UserFeeSell] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_LogMoney]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_LogMoney](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[ClientName] [nvarchar](100) NULL,
	[Money] [money] NULL,
	[CurrMoney] [money] NULL,
	[ChannelID] [int] NULL,
	[InfoID] [int] NULL,
	[MoneyType] [int] NULL,
	[IncomeOrPayOut] [int] NULL,
	[OrderID] [nvarchar](30) NULL,
	[PaymentID] [int] NULL,
	[Remark] [nvarchar](255) NULL,
	[PayTime] [smalldatetime] NULL,
	[Inputer] [nvarchar](50) NULL,
	[IP] [nvarchar](50) NULL,
	[Times] [int] NULL,
 CONSTRAINT [PK_KS_LogMoney] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_AdminPlan]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_AdminPlan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Content] [ntext] NULL,
	[AddDate] [datetime] NULL,
	[Status] [int] NULL,
	[TipsDays] [int] NULL,
 CONSTRAINT [PK_KS_AdminPlan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_UserFeePackages]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UserFeePackages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[adddate] [datetime] NULL,
	[Descript] [ntext] NULL,
	[flag] [int] NULL,
	[days] [int] NULL,
	[price] [money] NULL,
	[status] [int] NULL,
	[limit] [int] NULL,
	[examtf] [int] NULL,
	[contenttf] [int] NULL,
	[examclassids] [text] NULL,
	[contentclassids] [text] NULL,
 CONSTRAINT [PK_KS_UserFeePackages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_Log]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[ResultTF] [tinyint] NULL,
	[ActionIP] [nvarchar](50) NULL,
	[ActionTime] [datetime] NULL,
	[ScriptName] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_KS_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_UserFeeDiscount]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UserFeeDiscount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[groupid] [int] NOT NULL,
	[discount] [real] NULL,
	[status] [int] NULL,
	[packid] [int] NOT NULL,
 CONSTRAINT [PK_KS_UserFeeDiscount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_LinkClass]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_LinkClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](100) NOT NULL,
	[Description] [ntext] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_LinkClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProInvoice]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProInvoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[InvoiceType] [tinyint] NULL,
	[TitleType] [tinyint] NULL,
	[CompanyName] [nvarchar](255) NULL,
	[NSRSBH] [varchar](100) NULL,
	[Address] [nvarchar](255) NULL,
	[Tel] [varchar](100) NULL,
	[Bank] [nvarchar](100) NULL,
	[BankNum] [varchar](100) NULL,
	[AddDate] [datetime] NULL,
	[IsDefault] [tinyint] NULL,
	[ContactMan] [nvarchar](100) NULL,
	[Mobile] [varchar](100) NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyId] [int] NULL,
	[ContactAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_KS_ProInvoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_UserDepartment]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserDepartment](
	[DepartID] [int] IDENTITY(1,1) NOT NULL,
	[DepartMentName] [nvarchar](100) NULL,
	[DepartMentEname] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[Root] [int] NULL,
	[Depth] [tinyint] NULL,
	[OrderID] [int] NULL,
	[ParentIDPath] [varchar](4000) NULL,
	[Child] [int] NULL,
	[PrevID] [int] NULL,
	[NextID] [int] NULL,
	[ClassDir] [varchar](255) NULL,
	[UserName] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Intro] [ntext] NULL,
	[PhotoUrl] [varchar](255) NULL,
	[AdminPurview] [ntext] NULL,
 CONSTRAINT [PK_KS_UserDepartment] PRIMARY KEY CLUSTERED 
(
	[DepartID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Link]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Link](
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[SiteName] [nvarchar](255) NULL,
	[WebMaster] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Url] [nvarchar](255) NULL,
	[Password] [nvarchar](50) NULL,
	[LinkType] [int] NULL,
	[Logo] [nvarchar](150) NULL,
	[Description] [ntext] NULL,
	[Hits] [int] NULL,
	[Recommend] [int] NULL,
	[AddDate] [datetime] NULL,
	[Locked] [tinyint] NULL,
	[Verify] [int] NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_KS_Link] PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_UserCard]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_UserCard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CardNum] [nvarchar](50) NULL,
	[CardPass] [nvarchar](50) NULL,
	[Money] [money] NULL,
	[ValidNum] [int] NULL,
	[ValidUnit] [int] NULL,
	[AddDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[UseDate] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[IsUsed] [int] NULL,
	[IsSale] [int] NULL,
 CONSTRAINT [PK_KS_UserCard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_LabelClass]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_LabelClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[ParentIDPath] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[OrderID] [tinyint] NULL,
	[ClassType] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[from3g] [int] NULL,
 CONSTRAINT [PK_KS_LabelClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_UserBlogClass]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserBlogClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NULL,
	[ClassName] [varchar](255) NULL,
	[Descript] [varchar](1000) NULL,
	[AddDate] [datetime] NULL,
	[OrderID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_KS_USERBLOGCLASS] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Label]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Label](
	[LabelID] [int] NOT NULL,
	[LabelName] [nvarchar](50) NOT NULL,
	[LabelContent] [ntext] NULL,
	[Description] [ntext] NULL,
	[ClassID] [int] NULL,
	[OrderID] [tinyint] NULL,
	[LabelType] [tinyint] NULL,
	[LabelFlag] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[from3g] [int] NULL,
 CONSTRAINT [PK_KS_Label] PRIMARY KEY CLUSTERED 
(
	[LabelID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_User]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NULL,
	[AskRankId] [int] NULL,
	[DepartId] [int] NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](100) NULL,
	[Question] [nvarchar](50) NULL,
	[Answer] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[RealName] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[IsMobileRZ] [tinyint] NULL,
	[Sex] [nvarchar](50) NULL,
	[Birthday] [nvarchar](50) NULL,
	[IDCard] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[HomePage] [nvarchar](50) NULL,
	[UserFace] [nvarchar](100) NULL,
	[Sign] [ntext] NULL,
	[Privacy] [int] NULL,
	[CheckNum] [nvarchar](50) NULL,
	[RegDate] [datetime] NULL,
	[JoinDate] [datetime] NULL,
	[LastLoginTime] [datetime] NULL,
	[LastLoginIP] [nvarchar](50) NULL,
	[LoginTimes] [int] NULL,
	[ChargeType] [int] NULL,
	[BeginDate] [datetime] NULL,
	[EDays] [int] NULL,
	[Money] [money] NULL,
	[Score] [int] NULL,
	[ScoreHasUse] [int] NULL,
	[Point] [money] NULL,
	[Locked] [int] NULL,
	[RndPassword] [nvarchar](50) NULL,
	[companyname] [nvarchar](255) NULL,
	[zipcode] [nvarchar](255) NULL,
	[interest] [nvarchar](200) NULL,
	[intro] [ntext] NULL,
	[pic] [nvarchar](200) NULL,
	[qqtoken] [nvarchar](50) NULL,
	[qqopenid] [nvarchar](50) NULL,
	[SinaId] [nvarchar](50) NULL,
	[SinaToken] [nvarchar](50) NULL,
	[AlipayID] [nvarchar](50) NULL,
	[IsApi] [tinyint] NULL,
	[ProID] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
 CONSTRAINT [PK_KS_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_KeyTags]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_KeyTags](
	[TagsID] [int] IDENTITY(1,1) NOT NULL,
	[KeyText] [nvarchar](100) NOT NULL,
	[AddDate] [datetime] NULL,
	[TagsHits] [int] NULL,
	[TodayHits] [int] NULL,
	[YesterDayHits] [int] NULL,
	[WeekHits] [int] NULL,
	[LastUseTime] [datetime] NULL,
	[Status] [int] NULL,
	[FirstAlphabet] [varchar](50) NULL,
 CONSTRAINT [PK_KS_KeyTags] PRIMARY KEY CLUSTERED 
(
	[TagsID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProBookCode]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProBookCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodeID] [varchar](150) NULL,
	[CodePass] [varchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[AddDate] [datetime] NULL,
	[UseTime] [datetime] NULL,
	[IsUsed] [tinyint] NULL,
	[TypeID] [int] NULL,
	[CityID] [int] NULL,
	[ProvinceId] [int] NULL,
	[CountyID] [int] NULL,
	[Address] [nvarchar](255) NULL,
	[RealName] [nvarchar](100) NULL,
	[Mobile] [varchar](100) NULL,
	[IsPub] [tinyint] NULL,
	[ZipCode] [varchar](200) NULL,
 CONSTRAINT [PK_KS_ProBookCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProOrder]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[OrderTotalPrice] [money] NULL,
	[GoodsMoney] [money] NULL,
	[Freight] [money] NULL,
	[Taxes] [float] NULL,
	[PayDiscountMoney] [money] NULL,
	[Invoice] [nvarchar](255) NULL,
	[IsInvoice] [tinyint] NULL,
	[Invoiced] [tinyint] NULL,
	[MoneyReceipt] [money] NULL,
	[InputTime] [datetime] NULL,
	[deliveryDate] [nvarchar](100) NULL,
	[SpecifiedDate] [nvarchar](100) NULL,
	[deliveryTime] [nvarchar](100) NULL,
	[Remark] [nvarchar](500) NULL,
	[PaymentID] [int] NULL,
	[DeliverID] [int] NULL,
	[Status] [int] NULL,
	[OrderScore] [int] NULL,
	[ScoreTF] [tinyint] NULL,
	[RealName] [varchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[DeliverStatus] [int] NULL,
	[IsAnonymous] [tinyint] NULL,
	[CouponUserID] [int] NULL,
	[NoUseCouponMoney] [money] NULL,
	[UseCouponMoney] [money] NULL,
	[PayTime] [datetime] NULL,
	[PaymentPlatId] [int] NULL,
	[PayStatus] [int] NULL,
	[alipaytradestatus] [varchar](50) NULL,
	[alipaytradeno] [varchar](50) NULL,
	[OrderType] [tinyint] NULL,
	[SmsNum] [int] NULL,
	[IsTips] [tinyint] NULL,
	[ChangeScore] [int] NULL,
	[VerifyCode] [varchar](50) NULL,
	[IsBusiness] [tinyint] NULL,
	[Business] [varchar](50) NULL,
	[IsBusinessConfirm] [tinyint] NULL,
	[ConsumptionMode] [tinyint] NULL,
	[IsFrontPay] [tinyint] NULL,
	[FrontMoney] [money] NULL,
	[payId] [int] NULL,
	[SaveMoney] [money] NULL,
        [agent] [varchar](255),
 CONSTRAINT [PK_KS_ProOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_AskZJ]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_AskZJ](
	[zjId] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[username] [nvarchar](50) NULL,
	[realname] [nvarchar](50) NULL,
	[birthday] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[UserFace] [nvarchar](255) NULL,
	[Tel] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[ProvinceId] [int] NULL,
	[CityId] [int] NULL,
	[CountyId] [int] NULL,
	[DanWei] [nvarchar](250) NULL,
	[TypeID] [int] NULL,
	[SCFL] [ntext] NULL,
	[Intro] [ntext] NULL,
	[IDCard] [nvarchar](255) NULL,
	[ZYZ] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
	[Verify] [tinyint] NULL,
	[Sex] [nvarchar](50) NULL,
	[Recommend] [tinyint] NULL,
	[AskNum] [int] NULL,
	[BestNum] [int] NULL,
	[ClassID] [int] NULL,
	[istop] [int] NULL,
 CONSTRAINT [PK_KS_AskZJ] PRIMARY KEY CLUSTERED 
(
	[zjId] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProBidding]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProBidding](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[Money] [int] NULL,
	[BeginDate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[Bail] [money] NULL,
	[Num] [int] NULL,
	[ExtendTime] [int] NULL,
	[HightMoney] [money] NULL,
	[Times] [int] NULL,
	[HightUserName] [varchar](100) NULL,
	[IsEnd] [int] NULL,
 CONSTRAINT [PK_KS_ProBidding] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[KS_ProLimitBuyDel]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProLimitBuyDel] 
@ids varchar(1000)
AS
 if (@ids<>'')
  begin
  declare @sql nvarchar(4000)
  set @sql='delete from [KS_ProLimitBuy] Where TaskID in('+@ids+')'
  exec (@sql)
  set @sql='delete from [KS_UploadFiles] Where channelid=100002 and infoid in('+@ids+')'
  exec(@sql)
  set @sql='update [KS_ProductList] Set IsLimitBuy=0,LimitBuyTaskID=0,LimitBuyPrice=0,LimitBuyAmount=0 Where LimitBuyTaskID in('+@ids+')'
  exec (@sql)
 end
GO
/****** Object:  Table [dbo].[KS_ProLogInvoice]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProLogInvoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[ClientName] [nvarchar](50) NULL,
	[Inputer] [nvarchar](50) NULL,
	[InvoiceType] [nvarchar](100) NULL,
	[InvoiceNum] [nvarchar](50) NULL,
	[InvoiceTitle] [nvarchar](50) NULL,
	[InvoiceContent] [ntext] NULL,
	[InvoiceDate] [datetime] NULL,
	[MoneyTotal] [money] NULL,
	[HandlerName] [nvarchar](50) NULL,
	[InputTime] [datetime] NULL,
 CONSTRAINT [PK_KS_ProLogInvoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_AskTopic]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_AskTopic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[classid] [int] NULL,
	[UserId] [int] NULL,
	[titleFontColor] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[UserIP] [varchar](50) NULL,
	[title] [nvarchar](255) NOT NULL,
	[Content] [ntext] NULL,
	[PostTable] [nvarchar](30) NULL,
	[AddDate] [datetime] NULL,
	[LastPostTime] [datetime] NULL,
	[SolveTime] [datetime] NULL,
	[verify] [tinyint] NULL,
	[IsSolve] [tinyint] NULL,
	[IsTop] [tinyint] NULL,
	[Reward] [int] NULL,
	[Hits] [int] NULL,
	[PostNum] [int] NULL,
	[Recommend] [tinyint] NULL,
	[AskUserID] [int] NULL,
	[BestUserName] [nvarchar](50) NULL,
	[SEOTitle] [varchar](255) NULL,
	[SEOKeyWords] [varchar](255) NULL,
	[SEODescription] [varchar](255) NULL,
	[KeyTags] [varchar](255) NULL,
 CONSTRAINT [PK_KS_AskTopic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[KS_GetDocInputerList]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_GetDocInputerList] AS
select inputer from KS_InfoList Group By Inputer
GO
/****** Object:  Table [dbo].[KS_ProLogDeliver]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProLogDeliver](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NULL,
	[ClientName] [nvarchar](100) NULL,
	[UserName] [nvarchar](50) NULL,
	[Inputer] [nvarchar](50) NULL,
	[HandlerName] [nvarchar](50) NULL,
	[DeliverDate] [datetime] NULL,
	[DeliverType] [tinyint] NULL,
	[ExpressCorpId] [nvarchar](50) NULL,
	[ExpressNumber] [nvarchar](50) NULL,
	[Remark] [nvarchar](255) NULL,
	[Status] [tinyint] NULL,
	[MoneyReturnType] [tinyint] NULL,
	[MoneyReturnBankCard] [varchar](100) NULL,
	[MoneyReturnBankName] [varchar](150) NULL,
	[MoneyReturnCardName] [varchar](100) NULL,
	[HandlerDate] [datetime] NULL,
	[HandlerStatus] [tinyint] NULL,
 CONSTRAINT [PK_KS_ProLogDeliver] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_AskTable]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_AskTable](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NULL,
	[TableName] [varchar](100) NULL,
	[IsDefault] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[IsSys] [tinyint] NULL,
 CONSTRAINT [PK_KS_AskPostTable] PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProShoppingCart]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProShoppingCart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[Price] [money] NULL,
	[Num] [int] NULL,
	[AddDate] [datetime] NULL,
	[UserName] [nvarchar](50) NULL,
	[IsAnonymous] [tinyint] NULL,
	[IsChangeBuy] [tinyint] NULL,
	[IsBundleSale] [tinyint] NULL,
	[IsLimitBuy] [tinyint] NULL,
	[LimitBuyTaskID] [int] NULL,
	[AttrID] [int] NULL,
	[flag] [int] NULL,
	[CityID] [int] NULL,
	[BookCode] [varchar](100) NULL,
 CONSTRAINT [PK_KS_ProShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_AskRank]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_AskRank](
	[RankID] [int] IDENTITY(1,1) NOT NULL,
	[RankName] [nvarchar](50) NULL,
	[IsSys] [tinyint] NULL,
	[Score] [int] NULL,
	[Ico] [nvarchar](50) NULL,
	[QueNum] [int] NULL,
	[AnsNum] [int] NULL,
	[color] [nvarchar](30) NULL,
 CONSTRAINT [PK_KS_AskGrade] PRIMARY KEY CLUSTERED 
(
	[RankID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_UploadFiles]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UploadFiles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NULL,
	[InfoID] [int] NULL,
	[FileName] [varchar](255) NOT NULL,
	[DTimes] [int] NULL,
	[DSize] [int] NULL,
	[AliasName] [varchar](255) NULL,
	[isAffix] [tinyint] NULL,
	[UserName] [varchar](100) NULL,
 CONSTRAINT [PK_KS_UploadFiles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_JSFile]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_JSFile](
	[JSID] [int] IDENTITY(1,1) NOT NULL,
	[JSName] [nvarchar](100) NULL,
	[JSFileName] [nvarchar](100) NULL,
	[JSConfig] [ntext] NULL,
	[JSType] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[Description] [nvarchar](255) NULL,
	[OrderID] [tinyint] NULL,
	[ClassID] [int] NULL,
	[from3g] [int] NULL,
 CONSTRAINT [PK_KS_JSFile] PRIMARY KEY CLUSTERED 
(
	[JSID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_U_Product]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_U_Product](
	[InfoID] [int] NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[ClassID] [int] NOT NULL,
	[Content] [text] NULL,
	[zdyss] [nvarchar](255) NULL,
	[SADSDASA] [nvarchar](255) NULL,
	[spggt] [nvarchar](200) NULL,
	[ChannelID] [int] NULL,
	[KeyTags] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[TitleFontColor] [varchar](20) NULL,
	[Attribute] [varchar](255) NULL,
	[DefaultPic] [varchar](255) NULL,
	[TurnUrl] [varchar](255) NULL,
	[priority] [int] NULL,
	[Hits] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[VoteID] [int] NULL,
	[TemplateFile] [varchar](255) NULL,
	[Template3GFile] [varchar](255) NULL,
	[ShowON3G] [tinyint] NULL,
	[FileName] [varchar](255) NULL,
	[RefreshTF] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[DelTF] [tinyint] NULL,
	[Inputer] [varchar](100) NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[SocialIDs] [varchar](255) NULL,
	[ProvinceId] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[SEOTitle] [nvarchar](255) NULL,
	[SEOKeyWords] [nvarchar](255) NULL,
	[SEODescription] [nvarchar](255) NULL,
	[CommentNum] [int] NULL,
	[ProID] [varchar](20) NULL,
	[ProductType] [int] NULL,
	[Unit] [varchar](50) NULL,
	[BarCode] [varchar](100) NULL,
	[Weight] [float] NULL,
	[BigPhoto] [varchar](255) NULL,
	[ProducerName] [varchar](50) NULL,
	[TrademarkName] [varchar](50) NULL,
	[ServiceTerm] [int] NULL,
	[BrandID] [int] NULL,
	[Amount] [int] NULL,
	[AlarmNum] [int] NULL,
	[Price] [money] NULL,
	[Price_Member] [money] NULL,
	[GroupPrice] [tinyint] NULL,
	[TaxTF] [tinyint] NULL,
	[Tax] [float] NULL,
	[MinOrderNum] [int] NULL,
	[MaxOrderNum] [int] NULL,
	[Score] [int] NULL,
	[IsChangeBuy] [tinyint] NULL,
	[ChangeBuyNeedPrice] [money] NULL,
	[ChangeBuyPresentPrice] [money] NULL,
	[IsLimitbuy] [tinyint] NULL,
	[LimitBuyPrice] [money] NULL,
	[LimitBuyTaskID] [int] NULL,
	[LimitBuyAmount] [int] NULL,
	[AttributeCart] [varchar](50) NULL,
	[HasSold] [int] NULL,
	[CmtNum] [int] NULL,
	[AskNum] [int] NULL,
	[IsScoreChange] [tinyint] NULL,
	[ChangeScore] [int] NULL,
	[PayType] [tinyint] NULL,
	[PayID] [int] NULL,
	[FrontPrice] [money] NULL,
	[LimitBeginDate] [datetime] NULL,
	[LimitEndDate] [datetime] NULL,
	[IsBookCode] [tinyint] NULL,
	[BookCodeTypeID] [int] NULL,
	[LimitCityNum] [int] NULL,
	[DownUrl] [nvarchar](255) NULL,
	[IsPromotions] [tinyint] NULL,
	[IsGroupRate] [tinyint] NULL,
 CONSTRAINT [PK_KS_U_Product] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_MoodProject]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_MoodProject](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](100) NULL,
	[ProjectContent] [nvarchar](3000) NULL,
	[OnlyUser] [tinyint] NULL,
	[UserOnce] [int] NULL,
	[AllowGroupID] [varchar](200) NULL,
	[Status] [tinyint] NULL,
	[TimeLimit] [tinyint] NULL,
	[StartDate] [datetime] NULL,
	[ExpiredDate] [datetime] NULL,
 CONSTRAINT [PK_KS_MoodProject] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_BBSBoard]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BBSBoard](
	[BoardID] [int] IDENTITY(1,1) NOT NULL,
	[BoardName] [varchar](255) NULL,
	[ParentID] [int] NULL,
	[Root] [int] NULL,
	[Depth] [int] NULL,
	[OrderID] [int] NULL,
	[ParentIDPath] [varchar](255) NULL,
	[Child] [int] NULL,
	[PrevID] [int] NULL,
	[NextID] [int] NULL,
	[AddDate] [datetime] NULL,
	[Setting] [ntext] NULL,
	[BoardMaster] [varchar](255) NULL,
	[ICO] [varchar](255) NULL,
	[Intro] [varchar](255) NULL,
	[BoardRules] [ntext] NULL,
	[TopicNum] [int] NULL,
	[PostNum] [int] NULL,
	[TodayNum] [int] NULL,
	[LastPost] [varchar](255) NULL,
 CONSTRAINT [PK_KS_BBSBoard] PRIMARY KEY CLUSTERED 
(
	[BoardID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_U_Photo]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_U_Photo](
	[InfoID] [int] NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[ClassID] [int] NOT NULL,
	[Content] [text] NULL,
	[ShowStyle] [int] NULL,
	[PageNum] [int] NULL,
	[Details] [text] NULL,
	[ChannelID] [int] NULL,
	[KeyTags] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[TitleFontColor] [varchar](20) NULL,
	[Attribute] [varchar](255) NULL,
	[DefaultPic] [varchar](255) NULL,
	[TurnUrl] [varchar](255) NULL,
	[priority] [int] NULL,
	[Hits] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[VoteID] [int] NULL,
	[TemplateFile] [varchar](255) NULL,
	[Template3GFile] [varchar](255) NULL,
	[ShowON3G] [tinyint] NULL,
	[FileName] [varchar](255) NULL,
	[RefreshTF] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[DelTF] [tinyint] NULL,
	[Inputer] [varchar](100) NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[SocialIDs] [varchar](255) NULL,
	[ProvinceId] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[SEOTitle] [nvarchar](255) NULL,
	[SEOKeyWords] [nvarchar](255) NULL,
	[SEODescription] [nvarchar](255) NULL,
	[CommentNum] [int] NULL,
	[CopyFrom] [varchar](255) NULL,
	[Author] [varchar](255) NULL,
	[InfoPurview] [tinyint] NULL,
	[ArrGroupID] [varchar](255) NULL,
	[ReadPoint] [money] NULL,
	[ChargeType] [tinyint] NULL,
	[PitchTime] [int] NULL,
	[ReadTimes] [int] NULL,
	[DividePercent] [int] NULL,
	[PKID] [int] NULL,
 CONSTRAINT [PK_KS_U_Photo] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodListDel]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_MoodListDel] 
@ids varchar(1000)
AS
 if (@ids<>'')
  begin
 declare @sql nvarchar(4000)
 set @sql='delete from KS_MoodList Where ID in('+@ids+')'
 exec (@sql)
 end
GO
/****** Object:  Table [dbo].[KS_MoodList]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_MoodList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MoodID] [int] NULL,
	[ChannelID] [int] NULL,
	[InfoID] [int] NULL,
	[Title] [nvarchar](50) NULL,
	[M0] [int] NULL,
	[M1] [int] NULL,
	[M2] [int] NULL,
	[M3] [int] NULL,
	[M4] [int] NULL,
	[M5] [int] NULL,
	[M6] [int] NULL,
	[M7] [int] NULL,
	[M8] [int] NULL,
	[M9] [int] NULL,
	[M10] [int] NULL,
	[M11] [int] NULL,
	[M12] [int] NULL,
	[M13] [int] NULL,
	[M14] [int] NULL,
 CONSTRAINT [PK_KS_MoodList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_U_download]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_U_download](
	[InfoID] [int] NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[ClassID] [int] NOT NULL,
	[Content] [text] NULL,
	[Category] [varchar](200) NULL,
	[Language] [varchar](200) NULL,
	[Authorization] [varchar](200) NULL,
	[Platform] [varchar](255) NULL,
	[FileSize] [varchar](100) NULL,
	[Details] [text] NULL,
	[rjdx] [nvarchar](255) NULL,
	[syxt] [nvarchar](255) NULL,
	[rjxj] [nvarchar](255) NULL,
	[rjlx] [nvarchar](255) NULL,
	[yuyan] [nvarchar](255) NULL,
	[ChannelID] [int] NULL,
	[KeyTags] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[TitleFontColor] [varchar](20) NULL,
	[Attribute] [varchar](255) NULL,
	[DefaultPic] [varchar](255) NULL,
	[TurnUrl] [varchar](255) NULL,
	[priority] [int] NULL,
	[Hits] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[VoteID] [int] NULL,
	[TemplateFile] [varchar](255) NULL,
	[Template3GFile] [varchar](255) NULL,
	[ShowON3G] [tinyint] NULL,
	[FileName] [varchar](255) NULL,
	[RefreshTF] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[DelTF] [tinyint] NULL,
	[Inputer] [varchar](100) NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[SocialIDs] [varchar](255) NULL,
	[ProvinceId] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[SEOTitle] [nvarchar](255) NULL,
	[SEOKeyWords] [nvarchar](255) NULL,
	[SEODescription] [nvarchar](255) NULL,
	[CommentNum] [int] NULL,
	[CopyFrom] [varchar](255) NULL,
	[Author] [varchar](255) NULL,
	[InfoPurview] [tinyint] NULL,
	[ArrGroupID] [varchar](255) NULL,
	[ReadPoint] [money] NULL,
	[ChargeType] [tinyint] NULL,
	[PitchTime] [int] NULL,
	[ReadTimes] [int] NULL,
	[DividePercent] [int] NULL,
	[PKID] [int] NULL,
 CONSTRAINT [PK_KS_U_download] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_PKGD]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_PKGD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PKID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[UserIP] [nvarchar](50) NULL,
	[Status] [tinyint] NULL,
	[AddDate] [smalldatetime] NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_KS_PKGD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProBookCodeType]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProBookCodeType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](255) NULL,
	[Note] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
	[CityNum] [int] NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsOpenApply] [tinyint] NULL,
	[ApplyMustLogin] [tinyint] NULL,
	[ApplyNum] [int] NULL,
 CONSTRAINT [PK_KS_ProBookCodeType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_U_Article]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_U_Article](
	[InfoID] [int] NOT NULL,
	[Title] [varchar](255) NOT NULL,
	[ClassID] [int] NOT NULL,
	[Content] [text] NULL,
	[PageTitle] [text] NULL,
	[ChannelID] [int] NULL,
	[KeyTags] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[TitleFontColor] [varchar](20) NULL,
	[Attribute] [varchar](255) NULL,
	[DefaultPic] [varchar](255) NULL,
	[TurnUrl] [varchar](255) NULL,
	[priority] [int] NULL,
	[Hits] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[AddDate] [datetime] NULL,
	[VoteID] [int] NULL,
	[TemplateFile] [varchar](255) NULL,
	[Template3GFile] [varchar](255) NULL,
	[ShowON3G] [tinyint] NULL,
	[FileName] [varchar](255) NULL,
	[RefreshTF] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[DelTF] [tinyint] NULL,
	[Inputer] [varchar](100) NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[SocialIDs] [varchar](255) NULL,
	[ProvinceId] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[SEOTitle] [nvarchar](255) NULL,
	[SEOKeyWords] [nvarchar](255) NULL,
	[SEODescription] [nvarchar](255) NULL,
	[CommentNum] [int] NULL,
	[CopyFrom] [varchar](255) NULL,
	[Author] [varchar](255) NULL,
	[InfoPurview] [tinyint] NULL,
	[ArrGroupID] [varchar](255) NULL,
	[ReadPoint] [money] NULL,
	[ChargeType] [tinyint] NULL,
	[PitchTime] [int] NULL,
	[ReadTimes] [int] NULL,
	[DividePercent] [int] NULL,
	[PKID] [int] NULL,
 CONSTRAINT [PK_KS_U_Article] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_PhotoClass]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_PhotoClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[OrderID] [int] NOT NULL,
	[IsDefault] [tinyint] NULL,
 CONSTRAINT [PK_KS_PHOTOCLASS] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SpecialR]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_SpecialR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SpecialID] [int] NOT NULL,
	[InfoID] [int] NOT NULL,
	[ChannelID] [int] NOT NULL,
 CONSTRAINT [PK_KS_SpecialR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_PaymentPlat]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_PaymentPlat](
	[ID] [int] NOT NULL,
	[PlatName] [nvarchar](50) NULL,
	[Remark] [ntext] NULL,
	[AccountID] [nvarchar](50) NULL,
	[MD5Key] [nvarchar](100) NULL,
	[Rate] [float] NULL,
	[RateByUser] [tinyint] NULL,
	[OrderID] [int] NULL,
	[IsDisabled] [tinyint] NOT NULL,
	[IsDefault] [tinyint] NOT NULL,
	[ApplyUrl] [varchar](255) NULL,
	[showflag] [tinyint] NULL,
	[logo] [varchar](255) NULL,
 CONSTRAINT [PK_KS_PaymentPlat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SpecialClass]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SpecialClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](200) NOT NULL,
	[ClassEname] [nvarchar](50) NULL,
	[Descript] [ntext] NULL,
	[FsoIndex] [nvarchar](50) NULL,
	[TemplateFile] [nvarchar](255) NULL,
	[AddDate] [smalldatetime] NULL,
	[OrderID] [int] NULL,
	[PhotoUrl] [varchar](255) NULL,
 CONSTRAINT [PK_KS_SpecialClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDUnVerifySelect]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKGDUnVerifySelect]
@Ids nvarchar(1000)
 AS
  If @Ids=''
    return null
 Else
   Begin
  DECLARE @SQL Nvarchar(3000)
  SET @SQL='Update KS_PKGD SET Status=0  WHERE ID In('+@ids+')'
  EXEC (@SQL)
  End
GO
/****** Object:  Table [dbo].[KS_ProPaymentType]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProPaymentType](
	[Typeid] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NULL,
	[Discount] [float] NULL,
	[orderid] [int] NULL,
	[Status] [tinyint] NULL,
	[isDefault] [tinyint] NULL,
	[Intro] [nvarchar](1000) NULL,
	[TypeFlag] [tinyint] NULL,
	[PaymentIds] [nvarchar](100) NULL,
 CONSTRAINT [PK_KS_ProPaymentType] PRIMARY KEY CLUSTERED 
(
	[Typeid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_AskPost]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_AskPost](
	[postid] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NULL,
	[content] [ntext] NULL,
	[addDate] [datetime] NULL,
	[IsBest] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[UserIP] [nvarchar](100) NULL,
	[UserId] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[IsZj] [tinyint] NULL,
 CONSTRAINT [PK_KS_AskPost] PRIMARY KEY CLUSTERED 
(
	[postid] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProOrderItem]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProOrderItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[InfoID] [int] NULL,
	[Price_Market] [money] NULL,
	[Price] [money] NULL,
	[num] [int] NULL,
	[TotalPrice] [money] NULL,
	[AttrID] [int] NULL,
	[IsChangeBuy] [tinyint] NULL,
	[Remark] [nvarchar](255) NULL,
	[LimitBuyTaskID] [int] NULL,
	[IsLimitBuy] [int] NULL,
	[IsBundleSale] [tinyint] NULL,
	[ChangeScore] [int] NULL,
	[Freight] [money] NULL,
	[FreightType] [tinyint] NULL,
	[Business] [varchar](100) NULL,
	[CityID] [int] NULL,
	[BookCode] [varchar](100) NULL,
 CONSTRAINT [PK_KS_ProOrderItem] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_AskClass]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_AskClass](
	[ClassID] [int] NOT NULL,
	[ClassName] [nvarchar](100) NULL,
	[ClassEname] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[Root] [int] NULL,
	[Depth] [tinyint] NULL,
	[OrderID] [int] NULL,
	[ParentIDPath] [varchar](4000) NULL,
	[Child] [int] NULL,
	[PrevID] [int] NULL,
	[NextID] [int] NULL,
	[ClassDir] [varchar](255) NULL,
	[UserName] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[ShowInTop] [tinyint] NULL,
	[ClassBasicInfo] [ntext] NULL,
	[ClassDefineContent] [ntext] NULL,
	[AdminPurview] [ntext] NULL,
	[QueNum] [int] NULL,
	[AnsNum] [int] NULL,
 CONSTRAINT [PK_KS_AskClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProBiddingAsk]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProBiddingAsk](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[Money] [money] NULL,
	[AddDate] [datetime] NULL,
	[UserName] [varchar](100) NULL,
	[UserID] [int] NULL,
	[UserIP] [varchar](100) NULL,
	[Status] [int] NULL,
	[IsZB] [int] NULL,
	[RealName] [varchar](100) NULL,
	[Mobile] [varchar](60) NULL,
	[Address] [varchar](255) NULL,
	[ZipCode] [varchar](50) NULL,
	[AgentPrice] [money] NULL,
 CONSTRAINT [PK_KS_ProBiddingAsk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProOrderBundleSale]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProOrderBundleSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
	[InfoID] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Price] [money] NULL,
	[Num] [int] NULL,
	[addDate] [datetime] NULL,
 CONSTRAINT [PK_KS_ProOrderBundleSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProSpecificationR]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProSpecificationR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[SID] [int] NULL,
	[orderid] [int] NULL,
 CONSTRAINT [PK_KS_ProSpecificationR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_Announce]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Announce](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[Author] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Newest] [int] NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
 CONSTRAINT [PK_KS_Announce] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_Special]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Special](
	[SpecialID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[SpecialName] [nvarchar](100) NOT NULL,
	[SpecialEName] [nvarchar](50) NOT NULL,
	[SpecialPic] [nvarchar](255) NULL,
	[TemplateFile] [nvarchar](255) NOT NULL,
	[Descript] [ntext] NULL,
	[Recommend] [int] NULL,
	[AddDate] [smalldatetime] NULL,
	[FsoName] [nvarchar](255) NULL,
	[MetaKeyWord] [ntext] NULL,
	[MetaDescript] [ntext] NULL,
	[UserName] [nvarchar](50) NULL,
	[SpecialDefineContent] [ntext] NULL,
	[SpecialPurView] [int] NULL,
	[ArrGroupID] [nvarchar](100) NULL,
	[ReadPoint] [int] NULL,
	[ChargeType] [int] NULL,
	[PitchTime] [int] NULL,
	[ReadTimes] [int] NULL,
	[Hits] [int] NULL,
 CONSTRAINT [PK_KS_Special] PRIMARY KEY CLUSTERED 
(
	[SpecialID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDDelete]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKGDDelete]
@Ids nvarchar(1000)
 AS
  If @Ids=''
    return null
 Else
   Begin
  DECLARE @SQL Nvarchar(3000)
  SET @SQL='Delete From KS_PKGD WHERE ID In('+@ids+')'
  EXEC (@SQL)
  End
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDDel]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKGDDel]
@Ids nvarchar(1000)
 AS
  DECLARE @SQL Nvarchar(3000)
  SET @SQL='DELETE FROM KS_PKGD WHERE id in('+@Ids+')'
  EXEC (@SQL)
GO
/****** Object:  Table [dbo].[KS_BBSPost]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BBSPost](
	[postid] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NULL,
	[content] [nvarchar](2000) NULL,
	[AddDate] [datetime] NULL,
	[Verify] [int] NULL,
	[UserIP] [varchar](255) NULL,
	[UserId] [int] NULL,
	[UserName] [varchar](50) NULL,
	[Annex] [varchar](1000) NULL,
 CONSTRAINT [PK_KS_BBSPost] PRIMARY KEY CLUSTERED 
(
	[postid] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SJWarning]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJWarning](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adddate] [datetime] NULL,
	[scoreid] [int] NULL,
	[flag] [tinyint] NULL,
	[Content] [text] NULL,
	[sjId] [int] NULL,
	[readTF] [tinyint] NULL,
	[username] [varchar](50) NULL,
 CONSTRAINT [PK_KS_SJWarning] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodProjectDel]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_MoodProjectDel]
 @projectids nvarchar(1000)
 AS
  declare @sql nvarchar(1500)
  set @sql='delete from KS_MoodProject Where projectid in('+@projectids+')'
  exec (@sql)
  set @sql='delete from KS_MoodList Where moodid in('+@projectids+')'
   exec (@sql)
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDVerifySelect]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKGDVerifySelect]
@Ids nvarchar(1000)
 AS
  If @Ids=''
    return null
 Else
   Begin
  DECLARE @SQL Nvarchar(3000)
  SET @SQL='Update KS_PKGD SET Status=1 WHERE ID In('+@ids+')'
  EXEC (@SQL)
  End
GO
/****** Object:  Table [dbo].[KS_SJType]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](100) NOT NULL,
	[Color] [varchar](50) NULL,
	[OrderID] [int] NULL,
	[IsDefault] [tinyint] NULL,
 CONSTRAINT [PK_KS_SJType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProBundleSelect]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProBundleSelect](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
	[InfoID] [int] NULL,
	[Title] [nvarchar](200) NULL,
	[Price] [money] NULL,
	[Num] [int] NULL,
        [attrid] [int] default 0,
	[addDate] [datetime] NULL,
 CONSTRAINT [PK_KS_ProBundleSelect] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_SJTMType]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJTMType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TmType] [int] NULL,
	[TypeName] [varchar](100) NULL,
	[Intro] [text] NULL,
	[SJID] [int] NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_KS_SJTMType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProBundleSale]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProBundleSale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[infoid] [int] NULL,
	[kbinfoid] [int] NULL,
        [attrid] [int] default 0,
	[kbprice] [money] NULL,
 CONSTRAINT [PK_KS_ProBundleSale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_BBSRank]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BBSRank](
	[RankID] [int] IDENTITY(1,1) NOT NULL,
	[RankName] [varchar](200) NULL,
	[IsSys] [tinyint] NULL,
	[Score] [int] NULL,
	[Ico] [varchar](255) NULL,
	[TopicNum] [int] NULL,
	[PostNum] [varchar](50) NULL,
	[Color] [varchar](30) NULL,
 CONSTRAINT [PK_KS_BBSRank] PRIMARY KEY CLUSTERED 
(
	[RankID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_WorkTable]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_WorkTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[ItemName] [varchar](255) NOT NULL,
	[Ico] [varchar](255) NULL,
	[Url] [varchar](255) NULL,
	[Intro] [varchar](255) NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_KS_WorkTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProBrandR]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProBrandR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NULL,
	[BrandID] [int] NULL,
 CONSTRAINT [PK_KS_ProClassBrandR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_Area]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Area](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](155) NULL,
	[E_City] [nvarchar](155) NULL,
	[ParentID] [int] NULL,
	[OrderID] [int] NULL,
	[Depth] [int] NULL,
	[Letter] [nvarchar](50) NULL,
	[WebUrl] [nvarchar](100) NULL,
	[WebTitle] [nvarchar](255) NULL,
	[WebLogo] [nvarchar](255) NULL,
	[MetaKeyWord] [nvarchar](255) NULL,
	[MetaDescript] [nvarchar](255) NULL,
	[CopyRight] [nvarchar](255) NULL,
	[ContactMan] [nvarchar](100) NULL,
	[Tel] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[QQ] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[IsShow] [tinyint] NULL,
 CONSTRAINT [PK_KS_Area] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_VoteLog]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_VoteLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[VoteID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[IP] [nvarchar](50) NULL,
	[VoteDate] [datetime] NULL,
 CONSTRAINT [PK_KS_VoteLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProBrand]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProBrand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](200) NULL,
	[OrderID] [int] NULL,
	[ShowInTop] [tinyint] NULL,
	[PhotoUrl] [nvarchar](250) NULL,
	[Recommend] [tinyint] NULL,
	[Intro] [ntext] NULL,
	[firstAlphabet] [nvarchar](50) NULL,
	[BrandEName] [nvarchar](50) NULL,
	[num] [int] NULL,
	[TemplateFile] [varchar](255) NULL,
 CONSTRAINT [PK_KS_ClassBrand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_BBSTable]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BBSTable](
	[TableId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NULL,
	[TableName] [varchar](100) NULL,
	[IsDefault] [int] NULL,
	[AddDate] [datetime] NULL,
	[IsSys] [int] NULL,
 CONSTRAINT [PK_KS_BBSTable] PRIMARY KEY CLUSTERED 
(
	[TableId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_VoteItem]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_VoteItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[VoteID] [int] NOT NULL,
	[ItemName] [nvarchar](255) NULL,
	[VoteNum] [int] NULL,
 CONSTRAINT [PK_KS_VoteItem] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProAsk]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProAsk](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProID] [int] NULL,
	[UserName] [varchar](50) NULL,
	[UserID] [int] NULL,
	[UserIP] [varchar](50) NULL,
	[Content] [varchar](255) NULL,
	[AddDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[ReplyUser] [varchar](50) NULL,
	[ReplyContent] [nvarchar](500) NULL,
	[ReplyDate] [datetime] NULL,
	[IsReply] [tinyint] NULL,
	[PhotoUrl] [varchar](255) NULL,
 CONSTRAINT [PK_KS_ProAsk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_InfoList]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_InfoList](
	[InfoID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[Title] [varchar](255) NULL,
	[TitleFontColor] [nvarchar](20) NULL,
	[DefaultPic] [nvarchar](255) NULL,
	[Intro] [nvarchar](255) NULL,
	[KeyTags] [nvarchar](255) NULL,
	[Hits] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[CopyFrom] [nvarchar](100) NULL,
	[Author] [nvarchar](100) NULL,
	[AddDate] [datetime] NULL,
	[Attribute] [nvarchar](50) NULL,
	[Priority] [int] NULL,
	[Inputer] [nvarchar](100) NULL,
	[RefreshTF] [tinyint] NULL,
	[ShowOn3G] [tinyint] NULL,
	[FileName] [nvarchar](255) NULL,
	[TurnUrl] [nvarchar](255) NULL,
	[ProID] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[Verify] [tinyint] NULL,
	[InfoPurview] [tinyint] NULL,
	[ArrGroupID] [nvarchar](100) NULL,
	[ReadPoint] [money] NULL,
	[ChargeType] [tinyint] NULL,
	[PitchTime] [int] NULL,
	[ReadTimes] [int] NULL,
	[DividePercent] [int] NULL,
	[PKID] [int] NULL,
	[VoteID] [int] NULL,
	[CommentNum] [int] NULL,
	[DelTF] [tinyint] NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[SocialIDs] [varchar](255) NULL,
	[ProvinceID] [int] NULL,
 CONSTRAINT [PK_KS_InfoList] PRIMARY KEY NONCLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [ArrGroupID] ON [KS_InfoList] 
(
	[ArrGroupID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ChannelID] ON [KS_InfoList] 
(
	[ChannelID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_KS_InfoList] ON [KS_InfoList] 
(
	[ClassID] ASC
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_KS_InfoList_1] ON [KS_InfoList] 
(
	[Priority] ASC
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [NewsID] ON [KS_InfoList] 
(
	[InfoID] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_RechargeRecords]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_RechargeRecords](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[adddate] [datetime] NULL,
	[PayTime] [datetime] NULL,
	[status] [int] NULL,
	[paymoney] [money] NULL,
	[realmoney] [money] NULL,
	[remark] [ntext] NULL,
	[platID] [int] NULL,
	[alipaytradeno] [varchar](50) NULL,
	[alipaytradestatus] [varchar](50) NULL,
 CONSTRAINT [PK_KS_RechargeRecords] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProAddress]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[RealName] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[ZipCode] [nvarchar](50) NULL,
	[Tel] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
	[CityID] [int] NULL,
	[CountyID] [int] NULL,
	[AddDate] [smalldatetime] NULL,
	[IsDefault] [tinyint] NULL,
	[Title] [nvarchar](255) NULL,
 CONSTRAINT [PK_KS_ProAddress] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_BBSTopic]    Script Date: 04/01/2015 09:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BBSTopic](
	[TopicId] [int] IDENTITY(1,1) NOT NULL,
	[boardId] [int] NULL,
	[UserId] [int] NULL,
	[UserName] [varchar](50) NULL,
	[UserIP] [varchar](50) NULL,
	[Content] [nvarchar](4000) NULL,
	[PostTable] [varchar](50) NULL,
	[AddDate] [datetime] NULL,
	[LastPostTime] [datetime] NULL,
	[verify] [tinyint] NULL,
	[IsTop] [tinyint] NULL,
	[Hits] [int] NULL,
	[PostNum] [int] NULL,
	[Digg] [int] NULL,
	[IsBest] [int] NULL,
	[KeyTags] [varchar](255) NULL,
	[Annex] [varchar](1000) NULL,
	[ReplyText] [nvarchar](4000) NULL,
 CONSTRAINT [PK_KS_BBSTopic] PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_CollectionFilter]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_CollectionFilter](
	[FilterID] [int] IDENTITY(1,1) NOT NULL,
	[FilterName] [nvarchar](255) NULL,
	[FilterType] [tinyint] NULL,
	[BeginTag] [ntext] NULL,
	[EndTag] [ntext] NULL,
	[ReplaceBody] [ntext] NULL,
	[Status] [tinyint] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_CollectionFilter] PRIMARY KEY CLUSTERED 
(
	[FilterID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProDeliveryCorp]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProDeliveryCorp](
	[CorpID] [int] IDENTITY(1,1) NOT NULL,
	[CorpName] [nvarchar](100) NOT NULL,
	[WebUrl] [nvarchar](150) NULL,
	[OrderUrl] [nvarchar](200) NULL,
	[OrderID] [int] NULL,
	[Intro] [ntext] NULL,
	[Template] [ntext] NULL,
	[PhotoUrl] [varchar](255) NULL,
	[CorpCode] [varchar](50) NULL,
 CONSTRAINT [PK_KS_ProDeliveryCorp] PRIMARY KEY CLUSTERED 
(
	[CorpID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Class]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Class](
	[ClassID] [int] NOT NULL,
	[ChannelID] [smallint] NULL,
	[ClassName] [nvarchar](100) NULL,
	[ClassEname] [nvarchar](150) NULL,
	[ParentID] [int] NULL,
	[Root] [int] NULL,
	[Depth] [tinyint] NULL,
	[OrderID] [int] NULL,
	[ParentIDPath] [varchar](1500) NULL,
	[Child] [int] NULL,
	[PrevID] [int] NULL,
	[NextID] [int] NULL,
	[ClassDir] [varchar](255) NULL,
	[ClassType] [tinyint] NULL,
	[UserName] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[ClassTemplate] [nvarchar](255) NULL,
	[ContentTemplate] [nvarchar](255) NULL,
	[Class3GTemplate] [nvarchar](255) NULL,
	[Content3GTemplate] [nvarchar](255) NULL,
	[ShowInTop] [tinyint] NULL,
	[ShowOn3G] [tinyint] NULL,
	[ShowInCir] [tinyint] NULL,
	[AllowPubInfo] [tinyint] NULL,
	[PubFlag] [tinyint] NULL,
	[AllowPubGroupID] [varchar](255) NULL,
	[PubAddMoney] [int] NULL,
	[PubAddPoint] [int] NULL,
	[PubAddScore] [int] NULL,
	[CmtAddScore] [int] NULL,
	[ShareAddScore] [int] NULL,
	[CreateHtmlFlag] [tinyint] NULL,
	[AutoCreateType] [tinyint] NULL,
	[ClassFsoIndex] [varchar](50) NULL,
	[CreateInfoPath] [varchar](200) NULL,
	[CreateInfoFname] [varchar](150) NULL,
	[ClassDomain] [varchar](100) NULL,
	[ClassPurview] [smallint] NULL,
	[DefaultArrGroupID] [nvarchar](255) NULL,
	[DefaultReadPoint] [smallint] NULL,
	[DefaultChargeType] [smallint] NULL,
	[DefaultPitchTime] [smallint] NULL,
	[DefaultReadTimes] [smallint] NULL,
	[DefaultDividePercent] [smallint] NULL,
	[ClassBasicInfo] [ntext] NULL,
	[ClassDefineContent] [ntext] NULL,
	[AdminPurview] [ntext] NULL,
	[InfoNum] [int] NULL,
	[ProSpecialID] [int] NULL,
 CONSTRAINT [PK_KS_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProDelivery]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProDelivery](
	[DeliveryID] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryName] [nvarchar](200) NOT NULL,
	[CorpId] [int] NULL,
	[FreightType] [tinyint] NULL,
	[Freight] [money] NULL,
	[FirstHeavy] [float] NULL,
	[ContinueHeavy] [float] NULL,
	[FirstFreight] [money] NULL,
	[ContinueFreight] [money] NULL,
	[LimitFreight] [money] NULL,
	[ChargeType] [tinyint] NULL,
	[IsCOD] [tinyint] NULL,
	[Intro] [ntext] NULL,
	[PromotionType] [tinyint] NULL,
	[OrderAmount1] [money] NULL,
	[OrderAmount2] [money] NULL,
	[OrderAmount3] [money] NULL,
	[Freight1] [money] NULL,
	[Freight2] [money] NULL,
	[Status] [tinyint] NULL,
	[OrderID] [int] NULL,
	[IsDefault] [tinyint] NULL,
	[CityFirstFreight] [money] NULL,
	[CityContinueFreight] [money] NULL,
	[CityLimitFreight] [money] NULL,
	[CityIsCod] [tinyint] NULL,
	[ProvinceFirstFreight] [money] NULL,
	[ProvinceContinueFreight] [money] NULL,
	[ProvinceLimitFreight] [money] NULL,
	[ProvinceIsCod] [tinyint] NULL,
 CONSTRAINT [PK_KS_ProDelivery] PRIMARY KEY CLUSTERED 
(
	[DeliveryID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_BlogVisitors]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogVisitors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[UserName] [varchar](255) NULL,
	[VisitorId] [int] NULL,
	[Visitor] [varchar](255) NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_BLOGVISITORS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[KS_PKZTDel]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKZTDel]
@pkid varchar(255)
 AS
  declare @Sql varchar(3000)
  Set @Sql='Delete From KS_PKZT Where PKID in('+@pkid+')'
  exec (@SQL)
  Set @Sql='Delete From KS_PKGD Where PKID IN('+@PKID+')'
  exec (@SQL)
  Set @Sql='Update KS_InfoList Set pkid=0 Where PKID IN('+@PKID+')'
  EXEC(@SQL)
GO
/****** Object:  Table [dbo].[KS_ProductList]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProductList](
	[InfoID] [int] IDENTITY(1,1) NOT NULL,
	[ProID] [nvarchar](20) NOT NULL,
	[ChannelID] [int] NULL,
	[ClassID] [int] NULL,
	[KeyTags] [ntext] NULL,
	[Title] [nvarchar](255) NOT NULL,
	[TitleFontColor] [nvarchar](20) NULL,
	[ProductType] [int] NULL,
	[Attribute] [nvarchar](255) NULL,
	[BarCode] [nvarchar](100) NULL,
	[Unit] [nvarchar](50) NULL,
	[Weight] [float] NULL,
	[DefaultPic] [nvarchar](255) NULL,
	[BigPhoto] [nvarchar](255) NULL,
	[Intro] [nvarchar](300) NULL,
	[TurnUrl] [nvarchar](250) NULL,
	[priority] [int] NULL,
	[ProducerName] [nvarchar](50) NULL,
	[TrademarkName] [nvarchar](50) NULL,
	[ServiceTerm] [int] NULL,
	[Rank] [nvarchar](50) NULL,
	[Hits] [int] NULL,
	[BrandID] [int] NULL,
	[HitsByDay] [int] NULL,
	[HitsByWeek] [int] NULL,
	[HitsByMonth] [int] NULL,
	[LastHitsTime] [datetime] NULL,
	[Amount] [int] NULL,
	[AlarmNum] [int] NULL,
	[Price] [money] NULL,
	[Price_Member] [money] NULL,
	[GroupPrice] [tinyint] NULL,
	[TaxTF] [tinyint] NULL,
	[Tax] [float] NULL,
	[MinOrderNum] [int] NULL,
	[MaxOrderNum] [int] NULL,
	[AddDate] [datetime] NULL,
	[VoteID] [int] NULL,
	[ShowOn3G] [tinyint] NULL,
	[FileName] [nvarchar](255) NULL,
	[RefreshTF] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[Score] [int] NULL,
	[DelTF] [tinyint] NULL,
	[Inputer] [nvarchar](50) NULL,
	[IsChangeBuy] [tinyint] NULL,
	[ChangeBuyNeedPrice] [money] NULL,
	[ChangeBuyPresentPrice] [money] NULL,
	[IsLimitbuy] [tinyint] NULL,
	[LimitBuyPrice] [money] NULL,
	[LimitBuyTaskID] [int] NULL,
	[LimitBuyAmount] [int] NULL,
	[AttributeCart] [nvarchar](50) NULL,
	[HasSold] [int] NULL,
	[CommentNum] [int] NULL,
	[CmtNum] [int] NULL,
	[AskNum] [int] NULL,
	[AttachmentCharge] [int] NULL,
	[AttachmentChargeOnce] [tinyint] NULL,
	[IsScoreChange] [tinyint] NULL,
	[ChangeScore] [int] NULL,
	[SocialIDs] [varchar](255) NULL,
	[FrontPrice] [money] NULL,
	[PayType] [tinyint] NULL,
	[payId] [int] NULL,
	[IsGroupRate] [tinyint] NULL,
	[LimitBeginDate] [datetime] NULL,
	[LimitEndDate] [datetime] NULL,
	[IsBookCode] [tinyint] NULL,
	[BookCodeTypeID] [int] NULL,
	[LimitCityNum] [int] NULL,
	[IsPromotions] [tinyint] NULL,
	[DownUrl] [varchar](255) NULL,
	[ProvinceID] [int] NULL,
	[CityId] [int] NULL,
	[CountyId] [int] NULL,
 CONSTRAINT [PK_KS_ProductList] PRIMARY KEY CLUSTERED 
(
	[InfoID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_PKZT]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_PKZT](
	[PKID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[ZFGD] [text] NULL,
	[FFGD] [text] NULL,
	[UserTF] [tinyint] NULL,
	[OnceTF] [tinyint] NULL,
	[VerifyTF] [tinyint] NULL,
	[Status] [tinyint] NULL,
	[TimeLimit] [tinyint] NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[InfoID] [int] NULL,
	[ZFVotes] [int] NULL,
	[FFVotes] [int] NULL,
	[SFVotes] [int] NULL,
 CONSTRAINT [PK_KS_PKZT] PRIMARY KEY CLUSTERED 
(
	[PKID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_UserRechargeItem]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserRechargeItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RechargeWay] [tinyint] NULL,
	[AddWay] [tinyint] NULL,
	[Name] [varchar](250) NULL,
	[Cardnumber] [varchar](200) NULL,
	[password] [varchar](200) NULL,
	[FaceValue] [money] NULL,
	[PointNumber] [int] NULL,
	[PointType] [int] NULL,
	[UseDate] [datetime] NULL,
	[enddate] [datetime] NULL,
	[IsSell] [tinyint] NULL,
	[IsUse] [tinyint] NULL,
	[Users] [varchar](100) NULL,
	[RechargeDate] [datetime] NULL,
	[GroupId] [varchar](100) NULL,
	[UsedGroupId] [int] NULL,
	[EndGroupId] [int] NULL,
	[adddate] [datetime] NULL,
	[Inputer] [varchar](100) NULL,
	[ItemID] [int] NULL,
 CONSTRAINT [PK_KS_UserRechargeItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_BlogTemplate]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogTemplate](
	[SkinID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](255) NOT NULL,
	[templateMain] [varchar](255) NULL,
	[TemplateAuthor] [varchar](100) NULL,
	[TemplatePic] [varchar](255) NULL,
	[IsDefault] [tinyint] NOT NULL,
	[groupLevel] [varchar](255) NOT NULL,
	[Sharetag] [int] NULL,
	[UserTag] [int] NULL,
 CONSTRAINT [PK_KS_BLOGTEMPLATE] PRIMARY KEY CLUSTERED 
(
	[SkinID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProDeliveryItem]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProDeliveryItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryID] [int] NOT NULL,
	[provinces] [nvarchar](1000) NULL,
	[IsCod] [tinyint] NULL,
	[FirstFreight] [money] NULL,
	[ContinueFreight] [money] NULL,
	[LimitFreight] [money] NULL,
 CONSTRAINT [PK_KS_ProDeliveryItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProCoupon]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProCoupon](
	[CouponID] [int] IDENTITY(1,1) NOT NULL,
	[Couponname] [nvarchar](250) NULL,
	[FaceValue] [money] NULL,
	[MinAmount] [money] NULL,
	[CouponType] [int] NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Inputer] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Status] [tinyint] NULL,
	[MaxDiscount] [float] NULL,
	[LimitType] [int] NULL,
	[LimitProIds] [nvarchar](500) NULL,
	[LimitClassIDs] [nvarchar](500) NULL,
 CONSTRAINT [PK_KS_ProCoupon] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_BlogStatus]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NULL,
	[UserId] [int] NULL,
	[ArticleTotal] [int] NULL,
	[AlbumTotal] [int] NULL,
	[CorpusTotal] [int] NULL,
	[AskTotal] [int] NULL,
	[MessageTotal] [int] NULL,
 CONSTRAINT [PK_KS_BLOGSTATUS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Advertise]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Advertise](
	[adid] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[boardid] [nvarchar](255) NULL,
	[AdType] [int] NULL,
	[ShowType] [int] NULL,
	[LinkUrl] [nvarchar](255) NULL,
	[LinkTips] [nvarchar](255) NULL,
	[LinkTarget] [int] NULL,
	[Content] [ntext] NULL,
	[PicFlashUrl] [nvarchar](255) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Clicks] [int] NULL,
	[Views] [int] NULL,
	[TimeLimit] [int] NULL,
	[BeginDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[Status] [int] NULL,
	[RecordClickIP] [tinyint] NULL,
	[ClickAddScorePerTime] [int] NULL,
	[ClickScore] [int] NULL,
 CONSTRAINT [PK_KS_Advertise] PRIMARY KEY CLUSTERED 
(
	[adid] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProSpecification]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_ProSpecification](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[ShowType] [tinyint] NULL,
	[SValue] [ntext] NULL,
	[orderid] [int] NULL,
 CONSTRAINT [PK_KS_ShopSpecification] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_Admin]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[PrUserName] [nvarchar](50) NULL,
	[RealName] [nvarchar](20) NULL,
	[Tel] [nvarchar](15) NULL,
	[Descript] [nvarchar](255) NULL,
	[AddDate] [datetime] NULL,
	[LastLoginIP] [nvarchar](50) NULL,
	[LastLoginTime] [datetime] NULL,
	[LastLogoutTime] [datetime] NULL,
	[LoginTimes] [int] NULL,
	[Locked] [tinyint] NULL,
	[SysAdmin] [tinyint] NULL,
	[UserType] [tinyint] NULL,
	[PowerList] [ntext] NULL,
	[DocPower] [tinyint] NULL,
 CONSTRAINT [PK_KS_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_PaymentPlatItem]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_PaymentPlatItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PayId] [int] NULL,
	[AccountID] [varchar](100) NULL,
	[Md5Key] [varchar](255) NULL,
	[IsDefault] [int] NULL,
 CONSTRAINT [PK_KS_PaymentPlatItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SJTK]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_SJTK](
	[TmId] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NULL,
	[ClassID] [int] NULL,
	[Tmtype] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[Tmnr] [ntext] NULL,
	[DAJS] [ntext] NULL,
	[tmfs] [real] NULL,
	[Answer] [ntext] NULL,
	[OptionNum] [int] NULL,
	[OrderID] [int] NULL,
	[IsRnd] [tinyint] NULL,
	[IsMedia] [tinyint] NULL,
	[MediaUrl] [nvarchar](250) NULL,
	[MediaTxt] [ntext] NULL,
	[DAJSMedia] [nvarchar](250) NULL,
	[Difficulty] [tinyint] NULL,
	[KnowledgeId] [int] NULL,
	[KeyWords] [nvarchar](255) NULL,
 CONSTRAINT [PK_KS_SJTK] PRIMARY KEY CLUSTERED 
(
	[TmId] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_Adiplist]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Adiplist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adid] [int] NULL,
	[boardid] [int] NULL,
	[adddate] [datetime] NULL,
	[UserIP] [nvarchar](50) NULL,
	[userName] [varchar](50) NULL,
 CONSTRAINT [PK_KS_Adiplist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SJScore]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJScore](
	[ScoreID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[SJID] [int] NULL,
	[Answer] [ntext] NULL,
	[score] [float] NULL,
	[AddDate] [datetime] NULL,
	[KSSJ] [nvarchar](50) NULL,
	[Remark] [ntext] NULL,
	[IsTj] [tinyint] NULL,
	[HasUseTime] [varchar](50) NULL,
	[realTest] [tinyint] NULL,
	[CardNum] [varchar](100) NULL,
	[SessionRnd] [varchar](50) NULL,
	[TotalTMS] [int] NULL,
	[NOFinishTMS] [int] NULL,
	[UserIP] [varchar](50) NULL,
	[locked] [tinyint] NULL,
	[WarnTF] [tinyint] NULL,
	[WarnTimes] [int] NULL,
	[FirstInTime] [datetime] NULL,
	[IsPg] [tinyint] NULL,
	[PgTeacher] [varchar](50) NULL,
	[PY] [ntext] NULL,
	[PGSJ] [datetime] NULL,
	[ZGTDFQK] [text] NULL,
	[FrontTMS] [nvarchar](600) NULL,
 CONSTRAINT [PK_KS_SJScore] PRIMARY KEY CLUSTERED 
(
	[ScoreID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Adboard]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Adboard](
	[boardid] [int] IDENTITY(1,1) NOT NULL,
	[BoardName] [nvarchar](50) NULL,
	[AdRate] [int] NULL,
	[FileName] [nvarchar](50) NULL,
	[Maxads] [smallint] NULL,
	[Note] [ntext] NULL,
	[Status] [int] NULL,
	[ClassID] [int] NULL,
 CONSTRAINT [PK_KS_Adboard] PRIMARY KEY CLUSTERED 
(
	[boardid] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_UserRecord]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_UserRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserIP] [varchar](255) NULL,
	[flag] [int] NULL,
	[note] [varchar](255) NULL,
	[adddate] [datetime] NULL,
	[userid] [int] NULL,
	[UserName] [varchar](255) NULL,
 CONSTRAINT [PK_KS_UserRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SJRndZJ]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_SJRndZJ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SJID] [int] NULL,
	[TmType] [int] NULL,
	[TmIds] [nvarchar](255) NULL,
	[OrderID] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[FS] [real] NULL,
	[Num] [int] NULL,
	[Intro] [ntext] NULL,
 CONSTRAINT [PK_KS_SJRndZJ] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_CollectionItem]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_CollectionItem](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [nvarchar](255) NULL,
	[ModelID] [int] NULL,
	[ClassID] [int] NULL,
	[SiteName] [nvarchar](255) NULL,
	[CollectUrl] [nvarchar](255) NULL,
	[Encoding] [nvarchar](100) NULL,
	[Attribute] [nvarchar](50) NULL,
	[CollectOption] [nvarchar](50) NULL,
	[CollectListNum] [int] NULL,
	[CollectInfoNum] [int] NULL,
	[Remark] [nvarchar](255) NULL,
	[PauseTime] [int] NULL,
	[PausePerNum] [int] NULL,
	[ListBeginTag] [ntext] NULL,
	[ListEndTag] [ntext] NULL,
	[LinkBeginTag] [ntext] NULL,
	[LinkEndTag] [ntext] NULL,
	[PageType] [int] NULL,
	[PageUrl] [nvarchar](255) NULL,
	[PageStartID] [int] NULL,
	[PageEndID] [int] NULL,
	[PageListUrl] [ntext] NULL,
	[FieldsRuleXml] [ntext] NULL,
	[AddDate] [smalldatetime] NULL,
	[IsCanCollect] [tinyint] NULL,
	[LastCollectTime] [smalldatetime] NULL,
	[IsCreateHtml] [tinyint] NULL,
 CONSTRAINT [PK_KS_CollectionItem] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_SJReviewsCmt]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJReviewsCmt](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[userid] [int] NULL,
	[userip] [varchar](50) NULL,
	[content] [text] NULL,
	[status] [tinyint] NULL,
	[adddate] [datetime] NULL,
	[cmtid] [int] NULL,
 CONSTRAINT [PK_KS_SJReviewsCmt] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Comment]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NULL,
	[ClassID] [int] NULL,
	[InfoID] [int] NULL,
	[UserIP] [nvarchar](20) NULL,
	[Content] [ntext] NULL,
	[Support] [int] NULL,
	[Opposition] [int] NULL,
	[AddDate] [datetime] NULL,
	[Verify] [int] NULL,
	[Anonymous] [int] NULL,
	[UserName] [nvarchar](50) NULL,
	[Viewpoint] [int] NULL,
	[Reports] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_KS_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_SJTKSub]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_SJTKSub](
	[tmid] [int] IDENTITY(1,1) NOT NULL,
	[Tmnr] [ntext] NULL,
	[Answer] [ntext] NULL,
	[TmFs] [float] NULL,
	[TmType] [int] NULL,
	[ParentTmID] [int] NULL,
	[OrderID] [int] NULL,
	[Dajs] [ntext] NULL,
	[OptionNum] [int] NULL,
 CONSTRAINT [PK_KS_SJTKSub] PRIMARY KEY CLUSTERED 
(
	[tmid] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_SJReviews]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJReviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [tinyint] NULL,
	[UserName] [varchar](100) NULL,
	[UserIP] [varchar](50) NULL,
	[AddDate] [datetime] NULL,
	[CmtNum] [int] NULL,
	[Status] [tinyint] NULL,
	[SJID] [int] NULL,
	[Content] [text] NULL,
	[ClassID] [int] NULL,
 CONSTRAINT [PK_KS_SJComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_CollectionHistory]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_CollectionHistory](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NULL,
	[ModelID] [int] NULL,
	[InfoID] [int] NULL,
	[ClassID] [int] NULL,
	[Title] [varchar](255) NULL,
	[ItemUrl] [varchar](255) NULL,
	[Remark] [varchar](255) NULL,
	[IsSucceed] [int] NULL,
	[RecordTime] [datetime] NULL,
 CONSTRAINT [PK_KS_CollectionHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SJKnowledge]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJKnowledge](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[classid] [int] NULL,
	[content] [text] NULL,
	[username] [varchar](50) NULL,
	[adddate] [datetime] NULL,
 CONSTRAINT [PK_KS_SJKnowledge] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_CopyFrom]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_CopyFrom](
	[CopyFromID] [int] IDENTITY(1,1) NOT NULL,
	[CopyFromName] [nvarchar](50) NOT NULL,
	[WebSite] [nvarchar](100) NULL,
	[Address] [nvarchar](255) NULL,
	[ContactMan] [nvarchar](50) NULL,
	[Telphone] [nvarchar](50) NULL,
	[Fax] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[Email] [nvarchar](100) NULL,
	[Class] [nvarchar](15) NULL,
	[Intro] [ntext] NULL,
	[AddDate] [datetime] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_KS_CopyFrom] PRIMARY KEY CLUSTERED 
(
	[CopyFromID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_SJCTB]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_SJCTB](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tmid] [int] NULL,
	[userid] [int] NULL,
	[adddate] [smalldatetime] NULL,
	[flag] [tinyint] NULL,
 CONSTRAINT [PK_KS_SJCTB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_Form]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_Form](
	[FormID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](255) NULL,
	[FormTemplate] [nvarchar](255) NULL,
	[FieldsXML] [ntext] NULL,
	[TimeLimit] [tinyint] NULL,
	[BeginDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[LimitIP] [smallint] NULL,
	[UserTF] [tinyint] NULL,
	[UploadUserTF] [tinyint] NULL,
	[AllowGroupID] [nvarchar](100) NULL,
	[UserOnce] [tinyint] NULL,
	[Descript] [ntext] NULL,
	[VerifyTF] [tinyint] NULL,
	[CodeType] [int] NULL,
	[FileName] [nvarchar](100) NULL,
	[Status] [tinyint] NULL,
	[MaxItemID] [int] NULL,
	[IsSendMail] [tinyint] NULL,
	[SuccessTips] [varchar](255) NULL,
	[SuccessUrl] [varchar](255) NULL,
	[MailTemplate] [text] NULL,
 CONSTRAINT [PK_KS_Form] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_FieldGroup]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_FieldGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](255) NULL,
	[ChannelID] [int] NULL,
	[OrderId] [int] NULL,
	[IsSys] [tinyint] NULL,
 CONSTRAINT [PK_KS_FieldGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SJCorrection]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJCorrection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sjid] [int] NOT NULL,
	[content] [text] NULL,
	[status] [tinyint] NULL,
	[adddate] [datetime] NULL,
	[username] [varchar](50) NULL,
	[UserIP] [varchar](50) NULL,
 CONSTRAINT [PK_KS_SJCorrection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Favorite]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Favorite](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[ChannelID] [int] NULL,
	[InfoID] [int] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_Favorite] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_SJMyTraining]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJMyTraining](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[ClassID] [int] NULL,
	[OrderID] [int] NULL,
	[adddate] [datetime] NULL,
 CONSTRAINT [PK_KS_SJMyTraining] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SJClass]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJClass](
	[ClassID] [int] NOT NULL,
	[ClassName] [nvarchar](100) NOT NULL,
	[ClassEname] [nvarchar](255) NULL,
	[ParentID] [int] NULL,
	[Root] [int] NULL,
	[Depth] [tinyint] NULL,
	[OrderID] [int] NULL,
	[ParentIDPath] [varchar](4000) NULL,
	[Child] [int] NULL,
	[PrevID] [int] NULL,
	[NextID] [int] NULL,
	[ClassDir] [varchar](255) NULL,
	[UserName] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[ShowInTop] [tinyint] NULL,
	[ClassBasicInfo] [ntext] NULL,
	[ClassDefineContent] [ntext] NULL,
	[AdminPurview] [ntext] NULL,
 CONSTRAINT [PK_KS_SJClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_DownServer]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_DownServer](
	[DownID] [int] NOT NULL,
	[ChannelID] [int] NULL,
	[DownloadName] [nvarchar](50) NULL,
	[DownloadPath] [nvarchar](255) NULL,
	[rootid] [int] NULL,
	[orders] [int] NULL,
	[parentid] [int] NULL,
	[child] [int] NULL,
	[IsLock] [tinyint] NOT NULL,
	[IsOuter] [int] NULL,
	[UnionID] [nvarchar](50) NULL,
	[selfont] [nvarchar](255) NULL,
	[AllDownHits] [int] NOT NULL,
	[DayDownHits] [int] NOT NULL,
	[HitsTime] [datetime] NULL,
 CONSTRAINT [PK_KS_DownServer] PRIMARY KEY CLUSTERED 
(
	[DownID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_LogSms]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_LogSms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mobile] [varchar](30) NULL,
	[AddDate] [datetime] NULL,
	[IsSuccess] [tinyint] NULL,
	[UserName] [varchar](50) NULL,
	[Remark] [text] NULL,
	[Content] [text] NULL,
	[UserIP] [varchar](50) NULL,
 CONSTRAINT [PK_KS_LogSms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SJCJDItem]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJCJDItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NULL,
	[Title] [varchar](255) NULL,
	[MinScore] [float] NULL,
	[MaxScore] [float] NULL,
	[Score] [int] NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_KS_SJCJDItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_DiggList]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_DiggList](
	[DiggID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NOT NULL,
	[InfoID] [int] NOT NULL,
	[LastDiggTime] [datetime] NULL,
	[LastDiggUser] [nvarchar](120) NULL,
	[SupportNum] [int] NOT NULL,
	[AgainstNum] [int] NULL,
 CONSTRAINT [PK_KS_DiggList] PRIMARY KEY CLUSTERED 
(
	[DiggID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_SJMyTrainPaper]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJMyTrainPaper](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NULL,
	[UserName] [varchar](50) NULL,
	[AddDate] [datetime] NULL,
	[TmIds] [varchar](255) NULL,
	[LimitTime] [int] NULL,
	[IsTJ] [tinyint] NULL,
	[PostTime] [datetime] NULL,
	[SysScore] [float] NULL,
	[Score] [float] NULL,
	[ClassID] [int] NULL,
	[HasUseTime] [varchar](100) NULL,
	[Answer] [text] NULL,
	[noFinishTMS] [int] NULL,
	[TotalTMS] [int] NULL,
 CONSTRAINT [PK_KS_SJMyTrainPaper] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SJCJD]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJCJD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](255) NOT NULL,
	[OrderID] [int] NULL,
	[IsDefault] [tinyint] NULL,
 CONSTRAINT [PK_KS_SJCJD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Digg]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Digg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChannelID] [int] NOT NULL,
	[InfoID] [int] NOT NULL,
	[DiggID] [int] NOT NULL,
	[DiggTime] [datetime] NULL,
	[UserName] [nvarchar](100) NULL,
	[UserIP] [nvarchar](100) NULL,
	[DiggType] [int] NULL,
 CONSTRAINT [PK_KS_Digg] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_ProSpecial]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProSpecial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](200) NULL,
	[itemnum] [int] NULL,
 CONSTRAINT [PK_KS_ProSpecial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_SJCardItem]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJCardItem](
	[itemid] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CardNum] [varchar](255) NULL,
	[UserName] [varchar](255) NULL,
	[RealName] [varchar](50) NULL,
	[IDCard] [varchar](100) NULL,
	[UserFace] [varchar](50) NULL,
	[Status] [tinyint] NULL,
	[Sex] [varchar](50) NULL,
 CONSTRAINT [PK_KS_SJCardItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Dictionary]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Dictionary](
	[KeyID] [int] IDENTITY(1,1) NOT NULL,
	[KeyText] [nvarchar](50) NULL,
	[KeyValue] [ntext] NULL,
	[DefaultValue] [nvarchar](200) NULL,
 CONSTRAINT [PK_KS_Dictionary] PRIMARY KEY CLUSTERED 
(
	[KeyID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_SJCard]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJCard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](255) NULL,
	[CardPre] [varchar](255) NULL,
	[SjIdS] [varchar](255) NULL,
	[Subject] [varchar](255) NULL,
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Intro] [text] NULL,
	[status] [tinyint] NULL,
	[AddDate] [datetime] NULL,
 CONSTRAINT [PK_KS_SJCard] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_InnerLink]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_InnerLink](
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
	[LinkText] [nvarchar](150) NULL,
	[LinkColor] [nvarchar](50) NULL,
	[LinkUrl] [nvarchar](150) NULL,
	[Opentype] [nvarchar](50) NULL,
	[AddDate] [datetime] NULL,
	[Status] [int] NULL,
	[Times] [int] NULL,
 CONSTRAINT [PK_KS_InnerLink] PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KS_SJ]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_SJ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](255) NULL,
	[TitleFontColor] [varchar](50) NULL,
	[ClassID] [int] NULL,
	[TypeID] [int] NULL,
	[ProvinceID] [int] NULL,
	[KSSJ] [int] NULL,
	[Score] [real] NULL,
	[Money] [float] NULL,
	[Times] [int] NULL,
	[MustLogin] [tinyint] NULL,
	[GroupIDs] [varchar](100) NULL,
	[DepartIds] [varchar](100) NULL,
	[CopyFrom] [varchar](100) NULL,
	[Author] [varchar](50) NULL,
	[Inputer] [varchar](50) NULL,
	[Intro] [text] NULL,
	[Recommend] [tinyint] NULL,
	[Popular] [tinyint] NULL,
	[IsTop] [tinyint] NULL,
	[Comment] [tinyint] NULL,
	[IsTjDa] [tinyint] NULL,
	[IsSaveAnswer] [tinyint] NULL,
	[IsDelRecord] [tinyint] NULL,
	[Dtfs] [tinyint] NULL,
	[Verify] [tinyint] NULL,
	[AddDate] [datetime] NULL,
	[Hits] [int] NULL,
	[KeyTags] [varchar](255) NULL,
	[TestHits] [int] NULL,
	[SeoTitle] [varchar](255) NULL,
	[SeoKeyWords] [varchar](255) NULL,
	[SeoDescription] [varchar](255) NULL,
	[CmtNum] [int] NULL,
	[RealTest] [tinyint] NULL,
	[OpenTimeLimit] [tinyint] NULL,
	[TimeLimitBegin] [datetime] NULL,
	[TimeLimitEnd] [datetime] NULL,
	[ScorePubType] [tinyint] NULL,
	[ScorePubDate] [datetime] NULL,
	[RndST] [tinyint] NULL,
	[FullScreen] [tinyint] NULL,
	[RightTF] [tinyint] NULL,
	[PowerTF] [tinyint] NULL,
	[F5TF] [tinyint] NULL,
	[AuthorizationType] [tinyint] NULL,
	[AutoSaveTime] [int] NULL,
	[PJTeacher] [nvarchar](255) NULL,
	[CJDID] [int] NULL,
	[FrontSize] [int] NULL,
	[DoExamWay] [tinyint] NULL,
	[ShowOn3G] [tinyint] NULL,
	[SocialIDs] [varchar](255) NULL,
 CONSTRAINT [PK_KS_SJ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_Vote]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [KS_Vote](
	[VoteID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [ntext] NOT NULL,
	[BeginDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[VoteType] [tinyint] NULL,
	[LimitIP] [int] NULL,
	[UserTF] [int] NULL,
	[InfoID] [int] NULL,
 CONSTRAINT [PK_KS_Vote] PRIMARY KEY CLUSTERED 
(
	[VoteID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[KS_GetUserByGroupIDS]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_GetUserByGroupIDS]
@GroupIDS varchar(200)
 AS
 Declare @SQL Varchar(1000)
 Set @SQL='SELECT UserID,UserFace,UserName,RealName,Email,Sex,IDCard FROM [KS_USER] WHERE GroupID in'+'('+@GroupIDs+')'+' Order BY UserID Desc'
 Exec (@SQL)
GO
/****** Object:  Table [dbo].[KS_ProGroupBuyConsumer]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProGroupBuyConsumer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InfoID] [int] NULL,
	[AddDate] [datetime] NULL,
	[OrderID] [varchar](100) NULL,
	[UserName] [varchar](50) NULL,
	[Remark] [ntext] NULL,
	[Times] [int] NULL,
	[Mobile] [varchar](100) NULL,
 CONSTRAINT [PK_KS_ProGroupBuyConsumer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[KS_GetUserByDepartIDS]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_GetUserByDepartIDS]
@departids varchar(200)
 AS
 Declare @SQL Varchar(1000)
 Set @SQL='SELECT UserID,UserFace,UserName,RealName,Email,Sex,IDCard FROM [KS_USER] WHERE departID in'+'('+@departids+')'+' Order BY UserID Desc'
 Exec (@SQL)
GO
/****** Object:  Table [dbo].[KS_ViewRecords]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ViewRecords](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[basicType] [int] NULL,
	[channelid] [int] NULL,
	[infoid] [int] NULL,
	[adddate] [datetime] NULL,
 CONSTRAINT [PK_KS_ViewRecords] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_ProCommentReply]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_ProCommentReply](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [text] NULL,
	[adddate] [datetime] NULL,
	[status] [tinyint] NULL,
	[username] [varchar](50) NULL,
	[userip] [varchar](50) NULL,
	[cmtid] [int] NULL,
	[userid] [int] NULL,
 CONSTRAINT [PK_KS_ProCommentReply] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KS_BlogNav]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [KS_BlogNav](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[UserName] [varchar](255) NULL,
	[BlogId] [int] NULL,
	[NavName] [varchar](255) NULL,
	[NavId] [int] NULL,
	[NavAlias] [varchar](255) NULL,
	[NavOrderId] [int] NULL,
	[OwnSys] [tinyint] NULL,
	[CustomPage] [text] NULL,
	[Flag] [tinyint] NULL,
	[Marks] [text] NULL,
 CONSTRAINT [PK_KS_BLOGNAV] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[KS_ProUpdateCouponUser]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProUpdateCouponUser]
@CouponUserId int,
@OrderId varchar(100),
@AllowOffsetMoney money=0,
@UserName nvarchar(100),
@Note Ntext
 AS
  UPDATE [KS_ProCouponUser] Set
    UseFlag=1,
    UserName=@UserName,
    UseTime=GetDate(),
    OrderID=@OrderID,
    [Note]=@Note,
    AvailableMoney=AvailableMoney-@AllowOffsetMoney
  WHERE CouponUserId=@CouponUserId
GO
/****** Object:  StoredProcedure [dbo].[KS_ProCouponUserAdd]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProCouponUserAdd]
@CouponID int=0,
@couponNum varchar(100),
@userName varchar(100),
@AvailableMoney money=0,
@mailTF tinyint=0
 AS

 INSERT Into [KS_ProCouponUser](
   CouponID,CouponNum,UserName,AvailableMoney,MailTF,UseFlag,OrderID,AddDate
) values(
  @CouponID,@CouponNum,@UserName,@AvailableMoney,@MailTF,0,'',GetDate()
)
 return @@identity
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetCouponByCouponNum]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProGetCouponByCouponNum]
@CouponNum varchar(50)
 AS
SELECT Top 1 A.FaceValue,A.MinAmount,A.MaxDiscount,b.AvailableMoney,A.BeginDate,a.EndDate,a.Status,B.CouponUserID,B.Note,A.CouponType,B.UserName FROM KS_ProCoupon A Inner Join KS_ProCouponUser B On A.CouponID=B.CouponID Where B.CouponNum=@CouponNum
GO
/****** Object:  StoredProcedure [dbo].[KS_ProLimitBuyCheckPayEndTime]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProLimitBuyCheckPayEndTime]
 AS
Select i.Infoid,i.Num,i.OrderID,o.paytime,L.LimitBuyPayTime,O.status,O.InputTime From (KS_ProOrderItem i inner join ks_ProOrder o on i.orderid=o.orderid) inner join KS_ProLimitBuy L on I.LimitBuyTaskID=L.TaskID Where (L.LimitBuyPayTime)<>0 and i.IsLimitBuy<>0 and o.status=0 and o.MoneyReceipt=0
GO
/****** Object:  StoredProcedure [dbo].[KS_ProLimitBuyUpdate]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProLimitBuyUpdate]
@taskname nvarchar(255),
@tasktype int=0,
@limitbuybegintime datetime,
@limitbuyendtime datetime,
@limitbuypaytime int=0,
@intro ntext,
@status   tinyint=0,
@templatefile varchar(255),
@recommend tinyint=0,
@photourl varchar(255),
@jgrange varchar(255),
@taskid  int=0,
@isrepeat int output
 AS
  If  exists(select top 1 *  From KS_ProLimitBuy Where TaskName=@taskname And taskID<>@taskid)
  begin
   select @isrepeat=-2 /*重名*/
   return null
  end 
 Else
  Update [KS_ProLimitBuy] Set
   TaskName=@taskname,
   TaskType=@tasktype,
   LimitBuyBeginTime=@limitbuybegintime,
   LimitBuyEndTime=@limitbuyendtime,
   LimitBuyPayTime=@limitbuypaytime,
   Intro=@intro,
  TemplateFile=@templatefile,
   recommend=@recommend,
   photourl=@photourl,
  jgrange=@jgrange,
   Status=@status
  Where taskid=@taskid
 select @isrepeat=0
GO
/****** Object:  StoredProcedure [dbo].[KS_ProLimtBuyStatus]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProLimtBuyStatus] 
 @taskIds nvarchar(4000)
AS
  if @taskIds=''
  return null
 else
  begin

    declare @sql nvarchar(4000),@taskid int,@status int
    set @sql='declare rs cursor for select taskid,status From KS_ProLimitBuy Where taskid in('+@taskIds+')'
    exec (@sql)
     open rs
     fetch next from rs
     into @taskid,@status
     while @@fetch_status=0
     begin
         if @status=1
           update KS_ProLimitBuy Set Status=0 Where taskid=@taskid
        else
          update KS_ProLimitBuy Set Status=1 Where taskid=@taskid
         fetch next from rs
         into @taskid,@status
     end
     close rs
     deallocate rs
 end
GO
/****** Object:  StoredProcedure [dbo].[KS_ProLimitBuyAdd]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProLimitBuyAdd]
@taskname nvarchar(255),
@tasktype int=0,
@limitbuybegintime datetime,
@limitbuyendtime datetime,
@limitbuypaytime int=0,
@intro ntext,
@adddate datetime,
@status   tinyint=0,
@templatefile varchar(255),
@recommend tinyint=0,
@photourl varchar(200),
@jgrange varchar(255),
@isrepeat int output
 AS
  if exists(select top 1 taskid from [KS_ProLimitBuy] where taskname=@taskname)
   begin
    select @isrepeat=-2
   return null
   end
 else
   begin
  Insert Into [KS_ProLimitBuy](TaskName,TaskType,LimitBuyBeginTime,LimitBuyEndTime,LimitBuyPayTime,Intro,Status,AddDate,TemplateFile,Recommend,PhotoUrl,JGRange)
  values(@taskname,@tasktype,@limitbuybegintime,@limitbuyendtime,@limitbuypaytime,@intro,@status,@adddate,@templatefile,@recommend,@photoUrl,@jgrange)
   select @isrepeat=0
  end
GO
/****** Object:  StoredProcedure [dbo].[KS_ShopProImages]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ShopProImages] 
 @ID int=0
AS
 SELECT TOP 500 a.title,b.* FROM KS_ProductList A Left Join KS_ProImages B On A.InfoID=B.InfoID WHERE a.InfoID=@ID order by orderid,id
GO
/****** Object:  StoredProcedure [dbo].[KS_ProOrderDelete]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProOrderDelete]
@orderID varchar(100)
 AS
 DELETE FROM [KS_ProOrderBundleSale] Where CartID in(Select ItemID From [KS_ProOrderItem] Where OrderID=@OrderID)
 DELETE FROM [KS_ProOrderItem] Where OrderID=@OrderID
 DELETE FROM [KS_ProOrder] Where OrderID=@OrderID
 DELETE FROM [KS_ProOrderLog] Where OrderID=@OrderID
 DELETE FROM [KS_ProGroupBuyConsumer]  Where OrderID=@OrderID
GO
/****** Object:  StoredProcedure [dbo].[KS_ProShoppingCartAdd]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProShoppingCartAdd] 
 @infoId int=0,
  @price money=0,
  @num int=0,
  @username nvarchar(255),
  @adddate datetime,
  @IsAnonymous tinyint=0,
  @IsChangeBuy tinyint=0,
  @isBundleSale tinyint=0,
  @isLimitBuy tinyint=0,
  @limitBuyTaskId int=0,
  @attrid int=0,
  @flag int=0,
  @cityid int=0,
  @bookcode varchar(100),
  @cartid int out,
  @minnum int=0 out,
  @maxnum int=0 out
AS
 DECLARE @MinOrderNum int,@MaxOrderNum int,@Amount int
 Select top 1 @MinOrderNum=MinOrderNum,@MaxOrderNum=MaxOrderNum,@Amount=Amount From [KS_ProductList] Where InfoID=@InfoID
 If (@MinOrderNum<>0 And @num<@MinOrderNum and @IsChangeBuy=0)
  begin
   select @cartid=-3
   select @minnum=@minordernum
   select @maxnum=@maxordernum
  return
  end
 Else If(@MaxOrderNum<>0 And @Num>@MaxOrderNum and @IsChangeBuy=0)
  Begin
    select @cartid=-4
    select @minnum=@minordernum
    select @maxnum=@maxordernum
   return
  End 
 Else
  Begin
     if @isbundlesale=1 
      Begin
        Select @CartID=CartID From [KS_ProShoppingCart] Where UserName=@UserName and isBundleSale=1
        Delete From [KS_ProShoppingCart] Where UserName=@UserName and isBundleSale=1
        Delete From [KS_ProBundleSelect] Where CartID=@CartID
      End
     if not exists(select top 1 cartid from [KS_ProShoppingCart] where infoid=@infoid and attrid=@attrid and username=@username)
      Begin
      INSERT INTO [KS_ProShoppingCart] 
      (InfoID,Price,Num,UserName,IsAnonymous,IsChangeBuy,IsBundleSale,IsLimitBuy,LimitBuyTaskID,AddDate,AttrID,Flag,CityID,BookCode)
      Values(@InfoID,@Price,@Num,@UserName,@IsAnonymous,@IsChangeBuy,@IsBundleSale,@IsLimitBuy,@LimitBuyTaskID,@AddDate,@attrid,@flag,@cityid,@bookcode)
      select @cartid=@@identity
     End 
    Else
	  Begin
	   UPDATE [KS_ProShoppingCart] SET Num=@Num where infoid=@infoid and attrid=@attrid and username=@username
     select @cartid=-2
	  End
 End
 select @minnum=0
 select @maxnum=0
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetProFromCart]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProGetProFromCart] 
@userName nvarchar(50)
AS
select top 100 C.*,i.amount,i.channelid,i.classid,i.turnurl,i.filename,i.title,i.DefaultPic,i.IsGroupRate,i.groupprice,i.attributecart,i.price as price_market,i.price_member,i.taxtf,i.tax,i.Score,I.IsLimitBuy,I.LimitBuyPrice,I.LimitBuyAmount,i.IsScoreChange,I.ChangeScore,I.PayType,i.payid,I.FrontPrice,i.LimitBeginDate,i.LimitEndDate,i.IsBookCode,i.BookCodeTypeID,i.LimitCityNum,i.producttype,i.IsPromotions FROM [KS_ProShoppingCart] C Inner Join [KS_ProductList] I ON C.InfoID=I.InfoID Where C.Flag=0 and C.UserName=@userName order by C.isChangeBuy ,C.IsBundleSale,C.CartID
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetProFromOrderItem]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProGetProFromOrderItem]
@OrderID varchar(100)
AS
Select top 100  TurnUrl,I.FileName,I.InfoID,I.ClassID,I.InfoID,I.ChannelID,I.Score,I.Price_Member,I.Title as ITitle,I.DefaultPic,I.Price as Price_Market,I.Weight,I.Unit,I.AttributeCart,I.IsPromotions,I.ProductType,O.* From KS_ProOrderItem o left join KS_ProductList i on o.infoid=i.infoid Where O.OrderID=@OrderID order by O.ItemID
GO
/****** Object:  StoredProcedure [dbo].[KS_ProOrderAddBundleSale]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProOrderAddBundleSale] 
@infoID int=0,
@cartId int=0
AS
 DECLARE @ItemId int
 Select @ItemId=max(itemid) From KS_ProOrderItem
 insert into [KS_ProOrderBundleSale] Select CartId,InfoID,Title,Price,Num,getdate() From KS_ProBundleSelect Where cartId=@cartID
 Update  [KS_ProOrderBundleSale] Set CartId=@ItemId Where CartId=@cartId
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetProFromOrderBundleSale]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProGetProFromOrderBundleSale] 
@infoId int=0,
@cartId int=0
AS
Select I.Title,I.Weight,I.Price as Price_Market,I.Amount,I.Score,b.attrid From KS_ProOrderBundleSale S  inner join KS_ProBundleSale B on S.InfoID=b.id left Join KS_ProductList I ON b.kbInfoID=I.InfoID Where S.CartID=@CartID
GO
/****** Object:  StoredProcedure [dbo].[KS_AdminModifyPass]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_AdminModifyPass] 
@userName nvarchar(255),
@oldPassWord nvarchar(255),
@newPassWord nvarchar(255),
@result int out
AS
if exists(select top 1 * from KS_Admin Where [userName]=@userName and [passWord]=@oldPassWord)
   begin       
    update KS_Admin Set [passWord]=@newPassWord Where [userName]=@userName
    select @result=1
   end
else
   begin
   select @result=2
   end
GO
/****** Object:  StoredProcedure [dbo].[KS_SJTKModify]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_SJTKModify]
@tmid int=0,
@classid int=0,
@tmtype int=0,
@title nvarchar(255),
@tmnr ntext,
@dajs ntext,
@tmfs float=0,
@answer ntext,
@optionnum int=0,
@orderid int=0,
@isrnd tinyint=0,
@ismedia tinyint=0,
@mediaurl varchar(255),
@mediatxt ntext,
@dajsmedia varchar(255),
@difficulty int=0,
@knowledgeid int=0,
@keywords nvarchar(255)
 AS
 UPDATE KS_SJTK SET 
 [classid]=@classid,
 [tmtype]=@tmtype,
 [title]=@title,
 [tmnr]=@tmnr,
 [dajs]=@dajs,
 [tmfs]=@tmfs,
 [answer]=@answer,
 [optionnum]=@optionnum,
 [orderid]=@orderid,
 [isrnd]=@isrnd,
 [ismedia]=@ismedia,
 [mediaurl]=@mediaurl,
 [mediatxt]=@mediatxt,
 [dajsmedia]=@dajsmedia,
 [difficulty]=@difficulty,
 [knowledgeid]=@knowledgeid,
 [keywords]=@keywords WHERE tmid=@tmid
GO
/****** Object:  StoredProcedure [dbo].[KS_SJTKAdd]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_SJTKAdd]
@typeid int=0,
@classid int=0,
@tmtype int=0,
@title nvarchar(255),
@tmnr ntext,
@dajs ntext,
@tmfs float=0,
@answer ntext,
@optionnum int=0,
@orderid int=0,
@isrnd tinyint=0,
@ismedia tinyint=0,
@mediaurl varchar(255),
@mediatxt ntext,
@dajsmedia varchar(255),
@difficulty int=0,
@knowledgeid int=0,
@keywords nvarchar(255)
 AS
Insert Into KS_SJTK([typeid],[classid],[tmtype],[title],[tmnr],[dajs],[tmfs],[answer],[optionnum],[orderid],[isrnd],[ismedia],[mediaurl],[mediatxt],[dajsmedia],[difficulty],[knowledgeid],[keywords])                  
values(@typeid,@classid,@tmtype,@title,@tmnr,@dajs,@tmfs,@answer,@optionnum,@orderid,@isrnd,@ismedia,@mediaurl,@mediatxt,@dajsmedia,@difficulty,@knowledgeid,@keywords)
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionItemAdd]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CollectionItemAdd]
@itemname nvarchar(255),
@modelid int=0,
@classid int ,
@sitename nvarchar(255),
@collecturl nvarchar(255),
@encoding nvarchar(100),
@attribute nvarchar(100),
@collectoption nvarchar(100),
@collectlistnum int=0,
@collectinfonum int=0,
@pausepernum int=0,
@pausetime int=0,
@remark nvarchar(255),
@adddate datetime,
@id int output
AS
	INSERT INTO KS_CollectionItem(ItemName,ModelID,ClassID,SiteName,CollectUrl,Encoding,Attribute,CollectOption,CollectListNum,CollectInfoNum,PausePerNum,PauseTime,Remark,AddDate) VALUES(@itemname,@modelid,@classid,@sitename,@collecturl,@encoding,@attribute,@collectoption,@collectlistnum,@collectinfonum,@pausepernum,@pausetime,@remark,@adddate)
select @id=@@identity
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionItemUpdate1]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CollectionItemUpdate1]
  @ItemName varchar(255),
  @ClassID int,
  @SiteName varchar(255),
  @CollectUrl varchar(255),
  @Encoding varchar(50),
  @Attribute varchar(50),
  @CollectOption varchar(50),
  @CollectListNum int=0,
  @CollectInfoNum int=0,
  @PausePerNum int=0,
  @PauseTime int=0,
  @Remark varchar(255),
  @ItemID int
 AS
  Update [KS_CollectionItem] SET 
      [ItemName]=@ItemName,
      [ClassID]=@ClassID,
      [SiteName]=@SiteName,
      [CollectUrl]=@CollectUrl,
      [Encoding]=@Encoding,
      [Attribute]=@Attribute,
      [CollectOption]=@CollectOption,
      [CollectListNum]=@CollectListNum,
      [CollectInfoNum]=@CollectInfoNum,
      [PausePerNum]=@PausePerNum,
      [PauseTime]=@PauseTime,
      [Remark]=@Remark
   WHERE ItemID=@ItemID
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionItemCopy]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CollectionItemCopy]
@ItemName nvarchar(255),
@ModelID int=0,
@classid int ,
@sitename nvarchar(255),
@collecturl nvarchar(255),
@encoding nvarchar(100),
@attribute nvarchar(100),
@collectoption nvarchar(100),
@collectlistnum int=0,
@collectinfonum int=0,
@pausepernum int=0,
@pausetime int=0,
@remark nvarchar(255),
@adddate datetime,
@ListBeginTag ntext,
@ListEndTag ntext,
@LinkBeginTag ntext,
@LinkEndTag ntext,
@PageType int,
@PageUrl ntext,
@PageStartID int,
@PageEndID int,
@PageListUrl nvarchar(255),
@FieldsRuleXml ntext,
@IsCanCollect int,
@LastCollectTime datetime
AS
	INSERT INTO KS_CollectionItem([ItemName],[ModelID],[ClassID],[SiteName],[CollectUrl],[Encoding],[Attribute],[CollectOption],[CollectListNum],[CollectInfoNum],[PausePerNum],[PauseTime],[Remark],[AddDate],[ListBeginTag],[ListEndTag],[LinkBeginTag],[LinkEndTag],[PageType],[PageUrl],[PageStartID],[PageEndID],[PageListUrl],[FieldsRuleXml],[IsCanCollect],[LastCollectTime]) VALUES(@ItemName,@ModelID,@ClassID,@SiteName,@CollectUrl,@Encoding,@Attribute,@CollectOption,@CollectListNum,@CollectInfoNum,@PausePerNum,@PauseTime,@Remark,@AddDate,@ListBeginTag,@ListEndTag,@LinkBeginTag,@LinkEndTag,@PageType,@PageUrl,@PageStartID,@PageEndID,@PageListUrl,@FieldsRuleXml,@IsCanCollect,@LastCollectTime)
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionItemUpdate3]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CollectionItemUpdate3]
  @FieldsRuleXml Ntext ,
  @ItemID int
 AS
  Update [KS_CollectionItem] SET  [FieldsRuleXml]=@FieldsRuleXml Where ItemID=@ItemID
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionItemUpdate2]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CollectionItemUpdate2]
  @ListBeginTag ntext,
  @ListEndTag ntext,
  @LinkBeginTag ntext,
  @LinkEndTag ntext,
  @PageType int=0,
  @PageUrl varchar(255),
  @PageStartID int,
  @PageEndID int,
  @PageListUrl ntext,
  @ItemID int
 AS
  Update [KS_CollectionItem] SET 
    ListBeginTag=@ListBeginTag,
ListEndTag=@ListEndTag, 
LinkBeginTag=@LinkBeginTag,
LinkEndTag=@LinkEndTag,
PageType=@PageType,
PageUrl=@PageUrl,
PageStartID=@PageStartID,
PageEndID=@PageEndID,
PageListUrl=@PageListUrl
   WHERE ItemID=@ItemID
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionHistoryInsert]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CollectionHistoryInsert]
  @ItemID int,
  @ModelID int,
  @ClassID int,
  @InfoID int ,
  @Title varchar(255),
  @ItemUrl varchar(255),
  @Remark varchar(255),
  @IsSucceed tinyint,
  @RecordTime datetime
 AS
   INSERT INTO [KS_CollectionHistory] 
      ([ItemID],[ModelID],[ClassID],[InfoID],[Title],[ItemUrl],[Remark],[IsSucceed],[RecordTime])
      Values(@ItemID,@ModelID,@ClassID,@InfoID,@Title,@ItemUrl,@Remark,@IsSucceed,@RecordTime)
GO
/****** Object:  StoredProcedure [dbo].[KS_DelDigg]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_DelDigg]
@id int,
@num int=0
 AS
 Set NoCount ON
 DECLARE @DiggId int
 select top 1 @DiggId=diggid From KS_Digg Where ID=@id
 Update KS_DiggList Set SupportNum=SupportNum-@num ,AgainstNum=AgainstNum-@num  Where DiggID=@DiggID
 Delete From KS_Digg Where ID=@id
GO
/****** Object:  StoredProcedure [dbo].[KS_VoteAdd]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_VoteAdd]
@subject nvarchar(500),
@begindate datetime=getdate,
@expiredate datetime=getdate,
@votetype int=0,
@limitip int=0,
@infoid int=0,
@usertf int=0
 AS
Insert Into KS_vote([subject],[begindate],[expiredate],[votetype],[limitip],[infoid],[usertf])                  
values(@subject,@begindate,@expiredate,@votetype,@limitip,@infoid,@usertf)

 If @InfoID!=0
      Begin
       UPDATE [KS_InfoList] Set VoteID=@@identity  WHERE InfoID=@InfoID
     End
GO
/****** Object:  StoredProcedure [dbo].[KS_ModelGetMaxID]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ModelGetMaxID] AS

 declare @modelid int
 if (exists(select top 1 channelid from ks_model))
   begin
    select @modelid=max(channelid) from ks_model
    set @modelid=@modelid+1
   end 
 else
   begin
   set @modelid=1
   end
   select @modelid
GO
/****** Object:  StoredProcedure [dbo].[KS_ModelClone]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ModelClone] 
@ModelName nvarchar(255),
@ModelTable nvarchar(255),
@ModelID int=0,
 @isrepeat int=1 output
As
  if exists(select top 1 * from ks_model where modelname=@modelname or modeltable=@modeltable)
   begin
    select @isrepeat=-2
   return null
   end
 else
   begin
  declare @MaxModelID  int
  declare @SQL nvarchar(4000)
  Select @MaxModelID=max(channelid)+1 FROM KS_Model
  Set @SQL='Insert Into [KS_Model]([channelid],[modeltype],[modelname],[modeltable],[modelitem],[modelitemunit],[modelstatus],[basictype],[modelfolder],[modelfsofolder],[fsolistnum],[intro],[chargesoption],[attributeoption],[receiptoption],[pkoption],[fieldsxml],[adminupfilestf],[adminupfilesdir],[userupfilestf],[userupfilesdir],[allowupfilessize],[allowupphototype],[allowupflashtype],[allowupmediatype],[allowuprealtype],[allowupothertype],[allowpublication],[publicationverify],[publicationrefreshhtmloption],[publicationmodifyverify],[commenttype],[commentlen],[newestday],[commenttemplate],[searchtemplate],[diggbyvisitor],[diggrepeat],[diggpertimes],[setting],[showoption],[seooption],[modelorderid]) 
    select '+convert(varchar(255),@MaxModelID)+',0,'''+convert(varchar(255),@ModelName)+''','''+convert(varchar(255),@ModelTable)+''',[modelitem],[modelitemunit],[modelstatus],[basictype],[modelfolder],[modelfsofolder],[fsolistnum],[intro],[chargesoption],[attributeoption],[receiptoption],[pkoption],[fieldsxml],[adminupfilestf],[adminupfilesdir],[userupfilestf],[userupfilesdir],[allowupfilessize],[allowupphototype],[allowupflashtype],[allowupmediatype],[allowuprealtype],[allowupothertype],[allowpublication],[publicationverify],[publicationrefreshhtmloption],[publicationmodifyverify],[commenttype],[commentlen],[newestday],[commenttemplate],[searchtemplate],[diggbyvisitor],[diggrepeat],[diggpertimes],[setting],[showoption],[seooption],modelorderid+1 from KS_Model where channelid='+convert(varchar(255),@ModelID)
   Exec (@SQL)
   Declare @Table nvarchar(4000)
   Select @Table=ModelTable From KS_Model Where channelid=@ModelID
   Set @SQL='select * into '+Convert(varchar(255),@modeltable)+' from '+@Table+' where 1=0'
   Exec (@SQL)
   Set @SQL=' alter table '+CONVERT(Nvarchar(255),@ModelTable)+' add constraint pk_'+convert(varchar(255),@ModelID)+'_infoid primary key(infoid)'
   Exec (@SQL)
   select @isrepeat=0
 end
GO
/****** Object:  StoredProcedure [dbo].[KS_TagsHits]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_TagsHits] 
 @KeyText nvarchar(100)
AS

  DECLARE @TagsHits int,@TodayHits int,@YesterDayHits int,@WeekHits int,@LastUseTime datetime
  DECLARE @NowDayHits int ,@NowYesterDayHits int, @NowWeekHits int, @NowHits int

    SELECT top 1 @TagsHits=TagsHits,@TodayHits=TodayHits,@YesterDayHits=YesterDayHits,@WeekHits=WeekHits,@LastUseTime=LastUseTime FROM [KS_KeyTags] WHERE KeyText=@KeyText
  

     Set @NowHits=@TagsHits+1
     If DateDiff(week,@LastUseTime, GetDate())<=0
       SET @NowWeekHits=@WeekHits+1
     Else
      SET @NowWeekHits=1
     IF DateDiff(day,@LastUseTime,GetDate())=1
      SET @NowYesterDayHits=@YesterDayHits+1
    ELSE
     SET @NowYesterDayHits=1
    IF DateDiff(day,@LastUseTime,GetDate())<=0
     SET @NowDayHits=@TodayHits+1
   Else
     Set @NowDayHits=1

     UPDATE [KS_KeyTags] Set TagsHits=@NowDayHits,WeekHits=@NowWeekHits,YesterDayHits=@NowYesterDayHits,TodayHits=@NowDayHits,LastUseTime=GetDate()  Where KeyText=@KeyText
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodProjectUpdate]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_MoodProjectUpdate]
@ProjectName nvarchar(255),
@Status int=0,
@ProjectContent nvarchar(4000),
@TimeLimit tinyint=0,
@StartDate SmallDateTime=getdate,
@ExpiredDate SmallDateTime=getdate,
@OnlyUser tinyint=0,
@UserOnce tinyint=0,
@AllowGroupID nvarchar(500),
@ProjectID int=0,
 @isrepeat int=1 output

 AS
  If  exists(select top 1 *  From KS_MoodProject Where ProjectName=@ProjectName And ProjectID<>@ProjectID)
  begin
   select @isrepeat=-2 /*重名*/
   return null
  end 
 Else
  Update KS_MoodProject Set
   ProjectName=@ProjectName,
   Status=@Status,
   ProjectContent=@ProjectContent,
   TimeLimit=@TimeLimit,
   StartDate=@StartDate,
   ExpiredDate=@ExpiredDate,
   OnlyUser=@OnlyUser,
   UserOnce=@UserOnce,
   AllowGroupID=@AllowGroupID
  Where projectid=@ProjectID
 select @isrepeat=0
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodProjectStatus]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_MoodProjectStatus] 
 @Projectids nvarchar(4000)
AS
  if @projectids=''
  return null
 else
  begin

    declare @sql nvarchar(4000),@projectid int,@status int
    set @sql='declare rs cursor for select projectid,status From KS_MoodProject Where projectid in('+@ProjectIDs+')'
    exec (@sql)
     open rs
     fetch next from rs
     into @projectid,@status
     while @@fetch_status=0
     begin
         if @status=1
           update KS_MoodProject Set Status=0 Where projectid=@projectid
        else
          update KS_MoodProject Set Status=1 Where projectid=@projectid
         fetch next from rs
         into @projectid,@status
     end
     close rs
     deallocate rs
 end
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodProjectAdd]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_MoodProjectAdd]
@ProjectName nvarchar(255),
@Status int=0,
@ProjectContent nvarchar(4000),
@TimeLimit tinyint=0,
@StartDate SmallDateTime=getdate,
@ExpiredDate SmallDateTime=getdate,
@OnlyUser tinyint=0,
@UserOnce tinyint=0,
@AllowGroupID nvarchar(500),
 @isrepeat int=1 output
AS

 if exists(select top 1 * from KS_MoodProject Where ProjectName=@ProjectName)
   begin       
    select @isrepeat=-2 /*重名*/
    return null
   end 
else
	INSERT INTO KS_MoodProject(ProjectName,Status,ProjectContent,TimeLimit,StartDate,[ExpiredDate],OnlyUser,UserOnce,AllowGroupID) VALUES(@ProjectName,@Status,@ProjectContent,@TimeLimit,@StartDate,@ExpiredDate,@OnlyUser,@UserOnce,@AllowGroupID)
          select @isrepeat=0
GO
/****** Object:  StoredProcedure [dbo].[KS_GetMoodProjectInfo]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_GetMoodProjectInfo]
 @projectid int=0
 AS
 Select top 1 * From KS_MoodProject Where projectid=@projectid
GO
/****** Object:  StoredProcedure [dbo].[KS_MoodProjectHits]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_MoodProjectHits] 
@MoodId int=0,
@ChannelID int,
@InfoID int,
@ItemID int,
@Title nvarchar(255)
as
declare @sql nvarchar(4000)
 if exists(select top 1 * from KS_MoodList Where moodid=@MoodID and ChannelID=@ChannelID and infoid=@infoid)
   begin
     set @sql='UPDATE KS_MoodList Set M'+convert(varchar(100),@itemid)+'=m'+convert(varchar(100),@itemid)+'+1 where moodid='+convert(varchar(100),@MoodID)+' and ChannelID='+Convert(varchar(100),@ChannelID)+' and infoid='+convert(varchar(200),@infoid)
     exec (@sql)
   end 
 else
   begin
       set @sql='insert into KS_MoodList(moodid,channelid,infoid,title,m'+convert(varchar(100),@itemid)+') values('+convert(varchar(100),@MoodID)+','+convert(varchar(100),@ChannelID)+','+convert(varchar(100),@InfoID)+','''+convert(varchar(255),@Title)+''',1)'
       exec (@sql)
   end
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDVerify]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKGDVerify] 
 @Ids nvarchar(4000)
AS
  if @Ids=''
  return null
 else
  begin

    declare @sql nvarchar(4000),@gdid int,@status int
    set @sql='declare rs cursor for select id,status From KS_PKGD Where id in('+@Ids+')'
    exec (@sql)
     open rs
     fetch next from rs
     into @gdid,@status
     while @@fetch_status=0
     begin
         if @status=1
           update KS_PKGD Set Status=0 Where id=@gdid
        else
          update KS_PKGD Set Status=1 Where id=@gdid
         fetch next from rs
         into @gdid,@status
     end
     close rs
     deallocate rs
 end
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGDAdd]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKGDAdd]
@pkid int=0,
@username nvarchar(50),
@content nvarchar(3000),
@userip nvarchar(50),
@status tinyint=0,
@adddate smalldatetime,
@role   tinyint=0
 AS
  Insert Into [KS_PKGD](PKID,UserName,Content,UserIP,Status,AddDate,Role)
  values(@pkid,@UserName,@Content,@UserIP,@Status,@AddDate,@Role)
  If @Role=1
   Update KS_PKZT Set ZFVotes=ZFVotes+1 Where PKID=@PKID
  Else If @Role=2
   Update KS_PKZT Set FFVotes=FFVotes+1 Where PKID=@PKID
  Else
   Update KS_PKZT Set SFVotes=SFVotes+1 Where PKID=@PKID
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGetGDInfo]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKGetGDInfo]
@id int=0
 AS
SELECT TOP 1 * FROM KS_PKGD WHERE id=@id
GO
/****** Object:  StoredProcedure [dbo].[KS_ProGetProFromBundleSale]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProGetProFromBundleSale] 
@infoId int=0,
@cartId int=0
AS
Select I.Title,I.Weight,I.Price as Price_Market,I.Amount,I.Score,B.kbprice,s.ATTRID From KS_ProBundleSelect S Inner Join KS_ProBundleSale B ON S.InfoID=B.id Inner Join KS_ProductList I ON b.kbinfoid=I.InfoID Where B.InfoID=@InfoID And S.CartID=@CartID
GO
/****** Object:  StoredProcedure [dbo].[KS_ProCartAddBundleSale]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProCartAddBundleSale] 
 @infoid int=0,
 @cartId int=0
AS
 DECLARE @Title nvarchar(200),@KBPrice money,@AttrId int
 
 Delete From KS_ProBundleSelect Where CartID=@CartID And InfoID=@infoid
 
 Select top 1 @Title=I.Title,@KBPrice=K.KBPrice,@AttrId=K.attrid From [KS_ProBundleSale] K inner Join [KS_ProductList] I On I.infoid=K.kbinfoid Where k.ID=@infoid

  INSERT INTO [KS_ProBundleSelect] 
      (cartID,infoId,attrid,Title,Price,Num,AddDate)
      Values(@cartID,@infoid,@AttrId,@Title,@KBPrice,1,getdate())
GO
/****** Object:  StoredProcedure [dbo].[KS_ContentItemAdd]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ContentItemAdd]
  @channelid int,
  @classid int,
  @title varchar(255),
  @titlefontcolor varchar(50),
  @intro varchar(255),
  @defaultpic varchar(255),
  @keytags varchar(255),
  @hits int,
  @copyfrom varchar(255),
  @author varchar(255),
  @adddate datetime,
  @attribute varchar(255),
  @priority varchar(100),
  @inputer varchar(100),
  @verify int,
  @refreshtf int,
  @filename varchar(255),
  @turnurl varchar(255),
  @provinceid int,
  @cityid int,
  @countyid int,
  @infopurview int,
  @arrgroupid varchar(255),
  @readpoint int,
  @chargetype int,
  @pitchtime int,
  @readtimes money,
  @dividepercent int,
  @attachmentcharge int,
  @attachmentchargeonce int,
  @showon3g int=0,
  @itemid int output
 AS
  INSERT INTO [KS_InfoList](channelid,classid,title,titlefontcolor,intro,defaultpic,keytags,hits,copyfrom,author,adddate,attribute,priority,inputer,verify,refreshtf,filename,turnurl,provinceid,cityid,countyid,infopurview,arrgroupid,readpoint,chargetype,pitchtime,readtimes,dividepercent,attachmentcharge,attachmentchargeonce,showon3g) VALUES(@channelid,@classid,@title,@titlefontcolor,@intro,@defaultpic,@keytags,@hits,@copyfrom,@author,@adddate,@attribute,@priority,@inputer,@verify,@refreshtf,@filename,@turnurl,@provinceid,@cityid,@countyid,@infopurview,@arrgroupid,@readpoint,@chargetype,@pitchtime,@readtimes,@dividepercent,@attachmentcharge,@attachmentchargeonce,@showon3g)
select @itemid=@@identity
GO
/****** Object:  StoredProcedure [dbo].[KS_ItemHits]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ItemHits] 
 @Action varchar(50),
 @InfoID Int=0,
 @GetFlag int=0,
 @BasicType int=0,
 @OutHits int output
AS

  DECLARE @Hits int ,@dayhits int,@weekhits int,@monthhits int,@LastHitsTime datetime
  DECLARE @nowDayHits int ,@NowWeekHits int, @NowMonthHits int, @NowHits int
 If @BasicType=4 
    SELECT top 1 @Hits=Hits ,@DayHits=HitsByDay,@weekhits=HitsByWeek,@monthHits=HitsByMonth,@LastHitsTime=LastHitsTime FROM [KS_ProductList] WHERE InfoID=@InfoID
 Else
    SELECT top 1 @Hits=Hits ,@DayHits=HitsByDay,@weekhits=HitsByWeek,@monthHits=HitsByMonth,@LastHitsTime=LastHitsTime FROM [KS_InfoList] WHERE InfoID=@InfoID
  If @Action='count'
   BEGIN
     Set @NowHits=@Hits+1
     If DateDiff(week,@LastHitsTime, GetDate())<=0
       SET @NowWeekHits=@WeekHits+1
     Else
      SET @NowWeekHits=1
     IF DateDiff(month,@LastHitsTime,GetDate())<=0
      SET @NowMonthHits=@MonthHits+1
    ELSE
     SET @NowMonthHits=1
    IF DateDiff(day,@LastHitsTime,GetDate())<=0
     SET @NowDayHits=@DayHits+1
   Else
     Set @NowDayHits=1
   If @BasicType=4 
    UPDATE [KS_ProductList] Set Hits=@NowHits,HitsByWeek=@NowWeekHits,HitsByMonth=@NowMonthHits,HitsByDay=@NowDayHits,LastHitsTime=GetDate()  Where InfoID=@InfoID
    Else
     UPDATE [KS_InfoList] Set Hits=@NowHits,HitsByWeek=@NowWeekHits,HitsByMonth=@NowMonthHits,HitsByDay=@NowDayHits,LastHitsTime=GetDate()  Where InfoID=@InfoID

  END 
 Else
   Begin
     Set @NowHits=@Hits
     Set @NowDayHits=@DayHits
     Set @NowWeekHits=@WeekHits
     Set @NowMonthHits=@MonthHits
  END

  If @GetFlag=0 
     SELECT @OutHits= @NowHits
  Else If @GetFlag=1
     SELECT @OutHits= @NowDayHits
  Else If @GetFlag=2 
     SELECT @OutHits= @NowWeekHits
  Else If @GetFlag=3
     SELECT @OutHits=  @NowMonthHits
  Else
     SELECT @OutHits=  0
GO
/****** Object:  StoredProcedure [dbo].[KS_CommentNum]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CommentNum] 
 @InfoID Int=0,
 @BasicType int=0,
 @OutCommentNum int output
AS

  DECLARE @CommentNum int 
   If @BasicType=4 
    SELECT top 1 @CommentNum=CommentNum FROM [KS_ProductList] WHERE InfoID=@InfoID
 Else
    SELECT top 1 @CommentNum=CommentNum FROM [KS_InfoList] WHERE InfoID=@InfoID
    
    SELECT @OutCommentNum= @CommentNum
GO
/****** Object:  StoredProcedure [dbo].[KS_ShopItemAdd]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ShopItemAdd]
  @channelid int,
  @classid int,
  @title nvarchar(255),
  @titlefontcolor varchar(50),
  @producttype int,
  @proid nvarchar(100),
  @barcode nvarchar(150),
  @unit nvarchar(50),
  @weight float,
  @intro nvarchar(255),
  @defaultpic nvarchar(255),
  @bigphoto nvarchar(255),
  @keytags varchar(255),
  @hits int,
  @adddate datetime,
  @attribute varchar(255),
  @priority varchar(100),
  @inputer varchar(100),
  @verify int,
  @refreshtf int,
  @filename varchar(255),
  @attributecart varchar(255),
  @price money=0,
  @price_member money=0,
  @score money=0,
  @groupprice int =0,
  @ischangebuy int =0,
  @changebuyneedprice money=0,
  @changebuypresentprice money=0,
  @islimitbuy int=0,
  @limitbuytaskid int=0,
  @limitbuyprice money=0,
  @limitbuyamount int=0,
  @taxtf tinyint=0,
  @tax float=0,
  @amount int =0,
  @alarmnum int =0,
  @minordernum int=0,
  @maxordernum int =0,
  @attachmentcharge int=0,
  @attachmentchargeonce int=0,
  @turnurl varchar(255),
  @isscorechange int=0,
  @changescore int=0,
  @showon3g int=0,
  @paytype int=0,
  @payid int=0,
  @frontprice money=0,
  @limitbegindate datetime,
  @limitenddate datetime,
  @isbookcode int=0,
  @bookcodetypeid int=0,
  @limitcitynum int=0,
  @downurl varchar(255),
  @ispromotions int=0,
  @isgrouprate int=0,
  @provinceid int=0,
  @cityid int=0,
  @countyid int=0,
  @itemid int output
 AS
  INSERT INTO [KS_ProductList]

(channelid,classid,title,titlefontcolor,producttype,proid,barcode,unit,weight,intro,defaultpic,bigphoto,keytags,hits,adddate,attribute,priority,inputer,verify,refreshtf,filename,attributecart,price,price_member,score,groupprice,ischangebuy,changebuyneedprice,changebuypresentprice,islimitbuy,limitbuytaskid,limitbuyprice,limitbuyamount,taxtf,tax,amount,alarmnum,minordernum,maxordernum,attachmentcharge,attachmentchargeonce,turnurl,isscorechange,changescore,showon3g,paytype,payid,frontprice,limitbegindate,limitenddate,isbookcode,bookcodetypeid,limitcitynum,downurl,ispromotions,isgrouprate,provinceid,cityid,countyid) 
  VALUES

(@channelid,@classid,@title,@titlefontcolor,@producttype,@proid,@barcode,@unit,@weight,@intro,@defaultpic,@bigphoto,@keytags,@hits,@adddate,@attribute,@priority,@inputer,@verify,@refreshtf,@filename,@attributecart,@price,@price_member,@score,@groupprice,@ischangebuy,@changebuyneedprice,@changebuypresentprice,@islimitbuy,@limitbuytaskid,@limitbuyprice,@limitbuyamount,@taxtf,@tax,@amount,@alarmnum,@minordernum,@maxordernum,@attachmentcharge,@attachmentchargeonce,@turnurl,@isscorechange,@changescore,@showon3g,@paytype,@payid,@frontprice,@limitbegindate,@limitenddate,@isbookcode,@bookcodetypeid,@limitcitynum,@downurl,@ispromotions,@isgrouprate,@provinceid,@cityid,@countyid)
select @itemid=@@identity
GO
/****** Object:  StoredProcedure [dbo].[KS_ShopItemModify]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ShopItemModify]
   @classid int,
  @proid nvarchar(200),
  @title nvarchar(255),
  @titlefontcolor varchar(50),
  @producttype int,
  @barcode nvarchar(150),
  @unit nvarchar(50),
  @weight float,
  @intro nvarchar(255),
  @defaultpic nvarchar(255),
  @bigphoto nvarchar(255),
  @keytags varchar(255),
  @hits int,
  @adddate datetime,
  @attribute varchar(255),
  @priority varchar(100),
  @inputer varchar(100),
  @verify int,
  @attributecart varchar(255),
  @price money=0,
  @price_member money=0,
  @score int=0,
  @groupprice int =0,
  @ischangebuy int =0,
  @changebuyneedprice money=0,
  @changebuypresentprice money=0,
  @islimitbuy int=0,
  @limitbuytaskid int=0,
  @limitbuyprice money=0,
  @limitbuyamount int=0,
  @limitbegindate datetime,
  @limitenddate datetime,
  @taxtf tinyint=0,
  @tax float=0,
  @amount int =0,
  @alarmnum int =0,
  @minordernum int=0,
  @maxordernum int =0,
  @attachmentcharge int=0,
  @attachmentchargeonce int=0,
  @turnurl varchar(255),
  @isscorechange int=0,
  @changescore int=0,
  @showon3g int=0,
  @paytype int=0,
  @payid int=0,
  @frontprice money=0,
  @isbookcode int=0,
  @bookcodetypeid int=0,
  @limitcitynum int=0,
  @downurl varchar(255),
  @ispromotions int=0,
  @isgrouprate int=0,
  @provinceid int=0,
  @cityid int=0,
  @countyid int=0,
  @infoid int=0
 AS
  UPDATE [KS_ProductList]
  Set classid=@classid,
  proid=@proid,
  title=@title,
  titlefontcolor=@titlefontcolor,
  producttype=@producttype,
  barcode=@barcode,
  unit=@unit,
  weight=@weight,
  intro=@intro,
  defaultpic=@defaultpic,
  bigphoto=@bigphoto,
  keytags=@keytags, 
  hits=@hits,
  adddate=@adddate,
  attribute=@attribute,
  priority=@priority,
  inputer=@inputer,
  verify=@verify,
  attributecart=@attributecart,
  price=@price,
  price_member=@price_member,
  score=@score,
  groupprice=@groupprice,
  ischangebuy=@ischangebuy,
  changebuyneedprice=@changebuyneedprice,
  changebuypresentprice=@changebuypresentprice,
  islimitbuy=@islimitbuy,
  limitbuytaskid=@limitbuytaskid,
  limitbuyprice=@limitbuyprice,
  limitbuyamount=@limitbuyamount,
  taxtf=@taxtf,
  tax=@tax,
  amount=@amount,
  alarmnum=@alarmnum,
  minordernum=@minordernum,
  maxordernum=@maxordernum,
  attachmentcharge=@attachmentcharge,
  attachmentchargeOnce=@attachmentchargeonce,
  turnurl=@turnurl,
  isscorechange=@isscorechange,
  changescore=@changescore,
  showon3g=@showon3g,
  paytype=@paytype,
  payid=@payid,
  frontprice=@frontprice,
  limitbegindate=@limitbegindate,
  limitenddate=@limitenddate,
  isbookcode=@isbookcode,
  bookcodetypeid=@bookcodetypeid,
  limitcitynum=@limitcitynum,
  downurl=@downurl,
  ispromotions=@ispromotions,
  isgrouprate=@isgrouprate,
  provinceid=@provinceid,
  cityid=@cityid,
  countyid=@countyid
  Where InfoID=@infoid
GO
/****** Object:  StoredProcedure [dbo].[KS_CollectionFilterInsert]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_CollectionFilterInsert]
@FilterName nvarchar(255),
@FilterType int=0,
@BeginTag ntext ,
@EndTag ntext,
@ReplaceBody Ntext,
@AddDate SmallDateTime,
@Status int=0
AS
	INSERT INTO KS_CollectionFilter
                (FilterName,FilterType,BeginTag,EndTag,ReplaceBody,AddDate,Status)
              VALUES(@FilterName,@FilterType,@BeginTag,@EndTag,@ReplaceBody,@AddDate,@Status)
GO
/****** Object:  StoredProcedure [dbo].[KS_PKZTAddOrModify]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKZTAddOrModify] 
 @Title nvarchar(255),
 @ZFGD nvarchar(3000),
 @FFGD nvarchar(3000),
 @ZFVotes int=0,
 @FFVotes int=0,
 @SFVotes int=0,
 @UserTF tinyint=0,
 @OnceTF tinyint=0,
 @VerifyTF tinyint=0,
 @Status tinyint=0,
 @TimeLimit tinyint=0,
 @BeginDate smalldatetime=getdate,
 @EndDate smalldatetime=getdate,
 @InfoID int=0,
 @pkid int=0
AS
    If (exists(Select top 1 pkid From KS_PKZT Where InfoID=@InfoID) and @Infoid<>0) or (exists(select top 1 pkid from ks_pkzt where pkid=@pkid) and @pkid<>0)
     Begin  
     UPDATE KS_PKZT Set  Title=@Title, ZFGD=@ZFGD, FFGD=@FFGD, UserTF=@UserTF, OnceTF=@OnceTF, VerifyTF=@VerifyTF, Status=@Status,TimeLimit=@TimeLimit, BeginDate=@BeginDate, EndDate=@EndDate,ZFVotes=@ZFVotes,FFVotes=@FFVotes,SFVotes=@SFVotes   Where pkid=@PKID
    End
   else
     Begin
    INSERT INTO KS_PKZT(
      Title,ZFGD,FFGD,UserTF,OnceTF,VerifyTF,Status,TimeLimit,BeginDate,EndDate,InfoID,ZFVotes,FFVotes,SFVotes
    )
     VALUES(
     @Title,@ZFGD,@FFGD,@UserTF,@OnceTF,@VerifyTF,@Status,@TimeLimit,@BeginDate,@EndDate,@InfoID,@ZFVotes,@FFVotes,@SFVotes
   )
     If @InfoID!=0
      Begin
       SELECT @pkid=@@identity
       UPDATE [KS_InfoList] Set PKID=@pkid WHERE InfoID=@InfoID
     End
   End
GO
/****** Object:  StoredProcedure [dbo].[KS_PKGetInfo]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_PKGetInfo] 
@pkid int=0
AS
select top 1 * From KS_PKZT Where pkid=@pkid
GO
/****** Object:  StoredProcedure [dbo].[KS_ProCouponStatus]    Script Date: 04/01/2015 09:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [KS_ProCouponStatus] 
 @couponIds nvarchar(4000)
AS
  if @couponIds=''
  return null
 else
  begin

    declare @sql nvarchar(4000),@couponid int,@status int
    set @sql='declare rs cursor for select couponid,status From KS_ProCoupon Where couponid in('+@couponIds+')'
    exec (@sql)
     open rs
     fetch next from rs
     into @couponid,@status
     while @@fetch_status=0
     begin
         if @status=1
           update KS_ProCoupon Set Status=0 Where couponid=@couponid
        else
          update KS_ProCoupon Set Status=1 Where couponid=@couponid
         fetch next from rs
         into @couponid,@status
     end
     close rs
     deallocate rs
 end
GO
/****** Object:  Default [DF_KS_ProComment_ProID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_ProID]  DEFAULT (0) FOR [ProID]
GO
/****** Object:  Default [DF_KS_ProComment_StarNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_StarNum]  DEFAULT (0) FOR [StarNum]
GO
/****** Object:  Default [DF_KS_ProComment_CmtType]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_CmtType]  DEFAULT (0) FOR [CmtType]
GO
/****** Object:  Default [DF_KS_ProComment_Support]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_Support]  DEFAULT (0) FOR [Support]
GO
/****** Object:  Default [DF_KS_ProComment_CmtNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_CmtNum]  DEFAULT (0) FOR [CmtNum]
GO
/****** Object:  Default [DF_KS_ProComment_Status]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProComment] ADD  CONSTRAINT [DF_KS_ProComment_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProCouponUser_CouponId]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProCouponUser] ADD  CONSTRAINT [DF_KS_ProCouponUser_CouponId]  DEFAULT (0) FOR [CouponId]
GO
/****** Object:  Default [DF_KS_ProCouponUser_UseFlag]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProCouponUser] ADD  CONSTRAINT [DF_KS_ProCouponUser_UseFlag]  DEFAULT (0) FOR [UseFlag]
GO
/****** Object:  Default [DF_KS_ProCouponUser_AvailableMoney]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProCouponUser] ADD  CONSTRAINT [DF_KS_ProCouponUser_AvailableMoney]  DEFAULT (0) FOR [AvailableMoney]
GO
/****** Object:  Default [DF__KS_BlogInfo__Hit__66EA454A]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BlogInfo] ADD  DEFAULT (0) FOR [Hit]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_TaskType]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_TaskType]  DEFAULT (0) FOR [TaskType]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_LimitBuyBeginTime]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_LimitBuyBeginTime]  DEFAULT (getdate()) FOR [LimitBuyBeginTime]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_LimitBuyEndTime]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_LimitBuyEndTime]  DEFAULT (getdate()) FOR [LimitBuyEndTime]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_LimitBuyPayTime]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_LimitBuyPayTime]  DEFAULT (0) FOR [LimitBuyPayTime]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_Status]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProLimitBuy_Recommend]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProLimitBuy] ADD  CONSTRAINT [DF_KS_ProLimitBuy_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF__KS_UserRe__Recha__08362A7C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  DEFAULT (0) FOR [RechargeWay]
GO
/****** Object:  Default [DF__KS_UserRe__AddWa__092A4EB5]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  DEFAULT (0) FOR [AddWay]
GO
/****** Object:  Default [DF__KS_UserRe__FaceV__0A1E72EE]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  DEFAULT (0) FOR [FaceValue]
GO
/****** Object:  Default [DF__KS_UserRe__Point__0B129727]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  DEFAULT (0) FOR [PointNumber]
GO
/****** Object:  Default [DF__KS_UserRe__Point__0C06BB60]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  DEFAULT (0) FOR [PointType]
GO
/****** Object:  Default [DF__KS_UserRe__IsSel__0CFADF99]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  DEFAULT (0) FOR [IsSell]
GO
/****** Object:  Default [DF__KS_UserRe__IsUse__0DEF03D2]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  DEFAULT (0) FOR [IsUse]
GO
/****** Object:  Default [DF__KS_UserRe__UsedG__0EE3280B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  DEFAULT (0) FOR [UsedGroupId]
GO
/****** Object:  Default [DF__KS_UserRe__EndGr__0FD74C44]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserRechargeCard] ADD  DEFAULT (0) FOR [EndGroupId]
GO
/****** Object:  Default [DF__KS_ProIma__Order__3AC1AA49]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProImages] ADD  DEFAULT (0) FOR [OrderId]
GO
/****** Object:  Default [DF_KS_ProGroupPrice_InfoID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupPrice] ADD  CONSTRAINT [DF_KS_ProGroupPrice_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_ProGroupPrice_GroupID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupPrice] ADD  CONSTRAINT [DF_KS_ProGroupPrice_GroupID]  DEFAULT (0) FOR [GroupID]
GO
/****** Object:  Default [DF_KS_ProGroupPrice_Price]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupPrice] ADD  CONSTRAINT [DF_KS_ProGroupPrice_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF__KS_Blog__ClassID__34E9A0B9]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Blog] ADD  CONSTRAINT [DF__KS_Blog__ClassID__34E9A0B9]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_Blog__Templat__35DDC4F2]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Blog] ADD  CONSTRAINT [DF__KS_Blog__Templat__35DDC4F2]  DEFAULT (0) FOR [TemplateID]
GO
/****** Object:  Default [DF__KS_Blog__Hits__36D1E92B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Blog] ADD  CONSTRAINT [DF__KS_Blog__Hits__36D1E92B]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_BigClassID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_BigClassID]  DEFAULT (0) FOR [BigClassID]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_ClassID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_Locked]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_Locked]  DEFAULT (0) FOR [Locked]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_EndTF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_EndTF]  DEFAULT (0) FOR [EndTF]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_AllowBMFlag]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_AllowBMFlag]  DEFAULT (0) FOR [AllowBMFlag]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_minnum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_minnum]  DEFAULT (0) FOR [minnum]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_minnumtime]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_minnumtime]  DEFAULT (getdate()) FOR [minnumtime]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_IsSuccess]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_IsSuccess]  DEFAULT (0) FOR [IsSuccess]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_Discount]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_Discount]  DEFAULT (0) FOR [Discount]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_Weight]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_Weight]  DEFAULT (0) FOR [Weight]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_LimitBuyNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_LimitBuyNum]  DEFAULT (0) FOR [LimitBuyNum]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_Recommend]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_ProvinceID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_ProvinceID]  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_CityID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_CityID]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_HasSellNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_HasSellNum]  DEFAULT (0) FOR [HasSellNum]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_RealSellNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_RealSellNum]  DEFAULT (0) FOR [RealSellNum]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_CleanCart]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_CleanCart]  DEFAULT (0) FOR [CleanCart]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_ShowDelivery]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_ShowDelivery]  DEFAULT (0) FOR [ShowDelivery]
GO
/****** Object:  Default [DF_KS_ProGroupBuy_Comment]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  CONSTRAINT [DF_KS_ProGroupBuy_Comment]  DEFAULT (0) FOR [Comment]
GO
/****** Object:  Default [DF__KS_ProGro__IsBus__457442E6]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  DEFAULT (0) FOR [IsBusiness]
GO
/****** Object:  Default [DF__KS_ProGro__Freig__4668671F]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  DEFAULT (0) FOR [FreightType]
GO
/****** Object:  Default [DF__KS_ProGro__Freig__475C8B58]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  DEFAULT (0) FOR [Freight]
GO
/****** Object:  Default [DF__KS_ProGro__Amoun__4850AF91]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF__KS_ProGro__Amoun__4944D3CA]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  DEFAULT (0) FOR [AmountNum]
GO
/****** Object:  Default [DF__KS_ProGro__payId__2A8B4280]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProGroupBuy] ADD  DEFAULT (0) FOR [payId]
GO
/****** Object:  Default [DF_KS_ShopSpecificationPrice_proid]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProSpecificationPrice] ADD  CONSTRAINT [DF_KS_ShopSpecificationPrice_proid]  DEFAULT (0) FOR [proid]
GO
/****** Object:  Default [DF_KS_ShopSpecificationPrice_price]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProSpecificationPrice] ADD  CONSTRAINT [DF_KS_ShopSpecificationPrice_price]  DEFAULT (0) FOR [price]
GO
/****** Object:  Default [DF_KS_ShopSpecificationPrice_amount]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProSpecificationPrice] ADD  CONSTRAINT [DF_KS_ShopSpecificationPrice_amount]  DEFAULT (0) FOR [amount]
GO
/****** Object:  Default [DF_KS_ShopSpecificationPrice_weight]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProSpecificationPrice] ADD  CONSTRAINT [DF_KS_ShopSpecificationPrice_weight]  DEFAULT (0) FOR [weight]
GO
/****** Object:  Default [DF__KS_ProSpe__price__3F865F66]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProSpecificationPrice] ADD  DEFAULT (0) FOR [price_market]
GO
/****** Object:  Default [DF__KS_Model__ModelS__43D61337]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__ModelS__43D61337]  DEFAULT (0) FOR [ModelStatus]
GO
/****** Object:  Default [DF__KS_Model__FsoLis__44CA3770]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__FsoLis__44CA3770]  DEFAULT (2) FOR [FsoListNum]
GO
/****** Object:  Default [DF_KS_Model_SeoOption]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF_KS_Model_SeoOption]  DEFAULT (0) FOR [SeoOption]
GO
/****** Object:  Default [DF__KS_Model__Charge__45BE5BA9]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Charge__45BE5BA9]  DEFAULT (0) FOR [ChargesOption]
GO
/****** Object:  Default [DF__KS_Model__Attrib__46B27FE2]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Attrib__46B27FE2]  DEFAULT (0) FOR [AttributeOption]
GO
/****** Object:  Default [DF__KS_Model__Receip__47A6A41B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Receip__47A6A41B]  DEFAULT (0) FOR [ReceiptOption]
GO
/****** Object:  Default [DF_KS_Model_PKOption]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF_KS_Model_PKOption]  DEFAULT (0) FOR [PKOption]
GO
/****** Object:  Default [DF__KS_Model__BasicT__489AC854]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__BasicT__489AC854]  DEFAULT (0) FOR [BasicType]
GO
/****** Object:  Default [DF__KS_Model__AdminU__498EEC8D]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__AdminU__498EEC8D]  DEFAULT (1) FOR [AdminUpFilesTF]
GO
/****** Object:  Default [DF__KS_Model__UserUp__4A8310C6]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__UserUp__4A8310C6]  DEFAULT (0) FOR [UserUpFilesTF]
GO
/****** Object:  Default [DF__KS_Model__AllowU__4B7734FF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__AllowU__4B7734FF]  DEFAULT (0) FOR [AllowUpFilesSize]
GO
/****** Object:  Default [DF__KS_Model__AllowP__4C6B5938]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__AllowP__4C6B5938]  DEFAULT (0) FOR [AllowPublication]
GO
/****** Object:  Default [DF_KS_Model_RecycleBin]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF_KS_Model_RecycleBin]  DEFAULT (0) FOR [RecycleBin]
GO
/****** Object:  Default [DF__KS_Model__Public__4D5F7D71]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Public__4D5F7D71]  DEFAULT (0) FOR [PublicationVerify]
GO
/****** Object:  Default [DF_KS_Model_PublicationModifyVerify]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF_KS_Model_PublicationModifyVerify]  DEFAULT (0) FOR [PublicationModifyVerify]
GO
/****** Object:  Default [DF__KS_Model__Commen__4E53A1AA]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Commen__4E53A1AA]  DEFAULT (0) FOR [CommentType]
GO
/****** Object:  Default [DF__KS_Model__Commen__4F47C5E3]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Commen__4F47C5E3]  DEFAULT (0) FOR [CommentLen]
GO
/****** Object:  Default [DF__KS_Model__Newest__503BEA1C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__Newest__503BEA1C]  DEFAULT (0) FOR [NewestDay]
GO
/****** Object:  Default [DF__KS_Model__FsoHtm__51300E55]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__FsoHtm__51300E55]  DEFAULT (1) FOR [FsoHtmlType]
GO
/****** Object:  Default [DF__KS_Model__DiggBy__5224328E]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__DiggBy__5224328E]  DEFAULT (0) FOR [DiggByVisitor]
GO
/****** Object:  Default [DF__KS_Model__DiggRe__531856C7]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__DiggRe__531856C7]  DEFAULT (0) FOR [DiggRepeat]
GO
/****** Object:  Default [DF__KS_Model__DiggPe__540C7B00]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  CONSTRAINT [DF__KS_Model__DiggPe__540C7B00]  DEFAULT (0) FOR [DiggPerTimes]
GO
/****** Object:  Default [DF__KS_Model__Search__50E5F592]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  DEFAULT (0) FOR [SearchTF]
GO
/****** Object:  Default [DF__KS_Model__ModelO__39CD8610]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Model] ADD  DEFAULT (0) FOR [ModelOrderId]
GO
/****** Object:  Default [DF__KS_UserPh__UserI__59B045BD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF__KS_UserPh__TypeI__5AA469F6]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [TypeID]
GO
/****** Object:  Default [DF__KS_UserPh__Class__5B988E2F]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_UserPhot__Hit__5C8CB268]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [Hit]
GO
/****** Object:  Default [DF__KS_UserPh__Statu__5D80D6A1]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_UserPho__Fund__5E74FADA]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [Fund]
GO
/****** Object:  Default [DF__KS_UserPh__PageS__5F691F13]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [PageSize]
GO
/****** Object:  Default [DF__KS_UserPh__Model__605D434C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserPhotos] ADD  DEFAULT (0) FOR [Model]
GO
/****** Object:  Default [DF__KS_Messag__Subje__7132C993]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Message] ADD  DEFAULT (0) FOR [SubjectID]
GO
/****** Object:  Default [DF__KS_Messag__Verif__7226EDCC]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Message] ADD  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_Messag__ReadT__731B1205]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Message] ADD  DEFAULT (0) FOR [ReadTF]
GO
/****** Object:  Default [DF__KS_Messag__DelTf__740F363E]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Message] ADD  DEFAULT (0) FOR [DelTf]
GO
/****** Object:  Default [DF__KS_Messag__PMsgI__75035A77]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Message] ADD  DEFAULT (0) FOR [PMsgID]
GO
/****** Object:  Default [DF__KS_ProOrd__statu__44801EAD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderLog] ADD  DEFAULT (0) FOR [statusCode]
GO
/****** Object:  Default [DF__KS_UserGr__Group__1209AD79]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__Group__1209AD79]  DEFAULT (0) FOR [GroupID]
GO
/****** Object:  Default [DF__KS_UserGro__Type__12FDD1B2]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGro__Type__12FDD1B2]  DEFAULT (0) FOR [Type]
GO
/****** Object:  Default [DF__KS_UserGr__Charg__13F1F5EB]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__Charg__13F1F5EB]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF__KS_UserGr__Group__14E61A24]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__Group__14E61A24]  DEFAULT (0) FOR [GroupPoint]
GO
/****** Object:  Default [DF__KS_UserGr__Valid__15DA3E5D]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__Valid__15DA3E5D]  DEFAULT (0) FOR [ValidDays]
GO
/****** Object:  Default [DF__KS_UserGr__FormI__16CE6296]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__FormI__16CE6296]  DEFAULT (0) FOR [FormID]
GO
/****** Object:  Default [DF__KS_UserGr__IsReg__17C286CF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF__KS_UserGr__IsReg__17C286CF]  DEFAULT (0) FOR [IsReg]
GO
/****** Object:  Default [DF_KS_UserGroup_SpaceSize]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserGroup] ADD  CONSTRAINT [DF_KS_UserGroup_SpaceSize]  DEFAULT (0) FOR [SpaceSize]
GO
/****** Object:  Default [DF_KS_LogScore_AddDate]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_LogScore_Score]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_Score]  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF_KS_LogScore_NowScore]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_NowScore]  DEFAULT (0) FOR [NowScore]
GO
/****** Object:  Default [DF_KS_LogScore_AvailableScore]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_AvailableScore]  DEFAULT (0) FOR [AvailableScore]
GO
/****** Object:  Default [DF_KS_LogScore_ChannelID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_LogScore_infoid]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogScore] ADD  CONSTRAINT [DF_KS_LogScore_infoid]  DEFAULT (0) FOR [infoid]
GO
/****** Object:  Default [DF_KS_LogPoint_OrderID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF_KS_LogPoint_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_LogPoi__Chann__37703C52]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF__KS_LogPoi__Chann__37703C52]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_LogPoi__InfoI__3864608B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF__KS_LogPoi__InfoI__3864608B]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_LogPoi__InOrO__395884C4]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF__KS_LogPoi__InOrO__395884C4]  DEFAULT (0) FOR [InOrOutFlag]
GO
/****** Object:  Default [DF__KS_LogPoi__Point__3A4CA8FD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF__KS_LogPoi__Point__3A4CA8FD]  DEFAULT (0) FOR [Point]
GO
/****** Object:  Default [DF_KS_LogPoint_NowPoint]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF_KS_LogPoint_NowPoint]  DEFAULT (0) FOR [NowPoint]
GO
/****** Object:  Default [DF__KS_LogPoi__Times__3B40CD36]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogPoint] ADD  CONSTRAINT [DF__KS_LogPoi__Times__3B40CD36]  DEFAULT (0) FOR [Times]
GO
/****** Object:  Default [DF__KS_ADClas__Order__47E69B3D]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ADClass] ADD  DEFAULT (0) FOR [OrderId]
GO
/****** Object:  Default [DF_KS_UserFeeSell_AddDate]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserFeeSell] ADD  CONSTRAINT [DF_KS_UserFeeSell_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_LogMoney_ChannelID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_LogMoney_InfoID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_LogMoney_MoneyType]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_MoneyType]  DEFAULT (0) FOR [MoneyType]
GO
/****** Object:  Default [DF_KS_LogMoney_PaymentID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_PaymentID]  DEFAULT (0) FOR [PaymentID]
GO
/****** Object:  Default [DF_KS_LogMoney_PayTime]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_PayTime]  DEFAULT (getdate()) FOR [PayTime]
GO
/****** Object:  Default [DF_KS_LogMoney_Times]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LogMoney] ADD  CONSTRAINT [DF_KS_LogMoney_Times]  DEFAULT (0) FOR [Times]
GO
/****** Object:  Default [DF__KS_AdminP__Statu__4AC307E8]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AdminPlan] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_AdminP__TipsD__4BB72C21]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AdminPlan] ADD  DEFAULT (0) FOR [TipsDays]
GO
/****** Object:  Default [DF_KS_UserFeePackages_flag]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserFeePackages] ADD  CONSTRAINT [DF_KS_UserFeePackages_flag]  DEFAULT (0) FOR [flag]
GO
/****** Object:  Default [DF_KS_UserFeePackages_days]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserFeePackages] ADD  CONSTRAINT [DF_KS_UserFeePackages_days]  DEFAULT (0) FOR [days]
GO
/****** Object:  Default [DF_KS_UserFeePackages_price]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserFeePackages] ADD  CONSTRAINT [DF_KS_UserFeePackages_price]  DEFAULT (0) FOR [price]
GO
/****** Object:  Default [DF_KS_UserFeePackages_status]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserFeePackages] ADD  CONSTRAINT [DF_KS_UserFeePackages_status]  DEFAULT (0) FOR [status]
GO
/****** Object:  Default [DF_KS_UserFeePackages_modelid]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserFeePackages] ADD  CONSTRAINT [DF_KS_UserFeePackages_modelid]  DEFAULT (0) FOR [limit]
GO
/****** Object:  Default [DF__KS_Log__ResultTF__2EDAF651]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Log] ADD  CONSTRAINT [DF__KS_Log__ResultTF__2EDAF651]  DEFAULT (0) FOR [ResultTF]
GO
/****** Object:  Default [DF_KS_UserFeeDiscount_discount]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserFeeDiscount] ADD  CONSTRAINT [DF_KS_UserFeeDiscount_discount]  DEFAULT (0) FOR [discount]
GO
/****** Object:  Default [DF_KS_UserFeeDiscount_status]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserFeeDiscount] ADD  CONSTRAINT [DF_KS_UserFeeDiscount_status]  DEFAULT (0) FOR [status]
GO
/****** Object:  Default [DF_KS_UserFeeDiscount_packid]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserFeeDiscount] ADD  CONSTRAINT [DF_KS_UserFeeDiscount_packid]  DEFAULT (0) FOR [packid]
GO
/****** Object:  Default [DF__KS_ProInv__Invoi__4E9398CC]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProInvoice] ADD  DEFAULT (0) FOR [InvoiceType]
GO
/****** Object:  Default [DF__KS_ProInv__Title__4F87BD05]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProInvoice] ADD  DEFAULT (0) FOR [TitleType]
GO
/****** Object:  Default [DF__KS_ProInv__IsDef__507BE13E]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProInvoice] ADD  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF__KS_ProInv__Provi__51700577]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProInvoice] ADD  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF__KS_ProInv__CityI__526429B0]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProInvoice] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_ProInv__Count__53584DE9]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProInvoice] ADD  DEFAULT (0) FOR [CountyId]
GO
/****** Object:  Default [DF_KS_UserDepartment_ParentID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_ParentID]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF_KS_UserDepartment_Root]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_Root]  DEFAULT (0) FOR [Root]
GO
/****** Object:  Default [DF_KS_UserDepartment_Depth]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_Depth]  DEFAULT (0) FOR [Depth]
GO
/****** Object:  Default [DF_KS_UserDepartment_OrderID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_UserDepartment_Child]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_Child]  DEFAULT (0) FOR [Child]
GO
/****** Object:  Default [DF_KS_UserDepartment_PrevID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_PrevID]  DEFAULT (0) FOR [PrevID]
GO
/****** Object:  Default [DF_KS_UserDepartment_NextID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserDepartment] ADD  CONSTRAINT [DF_KS_UserDepartment_NextID]  DEFAULT (0) FOR [NextID]
GO
/****** Object:  Default [DF__KS_Link__ClassID__5772F790]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_Link__LinkTyp__58671BC9]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [LinkType]
GO
/****** Object:  Default [DF__KS_Link__Hits__595B4002]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_Link__Recomme__5A4F643B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF__KS_Link__Locked__5B438874]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [Locked]
GO
/****** Object:  Default [DF__KS_Link__Verify__5C37ACAD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Link] ADD  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_Link_OrderID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Link] ADD  CONSTRAINT [DF_KS_Link_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_UserCa__Money__3E082B48]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserCard] ADD  DEFAULT (0) FOR [Money]
GO
/****** Object:  Default [DF__KS_UserCa__Valid__3EFC4F81]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserCard] ADD  DEFAULT (0) FOR [ValidNum]
GO
/****** Object:  Default [DF__KS_UserCa__Valid__3FF073BA]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserCard] ADD  DEFAULT (0) FOR [ValidUnit]
GO
/****** Object:  Default [DF__KS_UserCa__IsUse__40E497F3]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserCard] ADD  DEFAULT (0) FOR [IsUsed]
GO
/****** Object:  Default [DF__KS_UserCa__IsSal__41D8BC2C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UserCard] ADD  DEFAULT (0) FOR [IsSale]
GO
/****** Object:  Default [DF__KS_LabelC__Paren__236943A5]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LabelClass] ADD  CONSTRAINT [DF__KS_LabelC__Paren__236943A5]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF__KS_LabelC__from3__3CA9F2BB]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_LabelClass] ADD  DEFAULT (0) FOR [from3g]
GO
/****** Object:  Default [DF__KS_Label__ClassI__2180FB33]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Label] ADD  CONSTRAINT [DF__KS_Label__ClassI__2180FB33]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_Label__from3g__3BB5CE82]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Label] ADD  DEFAULT (0) FOR [from3g]
GO
/****** Object:  Default [DF__KS_User__GroupID__7D0E9093]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__GroupID__7D0E9093]  DEFAULT (0) FOR [GroupID]
GO
/****** Object:  Default [DF_KS_User_AskRankId]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_AskRankId]  DEFAULT (0) FOR [AskRankId]
GO
/****** Object:  Default [DF_KS_User_DepartId]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_DepartId]  DEFAULT (0) FOR [DepartId]
GO
/****** Object:  Default [DF_KS_User_IsMobileRZ]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_IsMobileRZ]  DEFAULT (0) FOR [IsMobileRZ]
GO
/****** Object:  Default [DF__KS_User__Privacy__7FEAFD3E]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__Privacy__7FEAFD3E]  DEFAULT (0) FOR [Privacy]
GO
/****** Object:  Default [DF__KS_User__LoginTi__00DF2177]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__LoginTi__00DF2177]  DEFAULT (0) FOR [LoginTimes]
GO
/****** Object:  Default [DF__KS_User__ChargeT__01D345B0]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__ChargeT__01D345B0]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF__KS_User__EDays__03BB8E22]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__EDays__03BB8E22]  DEFAULT (0) FOR [EDays]
GO
/****** Object:  Default [DF_KS_User_Money]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_Money]  DEFAULT (0) FOR [Money]
GO
/****** Object:  Default [DF__KS_User__Score__04AFB25B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__Score__04AFB25B]  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF_KS_User_ScoreHasUse]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_ScoreHasUse]  DEFAULT (0) FOR [ScoreHasUse]
GO
/****** Object:  Default [DF__KS_User__Point__05A3D694]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__Point__05A3D694]  DEFAULT (0) FOR [Point]
GO
/****** Object:  Default [DF__KS_User__Locked__0697FACD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF__KS_User__Locked__0697FACD]  DEFAULT (0) FOR [Locked]
GO
/****** Object:  Default [DF_KS_User_IsApi]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  CONSTRAINT [DF_KS_User_IsApi]  DEFAULT (0) FOR [IsApi]
GO
/****** Object:  Default [DF__KS_User__ProID__3F51553C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  DEFAULT (0) FOR [ProID]
GO
/****** Object:  Default [DF__KS_User__CityID__40457975]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_User__CountyI__41399DAE]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_User] ADD  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF__KS_KeyTag__TagsH__1AD3FDA4]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__TagsH__1AD3FDA4]  DEFAULT (0) FOR [TagsHits]
GO
/****** Object:  Default [DF__KS_KeyTag__Today__1BC821DD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__Today__1BC821DD]  DEFAULT (0) FOR [TodayHits]
GO
/****** Object:  Default [DF__KS_KeyTag__Yeste__1CBC4616]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__Yeste__1CBC4616]  DEFAULT (0) FOR [YesterDayHits]
GO
/****** Object:  Default [DF__KS_KeyTag__WeekH__1DB06A4F]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__WeekH__1DB06A4F]  DEFAULT (0) FOR [WeekHits]
GO
/****** Object:  Default [DF__KS_KeyTag__LastU__1EA48E88]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__LastU__1EA48E88]  DEFAULT (getdate()) FOR [LastUseTime]
GO
/****** Object:  Default [DF__KS_KeyTag__Statu__1F98B2C1]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_KeyTags] ADD  CONSTRAINT [DF__KS_KeyTag__Statu__1F98B2C1]  DEFAULT (1) FOR [Status]
GO
/****** Object:  Default [DF__KS_ProBoo__IsUse__5634BA94]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBookCode] ADD  DEFAULT (0) FOR [IsUsed]
GO
/****** Object:  Default [DF__KS_ProBoo__TypeI__5728DECD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBookCode] ADD  DEFAULT (0) FOR [TypeID]
GO
/****** Object:  Default [DF__KS_ProBoo__CityI__581D0306]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBookCode] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_ProBoo__Provi__5911273F]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBookCode] ADD  DEFAULT (0) FOR [ProvinceId]
GO
/****** Object:  Default [DF__KS_ProBoo__Count__5A054B78]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBookCode] ADD  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF__KS_ProBoo__IsPub__5AF96FB1]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBookCode] ADD  DEFAULT (0) FOR [IsPub]
GO
/****** Object:  Default [DF_KS_ProOrder_PayDiscountMoney]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_PayDiscountMoney]  DEFAULT (0) FOR [PayDiscountMoney]
GO
/****** Object:  Default [DF_KS_ProOrder_Invoiced]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_Invoiced]  DEFAULT (0) FOR [IsInvoice]
GO
/****** Object:  Default [DF_KS_ProOrder_Invoiced_1]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_Invoiced_1]  DEFAULT (0) FOR [Invoiced]
GO
/****** Object:  Default [DF_KS_ProOrder_MoneyReceipt]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_MoneyReceipt]  DEFAULT (0) FOR [MoneyReceipt]
GO
/****** Object:  Default [DF_KS_ProOrder_Score]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_Score]  DEFAULT (0) FOR [OrderScore]
GO
/****** Object:  Default [DF_KS_ProOrder_ScoreTF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_ScoreTF]  DEFAULT (0) FOR [ScoreTF]
GO
/****** Object:  Default [DF_KS_ProOrder_ProvinceID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_ProvinceID]  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF_KS_ProOrder_CityID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_CityID]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_ProOrder_CountyID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_CountyID]  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF_KS_ProOrder_DeliverStatus]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_DeliverStatus]  DEFAULT (0) FOR [DeliverStatus]
GO
/****** Object:  Default [DF_KS_ProOrder_IsAnonymous]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_IsAnonymous]  DEFAULT (0) FOR [IsAnonymous]
GO
/****** Object:  Default [DF_KS_ProOrder_PaymentPlatId]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_PaymentPlatId]  DEFAULT (0) FOR [PaymentPlatId]
GO
/****** Object:  Default [DF_KS_ProOrder_PayStatus]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_PayStatus]  DEFAULT (0) FOR [PayStatus]
GO
/****** Object:  Default [DF_KS_ProOrder_OrderType]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_OrderType]  DEFAULT (0) FOR [OrderType]
GO
/****** Object:  Default [DF_KS_ProOrder_SmsNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_SmsNum]  DEFAULT (0) FOR [SmsNum]
GO
/****** Object:  Default [DF_KS_ProOrder_IsTips]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_IsTips]  DEFAULT (0) FOR [IsTips]
GO
/****** Object:  Default [DF_KS_ProOrder_ChangeScore]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  CONSTRAINT [DF_KS_ProOrder_ChangeScore]  DEFAULT (0) FOR [ChangeScore]
GO
/****** Object:  Default [DF__KS_ProOrd__IsBus__4A38F803]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [IsBusiness]
GO
/****** Object:  Default [DF__KS_ProOrd__IsBus__4B2D1C3C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [IsBusinessConfirm]
GO
/****** Object:  Default [DF__KS_ProOrd__Consu__4C214075]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [ConsumptionMode]
GO
/****** Object:  Default [DF__KS_ProOrd__IsFro__4D1564AE]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [IsFrontPay]
GO
/****** Object:  Default [DF__KS_ProOrd__Front__4E0988E7]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [FrontMoney]
GO
/****** Object:  Default [DF__KS_ProOrd__payId__2B7F66B9]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [payId]
GO
/****** Object:  Default [DF__KS_ProOrd__SaveM__422DC1E7]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrder] ADD  DEFAULT (0) FOR [SaveMoney]
GO
/****** Object:  Default [DF_KS_AskZJ_userid]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_userid]  DEFAULT (0) FOR [userid]
GO
/****** Object:  Default [DF_KS_AskZJ_ProvinceId]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_ProvinceId]  DEFAULT (0) FOR [ProvinceId]
GO
/****** Object:  Default [DF_KS_AskZJ_CityId]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_CityId]  DEFAULT (0) FOR [CityId]
GO
/****** Object:  Default [DF_KS_AskZJ_CountyId]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_CountyId]  DEFAULT (0) FOR [CountyId]
GO
/****** Object:  Default [DF_KS_AskZJ_TypeID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_TypeID]  DEFAULT (0) FOR [TypeID]
GO
/****** Object:  Default [DF_KS_AskZJ_AddDate]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_AskZJ_Status]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_Status]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_AskZJ_Recommend]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF_KS_AskZJ_AskDoneNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_AskDoneNum]  DEFAULT (0) FOR [AskNum]
GO
/****** Object:  Default [DF_KS_AskZJ_BestNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_BestNum]  DEFAULT (0) FOR [BestNum]
GO
/****** Object:  Default [DF_KS_AskZJ_BigClassID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_BigClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_AskZJ_istop]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskZJ] ADD  CONSTRAINT [DF_KS_AskZJ_istop]  DEFAULT (0) FOR [istop]
GO
/****** Object:  Default [DF__KS_ProBid__InfoI__12B3B8EF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBidding] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_ProBid__Money__13A7DD28]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBidding] ADD  DEFAULT (0) FOR [Money]
GO
/****** Object:  Default [DF__KS_ProBidd__Bail__149C0161]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBidding] ADD  DEFAULT (0) FOR [Bail]
GO
/****** Object:  Default [DF__KS_ProBiddi__Num__1590259A]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBidding] ADD  DEFAULT (0) FOR [Num]
GO
/****** Object:  Default [DF__KS_ProBid__Exten__168449D3]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBidding] ADD  DEFAULT (0) FOR [ExtendTime]
GO
/****** Object:  Default [DF__KS_ProBid__Hight__17786E0C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBidding] ADD  DEFAULT (0) FOR [HightMoney]
GO
/****** Object:  Default [DF__KS_ProBid__Times__186C9245]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBidding] ADD  DEFAULT (0) FOR [Times]
GO
/****** Object:  Default [DF__KS_ProBid__IsEnd__1960B67E]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBidding] ADD  DEFAULT (0) FOR [IsEnd]
GO
/****** Object:  Default [DF_KS_ProLogInvoice_MoneyTotal]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProLogInvoice] ADD  CONSTRAINT [DF_KS_ProLogInvoice_MoneyTotal]  DEFAULT (0) FOR [MoneyTotal]
GO
/****** Object:  Default [DF_KS_AskTopic_classid]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_classid]  DEFAULT (0) FOR [classid]
GO
/****** Object:  Default [DF_KS_AskTopic_UserId]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_UserId]  DEFAULT (0) FOR [UserId]
GO
/****** Object:  Default [DF_KS_AskTopic_AddDate]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_AskTopic_Status]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_Status]  DEFAULT (0) FOR [verify]
GO
/****** Object:  Default [DF_KS_AskTopic_IsSolve]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_IsSolve]  DEFAULT (0) FOR [IsSolve]
GO
/****** Object:  Default [DF_KS_AskTopic_IsTop]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_IsTop]  DEFAULT (0) FOR [IsTop]
GO
/****** Object:  Default [DF_KS_AskTopic_Reward]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_Reward]  DEFAULT (0) FOR [Reward]
GO
/****** Object:  Default [DF_KS_AskTopic_Hits]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_Hits]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF_KS_AskTopic_PostNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_PostNum]  DEFAULT (0) FOR [PostNum]
GO
/****** Object:  Default [DF_KS_AskTopic_Recommend]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF_KS_AskTopic_AskUserID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTopic] ADD  CONSTRAINT [DF_KS_AskTopic_AskUserID]  DEFAULT (0) FOR [AskUserID]
GO
/****** Object:  Default [DF_KS_ProLogDeliver_DeliverType]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProLogDeliver] ADD  CONSTRAINT [DF_KS_ProLogDeliver_DeliverType]  DEFAULT (0) FOR [DeliverType]
GO
/****** Object:  Default [DF_KS_ProLogDeliver_Status]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProLogDeliver] ADD  CONSTRAINT [DF_KS_ProLogDeliver_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProLogDeliver_MoneyReturnType]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProLogDeliver] ADD  CONSTRAINT [DF_KS_ProLogDeliver_MoneyReturnType]  DEFAULT (0) FOR [MoneyReturnType]
GO
/****** Object:  Default [DF_KS_ProLogDeliver_HandlerStatus]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProLogDeliver] ADD  CONSTRAINT [DF_KS_ProLogDeliver_HandlerStatus]  DEFAULT (0) FOR [HandlerStatus]
GO
/****** Object:  Default [DF_KS_AskTable_IsSys]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskTable] ADD  CONSTRAINT [DF_KS_AskTable_IsSys]  DEFAULT (0) FOR [IsSys]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_Price_1]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_Price_1]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_Num]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_Num]  DEFAULT (0) FOR [Num]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_IsAnonymous]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_IsAnonymous]  DEFAULT (0) FOR [IsAnonymous]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_IsChangeBuy]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_IsChangeBuy]  DEFAULT (0) FOR [IsChangeBuy]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_IsBundleSale]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_IsBundleSale]  DEFAULT (0) FOR [IsBundleSale]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_IsLimitBuy]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_IsLimitBuy]  DEFAULT (0) FOR [IsLimitBuy]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_LimitBuyTaskID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_LimitBuyTaskID]  DEFAULT (0) FOR [LimitBuyTaskID]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_AttrID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_AttrID]  DEFAULT (0) FOR [AttrID]
GO
/****** Object:  Default [DF_KS_ProShoppingCart_flag]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  CONSTRAINT [DF_KS_ProShoppingCart_flag]  DEFAULT (0) FOR [flag]
GO
/****** Object:  Default [DF__KS_ProSho__CityI__44160A59]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProShoppingCart] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_AskRank_IsSys]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskRank] ADD  CONSTRAINT [DF_KS_AskRank_IsSys]  DEFAULT (0) FOR [IsSys]
GO
/****** Object:  Default [DF_KS_AskGrade_Score]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskRank] ADD  CONSTRAINT [DF_KS_AskGrade_Score]  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF_KS_AskGrade_QNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskRank] ADD  CONSTRAINT [DF_KS_AskGrade_QNum]  DEFAULT (0) FOR [QueNum]
GO
/****** Object:  Default [DF_KS_AskGrade_AnsNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskRank] ADD  CONSTRAINT [DF_KS_AskGrade_AnsNum]  DEFAULT (0) FOR [AnsNum]
GO
/****** Object:  Default [DF_KS_UploadFiles_ChannelID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UploadFiles] ADD  CONSTRAINT [DF_KS_UploadFiles_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_UploadFiles_InfoID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UploadFiles] ADD  CONSTRAINT [DF_KS_UploadFiles_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_UploadFiles_DTimes]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UploadFiles] ADD  CONSTRAINT [DF_KS_UploadFiles_DTimes]  DEFAULT (0) FOR [DTimes]
GO
/****** Object:  Default [DF_KS_UploadFiles_DSize]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_UploadFiles] ADD  CONSTRAINT [DF_KS_UploadFiles_DSize]  DEFAULT (0) FOR [DSize]
GO
/****** Object:  Default [DF__KS_JSFile__Class__4EDDB18F]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_JSFile] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_JSFile__from3__3D9E16F4]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_JSFile] ADD  DEFAULT (0) FOR [from3g]
GO
/****** Object:  Default [DF__KS_U_Prod__InfoI__2AF556D4]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_U_Prod__Class__2BE97B0D]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_U_Prod__Chann__0EAE1DE1]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_U_Prod__prior__0FA2421A]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [priority]
GO
/****** Object:  Default [DF__KS_U_Produ__Hits__10966653]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_U_Prod__HitsB__118A8A8C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF__KS_U_Prod__HitsB__127EAEC5]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF__KS_U_Prod__HitsB__1372D2FE]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF__KS_U_Prod__VoteI__1466F737]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF__KS_U_Prod__ShowO__155B1B70]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [ShowON3G]
GO
/****** Object:  Default [DF__KS_U_Prod__Refre__164F3FA9]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF__KS_U_Prod__Verif__174363E2]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_U_Prod__DelTF__1837881B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF__KS_U_Prod__Attac__192BAC54]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF__KS_U_Prod__Attac__1A1FD08D]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF__KS_U_Prod__Provi__1B13F4C6]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [ProvinceId]
GO
/****** Object:  Default [DF__KS_U_Prod__CityI__1C0818FF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_U_Prod__Count__1CFC3D38]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF__KS_U_Prod__Comme__1DF06171]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF__KS_U_Prod__Produ__1EE485AA]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [ProductType]
GO
/****** Object:  Default [DF__KS_U_Prod__Weigh__1FD8A9E3]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [Weight]
GO
/****** Object:  Default [DF__KS_U_Prod__Servi__20CCCE1C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [ServiceTerm]
GO
/****** Object:  Default [DF__KS_U_Prod__Brand__21C0F255]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [BrandID]
GO
/****** Object:  Default [DF__KS_U_Prod__Amoun__22B5168E]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF__KS_U_Prod__Alarm__23A93AC7]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [AlarmNum]
GO
/****** Object:  Default [DF__KS_U_Prod__Price__249D5F00]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF__KS_U_Prod__Price__25918339]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [Price_Member]
GO
/****** Object:  Default [DF__KS_U_Prod__Group__2685A772]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [GroupPrice]
GO
/****** Object:  Default [DF__KS_U_Prod__TaxTF__2779CBAB]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [TaxTF]
GO
/****** Object:  Default [DF__KS_U_Produc__Tax__286DEFE4]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [Tax]
GO
/****** Object:  Default [DF__KS_U_Prod__MinOr__2962141D]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [MinOrderNum]
GO
/****** Object:  Default [DF__KS_U_Prod__MaxOr__2A563856]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [MaxOrderNum]
GO
/****** Object:  Default [DF__KS_U_Prod__Score__2B4A5C8F]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF__KS_U_Prod__IsCha__2C3E80C8]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [IsChangeBuy]
GO
/****** Object:  Default [DF__KS_U_Prod__Chang__2D32A501]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [ChangeBuyNeedPrice]
GO
/****** Object:  Default [DF__KS_U_Prod__Chang__2E26C93A]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [ChangeBuyPresentPrice]
GO
/****** Object:  Default [DF__KS_U_Prod__IsLim__2F1AED73]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [IsLimitbuy]
GO
/****** Object:  Default [DF__KS_U_Prod__Limit__300F11AC]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [LimitBuyPrice]
GO
/****** Object:  Default [DF__KS_U_Prod__Limit__310335E5]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [LimitBuyTaskID]
GO
/****** Object:  Default [DF__KS_U_Prod__Limit__31F75A1E]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [LimitBuyAmount]
GO
/****** Object:  Default [DF__KS_U_Prod__HasSo__32EB7E57]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [HasSold]
GO
/****** Object:  Default [DF__KS_U_Prod__CmtNu__33DFA290]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [CmtNum]
GO
/****** Object:  Default [DF__KS_U_Prod__AskNu__34D3C6C9]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [AskNum]
GO
/****** Object:  Default [DF__KS_U_Prod__IsSco__35C7EB02]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [IsScoreChange]
GO
/****** Object:  Default [DF__KS_U_Prod__Chang__36BC0F3B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [ChangeScore]
GO
/****** Object:  Default [DF__KS_U_Prod__PayTy__37B03374]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [PayType]
GO
/****** Object:  Default [DF__KS_U_Prod__PayID__38A457AD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [PayID]
GO
/****** Object:  Default [DF__KS_U_Prod__Front__39987BE6]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [FrontPrice]
GO
/****** Object:  Default [DF__KS_U_Prod__IsBoo__3A8CA01F]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [IsBookCode]
GO
/****** Object:  Default [DF__KS_U_Prod__BookC__3B80C458]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [BookCodeTypeID]
GO
/****** Object:  Default [DF__KS_U_Prod__Limit__3C74E891]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [LimitCityNum]
GO
/****** Object:  Default [DF__KS_U_Prod__IsPro__3D690CCA]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [IsPromotions]
GO
/****** Object:  Default [DF__KS_U_Prod__IsGro__3E5D3103]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Product] ADD  DEFAULT (0) FOR [IsGroupRate]
GO
/****** Object:  Default [DF_KS_MoodProject_UserOnce]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodProject] ADD  CONSTRAINT [DF_KS_MoodProject_UserOnce]  DEFAULT (0) FOR [UserOnce]
GO
/****** Object:  Default [DF_KS_MoodProject_Status]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodProject] ADD  CONSTRAINT [DF_KS_MoodProject_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_MoodProject_TimeLimit]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodProject] ADD  CONSTRAINT [DF_KS_MoodProject_TimeLimit]  DEFAULT (0) FOR [TimeLimit]
GO
/****** Object:  Default [DF__KS_BBSBoa__Paren__5A6F5FCC]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSBoard] ADD  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF__KS_BBSBoar__Root__5B638405]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSBoard] ADD  DEFAULT (0) FOR [Root]
GO
/****** Object:  Default [DF__KS_BBSBoa__Depth__5C57A83E]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSBoard] ADD  DEFAULT (0) FOR [Depth]
GO
/****** Object:  Default [DF__KS_BBSBoa__Order__5D4BCC77]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSBoard] ADD  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_BBSBoa__Child__5E3FF0B0]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSBoard] ADD  DEFAULT (0) FOR [Child]
GO
/****** Object:  Default [DF__KS_BBSBoa__PrevI__5F3414E9]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSBoard] ADD  DEFAULT (0) FOR [PrevID]
GO
/****** Object:  Default [DF__KS_BBSBoa__NextI__60283922]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSBoard] ADD  DEFAULT (0) FOR [NextID]
GO
/****** Object:  Default [DF__KS_BBSBoa__Topic__611C5D5B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSBoard] ADD  DEFAULT (0) FOR [TopicNum]
GO
/****** Object:  Default [DF__KS_BBSBoa__PostN__62108194]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSBoard] ADD  DEFAULT (0) FOR [PostNum]
GO
/****** Object:  Default [DF__KS_BBSBoa__Today__6304A5CD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSBoard] ADD  DEFAULT (0) FOR [TodayNum]
GO
/****** Object:  Default [DF__KS_U_Phot__InfoI__2724C5F0]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_U_Phot__Class__2818EA29]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_U_Phot__ShowS__290D0E62]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [ShowStyle]
GO
/****** Object:  Default [DF__KS_U_Phot__PageN__2A01329B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (10) FOR [PageNum]
GO
/****** Object:  Default [DF__KS_U_Phot__Chann__60E75331]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_U_Phot__prior__61DB776A]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [priority]
GO
/****** Object:  Default [DF__KS_U_Photo__Hits__62CF9BA3]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_U_Phot__HitsB__63C3BFDC]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF__KS_U_Phot__HitsB__64B7E415]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF__KS_U_Phot__HitsB__65AC084E]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF__KS_U_Phot__VoteI__66A02C87]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF__KS_U_Phot__ShowO__679450C0]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [ShowON3G]
GO
/****** Object:  Default [DF__KS_U_Phot__Refre__688874F9]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF__KS_U_Phot__Verif__697C9932]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_U_Phot__DelTF__6A70BD6B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF__KS_U_Phot__Attac__6B64E1A4]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF__KS_U_Phot__Attac__6C5905DD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF__KS_U_Phot__Provi__6D4D2A16]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [ProvinceId]
GO
/****** Object:  Default [DF__KS_U_Phot__CityI__6E414E4F]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_U_Phot__Count__6F357288]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF__KS_U_Phot__Comme__702996C1]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF__KS_U_Phot__InfoP__711DBAFA]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [InfoPurview]
GO
/****** Object:  Default [DF__KS_U_Phot__ReadP__7211DF33]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [ReadPoint]
GO
/****** Object:  Default [DF__KS_U_Phot__Charg__7306036C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF__KS_U_Phot__Pitch__73FA27A5]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [PitchTime]
GO
/****** Object:  Default [DF__KS_U_Phot__ReadT__74EE4BDE]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [ReadTimes]
GO
/****** Object:  Default [DF__KS_U_Phot__Divid__75E27017]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [DividePercent]
GO
/****** Object:  Default [DF__KS_U_Photo__PKID__76D69450]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Photo] ADD  DEFAULT (0) FOR [PKID]
GO
/****** Object:  Default [DF_KS_MoodList_MoodID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_MoodID]  DEFAULT (0) FOR [MoodID]
GO
/****** Object:  Default [DF_KS_MoodList_ChannelID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_MoodList_InfoID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_MoodList_M0]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M0]  DEFAULT (0) FOR [M0]
GO
/****** Object:  Default [DF_KS_MoodList_M1]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M1]  DEFAULT (0) FOR [M1]
GO
/****** Object:  Default [DF_KS_MoodList_M2]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M2]  DEFAULT (0) FOR [M2]
GO
/****** Object:  Default [DF_KS_MoodList_M3]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M3]  DEFAULT (0) FOR [M3]
GO
/****** Object:  Default [DF_KS_MoodList_M4]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M4]  DEFAULT (0) FOR [M4]
GO
/****** Object:  Default [DF_KS_MoodList_M5]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M5]  DEFAULT (0) FOR [M5]
GO
/****** Object:  Default [DF_KS_MoodList_M6]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M6]  DEFAULT (0) FOR [M6]
GO
/****** Object:  Default [DF_KS_MoodList_M7]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M7]  DEFAULT (0) FOR [M7]
GO
/****** Object:  Default [DF_KS_MoodList_M8]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M8]  DEFAULT (0) FOR [M8]
GO
/****** Object:  Default [DF_KS_MoodList_M9]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M9]  DEFAULT (0) FOR [M9]
GO
/****** Object:  Default [DF_KS_MoodList_M10]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M10]  DEFAULT (0) FOR [M10]
GO
/****** Object:  Default [DF_KS_MoodList_M11]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M11]  DEFAULT (0) FOR [M11]
GO
/****** Object:  Default [DF_KS_MoodList_M12]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M12]  DEFAULT (0) FOR [M12]
GO
/****** Object:  Default [DF_KS_MoodList_M13]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M13]  DEFAULT (0) FOR [M13]
GO
/****** Object:  Default [DF_KS_MoodList_M14]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_MoodList] ADD  CONSTRAINT [DF_KS_MoodList_M14]  DEFAULT (0) FOR [M14]
GO
/****** Object:  Default [DF__KS_U_down__InfoI__253C7D7E]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_U_down__Class__2630A1B7]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_U_down__Chann__77CAB889]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_U_down__prior__78BEDCC2]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [priority]
GO
/****** Object:  Default [DF__KS_U_downl__Hits__79B300FB]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_U_down__HitsB__7AA72534]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF__KS_U_down__HitsB__7B9B496D]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF__KS_U_down__HitsB__7C8F6DA6]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF__KS_U_down__VoteI__7D8391DF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF__KS_U_down__ShowO__7E77B618]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [ShowON3G]
GO
/****** Object:  Default [DF__KS_U_down__Refre__7F6BDA51]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF__KS_U_down__Verif__005FFE8A]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_U_down__DelTF__015422C3]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF__KS_U_down__Attac__024846FC]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF__KS_U_down__Attac__033C6B35]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF__KS_U_down__Provi__04308F6E]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [ProvinceId]
GO
/****** Object:  Default [DF__KS_U_down__CityI__0524B3A7]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_U_down__Count__0618D7E0]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF__KS_U_down__Comme__070CFC19]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF__KS_U_down__InfoP__08012052]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [InfoPurview]
GO
/****** Object:  Default [DF__KS_U_down__ReadP__08F5448B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [ReadPoint]
GO
/****** Object:  Default [DF__KS_U_down__Charg__09E968C4]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF__KS_U_down__Pitch__0ADD8CFD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [PitchTime]
GO
/****** Object:  Default [DF__KS_U_down__ReadT__0BD1B136]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [ReadTimes]
GO
/****** Object:  Default [DF__KS_U_down__Divid__0CC5D56F]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [DividePercent]
GO
/****** Object:  Default [DF__KS_U_downl__PKID__0DB9F9A8]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_download] ADD  DEFAULT (0) FOR [PKID]
GO
/****** Object:  Default [DF__KS_ProBoo__CityN__5DD5DC5C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBookCodeType] ADD  DEFAULT (0) FOR [CityNum]
GO
/****** Object:  Default [DF__KS_ProBoo__IsOpe__5ECA0095]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBookCodeType] ADD  DEFAULT (0) FOR [IsOpenApply]
GO
/****** Object:  Default [DF__KS_ProBoo__Apply__5FBE24CE]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBookCodeType] ADD  DEFAULT (0) FOR [ApplyMustLogin]
GO
/****** Object:  Default [DF__KS_ProBoo__Apply__60B24907]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBookCodeType] ADD  DEFAULT (0) FOR [ApplyNum]
GO
/****** Object:  Default [DF__KS_U_Arti__InfoI__2354350C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_U_Arti__Class__24485945]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_U_Arti__Chann__4A03EDD9]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_U_Arti__prior__4AF81212]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [priority]
GO
/****** Object:  Default [DF__KS_U_Artic__Hits__4BEC364B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_U_Arti__HitsB__4CE05A84]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF__KS_U_Arti__HitsB__4DD47EBD]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF__KS_U_Arti__HitsB__4EC8A2F6]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF__KS_U_Arti__VoteI__4FBCC72F]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF__KS_U_Arti__ShowO__50B0EB68]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [ShowON3G]
GO
/****** Object:  Default [DF__KS_U_Arti__Refre__51A50FA1]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF__KS_U_Arti__Verif__529933DA]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_U_Arti__DelTF__538D5813]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF__KS_U_Arti__Attac__54817C4C]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF__KS_U_Arti__Attac__5575A085]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF__KS_U_Arti__Provi__5669C4BE]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [ProvinceId]
GO
/****** Object:  Default [DF__KS_U_Arti__CityI__575DE8F7]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_U_Arti__Count__58520D30]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF__KS_U_Arti__Comme__59463169]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF__KS_U_Arti__InfoP__5A3A55A2]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [InfoPurview]
GO
/****** Object:  Default [DF__KS_U_Arti__ReadP__5B2E79DB]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [ReadPoint]
GO
/****** Object:  Default [DF__KS_U_Arti__Charg__5C229E14]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF__KS_U_Arti__Pitch__5D16C24D]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [PitchTime]
GO
/****** Object:  Default [DF__KS_U_Arti__ReadT__5E0AE686]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [ReadTimes]
GO
/****** Object:  Default [DF__KS_U_Arti__Divid__5EFF0ABF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [DividePercent]
GO
/****** Object:  Default [DF__KS_U_Artic__PKID__5FF32EF8]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_U_Article] ADD  DEFAULT (0) FOR [PKID]
GO
/****** Object:  Default [DF_KS_SpecialR_SpecialID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_SpecialR] ADD  CONSTRAINT [DF_KS_SpecialR_SpecialID]  DEFAULT (0) FOR [SpecialID]
GO
/****** Object:  Default [DF_KS_SpecialR_InfoID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_SpecialR] ADD  CONSTRAINT [DF_KS_SpecialR_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_SpecialR_ChannelID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_SpecialR] ADD  CONSTRAINT [DF_KS_SpecialR_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_PaymentPlat_showflag]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_PaymentPlat] ADD  CONSTRAINT [DF_KS_PaymentPlat_showflag]  DEFAULT (0) FOR [showflag]
GO
/****** Object:  Default [DF_KS_SpecialClass_AddDate]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_SpecialClass] ADD  CONSTRAINT [DF_KS_SpecialClass_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_SpecialClass_OrderID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_SpecialClass] ADD  CONSTRAINT [DF_KS_SpecialClass_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_ProPaymentType_Discount]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProPaymentType] ADD  CONSTRAINT [DF_KS_ProPaymentType_Discount]  DEFAULT (0) FOR [Discount]
GO
/****** Object:  Default [DF_KS_ProPaymentType_orderid]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProPaymentType] ADD  CONSTRAINT [DF_KS_ProPaymentType_orderid]  DEFAULT (0) FOR [orderid]
GO
/****** Object:  Default [DF_KS_ProPaymentType_Status]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProPaymentType] ADD  CONSTRAINT [DF_KS_ProPaymentType_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProPaymentType_isDefault]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProPaymentType] ADD  CONSTRAINT [DF_KS_ProPaymentType_isDefault]  DEFAULT (0) FOR [isDefault]
GO
/****** Object:  Default [DF_KS_ProPaymentType_TypeFlag]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProPaymentType] ADD  CONSTRAINT [DF_KS_ProPaymentType_TypeFlag]  DEFAULT (0) FOR [TypeFlag]
GO
/****** Object:  Default [DF_KS_AskPost_TopicID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_TopicID]  DEFAULT (0) FOR [TopicID]
GO
/****** Object:  Default [DF_KS_AskPost_addDate]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_addDate]  DEFAULT (getdate()) FOR [addDate]
GO
/****** Object:  Default [DF_KS_AskPost_IsBest]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_IsBest]  DEFAULT (0) FOR [IsBest]
GO
/****** Object:  Default [DF_KS_AskPost_Status]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_Status]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_AskPost_UserId]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_UserId]  DEFAULT (0) FOR [UserId]
GO
/****** Object:  Default [DF_KS_AskPost_IsZj]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskPost] ADD  CONSTRAINT [DF_KS_AskPost_IsZj]  DEFAULT (0) FOR [IsZj]
GO
/****** Object:  Default [DF_KS_ProOrderItem_Price_Market]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_Price_Market]  DEFAULT (0) FOR [Price_Market]
GO
/****** Object:  Default [DF_KS_ProOrderItem_Price]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_KS_ProOrderItem_num]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_num]  DEFAULT (0) FOR [num]
GO
/****** Object:  Default [DF_KS_ProOrderItem_TotalPrice]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_TotalPrice]  DEFAULT (0) FOR [TotalPrice]
GO
/****** Object:  Default [DF_KS_ProOrderItem_IsChangedBuy]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_IsChangedBuy]  DEFAULT (0) FOR [IsChangeBuy]
GO
/****** Object:  Default [DF_KS_ProOrderItem_LimitBuyTaskID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_LimitBuyTaskID]  DEFAULT (0) FOR [LimitBuyTaskID]
GO
/****** Object:  Default [DF_KS_ProOrderItem_IsLimitBuy]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_IsLimitBuy]  DEFAULT (0) FOR [IsLimitBuy]
GO
/****** Object:  Default [DF_KS_ProOrderItem_IsBundleSale]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_IsBundleSale]  DEFAULT (0) FOR [IsBundleSale]
GO
/****** Object:  Default [DF_KS_ProOrderItem_ChangeScore]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  CONSTRAINT [DF_KS_ProOrderItem_ChangeScore]  DEFAULT (0) FOR [ChangeScore]
GO
/****** Object:  Default [DF__KS_ProOrd__Freig__4EFDAD20]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  DEFAULT (0) FOR [Freight]
GO
/****** Object:  Default [DF__KS_ProOrd__Freig__4FF1D159]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  DEFAULT (0) FOR [FreightType]
GO
/****** Object:  Default [DF__KS_ProOrd__CityI__4321E620]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderItem] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_AskClass_ParentID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_ParentID]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF_KS_AskClass_Root]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_Root]  DEFAULT (0) FOR [Root]
GO
/****** Object:  Default [DF_KS_AskClass_Depth]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_Depth]  DEFAULT (0) FOR [Depth]
GO
/****** Object:  Default [DF_KS_AskClass_OrderID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_AskClass_Child]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_Child]  DEFAULT (0) FOR [Child]
GO
/****** Object:  Default [DF_KS_AskClass_PrevID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_PrevID]  DEFAULT (0) FOR [PrevID]
GO
/****** Object:  Default [DF_KS_AskClass_NextID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_NextID]  DEFAULT (0) FOR [NextID]
GO
/****** Object:  Default [DF_KS_AskClass_AddDate]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_AskClass_ShowInTop]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_AskClass] ADD  CONSTRAINT [DF_KS_AskClass_ShowInTop]  DEFAULT (0) FOR [ShowInTop]
GO
/****** Object:  Default [DF__KS_ProBid__InfoI__1C3D2329]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBiddingAsk] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_ProBid__Money__1D314762]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBiddingAsk] ADD  DEFAULT (0) FOR [Money]
GO
/****** Object:  Default [DF__KS_ProBid__UserI__1E256B9B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBiddingAsk] ADD  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF__KS_ProBid__Statu__1F198FD4]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBiddingAsk] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_ProBidd__IsZB__200DB40D]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBiddingAsk] ADD  DEFAULT (0) FOR [IsZB]
GO
/****** Object:  Default [DF__KS_ProBid__Agent__2101D846]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBiddingAsk] ADD  DEFAULT (0) FOR [AgentPrice]
GO
/****** Object:  Default [DF_KS_ProOrderBundleSale_CartID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderBundleSale] ADD  CONSTRAINT [DF_KS_ProOrderBundleSale_CartID]  DEFAULT (0) FOR [CartID]
GO
/****** Object:  Default [DF_KS_ProOrderBundleSale_InfoID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderBundleSale] ADD  CONSTRAINT [DF_KS_ProOrderBundleSale_InfoID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_ProOrderBundleSale_Price]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderBundleSale] ADD  CONSTRAINT [DF_KS_ProOrderBundleSale_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_KS_ProOrderBundleSale_Num]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderBundleSale] ADD  CONSTRAINT [DF_KS_ProOrderBundleSale_Num]  DEFAULT (0) FOR [Num]
GO
/****** Object:  Default [DF_KS_ProOrderBundleSale_addDate]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProOrderBundleSale] ADD  CONSTRAINT [DF_KS_ProOrderBundleSale_addDate]  DEFAULT (getdate()) FOR [addDate]
GO
/****** Object:  Default [DF_KS_ProSpecificationR_ClassID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProSpecificationR] ADD  CONSTRAINT [DF_KS_ProSpecificationR_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_ProSpecificationR_SID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProSpecificationR] ADD  CONSTRAINT [DF_KS_ProSpecificationR_SID]  DEFAULT (0) FOR [SID]
GO
/****** Object:  Default [DF__KS_ProSpe__order__416EA7D8]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProSpecificationR] ADD  DEFAULT (0) FOR [orderid]
GO
/****** Object:  Default [DF__KS_Announ__Chann__39237A9A]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Announce] ADD  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_Announ__Provi__2C738AF2]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Announce] ADD  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF__KS_Announ__CityI__2D67AF2B]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Announce] ADD  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF__KS_Announ__Count__2E5BD364]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Announce] ADD  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF_KS_Special_ClassID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_Special_Recommend]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF_KS_Special_SpecialPurView]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_SpecialPurView]  DEFAULT (0) FOR [SpecialPurView]
GO
/****** Object:  Default [DF_KS_Special_ReadPoint]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_ReadPoint]  DEFAULT (0) FOR [ReadPoint]
GO
/****** Object:  Default [DF_KS_Special_ChargeType]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_ChargeType]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF_KS_Special_PitchTime]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_PitchTime]  DEFAULT (0) FOR [PitchTime]
GO
/****** Object:  Default [DF_KS_Special_ReadTimes]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_ReadTimes]  DEFAULT (0) FOR [ReadTimes]
GO
/****** Object:  Default [DF_KS_Special_Hits]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Special] ADD  CONSTRAINT [DF_KS_Special_Hits]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_BBSPos__Topic__65E11278]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSPost] ADD  DEFAULT (0) FOR [TopicID]
GO
/****** Object:  Default [DF__KS_BBSPos__Verif__66D536B1]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSPost] ADD  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_BBSPos__UserI__67C95AEA]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSPost] ADD  DEFAULT (0) FOR [UserId]
GO
/****** Object:  Default [DF_KS_SJWarning_flag]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_SJWarning] ADD  CONSTRAINT [DF_KS_SJWarning_flag]  DEFAULT (0) FOR [flag]
GO
/****** Object:  Default [DF_KS_SJWarning_readTF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_SJWarning] ADD  CONSTRAINT [DF_KS_SJWarning_readTF]  DEFAULT (0) FOR [readTF]
GO
/****** Object:  Default [DF_KS_SJType_TypeName]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_SJType] ADD  CONSTRAINT [DF_KS_SJType_TypeName]  DEFAULT ('试卷类别名称') FOR [TypeName]
GO
/****** Object:  Default [DF_KS_SJType_OrderID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_SJType] ADD  CONSTRAINT [DF_KS_SJType_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_SJType_IsDefault]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_SJType] ADD  CONSTRAINT [DF_KS_SJType_IsDefault]  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF_KS_ProBundleSelect_ProID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBundleSelect] ADD  CONSTRAINT [DF_KS_ProBundleSelect_ProID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF_KS_ProBundleSelect_Price]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBundleSelect] ADD  CONSTRAINT [DF_KS_ProBundleSelect_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_KS_ProBundleSelect_Num]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBundleSelect] ADD  CONSTRAINT [DF_KS_ProBundleSelect_Num]  DEFAULT (0) FOR [Num]
GO
/****** Object:  Default [DF_KS_ProBundleSelect_addDate]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBundleSelect] ADD  CONSTRAINT [DF_KS_ProBundleSelect_addDate]  DEFAULT (getdate()) FOR [addDate]
GO
/****** Object:  Default [DF_KS_SJTMType_OrderID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_SJTMType] ADD  CONSTRAINT [DF_KS_SJTMType_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_ProBundleSale_proid]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBundleSale] ADD  CONSTRAINT [DF_KS_ProBundleSale_proid]  DEFAULT (0) FOR [infoid]
GO
/****** Object:  Default [DF_KS_ProBundleSale_kbproid]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBundleSale] ADD  CONSTRAINT [DF_KS_ProBundleSale_kbproid]  DEFAULT (0) FOR [kbinfoid]
GO
/****** Object:  Default [DF_KS_ProBundleSale_kbprice]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBundleSale] ADD  CONSTRAINT [DF_KS_ProBundleSale_kbprice]  DEFAULT (0) FOR [kbprice]
GO
/****** Object:  Default [DF__KS_BBSRan__IsSys__6AA5C795]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSRank] ADD  DEFAULT (0) FOR [IsSys]
GO
/****** Object:  Default [DF__KS_BBSRan__Score__6B99EBCE]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSRank] ADD  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF__KS_BBSRan__Topic__6C8E1007]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSRank] ADD  DEFAULT (0) FOR [TopicNum]
GO
/****** Object:  Default [DF_KS_WorkTable_OrderID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_WorkTable] ADD  CONSTRAINT [DF_KS_WorkTable_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_ProBrandR_ClassID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBrandR] ADD  CONSTRAINT [DF_KS_ProBrandR_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_ProClassBrandR_BrandID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBrandR] ADD  CONSTRAINT [DF_KS_ProClassBrandR_BrandID]  DEFAULT (0) FOR [BrandID]
GO
/****** Object:  Default [DF_KS_Area_ParentID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Area] ADD  CONSTRAINT [DF_KS_Area_ParentID]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF_KS_Area_OrderID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Area] ADD  CONSTRAINT [DF_KS_Area_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_Area_Depth]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Area] ADD  CONSTRAINT [DF_KS_Area_Depth]  DEFAULT (0) FOR [Depth]
GO
/****** Object:  Default [DF_KS_Area_IsShow]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_Area] ADD  CONSTRAINT [DF_KS_Area_IsShow]  DEFAULT (0) FOR [IsShow]
GO
/****** Object:  Default [DF__KS_VoteLo__VoteI__24285DB4]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_VoteLog] ADD  CONSTRAINT [DF__KS_VoteLo__VoteI__24285DB4]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF_KS_VoteLog_VoteDate]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_VoteLog] ADD  CONSTRAINT [DF_KS_VoteLog_VoteDate]  DEFAULT (getdate()) FOR [VoteDate]
GO
/****** Object:  Default [DF_KS_ClassBrand_OrderID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBrand] ADD  CONSTRAINT [DF_KS_ClassBrand_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_ClassBrand_ShowInTop]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBrand] ADD  CONSTRAINT [DF_KS_ClassBrand_ShowInTop]  DEFAULT (0) FOR [ShowInTop]
GO
/****** Object:  Default [DF_KS_ClassBrand_Recommend]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBrand] ADD  CONSTRAINT [DF_KS_ClassBrand_Recommend]  DEFAULT (0) FOR [Recommend]
GO
/****** Object:  Default [DF_KS_ProBrand_num]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProBrand] ADD  CONSTRAINT [DF_KS_ProBrand_num]  DEFAULT (0) FOR [num]
GO
/****** Object:  Default [DF__KS_BBSTab__IsDef__6F6A7CB2]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSTable] ADD  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF__KS_BBSTab__IsSys__705EA0EB]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSTable] ADD  DEFAULT (0) FOR [IsSys]
GO
/****** Object:  Default [DF__KS_VoteIt__VoteI__2057CCD0]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_VoteItem] ADD  CONSTRAINT [DF__KS_VoteIt__VoteI__2057CCD0]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF__KS_VoteIt__VoteN__214BF109]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_VoteItem] ADD  CONSTRAINT [DF__KS_VoteIt__VoteN__214BF109]  DEFAULT (0) FOR [VoteNum]
GO
/****** Object:  Default [DF_KS_ProAsk_ProID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProAsk] ADD  CONSTRAINT [DF_KS_ProAsk_ProID]  DEFAULT (0) FOR [ProID]
GO
/****** Object:  Default [DF_KS_InfoList_ChannelID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_InfoList_HitsByDay]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_HitsByDay]  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF_KS_InfoList_HitsByWeek]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_HitsByWeek]  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF_KS_InfoList_HitsByMonth]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_HitsByMonth]  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF_KS_InfoList_LastHitsTime]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_LastHitsTime]  DEFAULT (getdate()) FOR [LastHitsTime]
GO
/****** Object:  Default [DF_KS_InfoList_RefreshTF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_RefreshTF]  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF_KS_InfoList_ShowOn3G]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_ShowOn3G]  DEFAULT (0) FOR [ShowOn3G]
GO
/****** Object:  Default [DF_KS_InfoList_ProID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_ProID]  DEFAULT (0) FOR [ProID]
GO
/****** Object:  Default [DF_KS_InfoList_CityID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_CityID]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_InfoList_CountyID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_CountyID]  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF_KS_InfoList_Verify]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_Verify]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_InfoList_InfoPurview]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_InfoPurview]  DEFAULT (0) FOR [InfoPurview]
GO
/****** Object:  Default [DF_KS_InfoList_ArrGroupID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_ArrGroupID]  DEFAULT ('0') FOR [ArrGroupID]
GO
/****** Object:  Default [DF_KS_InfoList_ReadPoint]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_ReadPoint]  DEFAULT (0) FOR [ReadPoint]
GO
/****** Object:  Default [DF_KS_InfoList_ChargeType]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_ChargeType]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF_KS_InfoList_PitchTime]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_PitchTime]  DEFAULT (24) FOR [PitchTime]
GO
/****** Object:  Default [DF_KS_InfoList_ReadTimes]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_ReadTimes]  DEFAULT (10) FOR [ReadTimes]
GO
/****** Object:  Default [DF_KS_InfoList_DividePercent]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_DividePercent]  DEFAULT (0) FOR [DividePercent]
GO
/****** Object:  Default [DF_KS_InfoList_PKID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_PKID]  DEFAULT (0) FOR [PKID]
GO
/****** Object:  Default [DF_KS_InfoList_VoteID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_VoteID]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF_KS_InfoList_CommentNum]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_CommentNum]  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF_KS_InfoList_DelTF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_DelTF]  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF_KS_InfoList_AttachmentCharge]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_AttachmentCharge]  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF_KS_InfoList_AttachmentChargeOnce]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_AttachmentChargeOnce]  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF_KS_InfoList_SocialIDs]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  CONSTRAINT [DF_KS_InfoList_SocialIDs]  DEFAULT (0) FOR [SocialIDs]
GO
/****** Object:  Default [DF__KS_InfoLi__Provi__490FC9A0]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_InfoList] ADD  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF_KS_RechargeRecords_status]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_RechargeRecords] ADD  CONSTRAINT [DF_KS_RechargeRecords_status]  DEFAULT (0) FOR [status]
GO
/****** Object:  Default [DF_KS_RechargeRecords_paymoney]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_RechargeRecords] ADD  CONSTRAINT [DF_KS_RechargeRecords_paymoney]  DEFAULT (0) FOR [paymoney]
GO
/****** Object:  Default [DF_KS_RechargeRecords_realmoney]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_RechargeRecords] ADD  CONSTRAINT [DF_KS_RechargeRecords_realmoney]  DEFAULT (0) FOR [realmoney]
GO
/****** Object:  Default [DF_KS_RechargeRecords_platID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_RechargeRecords] ADD  CONSTRAINT [DF_KS_RechargeRecords_platID]  DEFAULT (0) FOR [platID]
GO
/****** Object:  Default [DF_KS_ProAddress_ProvinceID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProAddress] ADD  CONSTRAINT [DF_KS_ProAddress_ProvinceID]  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF_KS_ProAddress_CityID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProAddress] ADD  CONSTRAINT [DF_KS_ProAddress_CityID]  DEFAULT (0) FOR [CityID]
GO
/****** Object:  Default [DF_KS_ProAddress_CountyID]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProAddress] ADD  CONSTRAINT [DF_KS_ProAddress_CountyID]  DEFAULT (0) FOR [CountyID]
GO
/****** Object:  Default [DF_KS_ProAddress_IsDefault]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_ProAddress] ADD  CONSTRAINT [DF_KS_ProAddress_IsDefault]  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF__KS_BBSTop__board__733B0D96]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSTopic] ADD  DEFAULT (0) FOR [boardId]
GO
/****** Object:  Default [DF__KS_BBSTop__UserI__742F31CF]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSTopic] ADD  DEFAULT (0) FOR [UserId]
GO
/****** Object:  Default [DF__KS_BBSTop__verif__75235608]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSTopic] ADD  DEFAULT (0) FOR [verify]
GO
/****** Object:  Default [DF__KS_BBSTop__IsTop__76177A41]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSTopic] ADD  DEFAULT (0) FOR [IsTop]
GO
/****** Object:  Default [DF__KS_BBSTopi__Hits__770B9E7A]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSTopic] ADD  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF__KS_BBSTop__PostN__77FFC2B3]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSTopic] ADD  DEFAULT (0) FOR [PostNum]
GO
/****** Object:  Default [DF__KS_BBSTopi__Digg__78F3E6EC]    Script Date: 04/01/2015 09:38:34 ******/
ALTER TABLE [KS_BBSTopic] ADD  DEFAULT (0) FOR [Digg]
GO
/****** Object:  Default [DF__KS_BBSTop__IsBes__79E80B25]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_BBSTopic] ADD  DEFAULT (0) FOR [IsBest]
GO
/****** Object:  Default [DF_KS_ProDeliveryCorp_OrderID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDeliveryCorp] ADD  CONSTRAINT [DF_KS_ProDeliveryCorp_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_Class__Parent__3E52440B]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Parent__3E52440B]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF__KS_Class__Root__3F466844]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Root__3F466844]  DEFAULT (0) FOR [Root]
GO
/****** Object:  Default [DF__KS_Class__OrderI__403A8C7D]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__OrderI__403A8C7D]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_Class__Child__412EB0B6]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Child__412EB0B6]  DEFAULT (0) FOR [Child]
GO
/****** Object:  Default [DF__KS_Class__PrevID__4222D4EF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__PrevID__4222D4EF]  DEFAULT (0) FOR [PrevID]
GO
/****** Object:  Default [DF__KS_Class__NextID__4316F928]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__NextID__4316F928]  DEFAULT (0) FOR [NextID]
GO
/****** Object:  Default [DF__KS_Class__ClassT__440B1D61]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__ClassT__440B1D61]  DEFAULT (1) FOR [ClassType]
GO
/****** Object:  Default [DF__KS_Class__ShowIn__44FF419A]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__ShowIn__44FF419A]  DEFAULT (0) FOR [ShowInTop]
GO
/****** Object:  Default [DF_KS_Class_ShowOn3G]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_ShowOn3G]  DEFAULT (0) FOR [ShowOn3G]
GO
/****** Object:  Default [DF__KS_Class__ShowIn__45F365D3]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__ShowIn__45F365D3]  DEFAULT (0) FOR [ShowInCir]
GO
/****** Object:  Default [DF__KS_Class__AllowP__46E78A0C]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__AllowP__46E78A0C]  DEFAULT (0) FOR [AllowPubInfo]
GO
/****** Object:  Default [DF_KS_Class_PubFlag]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_PubFlag]  DEFAULT (1) FOR [PubFlag]
GO
/****** Object:  Default [DF__KS_Class__AllowP__47DBAE45]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__AllowP__47DBAE45]  DEFAULT ('0') FOR [AllowPubGroupID]
GO
/****** Object:  Default [DF__KS_Class__PubAdd__48CFD27E]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__PubAdd__48CFD27E]  DEFAULT (0) FOR [PubAddMoney]
GO
/****** Object:  Default [DF__KS_Class__PubAdd__49C3F6B7]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__PubAdd__49C3F6B7]  DEFAULT (0) FOR [PubAddPoint]
GO
/****** Object:  Default [DF__KS_Class__PubAdd__4AB81AF0]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__PubAdd__4AB81AF0]  DEFAULT (0) FOR [PubAddScore]
GO
/****** Object:  Default [DF_KS_Class_CmtAddScore]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_CmtAddScore]  DEFAULT (0) FOR [CmtAddScore]
GO
/****** Object:  Default [DF_KS_Class_ShareAddScore]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_ShareAddScore]  DEFAULT (0) FOR [ShareAddScore]
GO
/****** Object:  Default [DF__KS_Class__Create__4BAC3F29]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Create__4BAC3F29]  DEFAULT (0) FOR [CreateHtmlFlag]
GO
/****** Object:  Default [DF__KS_Class__AutoCr__4CA06362]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__AutoCr__4CA06362]  DEFAULT (0) FOR [AutoCreateType]
GO
/****** Object:  Default [DF__KS_Class__ClassP__4D94879B]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__ClassP__4D94879B]  DEFAULT (0) FOR [ClassPurview]
GO
/****** Object:  Default [DF__KS_Class__Defaul__4E88ABD4]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Defaul__4E88ABD4]  DEFAULT (0) FOR [DefaultReadPoint]
GO
/****** Object:  Default [DF__KS_Class__Defaul__4F7CD00D]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Defaul__4F7CD00D]  DEFAULT (0) FOR [DefaultChargeType]
GO
/****** Object:  Default [DF__KS_Class__Defaul__5070F446]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Defaul__5070F446]  DEFAULT (24) FOR [DefaultPitchTime]
GO
/****** Object:  Default [DF__KS_Class__Defaul__5165187F]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Defaul__5165187F]  DEFAULT (10) FOR [DefaultReadTimes]
GO
/****** Object:  Default [DF__KS_Class__Defaul__52593CB8]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF__KS_Class__Defaul__52593CB8]  DEFAULT (0) FOR [DefaultDividePercent]
GO
/****** Object:  Default [DF_KS_Class_InfoNum]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  CONSTRAINT [DF_KS_Class_InfoNum]  DEFAULT (0) FOR [InfoNum]
GO
/****** Object:  Default [DF__KS_Class__ProSpe__407A839F]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Class] ADD  DEFAULT (0) FOR [ProSpecialID]
GO
/****** Object:  Default [DF_KS_ProDelivery_CorpId]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_CorpId]  DEFAULT (0) FOR [CorpId]
GO
/****** Object:  Default [DF_KS_ProDelivery_FreightType]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_FreightType]  DEFAULT (0) FOR [FreightType]
GO
/****** Object:  Default [DF_KS_ProDelivery_Freight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_Freight]  DEFAULT (0) FOR [Freight]
GO
/****** Object:  Default [DF_KS_ProDelivery_FirstHeavy]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_FirstHeavy]  DEFAULT (0) FOR [FirstHeavy]
GO
/****** Object:  Default [DF_KS_ProDelivery_ContinueHeavy]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ContinueHeavy]  DEFAULT (0) FOR [ContinueHeavy]
GO
/****** Object:  Default [DF_KS_ProDelivery_FirstFreight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_FirstFreight]  DEFAULT (0) FOR [FirstFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_ContinueFreight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ContinueFreight]  DEFAULT (0) FOR [ContinueFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_LimitFreight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_LimitFreight]  DEFAULT (0) FOR [LimitFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_ChargeType]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ChargeType]  DEFAULT (0) FOR [ChargeType]
GO
/****** Object:  Default [DF_KS_ProDelivery_PromotionType]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_PromotionType]  DEFAULT (0) FOR [PromotionType]
GO
/****** Object:  Default [DF_KS_ProDelivery_Freight2]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_Freight2]  DEFAULT (0) FOR [Freight2]
GO
/****** Object:  Default [DF_KS_ProDelivery_Status]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProDelivery_OrderID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_ProDelivery_IsDefault]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_IsDefault]  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF_KS_ProDelivery_CityFirstFreight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_CityFirstFreight]  DEFAULT (0) FOR [CityFirstFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_CityContinueFreight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_CityContinueFreight]  DEFAULT (0) FOR [CityContinueFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_CityLimitFreight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_CityLimitFreight]  DEFAULT (0) FOR [CityLimitFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_CityIsCod]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_CityIsCod]  DEFAULT (0) FOR [CityIsCod]
GO
/****** Object:  Default [DF_KS_ProDelivery_ProvinceFirstFreight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ProvinceFirstFreight]  DEFAULT (0) FOR [ProvinceFirstFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_ProvinceContinueFreight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ProvinceContinueFreight]  DEFAULT (0) FOR [ProvinceContinueFreight]
GO
/****** Object:  Default [DF_KS_ProDelivery_ProvinceIsCod]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDelivery] ADD  CONSTRAINT [DF_KS_ProDelivery_ProvinceIsCod]  DEFAULT (0) FOR [ProvinceIsCod]
GO
/****** Object:  Default [DF_KS_ProductList_ChannelID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_ChannelID]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_ProductList_Weight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Weight]  DEFAULT (0) FOR [Weight]
GO
/****** Object:  Default [DF_KS_ProductList_priority]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_priority]  DEFAULT (0) FOR [priority]
GO
/****** Object:  Default [DF_KS_ProductList_Hits]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Hits]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF_KS_ProductList_BrandID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_BrandID]  DEFAULT (0) FOR [BrandID]
GO
/****** Object:  Default [DF_KS_ProductList_HitsByDay]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_HitsByDay]  DEFAULT (0) FOR [HitsByDay]
GO
/****** Object:  Default [DF_KS_ProductList_HitsByWeek]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_HitsByWeek]  DEFAULT (0) FOR [HitsByWeek]
GO
/****** Object:  Default [DF_KS_ProductList_HitsByMonth]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_HitsByMonth]  DEFAULT (0) FOR [HitsByMonth]
GO
/****** Object:  Default [DF_KS_ProductList_LastHitsTime]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_LastHitsTime]  DEFAULT (getdate()) FOR [LastHitsTime]
GO
/****** Object:  Default [DF_KS_ProductList_Amount]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Amount]  DEFAULT (0) FOR [Amount]
GO
/****** Object:  Default [DF_KS_ProductList_AlarmNum]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_AlarmNum]  DEFAULT (0) FOR [AlarmNum]
GO
/****** Object:  Default [DF_KS_ProductList_Price]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Price]  DEFAULT (0) FOR [Price]
GO
/****** Object:  Default [DF_KS_ProductList_Price_Member]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Price_Member]  DEFAULT (0) FOR [Price_Member]
GO
/****** Object:  Default [DF_KS_ProductList_GroupPrice]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_GroupPrice]  DEFAULT (0) FOR [GroupPrice]
GO
/****** Object:  Default [DF_KS_ProductList_TaxTF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_TaxTF]  DEFAULT (0) FOR [TaxTF]
GO
/****** Object:  Default [DF_KS_ProductList_Tax]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Tax]  DEFAULT (0) FOR [Tax]
GO
/****** Object:  Default [DF_KS_ProductList_MinOrderNum]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_MinOrderNum]  DEFAULT (0) FOR [MinOrderNum]
GO
/****** Object:  Default [DF_KS_ProductList_MaxOrderNum]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_MaxOrderNum]  DEFAULT (0) FOR [MaxOrderNum]
GO
/****** Object:  Default [DF_KS_ProductList_VoteID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_VoteID]  DEFAULT (0) FOR [VoteID]
GO
/****** Object:  Default [DF_KS_ProductList_ShowOn3G]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_ShowOn3G]  DEFAULT (0) FOR [ShowOn3G]
GO
/****** Object:  Default [DF_KS_ProductList_RefreshTF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_RefreshTF]  DEFAULT (0) FOR [RefreshTF]
GO
/****** Object:  Default [DF_KS_ProductList_Verify]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Verify]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF_KS_ProductList_Point]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_Point]  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF_KS_ProductList_DelTF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_DelTF]  DEFAULT (0) FOR [DelTF]
GO
/****** Object:  Default [DF_KS_ProductList_HasSold]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_HasSold]  DEFAULT (0) FOR [HasSold]
GO
/****** Object:  Default [DF_KS_ProductList_CommentNum]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_CommentNum]  DEFAULT (0) FOR [CommentNum]
GO
/****** Object:  Default [DF_KS_ProductList_CmtNum]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_CmtNum]  DEFAULT (0) FOR [CmtNum]
GO
/****** Object:  Default [DF_KS_ProductList_AskNum]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_AskNum]  DEFAULT (0) FOR [AskNum]
GO
/****** Object:  Default [DF_KS_ProductList_AttachmentCharge]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_AttachmentCharge]  DEFAULT (0) FOR [AttachmentCharge]
GO
/****** Object:  Default [DF_KS_ProductList_AttachmentChargeOnce]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_AttachmentChargeOnce]  DEFAULT (0) FOR [AttachmentChargeOnce]
GO
/****** Object:  Default [DF_KS_ProductList_IsScoreChange]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_IsScoreChange]  DEFAULT (0) FOR [IsScoreChange]
GO
/****** Object:  Default [DF_KS_ProductList_ChangeScore]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_ChangeScore]  DEFAULT (0) FOR [ChangeScore]
GO
/****** Object:  Default [DF_KS_ProductList_SocialIDs]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  CONSTRAINT [DF_KS_ProductList_SocialIDs]  DEFAULT (0) FOR [SocialIDs]
GO
/****** Object:  Default [DF__KS_Produc__Front__51DA19CB]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [FrontPrice]
GO
/****** Object:  Default [DF__KS_Produc__PayTy__52CE3E04]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [PayType]
GO
/****** Object:  Default [DF__KS_Produc__payId__29971E47]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [payId]
GO
/****** Object:  Default [DF__KS_Produc__IsGro__3E923B2D]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [IsGroupRate]
GO
/****** Object:  Default [DF__KS_Produc__IsBoo__4262CC11]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [IsBookCode]
GO
/****** Object:  Default [DF__KS_Produc__BookC__4356F04A]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [BookCodeTypeID]
GO
/****** Object:  Default [DF__KS_Produc__Limit__444B1483]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [LimitCityNum]
GO
/****** Object:  Default [DF__KS_Produc__IsPro__453F38BC]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [IsPromotions]
GO
/****** Object:  Default [DF__KS_Produc__Provi__46335CF5]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [ProvinceID]
GO
/****** Object:  Default [DF__KS_Produc__CityI__4727812E]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [CityId]
GO
/****** Object:  Default [DF__KS_Produc__Count__481BA567]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProductList] ADD  DEFAULT (0) FOR [CountyId]
GO
/****** Object:  Default [DF_KS_PKZT_UserTF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_UserTF]  DEFAULT (0) FOR [UserTF]
GO
/****** Object:  Default [DF_KS_PKZT_OnceTF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_OnceTF]  DEFAULT (0) FOR [OnceTF]
GO
/****** Object:  Default [DF_KS_PKZT_VerifyTF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_VerifyTF]  DEFAULT (0) FOR [VerifyTF]
GO
/****** Object:  Default [DF_KS_PKZT_Status]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_PKZT_TimeLimit]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_TimeLimit]  DEFAULT (0) FOR [TimeLimit]
GO
/****** Object:  Default [DF_KS_PKZT_BeginDate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_BeginDate]  DEFAULT (getdate()) FOR [BeginDate]
GO
/****** Object:  Default [DF_KS_PKZT_EndDate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_EndDate]  DEFAULT (getdate()) FOR [EndDate]
GO
/****** Object:  Default [DF_KS_PKZT_ZFVotes]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_ZFVotes]  DEFAULT (0) FOR [ZFVotes]
GO
/****** Object:  Default [DF_KS_PKZT_FFVotes]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_PKZT] ADD  CONSTRAINT [DF_KS_PKZT_FFVotes]  DEFAULT (0) FOR [FFVotes]
GO
/****** Object:  Default [DF__KS_UserRe__Recha__7CC477D0]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  DEFAULT (0) FOR [RechargeWay]
GO
/****** Object:  Default [DF__KS_UserRe__AddWa__7DB89C09]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  DEFAULT (0) FOR [AddWay]
GO
/****** Object:  Default [DF__KS_UserRe__FaceV__7EACC042]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  DEFAULT (0) FOR [FaceValue]
GO
/****** Object:  Default [DF__KS_UserRe__Point__7FA0E47B]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  DEFAULT (0) FOR [PointNumber]
GO
/****** Object:  Default [DF__KS_UserRe__Point__009508B4]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  DEFAULT (0) FOR [PointType]
GO
/****** Object:  Default [DF__KS_UserRe__IsSel__01892CED]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  DEFAULT (0) FOR [IsSell]
GO
/****** Object:  Default [DF__KS_UserRe__IsUse__027D5126]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  DEFAULT (0) FOR [IsUse]
GO
/****** Object:  Default [DF__KS_UserRe__UsedG__0371755F]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  DEFAULT (0) FOR [UsedGroupId]
GO
/****** Object:  Default [DF__KS_UserRe__EndGr__04659998]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  DEFAULT (0) FOR [EndGroupId]
GO
/****** Object:  Default [DF__KS_UserRe__ItemI__0559BDD1]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRechargeItem] ADD  DEFAULT (0) FOR [ItemID]
GO
/****** Object:  Default [DF_KS_BlogTemplate_Sharetag]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_BlogTemplate] ADD  CONSTRAINT [DF_KS_BlogTemplate_Sharetag]  DEFAULT (0) FOR [Sharetag]
GO
/****** Object:  Default [DF_KS_BlogTemplate_UserTag]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_BlogTemplate] ADD  CONSTRAINT [DF_KS_BlogTemplate_UserTag]  DEFAULT (0) FOR [UserTag]
GO
/****** Object:  Default [DF_KS_ProDeliveryItem_DeliveryID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  CONSTRAINT [DF_KS_ProDeliveryItem_DeliveryID]  DEFAULT (0) FOR [DeliveryID]
GO
/****** Object:  Default [DF_KS_ProDeliveryItem_IsCod]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  CONSTRAINT [DF_KS_ProDeliveryItem_IsCod]  DEFAULT (0) FOR [IsCod]
GO
/****** Object:  Default [DF_KS_ProDeliveryItem_FirstFreight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  CONSTRAINT [DF_KS_ProDeliveryItem_FirstFreight]  DEFAULT (0) FOR [FirstFreight]
GO
/****** Object:  Default [DF_KS_ProDeliveryItem_ContinueFreight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  CONSTRAINT [DF_KS_ProDeliveryItem_ContinueFreight]  DEFAULT (0) FOR [ContinueFreight]
GO
/****** Object:  Default [DF_KS_ProDeliveryItem_LimitFreight]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProDeliveryItem] ADD  CONSTRAINT [DF_KS_ProDeliveryItem_LimitFreight]  DEFAULT (0) FOR [LimitFreight]
GO
/****** Object:  Default [DF_KS_ProCoupon_FaceValue]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_FaceValue]  DEFAULT (0) FOR [FaceValue]
GO
/****** Object:  Default [DF_KS_ProCoupon_MinAmount]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_MinAmount]  DEFAULT (0) FOR [MinAmount]
GO
/****** Object:  Default [DF_KS_ProCoupon_CouponType]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_CouponType]  DEFAULT (0) FOR [CouponType]
GO
/****** Object:  Default [DF_KS_ProCoupon_BeginDate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_BeginDate]  DEFAULT (getdate()) FOR [BeginDate]
GO
/****** Object:  Default [DF_KS_ProCoupon_EndDate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_EndDate]  DEFAULT (getdate()) FOR [EndDate]
GO
/****** Object:  Default [DF_KS_ProCoupon_AddDate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_ProCoupon_Status]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_Status]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_ProCoupon_MaxDiscount]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_MaxDiscount]  DEFAULT (0) FOR [MaxDiscount]
GO
/****** Object:  Default [DF_KS_ProCoupon_LimitType]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_LimitType]  DEFAULT (0) FOR [LimitType]
GO
/****** Object:  Default [DF_KS_ProCoupon_LimitIds]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCoupon] ADD  CONSTRAINT [DF_KS_ProCoupon_LimitIds]  DEFAULT (1000) FOR [LimitProIds]
GO
/****** Object:  Default [DF__KS_Advert__board__2CBDA3B5]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  DEFAULT (0) FOR [boardid]
GO
/****** Object:  Default [DF__KS_Advert__AdTyp__2DB1C7EE]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  DEFAULT (0) FOR [AdType]
GO
/****** Object:  Default [DF__KS_Advert__ShowT__2EA5EC27]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  DEFAULT (0) FOR [ShowType]
GO
/****** Object:  Default [DF__KS_Advert__LinkT__2F9A1060]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  DEFAULT (0) FOR [LinkTarget]
GO
/****** Object:  Default [DF__KS_Advert__Width__308E3499]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  DEFAULT (0) FOR [Width]
GO
/****** Object:  Default [DF__KS_Advert__Heigh__318258D2]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  DEFAULT (0) FOR [Height]
GO
/****** Object:  Default [DF__KS_Advert__Click__32767D0B]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  DEFAULT (0) FOR [Clicks]
GO
/****** Object:  Default [DF__KS_Advert__Views__336AA144]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  DEFAULT (0) FOR [Views]
GO
/****** Object:  Default [DF__KS_Advert__TimeL__345EC57D]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  DEFAULT (0) FOR [TimeLimit]
GO
/****** Object:  Default [DF__KS_Advert__Statu__3552E9B6]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_Advertise_RecordClicks]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF_KS_Advertise_RecordClicks]  DEFAULT (0) FOR [RecordClickIP]
GO
/****** Object:  Default [DF_KS_Advertise_ClickAddScorePerTime]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF_KS_Advertise_ClickAddScorePerTime]  DEFAULT (0) FOR [ClickAddScorePerTime]
GO
/****** Object:  Default [DF_KS_Advertise_ClickScore]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Advertise] ADD  CONSTRAINT [DF_KS_Advertise_ClickScore]  DEFAULT (0) FOR [ClickScore]
GO
/****** Object:  Default [DF_KS_ShopSpecification_ShowType]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProSpecification] ADD  CONSTRAINT [DF_KS_ShopSpecification_ShowType]  DEFAULT (0) FOR [ShowType]
GO
/****** Object:  Default [DF_KS_ShopSpecification_orderid]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProSpecification] ADD  CONSTRAINT [DF_KS_ShopSpecification_orderid]  DEFAULT (0) FOR [orderid]
GO
/****** Object:  Default [DF_KS_Admin_AddDate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF_KS_Admin_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_Admin_LastLoginTime]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF_KS_Admin_LastLoginTime]  DEFAULT (getdate()) FOR [LastLoginTime]
GO
/****** Object:  Default [DF_KS_Admin_LastLogoutTime]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF_KS_Admin_LastLogoutTime]  DEFAULT (getdate()) FOR [LastLogoutTime]
GO
/****** Object:  Default [DF__KS_Admin__LoginT__7B905C75]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF__KS_Admin__LoginT__7B905C75]  DEFAULT (0) FOR [LoginTimes]
GO
/****** Object:  Default [DF__KS_Admin__Locked__7C8480AE]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF__KS_Admin__Locked__7C8480AE]  DEFAULT (0) FOR [Locked]
GO
/****** Object:  Default [DF_KS_Admin_SysAdmin]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF_KS_Admin_SysAdmin]  DEFAULT (0) FOR [SysAdmin]
GO
/****** Object:  Default [DF__KS_Admin__UserTy__7D78A4E7]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF__KS_Admin__UserTy__7D78A4E7]  DEFAULT ('0') FOR [UserType]
GO
/****** Object:  Default [DF_KS_Admin_DocPower]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Admin] ADD  CONSTRAINT [DF_KS_Admin_DocPower]  DEFAULT (0) FOR [DocPower]
GO
/****** Object:  Default [DF__KS_Paymen__PayId__23DE44F1]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_PaymentPlatItem] ADD  DEFAULT (0) FOR [PayId]
GO
/****** Object:  Default [DF__KS_Paymen__IsDef__24D2692A]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_PaymentPlatItem] ADD  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF_KS_SJTK_OptionNum]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJTK] ADD  CONSTRAINT [DF_KS_SJTK_OptionNum]  DEFAULT (0) FOR [OptionNum]
GO
/****** Object:  Default [DF_KS_Adiplist_adid]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Adiplist] ADD  CONSTRAINT [DF_KS_Adiplist_adid]  DEFAULT (0) FOR [adid]
GO
/****** Object:  Default [DF_KS_Adiplist_boardid]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Adiplist] ADD  CONSTRAINT [DF_KS_Adiplist_boardid]  DEFAULT (0) FOR [boardid]
GO
/****** Object:  Default [DF_KS_Adiplist_adddate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Adiplist] ADD  CONSTRAINT [DF_KS_Adiplist_adddate]  DEFAULT (getdate()) FOR [adddate]
GO
/****** Object:  Default [DF_KS_SJScore_IsTj]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJScore] ADD  CONSTRAINT [DF_KS_SJScore_IsTj]  DEFAULT (0) FOR [IsTj]
GO
/****** Object:  Default [DF_KS_SJScore_HasUseTime]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJScore] ADD  CONSTRAINT [DF_KS_SJScore_HasUseTime]  DEFAULT ('0:0') FOR [HasUseTime]
GO
/****** Object:  Default [DF_KS_SJScore_realTest]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJScore] ADD  CONSTRAINT [DF_KS_SJScore_realTest]  DEFAULT (0) FOR [realTest]
GO
/****** Object:  Default [DF_KS_SJScore_TotalTM]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJScore] ADD  CONSTRAINT [DF_KS_SJScore_TotalTM]  DEFAULT (0) FOR [TotalTMS]
GO
/****** Object:  Default [DF_KS_SJScore_Status]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJScore] ADD  CONSTRAINT [DF_KS_SJScore_Status]  DEFAULT (0) FOR [locked]
GO
/****** Object:  Default [DF_KS_SJScore_WarnTF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJScore] ADD  CONSTRAINT [DF_KS_SJScore_WarnTF]  DEFAULT (0) FOR [WarnTF]
GO
/****** Object:  Default [DF_KS_SJScore_WarnTimes]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJScore] ADD  CONSTRAINT [DF_KS_SJScore_WarnTimes]  DEFAULT (0) FOR [WarnTimes]
GO
/****** Object:  Default [DF_KS_SJScore_FirstInTime]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJScore] ADD  CONSTRAINT [DF_KS_SJScore_FirstInTime]  DEFAULT (getdate()) FOR [FirstInTime]
GO
/****** Object:  Default [DF_KS_SJScore_IsPg]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJScore] ADD  CONSTRAINT [DF_KS_SJScore_IsPg]  DEFAULT (0) FOR [IsPg]
GO
/****** Object:  Default [DF_KS_SJScore_FrontTMS]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJScore] ADD  CONSTRAINT [DF_KS_SJScore_FrontTMS]  DEFAULT (0) FOR [FrontTMS]
GO
/****** Object:  Default [DF__KS_Adboar__AdRat__1F63A897]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Adboard] ADD  DEFAULT (0) FOR [AdRate]
GO
/****** Object:  Default [DF__KS_Adboar__Maxad__2057CCD0]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Adboard] ADD  DEFAULT (0) FOR [Maxads]
GO
/****** Object:  Default [DF__KS_Adboar__Statu__214BF109]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Adboard] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_ADBoar__Class__450A2E92]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Adboard] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_UserRec__flag__27AED5D5]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRecord] ADD  DEFAULT (0) FOR [flag]
GO
/****** Object:  Default [DF__KS_UserRe__useri__28A2FA0E]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_UserRecord] ADD  DEFAULT (0) FOR [userid]
GO
/****** Object:  Default [DF_KS_SJRndZJ_SJID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJRndZJ] ADD  CONSTRAINT [DF_KS_SJRndZJ_SJID]  DEFAULT (0) FOR [SJID]
GO
/****** Object:  Default [DF_KS_SJRndZJ_TmType]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJRndZJ] ADD  CONSTRAINT [DF_KS_SJRndZJ_TmType]  DEFAULT (0) FOR [TmType]
GO
/****** Object:  Default [DF_KS_SJRndZJ_OrderID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJRndZJ] ADD  CONSTRAINT [DF_KS_SJRndZJ_OrderID]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF_KS_SJRndZJ_FS]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJRndZJ] ADD  CONSTRAINT [DF_KS_SJRndZJ_FS]  DEFAULT (0) FOR [FS]
GO
/****** Object:  Default [DF_KS_SJRndZJ_Num]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJRndZJ] ADD  CONSTRAINT [DF_KS_SJRndZJ_Num]  DEFAULT (0) FOR [Num]
GO
/****** Object:  Default [DF_KS_CollectionItem_ModelID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_ModelID]  DEFAULT (0) FOR [ModelID]
GO
/****** Object:  Default [DF_KS_CollectionItem_PageType]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_PageType]  DEFAULT (0) FOR [PageType]
GO
/****** Object:  Default [DF_KS_CollectionItem_PageStartID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_PageStartID]  DEFAULT (0) FOR [PageStartID]
GO
/****** Object:  Default [DF_KS_CollectionItem_PageEndID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_PageEndID]  DEFAULT (0) FOR [PageEndID]
GO
/****** Object:  Default [DF_KS_CollectionItem_AddDate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_AddDate]  DEFAULT (getdate()) FOR [AddDate]
GO
/****** Object:  Default [DF_KS_CollectionItem_IsCanCollect]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_IsCanCollect]  DEFAULT (0) FOR [IsCanCollect]
GO
/****** Object:  Default [DF_KS_CollectionItem_LastCollectTime]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_LastCollectTime]  DEFAULT (getdate()) FOR [LastCollectTime]
GO
/****** Object:  Default [DF_KS_CollectionItem_IsCreateHtml]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_CollectionItem] ADD  CONSTRAINT [DF_KS_CollectionItem_IsCreateHtml]  DEFAULT (0) FOR [IsCreateHtml]
GO
/****** Object:  Default [DF_KS_SJReviewsCmt_status]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJReviewsCmt] ADD  CONSTRAINT [DF_KS_SJReviewsCmt_status]  DEFAULT (0) FOR [status]
GO
/****** Object:  Default [DF_KS_SJReviewsCmt_adddate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJReviewsCmt] ADD  CONSTRAINT [DF_KS_SJReviewsCmt_adddate]  DEFAULT (getdate()) FOR [adddate]
GO
/****** Object:  Default [DF__KS_Commen__Chann__5441852A]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Chann__5441852A]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF_KS_Comment_ClassID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF_KS_Comment_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_Commen__InfoI__5535A963]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__InfoI__5535A963]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_Commen__Suppo__5629CD9C]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Suppo__5629CD9C]  DEFAULT (0) FOR [Support]
GO
/****** Object:  Default [DF__KS_Commen__Oppos__571DF1D5]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Oppos__571DF1D5]  DEFAULT (0) FOR [Opposition]
GO
/****** Object:  Default [DF__KS_Commen__Verif__5812160E]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Verif__5812160E]  DEFAULT (0) FOR [Verify]
GO
/****** Object:  Default [DF__KS_Commen__Anony__59063A47]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Anony__59063A47]  DEFAULT (0) FOR [Anonymous]
GO
/****** Object:  Default [DF__KS_Commen__Viewp__59FA5E80]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF__KS_Commen__Viewp__59FA5E80]  DEFAULT (0) FOR [Viewpoint]
GO
/****** Object:  Default [DF_KS_Comment_Reports]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF_KS_Comment_Reports]  DEFAULT (0) FOR [Reports]
GO
/****** Object:  Default [DF_KS_Comment_UserID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Comment] ADD  CONSTRAINT [DF_KS_Comment_UserID]  DEFAULT (0) FOR [UserID]
GO
/****** Object:  Default [DF__KS_SJTKSub__TmFs__2BB470E3]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJTKSub] ADD  DEFAULT (0) FOR [TmFs]
GO
/****** Object:  Default [DF__KS_SJTKSu__TmTyp__2CA8951C]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJTKSub] ADD  DEFAULT (0) FOR [TmType]
GO
/****** Object:  Default [DF__KS_SJTKSu__Paren__2D9CB955]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJTKSub] ADD  DEFAULT (0) FOR [ParentTmID]
GO
/****** Object:  Default [DF__KS_SJTKSu__Order__2E90DD8E]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJTKSub] ADD  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_SJTKSu__Optio__2F8501C7]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJTKSub] ADD  DEFAULT (0) FOR [OptionNum]
GO
/****** Object:  Default [DF_KS_SJComment_CmtNum]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJReviews] ADD  CONSTRAINT [DF_KS_SJComment_CmtNum]  DEFAULT (0) FOR [CmtNum]
GO
/****** Object:  Default [DF_KS_SJComment_SJID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJReviews] ADD  CONSTRAINT [DF_KS_SJComment_SJID]  DEFAULT (0) FOR [SJID]
GO
/****** Object:  Default [DF_KS_SJReviews_ClassID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJReviews] ADD  CONSTRAINT [DF_KS_SJReviews_ClassID]  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF_KS_SJKnowledge_adddate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJKnowledge] ADD  CONSTRAINT [DF_KS_SJKnowledge_adddate]  DEFAULT (getdate()) FOR [adddate]
GO
/****** Object:  Default [DF_KS_SJCTB_flag]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJCTB] ADD  CONSTRAINT [DF_KS_SJCTB_flag]  DEFAULT (0) FOR [flag]
GO
/****** Object:  Default [DF__KS_Form__TimeLim__7C4F7684]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__TimeLim__7C4F7684]  DEFAULT (0) FOR [TimeLimit]
GO
/****** Object:  Default [DF__KS_Form__BeginDa__7D439ABD]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__BeginDa__7D439ABD]  DEFAULT (getdate()) FOR [BeginDate]
GO
/****** Object:  Default [DF__KS_Form__ExpireD__7E37BEF6]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__ExpireD__7E37BEF6]  DEFAULT (getdate()) FOR [ExpireDate]
GO
/****** Object:  Default [DF__KS_Form__LimitIP__7F2BE32F]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__LimitIP__7F2BE32F]  DEFAULT (0) FOR [LimitIP]
GO
/****** Object:  Default [DF__KS_Form__UserTF__00200768]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__UserTF__00200768]  DEFAULT (0) FOR [UserTF]
GO
/****** Object:  Default [DF_KS_Form_UploadUserTF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF_KS_Form_UploadUserTF]  DEFAULT (0) FOR [UploadUserTF]
GO
/****** Object:  Default [DF__KS_Form__UserOnc__01142BA1]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__UserOnc__01142BA1]  DEFAULT (0) FOR [UserOnce]
GO
/****** Object:  Default [DF__KS_Form__VerifyT__02084FDA]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__VerifyT__02084FDA]  DEFAULT (0) FOR [VerifyTF]
GO
/****** Object:  Default [DF__KS_Form__CodeTyp__02FC7413]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__CodeTyp__02FC7413]  DEFAULT (0) FOR [CodeType]
GO
/****** Object:  Default [DF__KS_Form__Status__03F0984C]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__Status__03F0984C]  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF__KS_Form__MaxItem__04E4BC85]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF__KS_Form__MaxItem__04E4BC85]  DEFAULT (0) FOR [MaxItemID]
GO
/****** Object:  Default [DF_KS_Form_IsSendMail]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Form] ADD  CONSTRAINT [DF_KS_Form_IsSendMail]  DEFAULT (0) FOR [IsSendMail]
GO
/****** Object:  Default [DF__KS_FieldG__Chann__3138400F]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_FieldGroup] ADD  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_FieldG__Order__322C6448]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_FieldGroup] ADD  DEFAULT (0) FOR [OrderId]
GO
/****** Object:  Default [DF__KS_FieldG__IsSys__33208881]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_FieldGroup] ADD  DEFAULT (0) FOR [IsSys]
GO
/****** Object:  Default [DF_KS_SJCorrection_sjid]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJCorrection] ADD  CONSTRAINT [DF_KS_SJCorrection_sjid]  DEFAULT (0) FOR [sjid]
GO
/****** Object:  Default [DF_KS_SJCorrection_status]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJCorrection] ADD  CONSTRAINT [DF_KS_SJCorrection_status]  DEFAULT (0) FOR [status]
GO
/****** Object:  Default [DF_KS_SJCorrection_adddate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJCorrection] ADD  CONSTRAINT [DF_KS_SJCorrection_adddate]  DEFAULT (getdate()) FOR [adddate]
GO
/****** Object:  Default [DF__KS_Favori__Chann__27C3E46E]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Favorite] ADD  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_Favori__InfoI__28B808A7]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Favorite] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_SJMyTr__Class__3449B6E4]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJMyTraining] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_SJMyTr__Order__353DDB1D]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJMyTraining] ADD  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_SJClass__Parent__3E52440B]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJClass] ADD  CONSTRAINT [DF__KS_SJClass__Parent__3E52440B]  DEFAULT (0) FOR [ParentID]
GO
/****** Object:  Default [DF__KS_SJClass__Root__3F466844]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJClass] ADD  CONSTRAINT [DF__KS_SJClass__Root__3F466844]  DEFAULT (0) FOR [Root]
GO
/****** Object:  Default [DF__KS_SJClass__OrderI__403A8C7D]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJClass] ADD  CONSTRAINT [DF__KS_SJClass__OrderI__403A8C7D]  DEFAULT (0) FOR [OrderID]
GO
/****** Object:  Default [DF__KS_SJClass__Child__412EB0B6]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJClass] ADD  CONSTRAINT [DF__KS_SJClass__Child__412EB0B6]  DEFAULT (0) FOR [Child]
GO
/****** Object:  Default [DF__KS_SJClass__PrevID__4222D4EF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJClass] ADD  CONSTRAINT [DF__KS_SJClass__PrevID__4222D4EF]  DEFAULT (0) FOR [PrevID]
GO
/****** Object:  Default [DF__KS_SJClass__NextID__4316F928]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJClass] ADD  CONSTRAINT [DF__KS_SJClass__NextID__4316F928]  DEFAULT (0) FOR [NextID]
GO
/****** Object:  Default [DF__KS_SJClass__ShowIn__44FF419A]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJClass] ADD  CONSTRAINT [DF__KS_SJClass__ShowIn__44FF419A]  DEFAULT (0) FOR [ShowInTop]
GO
/****** Object:  Default [DF__KS_DownSe__DownI__6C190EBB]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__DownI__6C190EBB]  DEFAULT (0) FOR [DownID]
GO
/****** Object:  Default [DF__KS_DownSe__Chann__6D0D32F4]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__Chann__6D0D32F4]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_DownSe__rooti__6E01572D]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__rooti__6E01572D]  DEFAULT (0) FOR [rootid]
GO
/****** Object:  Default [DF__KS_DownSe__order__6EF57B66]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__order__6EF57B66]  DEFAULT (0) FOR [orders]
GO
/****** Object:  Default [DF__KS_DownSe__paren__6FE99F9F]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__paren__6FE99F9F]  DEFAULT (0) FOR [parentid]
GO
/****** Object:  Default [DF__KS_DownSe__child__70DDC3D8]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__child__70DDC3D8]  DEFAULT (0) FOR [child]
GO
/****** Object:  Default [DF__KS_DownSe__IsLoc__71D1E811]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__IsLoc__71D1E811]  DEFAULT (0) FOR [IsLock]
GO
/****** Object:  Default [DF__KS_DownSe__IsOut__72C60C4A]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__IsOut__72C60C4A]  DEFAULT (0) FOR [IsOuter]
GO
/****** Object:  Default [DF__KS_DownSe__AllDo__73BA3083]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__AllDo__73BA3083]  DEFAULT (0) FOR [AllDownHits]
GO
/****** Object:  Default [DF__KS_DownSe__DayDo__74AE54BC]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__DayDo__74AE54BC]  DEFAULT (0) FOR [DayDownHits]
GO
/****** Object:  Default [DF__KS_DownSe__HitsT__75A278F5]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DownServer] ADD  CONSTRAINT [DF__KS_DownSe__HitsT__75A278F5]  DEFAULT (getdate()) FOR [HitsTime]
GO
/****** Object:  Default [DF__KS_LogSms__IsSuc__35FCF52C]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_LogSms] ADD  DEFAULT (0) FOR [IsSuccess]
GO
/****** Object:  Default [DF__KS_DiggLi__Chann__66603565]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DiggList] ADD  CONSTRAINT [DF__KS_DiggLi__Chann__66603565]  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_DiggLi__InfoI__6754599E]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DiggList] ADD  CONSTRAINT [DF__KS_DiggLi__InfoI__6754599E]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_DiggLi__Suppo__68487DD7]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DiggList] ADD  CONSTRAINT [DF__KS_DiggLi__Suppo__68487DD7]  DEFAULT (0) FOR [SupportNum]
GO
/****** Object:  Default [DF__KS_DiggLi__Again__693CA210]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_DiggList] ADD  CONSTRAINT [DF__KS_DiggLi__Again__693CA210]  DEFAULT (0) FOR [AgainstNum]
GO
/****** Object:  Default [DF__KS_SJMyTr__Limit__381A47C8]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJMyTrainPaper] ADD  DEFAULT (0) FOR [LimitTime]
GO
/****** Object:  Default [DF__KS_SJMyTra__IsTJ__390E6C01]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJMyTrainPaper] ADD  DEFAULT (0) FOR [IsTJ]
GO
/****** Object:  Default [DF__KS_SJMyTr__SysSc__3A02903A]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJMyTrainPaper] ADD  DEFAULT (0) FOR [SysScore]
GO
/****** Object:  Default [DF__KS_SJMyTr__Score__3AF6B473]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJMyTrainPaper] ADD  DEFAULT (0) FOR [Score]
GO
/****** Object:  Default [DF__KS_SJMyTr__Class__3BEAD8AC]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJMyTrainPaper] ADD  DEFAULT (0) FOR [ClassID]
GO
/****** Object:  Default [DF__KS_SJMyTr__noFin__3CDEFCE5]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJMyTrainPaper] ADD  DEFAULT (0) FOR [noFinishTMS]
GO
/****** Object:  Default [DF__KS_SJMyTr__Total__3DD3211E]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJMyTrainPaper] ADD  DEFAULT (0) FOR [TotalTMS]
GO
/****** Object:  Default [DF_KS_SJCJD_IsDefault]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJCJD] ADD  CONSTRAINT [DF_KS_SJCJD_IsDefault]  DEFAULT (0) FOR [IsDefault]
GO
/****** Object:  Default [DF__KS_Digg__Channel__15A53433]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Digg] ADD  DEFAULT (0) FOR [ChannelID]
GO
/****** Object:  Default [DF__KS_Digg__InfoID__1699586C]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Digg] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_Digg__DiggID__178D7CA5]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Digg] ADD  DEFAULT (0) FOR [DiggID]
GO
/****** Object:  Default [DF__KS_Digg__DiggTyp__1881A0DE]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Digg] ADD  DEFAULT (0) FOR [DiggType]
GO
/****** Object:  Default [DF__KS_ProSpe__itemn__38D961D7]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProSpecial] ADD  DEFAULT (0) FOR [itemnum]
GO
/****** Object:  Default [DF__KS_InnerL__Statu__4CF5691D]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_InnerLink] ADD  DEFAULT (0) FOR [Status]
GO
/****** Object:  Default [DF_KS_InnerLink_Num]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_InnerLink] ADD  CONSTRAINT [DF_KS_InnerLink_Num]  DEFAULT (0) FOR [Times]
GO
/****** Object:  Default [DF_KS_SJ_MustLogin]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_MustLogin]  DEFAULT (0) FOR [MustLogin]
GO
/****** Object:  Default [DF_KS_SJ_IsSaveAnswer]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_IsSaveAnswer]  DEFAULT (0) FOR [IsSaveAnswer]
GO
/****** Object:  Default [DF_KS_SJ_IsKSRecord]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_IsKSRecord]  DEFAULT (0) FOR [IsDelRecord]
GO
/****** Object:  Default [DF_KS_SJ_Hits]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_Hits]  DEFAULT (0) FOR [Hits]
GO
/****** Object:  Default [DF_KS_SJ_TestHits]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_TestHits]  DEFAULT (0) FOR [TestHits]
GO
/****** Object:  Default [DF_KS_SJ_CmtNum]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_CmtNum]  DEFAULT (0) FOR [CmtNum]
GO
/****** Object:  Default [DF_KS_SJ_RealTest]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_RealTest]  DEFAULT (0) FOR [RealTest]
GO
/****** Object:  Default [DF_KS_SJ_OpenTimeLimit]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_OpenTimeLimit]  DEFAULT (0) FOR [OpenTimeLimit]
GO
/****** Object:  Default [DF_KS_SJ_ScorePubType]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_ScorePubType]  DEFAULT (0) FOR [ScorePubType]
GO
/****** Object:  Default [DF_KS_SJ_RndST]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_RndST]  DEFAULT (0) FOR [RndST]
GO
/****** Object:  Default [DF_KS_SJ_FullScreen]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_FullScreen]  DEFAULT (0) FOR [FullScreen]
GO
/****** Object:  Default [DF_KS_SJ_RightTF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_RightTF]  DEFAULT (0) FOR [RightTF]
GO
/****** Object:  Default [DF_KS_SJ_PowerTF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_PowerTF]  DEFAULT (0) FOR [PowerTF]
GO
/****** Object:  Default [DF_KS_SJ_F5TF]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_F5TF]  DEFAULT (0) FOR [F5TF]
GO
/****** Object:  Default [DF_KS_SJ_AuthorizationType]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_AuthorizationType]  DEFAULT (0) FOR [AuthorizationType]
GO
/****** Object:  Default [DF_KS_SJ_AutoSaveTime]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_AutoSaveTime]  DEFAULT (0) FOR [AutoSaveTime]
GO
/****** Object:  Default [DF_KS_SJ_CJDID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_CJDID]  DEFAULT (0) FOR [CJDID]
GO
/****** Object:  Default [DF_KS_SJ_FrontSize]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_FrontSize]  DEFAULT (0) FOR [FrontSize]
GO
/****** Object:  Default [DF_KS_SJ_DoExamWay]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_DoExamWay]  DEFAULT (0) FOR [DoExamWay]
GO
/****** Object:  Default [DF_KS_SJ_ShowOn3G]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_ShowOn3G]  DEFAULT (0) FOR [ShowOn3G]
GO
/****** Object:  Default [DF_KS_SJ_SocialIDs]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_SJ] ADD  CONSTRAINT [DF_KS_SJ_SocialIDs]  DEFAULT (0) FOR [SocialIDs]
GO
/****** Object:  Default [DF__KS_Vote__BeginDa__19AACF41]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF__KS_Vote__BeginDa__19AACF41]  DEFAULT (getdate()) FOR [BeginDate]
GO
/****** Object:  Default [DF__KS_Vote__ExpireD__1A9EF37A]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF__KS_Vote__ExpireD__1A9EF37A]  DEFAULT (getdate()) FOR [ExpireDate]
GO
/****** Object:  Default [DF__KS_Vote__VoteTyp__1B9317B3]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF__KS_Vote__VoteTyp__1B9317B3]  DEFAULT (0) FOR [VoteType]
GO
/****** Object:  Default [DF__KS_Vote__LimitIP__1C873BEC]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF__KS_Vote__LimitIP__1C873BEC]  DEFAULT (0) FOR [LimitIP]
GO
/****** Object:  Default [DF__KS_Vote__UserTF__1D7B6025]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF__KS_Vote__UserTF__1D7B6025]  DEFAULT (0) FOR [UserTF]
GO
/****** Object:  Default [DF_KS_Vote_ItemID]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_Vote] ADD  CONSTRAINT [DF_KS_Vote_ItemID]  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_ProGro__InfoI__40AF8DC9]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProGroupBuyConsumer] ADD  DEFAULT (0) FOR [InfoID]
GO
/****** Object:  Default [DF__KS_ProGro__Times__41A3B202]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProGroupBuyConsumer] ADD  DEFAULT (0) FOR [Times]
GO
/****** Object:  Default [DF_KS_ViewRecords_basicType]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ViewRecords] ADD  CONSTRAINT [DF_KS_ViewRecords_basicType]  DEFAULT (0) FOR [basicType]
GO
/****** Object:  Default [DF_KS_ViewRecords_channelid]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ViewRecords] ADD  CONSTRAINT [DF_KS_ViewRecords_channelid]  DEFAULT (0) FOR [channelid]
GO
/****** Object:  Default [DF_KS_ViewRecords_infoid]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ViewRecords] ADD  CONSTRAINT [DF_KS_ViewRecords_infoid]  DEFAULT (0) FOR [infoid]
GO
/****** Object:  Default [DF_KS_ViewRecords_adddate]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ViewRecords] ADD  CONSTRAINT [DF_KS_ViewRecords_adddate]  DEFAULT (getdate()) FOR [adddate]
GO
/****** Object:  Default [DF_KS_ProCommentReply_cmtid]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCommentReply] ADD  CONSTRAINT [DF_KS_ProCommentReply_cmtid]  DEFAULT (0) FOR [cmtid]
GO
/****** Object:  Default [DF_KS_ProCommentReply_userid]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_ProCommentReply] ADD  CONSTRAINT [DF_KS_ProCommentReply_userid]  DEFAULT (0) FOR [userid]
GO
/****** Object:  Default [DF__KS_BlogNa__OwnSy__5EDFDA85]    Script Date: 04/01/2015 09:38:35 ******/
ALTER TABLE [KS_BlogNav] ADD  CONSTRAINT [DF__KS_BlogNa__OwnSy__5EDFDA85]  DEFAULT (0) FOR [OwnSys]
GO
