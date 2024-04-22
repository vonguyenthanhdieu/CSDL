CREATE DATABASE NuocGiaiKhat
Go

use NuocGiaiKhat
GO

create table NGK(MaNGK varchar(3) primary key,
				TenNGK nvarchar(20),
				Quycach nvarchar(10),
				MaLoaiNGK char(3))
GO

create table LOAINGK(MaLoaiNGK char(3) primary key,
					TenLoaiNGK nvarchar(30),
					MaNCC char(3))
GO

create table NHACC(MaNCC char(3) primary key,
					TenNCC nvarchar(30),
					DiaChiNCC nvarchar(50),
					DTNCC nvarchar(20))
GO

create table KH(MaKH char(4) primary key,
				TenKH nvarchar(30),
				DCKH nvarchar(30),
				DTKH nvarchar(20))
GO

create table DDH(SoDDH char(5) primary key,
				NgayDH datetime,
				MaNCC char(3))
GO

create table CT_DDH(SoDDH char(5) not null,
					MaNGK varchar(3) not null,
					SLDat int,
Constraint pr_ctddh Primary key(SoDDH, MaNGK))
GO

create table PHIEUGH(SoPGH char(5) primary key,
					NgayGH datetime,
					SoDDH char(5))
GO

create table CT_PGH(SoPGH char(5) not null,
					MaNGK varchar(3) not null,
					SLGiao int,
					DGGiao int,
constraint pr_ctpgh primary key(SoPGH, MaNGK))
GO

create table HOADON(SoHD char(4) primary key,
					NgaylapHD datetime,
					MaKH char(4))
GO 

create table CT_HOADON(SoHD char(4) not null,
						MaNGK varchar(3) not null,
						SLKHMua int,
						DKBan int,
constraint pr_cthoadon primary key(SoHD, MaNGK))
GO

create table PHIEUHEN(SoPH char(4) primary key,
						NgayLapPH datetime,
						NgayHenGiao datetime,
						MaKH char(4),
constraint for_phieuhen foreign key(MaKH) references KH(MaKH))
GO

create table CT_PH(SoPH char(4) not null,
					MaNGK varchar(3) not null,
					SLHen int,
constraint pr_ctph primary key(SoPH, MaNGK),
constraint for_ctph foreign key(SoPH) references PHIEUHEN(SoPH),
constraint for_ctph2 foreign key(MaNGK) references NGK(MaNGK))
GO

create table PHIEUTRANO(SoPTN char(5) primary key,
						NgayTra datetime,
						SoTienTra int,
						SoHD char(4),
constraint for_Phieutrano foreign key(SoHD) References HOADON(SoHD))
GO

-- add khoa ngoai

alter table NGK 
ADD constraint for_NGK Foreign key(MaLoaiNGK) references LOAINGK(MaLoaiNGK)
GO

alter table LOAINGK
add constraint for_loaingk foreign key(MaNCC) references NHACC(MaNCC)
Go

alter table DDH 
add constraint for_ddh foreign key(MaNCC) references NHACC(MaNCC)
Go

alter table PHIEUGH 
add constraint for_phieugh foreign key(SoDDH) references DDH(SoDDH)
Go

alter table HOADON 
add constraint for_hoadon foreign key(MaKH) references KH(MaKH)
Go

--alter table PHIEUHEN 
--add constraint for_phieuhen foreign key(MaKH) references KH(MaKH)
--Go

alter table CT_HOADON
add constraint for_cthd foreign key(SoHD) references HOADON(SoHD)

alter table CT_HOADON
add constraint for_cthd2 foreign key(MaNGK) references NGK(MaNGK)
GO

alter table CT_DDH
add constraint for_ctddh foreign key(SoDDH) references DDH(SoDDH)

alter table CT_DDH
add constraint for_ctddh2 foreign key(MaNGK) references NGK(MaNGK)
GO

alter table CT_PGH
add constraint for_ctpgh foreign key(SoPGH) references PHIEUGH(SoPGH)

alter table CT_PGH
add constraint for_ctpgh2 foreign key(MaNGK) references NGK(MaNGK)
GO

--alter table CT_PH
--add constraint for_ctph1 foreign key(SoPH) references PHIEUHEN(SoPH)

--alter table CT_PH
--add constraint for_ctph2 foreign key(MaNGK) references NGK(MaNGK)
--GO

--II. NGON NGU THAO TAC DU LIEU
--Nhap du lieu
insert into NHACC
	values('NC1', 'Công ty NGK quốc tế CocaCola', 'Xa lộ Hà Nội, Thủ Đức, TP.HCM', '088967908')
insert into NHACC
	values('NC2', 'Công ty NGK quốc tế Pepsi', 'Bến Chương Dương, quận 1, TP.HCM', '083663366')
insert into NHACC
	values('NC3', 'Công ty NGK Bến Chương Dương', 'Hàm Tử, Q.5, TP.HCM', '089456677')

insert into LOAINGK
	values ('NK1', 'Nước ngọt có gas', 'NC1')
