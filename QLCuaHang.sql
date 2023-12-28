CREATE DATABASE QLCuaHang

USE QLCuaHang
CREATE TABLE [dbo].[LoaiHangs] (
    [MaLoai]      INT            IDENTITY (1, 1) NOT NULL,
    [TenLoaiHang] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.LoaiHangs] PRIMARY KEY CLUSTERED ([MaLoai] ASC)
);
CREATE TABLE [dbo].[SanPhams] (
    [MaSP]            INT             IDENTITY (1, 1) NOT NULL,
    [TenSP]           NVARCHAR (MAX)  NOT NULL,
    [GiaBan]          DECIMAL (18, 2) NOT NULL,
    [SoLuong]         INT             NOT NULL,
    [MoTa]            NVARCHAR (MAX)  NULL,
    [AnhSP]           NVARCHAR (MAX)  NOT NULL,
    [LoaiHang_MaLoai] INT             NULL,
    CONSTRAINT [PK_dbo.SanPhams] PRIMARY KEY CLUSTERED ([MaSP] ASC),
    CONSTRAINT [FK_dbo.SanPhams_dbo.LoaiHangs_LoaiHang_MaLoai] FOREIGN KEY ([LoaiHang_MaLoai]) REFERENCES [dbo].[LoaiHangs] ([MaLoai])
);
GO
CREATE TABLE [dbo].[GioHangs] (
    [iMaSp]        INT             NOT NULL,
    [iTenSp]       NVARCHAR (MAX)  NULL,
    [iAnhBia]      NVARCHAR (MAX)  NULL,
    [iDonGia]      DECIMAL (18, 2) NOT NULL,
    [iSoLuong]     INT             NOT NULL,
    [SanPham_MaSP] INT             NULL,
    [iUsername]    NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_dbo.GioHangs] PRIMARY KEY CLUSTERED ([iMaSp] ASC),
    CONSTRAINT [FK_dbo.GioHangs_dbo.SanPhams_SanPham_MaSP] FOREIGN KEY ([SanPham_MaSP]) REFERENCES [dbo].[SanPhams] ([MaSP])
);

GO
CREATE TABLE [dbo].[DonHangs] (
    [MaDon]          INT            IDENTITY (1, 1) NOT NULL,
    [NgayDat]        DATETIME       NOT NULL,
    [ThanhToan]      NVARCHAR (MAX) NULL,
    [DiaChiNhanHang] NVARCHAR (MAX) NULL,
    [TongTien]       DECIMAL (18)   NOT NULL,
    [MaNguoiDung]    NVARCHAR (MAX) NULL,
    [SDT]            NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.DonHangs] PRIMARY KEY CLUSTERED ([MaDon] ASC)
);
CREATE TABLE [dbo].[ChiTietDonHangs] (
    [MaCTHoaDon] INT IDENTITY (1, 1) NOT NULL,
    [MaDon]      INT NOT NULL,
    [MaSP]       INT NOT NULL,
    [SoLuong]    INT NOT NULL,
    CONSTRAINT [PK_dbo.ChiTietDonHangs] PRIMARY KEY CLUSTERED ([MaCTHoaDon] ASC),
    CONSTRAINT [FK_dbo.ChiTietDonHangs_dbo.SanPhams_MaSP] FOREIGN KEY ([MaSP]) REFERENCES [dbo].[SanPhams] ([MaSP]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.ChiTietDonHangs_dbo.DonHangs_MaDon] FOREIGN KEY ([MaDon]) REFERENCES [dbo].[DonHangs] ([MaDon]) ON DELETE CASCADE
);
GO
--THÊM DỮ LIỆU---
SET IDENTITY_INSERT [dbo].[LoaiHangs] ON
INSERT INTO [dbo].[LoaiHangs] ([MaLoai], [TenLoaiHang]) VALUES (1, N'Hoa Nhà Len')
INSERT INTO [dbo].[LoaiHangs] ([MaLoai], [TenLoaiHang]) VALUES (2, N'Áo kiểu xinh')
INSERT INTO [dbo].[LoaiHangs] ([MaLoai], [TenLoaiHang]) VALUES (3, N'Túi xách ')
INSERT INTO [dbo].[LoaiHangs] ([MaLoai], [TenLoaiHang]) VALUES (4, N'Đầm xinh')
SET IDENTITY_INSERT [dbo].[LoaiHangs] OFF


