DROP TABLE IF EXISTS bid;
DROP TABLE IF EXISTS _order;
DROP TABLE IF EXISTS _user;
DROP TABLE IF EXISTS artwork;

CREATE TABLE _user (
  user_id varchar(20) NOT NULL,
  username varchar(10) DEFAULT NULL,
  email varchar(255) NOT NULL,
  pwd varchar(255) NOT NULL,
  PRIMARY KEY (user_id)
) 
CREATE TABLE artwork (
  artwork_code varchar(24) NOT NULL,
  artwork_name varchar(255) NOT NULL,
  artwork_url varchar(255),
  price float DEFAULT 1.00,
  provider varchar(255) NOT NULL,
  arrive_time date NOT NULL,
  auction_time date DEFAULT NULL,

  PRIMARY KEY (artwork_code)
) 
CREATE TABLE _order (
  order_code varchar(13) DEFAULT NULL,
  artwork_code varchar(24) NOT NULL,
  buyer_id varchar(20) NOT NULL,
  final_price float NOT NULL,
  order_time datetime NOT NULL,
  PRIMARY KEY (buyer_id,artwork_code),
  CONSTRAINT fk_order_artworkcode_inartwork FOREIGN KEY (artwork_code) REFERENCES artwork (artwork_code),
  CONSTRAINT fk_order_buyerid_inbid FOREIGN KEY (buyer_id) REFERENCES _user (user_id)
)
CREATE TABLE bid (
  bidder_id varchar(20) NOT NULL,
  artwork_code varchar(24) NOT NULL,
  bid_price float NOT NULL,
  PRIMARY KEY (bidder_id,artwork_code),
  CONSTRAINT fk_bid_artworkcode_inartwork FOREIGN KEY (artwork_code) REFERENCES artwork (artwork_code),
  CONSTRAINT fk_bid_bidderid_inbid FOREIGN KEY (bidder_id) REFERENCES _user (user_id)
) 

INSERT INTO [dbo].[_user] ([user_id], [username], [email], [pwd]) VALUES (N'128650040772968750', N'bps', N'123@bps.com', N'123456')
INSERT INTO [dbo].[_user] ([user_id], [username], [email], [pwd]) VALUES (N'132186496904501139', N'linyi', N'123@ly.com', N'123456')


INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019102915261234', N'《初谜》', N'~\Content\img\auction\20191008170816969aa55e495.png ', 66000, N'香港蘇富比', N'2019-09-20', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019103019551234', N'《故乡的雪》', N'~\Content\img\auction\2019081717151116652250403.jpg ', 54000, N'佳士得', N'2019-09-22', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019110121441234', N'《祥云》', N'~\Content\img\auction\20190912112934283060a4cf4.jpg ', 33000, N'中国嘉德', N'2019-09-21', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019110206451234', N'《十渡福禄》', N'~\Content\img\auction\20190902101343428e3afb04c.JPG ', 45000, N'北京保利', N'2019-09-16', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019110308211234', N'《回响》', N'~\Content\img\auction\20191031175918636cb35acb3.png ', 59000, N'北京匡时', N'2019-09-23', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019110412121234', N'《还有我1426》', N'~\Content\img\auction\201908181034079976256d41b.jpg ', 70000, N'北京瀚海', N'2019-09-24', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019110513271234', N'《祈祷和陪伴》', N'~\Content\img\auction\2019081723202951982afba6c.jpg ', 69000, N'中贸圣佳', N'2019-09-25', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019110604231234', N'《新山海经——洪崖洞》', N'~\Content\img\auction\20190912110155188c7bfdb24.JPG ', 51000, N'北京银座', N'2019-09-26', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019111116371234', N'《对话》', N'~\Content\img\auction\20191017131748479436bf08a.png ', 20000, N'中宏信', N'2019-09-26', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019111221461234', N'《约会》', N'~\Content\img\auction\20191101150727624d454507f.png', 67000, N'北京大羿', N'2019-09-28', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019111523591234', N'古钱 金银锭', N'~\Content\img\auction\1572245990594.jpg', 58000, N'匿名收藏家', N'2019-10-01', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019111523592550', N'《西湖》', N'~\Content\img\auction\1572233678163.jpg', 3700000, N'天信听证会', N'2019-11-21', NULL)
INSERT INTO [dbo].[artwork] ([artwork_code], [artwork_name], [artwork_url], [price], [provider], [arrive_time], [auction_time]) VALUES (N'2019111523592560', N'百达翡丽「喜鹊聚宝鸟巢」', N'~\Content\img\auction\1572245990591.png', 200000, N'林一堂', N'2019-11-20', NULL)