insert into LOAINGK
	values ('NK2', 'Nước ngọt không gas', 'NC2')
insert into LOAINGK
	values ('NK3', 'Trà', 'NC1')
insert into LOAINGK
	values ('NK4', 'Sữa', 'NC2')

insert into NGK
	values ('CC1', 'Coca Cola', 'Chai', 'NK1')
insert into NGK
	values ('CC2', 'Coca Cola', 'Lon', 'NK1')
insert into NGK
	values ('PS1', 'Pepsi', 'Chai', 'NK1')
insert into NGK
	values ('PS2', 'Pepsi', 'Lon', 'NK1')
insert into NGK
	values ('SV1', 'Seven Up', 'Chai', 'NK1')
insert into NGK
	values ('SV2', 'Seven Up', 'Lon', 'NK1')
insert into NGK
	values ('NO1', 'Number One', 'Chai', 'NK1')
insert into NGK
	values ('NO2', 'Number One', 'Lon', 'NK1')
insert into NGK
	values ('ST1', 'Sting dâu', 'Chai', 'NK1')
insert into NGK
	values ('ST2', 'Sting dâu', 'Lon', 'NK1')
insert into NGK
	values ('C2', 'Trà C2', 'Chai', 'NK2')
insert into NGK
	values ('OD', 'Trà xanh 0 độ', 'Chai', 'NK2')
insert into NGK
	values ('ML1', 'Sữa tươi tiệt trùng', 'Bịch', 'NK1')
insert into NGK
	values ('WT1', 'Nước uống đóng chai', 'Chai', 'NK2')

insert into KH
	values('KH01', 'Cửa hàng BT', '144 XVNT', '088405996')
insert into KH
	values('KH02', 'Cửa hàng Trà', '198/42 NTT', '085974572')
insert into KH
	values('KH03', 'Siêu thị Coop', '24 ĐTH', '086547888')

insert into DDH
	values('DDH01', '5/10/2011', 'NC1')
insert into DDH
	values('DDH02', '5/20/2011', 'NC1')
insert into DDH
	values('DDH03', '5/26/2011', 'NC2')
insert into DDH
	values('DDH04', '6/03/2011', 'NC2')

insert into CT_DDH
	values('DDH01', 'CC1', 20)
insert into CT_DDH
	values('DDH01', 'CC2', 15)
insert into CT_DDH
	values('DDH01', 'PS1', 18)
insert into CT_DDH
	values('DDH01', 'SV2', 12)
insert into CT_DDH
	values('DDH02', 'CC2', 30)
insert into CT_DDH
	values('DDH02', 'PS2', 10)
insert into CT_DDH
	values('DDH02', 'SV1', 5)
insert into CT_DDH
	values('DDH02', 'ST1', 15)
insert into CT_DDH
	values('DDH02', 'C2', 10)
insert into CT_DDH
	values('DDH03', 'OD', 45)
insert into CT_DDH
	values('DDH04', 'CC1', 8)
insert into CT_DDH
	values('DDH04', 'ST2', 12)

insert into PHIEUGH
	values('PGH01', '5/12/2010', 'DDH01')
insert into PHIEUGH
	values('PGH02', '5/15/2010', 'DDH01')
insert into PHIEUGH
	values('PGH03', '5/21/2010', 'DDH02')
insert into PHIEUGH
	values('PGH04', '5/22/2010', 'DDH02')
insert into PHIEUGH
	values('PGH05', '5/28/2010', 'DDH03')

insert into CT_PGH
	values('PGH01', 'CC1', 15, 5000)
insert into CT_PGH
	values('PGH01', 'CC2', 15, 4000)
insert into CT_PGH
	values('PGH01', 'SV2', 10, 4000)
insert into CT_PGH
	values('PGH02', 'SV2', 2, 4000)
insert into CT_PGH
	values('PGH03', 'CC2', 30, 5000)
insert into CT_PGH
	values('PGH03', 'PS2', 10, 4000)
insert into CT_PGH
	values('PGH03', 'ST1', 15, 9000)
insert into CT_PGH
	values('PGH03', 'C2', 10, 8000)

insert into HOADON	
	values('HD01', '5/10/2010', 'KH01')
insert into HOADON	
	values('HD02', '5/10/2010', 'KH01')
insert into HOADON	
	values('HD03', '6/5/2010', 'KH02')
insert into HOADON	
	values('HD04', '6/16/2010', 'KH02')
insert into HOADON	
	values('HD05', '6/22/2011', 'KH02')
insert into HOADON	
	values('HD06', '7/8/2010', 'KH03')

insert into CT_HOADON
	values('HD01', 'CC1', 20, 6000)
insert into CT_HOADON
	values('HD01', 'CC2', 50, 5000)
insert into CT_HOADON
	values('HD02', 'ST1', 40, 10000)
insert into CT_HOADON
	values('HD03', 'SV2', 60, 5000)
insert into CT_HOADON
	values('HD04', 'PS2', 25, 5000)
