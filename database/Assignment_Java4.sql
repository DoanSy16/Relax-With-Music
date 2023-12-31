USE master
-- drop database [Assignment_Java4]
GO
create database [Assignment_Java4]
GO
USE [Assignment_Java4]
GO
/****** Object:  Table [dbo].[history]    Script Date: 4/12/2023 9:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](30) NULL,
	[videoId] [int] NULL,
	[viewsDate] [date] NOT NULL,
	[isLike] [bit] NOT NULL,
	[likedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sharevideo]    Script Date: 4/12/2023 9:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sharevideo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](30) NULL,
	[videoId] [int] NULL,
	[emails] [nvarchar](30) NOT NULL,
	[shareDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[us]    Script Date: 4/12/2023 9:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[us](
	[username] [nvarchar](30) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[password] [nvarchar](30) NOT NULL,
	[email] [nvarchar](30) NOT NULL,
	[image] [varchar](50) NULL,
	[position] [nvarchar](20) NULL,
	[liked] [int] NULL,
	[shares] [int] NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video]    Script Date: 4/12/2023 9:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[href] [varchar](50) NOT NULL,
	[poster] [varchar](255) NULL,
	[views] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[liked] [int] NULL,
	[shares] [int] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[isActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[history] ON 

INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (1, N'Teonv', 1, CAST(N'2023-04-10' AS Date), 1, CAST(N'2023-04-10' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (2, N'Teonv', 2, CAST(N'2023-04-10' AS Date), 1, CAST(N'2023-04-10' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (3, N'Teonv', 3, CAST(N'2023-04-10' AS Date), 1, CAST(N'2023-04-10' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (4, N'Teonv', 4, CAST(N'2023-04-10' AS Date), 1, CAST(N'2023-04-10' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (5, N'Teonv', 5, CAST(N'2023-04-10' AS Date), 1, CAST(N'2023-04-10' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (6, N'Teonv', 6, CAST(N'2023-04-10' AS Date), 1, CAST(N'2023-04-10' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (7, N'Pheonv', 1, CAST(N'2023-04-11' AS Date), 1, CAST(N'2023-03-11' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (8, N'Pheonv', 2, CAST(N'2023-04-11' AS Date), 1, CAST(N'2023-03-11' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (9, N'Pheonv', 3, CAST(N'2023-04-11' AS Date), 1, CAST(N'2023-03-11' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (10, N'Pheonv', 4, CAST(N'2023-04-11' AS Date), 1, CAST(N'2023-03-11' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (11, N'Pheonv', 5, CAST(N'2023-04-11' AS Date), 1, CAST(N'2023-03-11' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (12, N'Pheonv', 6, CAST(N'2023-04-11' AS Date), 1, CAST(N'2023-03-11' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (13, N'Nont', 1, CAST(N'2023-03-12' AS Date), 1, CAST(N'2023-03-12' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (14, N'Nont', 2, CAST(N'2023-03-12' AS Date), 1, CAST(N'2023-03-12' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (15, N'Nont', 3, CAST(N'2023-03-12' AS Date), 1, CAST(N'2023-03-12' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (16, N'Nont', 4, CAST(N'2023-03-12' AS Date), 1, CAST(N'2023-03-12' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (17, N'Nont', 5, CAST(N'2023-03-12' AS Date), 1, CAST(N'2023-03-12' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (18, N'Nont', 6, CAST(N'2023-03-12' AS Date), 1, CAST(N'2023-03-12' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (19, N'Sydh', 1, CAST(N'2023-03-30' AS Date), 1, CAST(N'2023-03-30' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (20, N'Sydh', 3, CAST(N'2023-03-30' AS Date), 1, CAST(N'2023-03-30' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (21, N'Sydh', 4, CAST(N'2023-03-30' AS Date), 1, CAST(N'2023-03-30' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (22, N'Sydh', 5, CAST(N'2023-03-30' AS Date), 1, CAST(N'2023-03-30' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (23, N'Sydh', 6, CAST(N'2023-03-30' AS Date), 1, CAST(N'2023-03-30' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (24, N'Annv', 1, CAST(N'2023-03-28' AS Date), 1, CAST(N'2023-03-28' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (25, N'Annv', 3, CAST(N'2023-03-28' AS Date), 1, CAST(N'2023-03-28' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (26, N'Annv', 4, CAST(N'2023-03-28' AS Date), 1, CAST(N'2023-03-28' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (27, N'Annv', 6, CAST(N'2023-03-28' AS Date), 1, CAST(N'2023-03-28' AS Date))
INSERT [dbo].[history] ([id], [username], [videoId], [viewsDate], [isLike], [likedDate]) VALUES (28, N'Sydh2851', 4, CAST(N'2023-04-10' AS Date), 1, CAST(N'2023-04-10' AS Date))
SET IDENTITY_INSERT [dbo].[history] OFF
GO
SET IDENTITY_INSERT [dbo].[sharevideo] ON 

INSERT [dbo].[sharevideo] ([id], [username], [videoId], [emails], [shareDate]) VALUES (1, N'Teonv', 1, N'Pheonv@gmail.com', CAST(N'2023-03-10' AS Date))
INSERT [dbo].[sharevideo] ([id], [username], [videoId], [emails], [shareDate]) VALUES (2, N'Teonv', 2, N'Pheonv@gmail.com', CAST(N'2023-03-10' AS Date))
INSERT [dbo].[sharevideo] ([id], [username], [videoId], [emails], [shareDate]) VALUES (3, N'Teonv', 3, N'Pheonv@gmail.com', CAST(N'2023-03-10' AS Date))
INSERT [dbo].[sharevideo] ([id], [username], [videoId], [emails], [shareDate]) VALUES (4, N'Pheonv', 3, N'Teonv@gmail.com', CAST(N'2023-03-10' AS Date))
INSERT [dbo].[sharevideo] ([id], [username], [videoId], [emails], [shareDate]) VALUES (5, N'Nont', 1, N'Teonv@gmail.com', CAST(N'2023-03-10' AS Date))
INSERT [dbo].[sharevideo] ([id], [username], [videoId], [emails], [shareDate]) VALUES (6, N'Nont', 3, N'Teonv@gmail.com', CAST(N'2023-03-10' AS Date))
SET IDENTITY_INSERT [dbo].[sharevideo] OFF
GO
INSERT [dbo].[us] ([username], [fullname], [password], [email], [image], [position], [liked], [shares], [isActive]) VALUES (N'Annv', N'Nguyễn Văn An', N'123456', N'Annv@gmail.com', N'Annv.png', N'Nhân viên', 4, 0, 1)
INSERT [dbo].[us] ([username], [fullname], [password], [email], [image], [position], [liked], [shares], [isActive]) VALUES (N'Nont', N'Nguyễn Thị Nỡ', N'123456', N'Nont@gmail.com', N'Nont.png', N'Khách hàng', 6, 2, 1)
INSERT [dbo].[us] ([username], [fullname], [password], [email], [image], [position], [liked], [shares], [isActive]) VALUES (N'Pheonv', N'Nguyễn Văn Phèo', N'123456', N'Pheonv@gmail.com', N'Pheonv.png', N'Khách hàng', 6, 1, 1)
INSERT [dbo].[us] ([username], [fullname], [password], [email], [image], [position], [liked], [shares], [isActive]) VALUES (N'Sydh', N'Đoàn Hiệp Sỹ', N'123456', N'sydhpc04388@fpt.edu.vn', N'sydh.png', N'Nhân viên', 5, 0, 1)
INSERT [dbo].[us] ([username], [fullname], [password], [email], [image], [position], [liked], [shares], [isActive]) VALUES (N'Sydh2851', N'Đoàn Hiệp Sỹ', N'123456', N'doanhiepsy285@gmail.com', N'sydh2851.png', N'Admin', 1, 0, 1)
INSERT [dbo].[us] ([username], [fullname], [password], [email], [image], [position], [liked], [shares], [isActive]) VALUES (N'Teonv', N'Nguyễn Văn Tèo', N'123456', N'Teonv@gmail.com', N'Teonv.png', N'Khách hàng', 6, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[video] ON 

INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [description], [liked], [shares], [startDate], [endDate], [isActive]) VALUES (1, N'Gió (Speed Up) - JanK x KProx「Lo - Fi Ver」/ Official Lyric Video', N'https://www.youtube.com/embed/eKuPpmil38Y', N'1.png', 10, N'Gió (Speed Up) - JanK x KProx「Lo - Fi Ver」/ Official Lyric Video
Mp3: updating...
 Lyrics

Gió nhẹ sang tôi ngỡ trời xuân 
Nắng hồng lên tôi ngỡ đông tàn 
Ai có ngờ đâu đông vẫn còn đây 
Xuân chưa về 
Tôi ngỡ tình ta xanh ngát trời xuân 
Đâu biết ngày đông kéo đến bất chợt 
Yêu mấy rồi nay cũng hóa tàn phai 
Theo người 

Đk: 
Gió mang hương về giờ em ở đâu vương trên môi nụ hôn của ai 
Để bây giờ tình ta sẽ không bền lâu được thêm nữa đâu 
Xin em hãy cứ đi đi thật xa đừng về đây níu kéo những thứ vốn không thuộc về 1 người vô tâm 

Có hay đâu em chỉ xem tình tôi như mây trôi lạc giữa trời kia 
Chén men sầu làm sao vơi đi niềm đau mà em đã trao 
Bao câu hẹn ước ta bên cạnh nhau vội quên mau thương đau cạnh tôi bởi em đi rồi!!! ngồi với đơn côi 

Ver2: 
Mà vì lòng thương lắm ngậm ngùi 
Mình tôi gánh phiền lo 
Thương chẳng thể buông 
Em có đâu ngờ 
Trên khóe miệng cười tôi khóc trong tim 

Em ở cạnh người môi mắt em vui 
Thôi chắc đành vậy cạnh tôi thấy em buồn 
Tôi chẳng đành lòng nhìn đôi mắt em sầu 
Thương lắm rồi giờ đành buông để người đi….. 
Tôi sầuu

End.', 5, 2, CAST(N'2023-03-10' AS Date), CAST(N'2023-04-06' AS Date), 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [description], [liked], [shares], [startDate], [endDate], [isActive]) VALUES (2, N'Là anh - Mộng Nhiên - Lê Vy Music', N'https://www.youtube-nocookie.com/embed/xLs6ufVKatg', N'2.png', 9, N'Nghe nhạc cùng tớ nha
Lyrics

Cùng bên nhau mai sau 
Là điều ước muốn lớn nhất 
Bàn tay anh đưa ra 
Tựa là nắng ấm lấp lánh 
Này không gian bao la 
Thuộc về cho riêng hai ta 
Cho tình yêu trăm năm nở hoa 
Biết bao giấc mơ ngọt ngào 
Đã từng khóc xuyên qua đêm 
Tỉnh mộng gối đã ướt đẫm 
Chợt anh như hè qua 
Ngập tràn ấm áp nắng sớm 
Dù hai ta già đi 
Và dù hai ta già đi 
Vẫn còn đây bóng dáng ngày ấy 
Một điều xa xưa 
Ta từng thề nguyện qua rồi 
Cùng đi cùng đi ngàn năm 
Về sau mình vẫn có nhau 
Tô màu lên trải hoa 
Tình yêu chúng mình 
Đập tan màn sương mù kia 
Còn vương vấn không buông bàn tay
Đắm đuối đắm đuối mê say 
Là anh là anh cùng em 
Vượt qua màn đêm tối kia 
Kiên cường khi đạp qua 
Từng con sóng xô 
Ngoài khơi biển xanh trời cao này 
Rộng lớn phiêu du cùng nhau 
Bỏ lại đau đớn phía sau 
Cùng bên nhau mai sau 
Là điều ước muốn lớn nhất 
Bàn tay anh đưa ra 
Tựa là nắng ấm lấp lánh 
Này không gian bao la 
Thuộc về cho riêng hai ta 
Cho tình yêu trăm năm nở hoa 
Biết bao giấc mơ ngọt ngào 
Đã từng khóc xuyên qua đêm 
Tỉnh mộng gối đã ướt đẫm 
Chợt anh như hè qua 
Ngập tràn ấm áp nắng sớm 
Dù hai ta già đi 
Và dù hai ta già đi 
Vẫn còn đây bóng dáng ngày ấy 
Một điều xa xưa 
Ta từng thề nguyện qua rồi 
Cùng đi cùng đi ngàn năm 
Về sau mình vẫn có nhau 
Tô màu lên trải hoa 
Tình yêu chúng mình 
Đập tan màn sương mù kia 
Còn vương vấn không buông bàn tay
Đắm đuối đắm đuối mê say 
Là anh là anh cùng em 
Vượt qua màn đêm tối kia 
Kiên cường khi đạp qua 
Từng con sóng xô 
Ngoài khơi biển xanh trời cao này 
Rộng lớn phiêu du cùng nhau 
Bỏ lại đau đớn phía sau 
Cùng đi cùng đi ngàn năm 
Về sau mình vẫn có nhau 
Tô màu lên trải hoa 
Tình yêu chúng mình 
Đập tan màn sương mù kia 
Còn vương vấn không buông bàn tay
Đắm đuối đắm đuối mê say 
Là anh là anh cùng em 
Vượt qua màn đêm tối kia 
Kiên cường khi đạp qua 
Từng con sóng xô 
Ngoài khơi biển xanh trời cao này 
Rộng lớn phiêu du cùng nhau 
Bỏ lại đau đớn phía sau', 3, 1, CAST(N'2023-03-10' AS Date), CAST(N'2023-04-06' AS Date), 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [description], [liked], [shares], [startDate], [endDate], [isActive]) VALUES (3, N'Nhạc Lofi 2023 - Những Bản Lofi Mix Chill Nhẹ Nhàng Cực Hay - Nhạc Trẻ Lofi Gây Nghiện Hot Nhất 2023', N'https://www.youtube-nocookie.com/embed/Tvd4rWHu_nw', N'3.png', 15, N'TRACKLIST:

00:00 Bật Tình Yêu Lên
03:15 Rồi Ta Sẽ Ngắm Pháo Hoa Cùng Nhau
07:25 4 Mùa Thương Em
11:48 Nhất Trên Đời
15:05 Tình Yêu Màu Hồng
19:44 Phải Chăng Em Đã Yêu
23:28 Liệu Giờ
27:30 Chàng Trai Sơ Mi Hồng
32:00 Thích Em Hơi Nhiều
35:14 Kìa Bóng Dáng Ai
38:31 Hai Mươi Hai
42:11 Yêu Em Hơn Mỗi Ngày', 5, 3, CAST(N'2023-03-10' AS Date), CAST(N'2023-04-06' AS Date), 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [description], [liked], [shares], [startDate], [endDate], [isActive]) VALUES (4, N'Nhạc Remix Hot Trend Được Sử Dụng Nhiều Nhất TikTok 2023', N'https://www.youtube-nocookie.com/embed/s7BUEFgxk_s', N'4.png', 20, N'Top 20 Bài Hát Hot Nhất Trên TikTok 2023 | Nhạc Remix Hot Trend Được Sử Dụng Nhiều Nhất TikTok 2023
Tracklist:
0:00 Lý Do Là Gì
3:43 Thuyền Quyên
6:57 Là Anh
10:06 Cô Gái Này Là Của Ai
14:16 U Mee
18:02 Tiếng Pháo Tiễn Người
21:24 Sao Cũng Được
24:28 Lúc Em Cần Anh Đang Ở Đâu
28:27 Yêu Nhau Xong Rồi
32:37 Lệ Tình
35:53 Muốn Cưa Hay Được Cưa
39:05 Rồi Ta Sẽ Ngắm Pháo Hoa Cùng Nhau
42:36 11 Giờ 11 Phút
46:39 Trạm Kế Tiếp
51:27 Con Tim Không Đổi Thay
54:46 Vạn Dặm Xa Nhau Vạn Lần Thương Đau
58:12 Anh Sẽ Quên Em Mà
1:01:32 Sự Thật Đã Bỏ Quên
1:05:16 Bông Hoa Nở Muộn
1:08:45 Nợ Nhau Một Lời', 6, 0, CAST(N'2023-03-10' AS Date), CAST(N'2023-04-06' AS Date), 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [description], [liked], [shares], [startDate], [endDate], [isActive]) VALUES (5, N'Nhạc Chill Nhẹ Nhàng - Những Bản Lofi Việt Nhẹ Nhàng Cực Chill - Lofi Chill Gây Nghiện Hay Nhất 2023', N'https://www.youtube-nocookie.com/embed/bRBuzqCJvU4', N'5.png', 20, N'Nhạc Chill Nhẹ Nhàng - Những Bản Lofi Việt Nhẹ Nhàng Cực Chill
Lofi Chill Gây Nghiện Hay Nhất 2023
TRACKLIST:
0:00 01. Hơn Cả Mây Trời - Như Việt
4:03 02. Hẹn Em Ở Lần Yêu Thứ 2 - Nguyeen 
10:37 03. Anh Đã Từ Bỏ Rồi Đấy - Nguyenn
15:02 04. Kẻ Điên Tin Vào Tình Yêu - Lil Z Poet 
19:16 05. Khi Em Lớn - Orange x Hoàng Dũng
23:15 06. Đường Tôi Chở Em Về - BUITRUONGLINH
28:20 07. Rung Động - Dương Edward
32:02 08. Suy Nghĩ Trong Anh - Khắc Việt
35:59 09. Yêu Từ Đâu Mà Ra - Lil ZPOET
39:46 10. Nhắn Tới Khoảng Trời Em - QUÂN A.P
43:35 11. Chuyện Đôi Ta - Emcee L (Da LAB) ft Muộii
46:43 12. Nàng Thơ - Hoàng Dũng 
50:33 13. Em Băng Qua - Lập Nguyên
55:10 14. Ngày Mình Chung Đôi - Hùng Min
1:01:16 15. Yêu Nhiều Ghen Nhiều - Thanh Hưng', 4, 0, CAST(N'2023-03-10' AS Date), CAST(N'2023-04-06' AS Date), 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [description], [liked], [shares], [startDate], [endDate], [isActive]) VALUES (6, N'4 Mùa Thương Em (Lập Nguyên)', N'https://www.youtube-nocookie.com/embed/OolYa2Tj1RA', N'6.png', 19, N'4 Mùa Thương Em (Lập Nguyên) | Thương em khi mùa thu, thương em sang mùa hạ...Nhạc Chill Tiktok 2023
Tracklist:
00:00 4 Mùa Thương Em - Lập Nguyên x Night T x Yến Nồi Cơm Điện
03:46 Không Yêu Xin Đừng Nói - Umie x Droppy x Hổ
07:45 Mặt Mộc - Phạm Nguyên Ngọc x VAnh x Ân Nhi
11:22 Hình Như Ta Thích Nhau - Doãn Hiếu
14:50 Rồi Ta Sẽ Ngắm Pháo Hoa Cùng Nhau - O.lew
18:36 Ghé Vào Tai - Umie x Freaky x Hổ
21:48 Đâu Ai Dám Hứa - CZEE
25:00 Hẹn Em Ở Lần Yêu Thứ 2 - Nguyenn x Đặng Tuấn Vũ
30:51 11 Giờ 11 Phút - MiiNa x RIN9 x DREAMeR
34:29 Dù Cho Mai Về Sau - buitruonglinh
38:23 Tình Ca Tình Ta - Kis
41:25 Rung Động - Dương Edward
45:25 Đường Tôi Chở Em Về - buitruonglinh
49:38 Tình Yêu Màu Hồng - Hồ Văn Quý x Xám
53:48 Em Là Nhất Miền Tây - Võ Lê Mi x Jin Tuấn Nam
56:42 Yêu Trong Nắng Mai - Hồ Văn Quý x Lê Vũ', 5, 0, CAST(N'2023-03-10' AS Date), CAST(N'2023-04-06' AS Date), 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [description], [liked], [shares], [startDate], [endDate], [isActive]) VALUES (7, N'[Playlist]🔥nhạc này chill phết.., em đã dịu dàng lại còn hay nở nụ cười | gió, cold dont, lửng lơ', N'https://www.youtube.com/embed/IVDmmmwjq6M', N'7.png', 20, N'[Playlist] - Những Bản Nhạc Chill - BapNgo
TRACKLIST:
01 ~ 00:00 Tình yêu màu hồng 
02 ~ 02:46 Cold Dont 
03 ~ 05:29 Noivoianh
04 ~ 08:28 Gió 
05 ~ 11:00 Là anh 
06 ~ 14:20 Anh sẽ đón em 
07 ~ 17:34 Chẳng cần makeup 
08 ~ 20:32 Tan
09 ~ 23:07 Đâu ai dám hứa 
10 ~ 26:11 Tình ca tình ta 
11 ~ 28:56 Is it you 
12 ~ 32:07 Điềm xui
13 ~ 34:56 Hẹn em ở lần yêu thứ hai', 5, 0, CAST(N'2023-03-10' AS Date), CAST(N'2023-04-06' AS Date), 1)
SET IDENTITY_INSERT [dbo].[video] OFF
GO
ALTER TABLE [dbo].[history] ADD  DEFAULT (getdate()) FOR [viewsDate]
GO
ALTER TABLE [dbo].[history] ADD  DEFAULT ((0)) FOR [isLike]
GO
ALTER TABLE [dbo].[us] ADD  DEFAULT ((0)) FOR [liked]
GO
ALTER TABLE [dbo].[us] ADD  DEFAULT ((0)) FOR [shares]
GO
ALTER TABLE [dbo].[us] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [shares]
GO
ALTER TABLE [dbo].[video] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[us] ([username])
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD FOREIGN KEY([videoId])
REFERENCES [dbo].[video] ([id])
GO
ALTER TABLE [dbo].[sharevideo]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[us] ([username])
GO
ALTER TABLE [dbo].[sharevideo]  WITH CHECK ADD FOREIGN KEY([videoId])
REFERENCES [dbo].[video] ([id])
GO
/****** Object:  StoredProcedure [dbo].[trend]    Script Date: 4/12/2023 9:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[trend] AS 
BEGIN
SELECT *FROM video v ORDER BY v.views DESC 
END
GO