SET IDENTITY_INSERT [dbo].[SanPhams] ON
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (1, N'Bó hoa xanh trắng tổng hợp hoa ', CAST(450000.00 AS Decimal(18, 2)), 5, N'Hoa được làm thủ công', N'/Image/Bo hoa xanh trang.jpg', 1)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (2, N'Bó hoa tím trắng pastel mộng mơ ', CAST(380000.00 AS Decimal(18, 2)), 4, N'Có thể tặng sinh nhật hoặc kỷ niệm', N'/Image/Bo hoa tim trang.jpg', 1)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (3, N'Bó hoa tím hồng pastel nhiều loại hoa', CAST(480000.00 AS Decimal(18, 2)), 6, N'Dịp lễ là sự thích hợp', N'/Image/bo_hoa_tim_hong.jpg', 1)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (4, N'Áo kiểu xanh len sọc trắng mẫu mới', CAST(300000.00 AS Decimal(18, 2)), 10, N'Đi biển là sự hợp lý', N'/Image/Ao kieu xanh bien.jpg', 2)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (5, N'Áo bảy sắc cầu vồng tay dài hot trend', CAST(570000.00 AS Decimal(18, 2)), 12, N'Mùa đông tới người không tới thì thôi', N'/Image/Ao bay sac cau vong.jpg', 2)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (6, N'Áo kiểu xanh bơ nơ giữ ấm mùa đông', CAST(290000.00 AS Decimal(18, 2)), 7, N'Xanh lá nhưng không xa lánh', N'/Image/ao kieu xanh bo.jpg', 2)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (7, N'Áo croptop hoa bi nhỏ màu hồng be', CAST(180000.00 AS Decimal(18, 2)), 11, N'Vườn hoa này chỉ cần một chủ', N'/Image/ao_no_hoa.jpg', 2)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (8, N'Túi đeo Cinamoroll tai dài dễ thương', CAST(400000.00 AS Decimal(18, 2)), 20, N'Túi xách thú nhồi bông tai dài ', N'/Image/tui_tai_dai_trang_xanh.jpg', 3)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (9, N'Túi que kem nhiều màu sắc trẻ trung', CAST(630000.00 AS Decimal(18, 2)), 10, N'Túi xách đầy màu sắc chấp mọi đồ', N'/Image/Tui kem bay màu.jpg', 3)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (10, N'Túi hoa cúc xanh trắng dây đeo biển', CAST(800000.00 AS Decimal(18, 2)), 5, N'Sự thích hợp với trang phục nữ tính', N'/Image/Tui hoa cuc xanh trang.jpg', 3)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (11, N'Túi xanh phiên bản giới hạn dây đeo', CAST(950000.00 AS Decimal(18, 2)), 3, N'Phiên bản giới hạn', N'/Image/Tui day deo phien ban gioi han.jpg', 3)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (12, N'Váy Hoa thêu xanh hồng pastel body', CAST(700000.00 AS Decimal(18, 2)), 9, N'Những buổi tiệc cùng bạn bè ', N'/Image/Dam_xanh_hong.jpg', 4)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (13, N'Váy sọc caro hồng trắng khoét eo ', CAST(650000.00 AS Decimal(18, 2)), 13, N'Hẹn hò không thể hợp lý hơn', N'/Image/vay caro do trang.jpg', 4)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (14, N'Váy cột lông tơ nữ tính cầu vồng ấm ', CAST(850000.00 AS Decimal(18, 2)), 3, N'Phiên bản giới hạn', N'/Image/vay long to.jpg', 4)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (15, N'Set váy trắng xanh năng động gen Z', CAST(420000.00 AS Decimal(18, 2)), 8, N'Không cần suy nghĩ phối đồ', N'/Image/set vay xanh trang.jpg', 4)
INSERT INTO [dbo].[SanPhams] ([MaSP], [TenSP], [GiaBan], [SoLuong], [MoTa], [AnhSP], [LoaiHang_MaLoai]) VALUES (16, N'Bó Hoa hồng đỏ đặc biệt mùa giáng sinh', CAST(520000.00 AS Decimal(18, 2)), 10, N'Nếu cậu xuất hiện cùng với bó hoa này thì chúng ta thành đôi', N'/Image/Bo hoa hong do.jpg', 1)
SET IDENTITY_INSERT [dbo].[SanPhams] OFF