insert into CT_HOADON
	values('HD05', 'CC1', 100, 6000)
insert into CT_HOADON
	values('HD05', 'SV1', 12, 8000)
insert into CT_HOADON
	values('HD05', 'C2', 80, 9000)
insert into CT_HOADON
	values('HD06', 'OD', 55, 1000)
insert into CT_HOADON
	values('HD06', 'ST2', 50, 11000)

insert into PHIEUHEN
	values('PH01', '8/5/2010', '9/6/2010', 'KH01')
insert into PHIEUHEN
	values('PH02', '25/5/2010', '28/6/2010', 'KH02')
insert into PHIEUHEN
	values('PH03', '1/6/2010', '2/6/2010', 'KH03')

insert into CT_PH
	values('PH01', 'ST2', 10)
insert into CT_PH
	values('PH01', 'OD', 8)
insert into CT_PH
	values('PH02', 'CC1', 20)
insert into CT_PH
	values('PH03', 'ST1', 7)
insert into CT_PH
	values('PH03', 'SV2', 12)
insert into CT_PH
	values('PH03', 'CC2', 9)
insert into CT_PH
	values('PH04', 'PS2', 15)

insert into PHIEUTRANO
	values('PTN01', '5/18/2010', 500000, 'HD01')
insert into PHIEUTRANO
	values('PTN02', '6/01/2010', 350000, 'HD01')
insert into PHIEUTRANO
	values('PTN03', '6/02/2010', 650000, 'HD02')
insert into PHIEUTRANO
	values('PTN04', '6/15/2010', 1020000, 'HD03')
insert into PHIEUTRANO
	values('PTN05', '7/01/2010', 1080000, 'HD03')
GO

--I. NGON NGU DINH NGHIA DU LIEU
--Them thuoc tinh GHICHU cho NGK
alter table NGK
	add GHICHU varchar(50) null
GO

--Them thuoc tinh KHUYENMAI cho HOADON
alter table HOADON
	add KHUYENMAI int null
GO

--thay doi kieu du lieu cua GHICHU
alter table NGK
	alter column GHICHU varchar(100) null
GO

--xoa thuoc tinh GHICHU
alter table NGK
	drop column GHICHU
GO

--II. NGON NGU THAO TAC DU LIEU
--Cap nhat KHUYENMAI la 10 cho HOADON duoc lap trong thang 10/2010
UPDATE HOADON
SET KHUYENMAI = 10
Where NgaylapHD >= '10/01/2010' and NgaylapHD <= '10/31/2010'
GO

--them mot dong vao CT_HOADON
INSERT INTO CT_HOADON
VALUES('HD01', 'ST1', 20, 60)
GO

--Cap nhat don gia ban len 5% doi voi MaNGK 'CC2'
UPDATE CT_HOADON
SET DKBan = DKBan*1.05
WHERE MaNGK = 'CC2'
GO

--Xoa cac dong co DGBan lon hon 150 trong quan he CT_HOADON
DELETE FROM CT_HOADON
WHERE DKBan > 150
GO

--III. Ngon ngu truy van du lieu
--1.Danh sach NGK co ma loai NGK la NK1
SELECT * FROM NGK
WHERE MaLoaiNGK = 'NK1'
GO

--2.Liet ke cac hoa don mua hang trong nam 2010
SELECT * FROM HOADON
WHERE YEAR(NgaylapHD) = '2010'
GO

--3.Cho biet cac chi tiet don hang SLDat nho hon 60
SELECT * FROM CT_DDH
WHERE SLDat < 60
GO

--4.Cho biet thong tin cac phieu tra no co so tien tra lon hon 500000 dong
SELECT * FROM PHIEUTRANO
WHERE SoTienTra > 500000
GO

--5.Cho biet thong tin nuoc giai khat co QuyCach la 'Lon'
SELECT * FROM NGK
WHERE QuyCach = 'Lon'
GO

--6.Hien thi thong tin cua NGK chua ban duoc
SELECT NGK.* 
FROM NGK LEFT JOIN CT_HOADON ct
ON NGK.MaNGK = CT.MaNGK
WHERE ct.MaNGK is null;
GO

--7.Hien thi ten va tong so luong ban cua tung NGK
SELECT TenNGK, SUM(SLKHMua) TongSLBan
FROM NGK JOIN CT_HOADON ct
ON NGK.MaNGK = ct.MaNGK
GROUP BY TenNGK
GO

--8.Hien thi ten va tong so luong NGK nhap ve
SELECT TenNGK, SUM(SLDat) TongSLNhapVe
FROM NGK JOIN CT_DDH 
ON NGK.MaNGK = CT_DDH.MaNGK
GROUP BY TenNGK
GO

--9.Hien thi DDH da dat NGK voi so luong nhieu nhat so voi cac DDH khac co dat NGK do
SELECT SoDDH, MaNGK, SUM(SLDat) TongSLBan
FROM NGK JOIN CT_DDH
ON NGK.MaNGK = CT_DDH.MaNGK
