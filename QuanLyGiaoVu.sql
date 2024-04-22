CREATE DATABASE QuanLyGiaoVu
GO
USE QuanLyGiaoVu
GO

CREATE TABLE KHOA(MAKHOA VARCHAR(4) PRIMARY KEY,
				TENKHOA VARCHAR(40),
				NGTLAP SMALLDATETIME,
				TRGKHOA CHAR(4))
GO

CREATE TABLE MONHOC(MAMH VARCHAR(10) PRIMARY KEY,
					TENMH VARCHAR(40),
					TCLT TINYINT,
					TCTH TINYINT,
					MAKHOA VARCHAR(4))
GO

CREATE TABLE DIEUKIEN(MAMH VARCHAR(10) NOT NULL,
						MAMH_TRUOC VARCHAR(10) NOT NULL,
CONSTRAINT pr_dk PRIMARY KEY(MAMH, MAMH_TRUOC))
GO

CREATE TABLE GIAOVIEN(MAGV CHAR(4) PRIMARY KEY,
					HOTEN VARCHAR(40),
					HOCVI VARCHAR(10),
					HOCHAM VARCHAR(10),
					GIOITINH VARCHAR(3),
					NGSINH SMALLDATETIME,
					NGVL SMALLDATETIME,
					HESO NUMERIC(4,2),
					MUCLUONG MONEY,
					MAKHOA VARCHAR(4))
GO

CREATE TABLE LOP(MALOP CHAR(3) PRIMARY KEY,
				TENLOP VARCHAR(40),
				TRGLOP CHAR(5),
				SISO TINYINT,
				MAGVCN CHAR(4))
GO

CREATE TABLE HOCVIEN(MAHV CHAR(5) PRIMARY KEY,
					HO VARCHAR(40),
					TEN VARCHAR(10),
					NGSINH SMALLDATETIME,
					GIOITINH VARCHAR(3),
					NOISINH VARCHAR(40),
					MALOP CHAR(3))
GO

CREATE TABLE GIANGDAY(MALOP CHAR(3) NOT NULL,
					MAMH VARCHAR(10) NOT NULL,
					MAGV CHAR(4),
					HOCKY TINYINT,
					NAM SMALLINT,
					TUNGAY SMALLDATETIME,
					DENNGAY SMALLDATETIME,
CONSTRAINT pr_gd PRIMARY KEY(MALOP, MAMH))
GO

CREATE TABLE KETQUATHI(MAHV CHAR(5) NOT NULL,
						MAMH VARCHAR(10) NOT NULL,
						LANTHI TINYINT NOT NULL,
						NGTHI SMALLDATETIME,
						DIEM NUMERIC(4,2),
						KQUA VARCHAR(10),
CONSTRAINT pr_kq PRIMARY KEY(MAHV, MAMH, LANTHI))
GO

--add khoa ngoai
ALTER TABLE MONHOC
ADD CONSTRAINT for_mh FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
GO

ALTER TABLE DIEUKIEN
ADD CONSTRAINT for_dk FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
GO

ALTER TABLE GIAOVIEN
ADD CONSTRAINT for_gv FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
GO

ALTER TABLE GIANGDAY
ADD CONSTRAINT for_gd FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)

ALTER TABLE GIANGDAY
ADD CONSTRAINT for_gd2 FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
GO

ALTER TABLE KETQUATHI
ADD CONSTRAINT for_kqt FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV)

ALTER TABLE KETQUATHI
ADD CONSTRAINT for_kqt2 FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
GO

ALTER TABLE LOP
ADD CONSTRAINT for_l FOREIGN KEY(MAGVCN) REFERENCES GIAOVIEN(MAGV)
GO

ALTER TABLE HOCVIEN
ADD CONSTRAINT for_hv FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
GO

--nhap data
INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP, TRGKHOA) 
VALUES
	('KHMT', 'Khoa hoc may tinh', '7/6/2005', 'GV01'),
	('HTTT', 'He thong thong tin', '7/6/2005', 'GV02'),
	('CNPM', 'Cong nghe phan mem', '7/6/2005', 'GV04'),
	('MTT', 'Mang va truyen thong', '20/10/2005', 'GV03'),
	('KTMT', 'Ky thuat may tinh', '20/12/2005', NULL);
GO

INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA)
VALUES
    ('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '2/5/1950', '11/1/2004', 5.00, 2250000, 'KHMT'),
    ('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '17/12/1965', '20/4/2004', 4.50, 2025000, 'HTTT'),
    ('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1/8/1950', '23/9/2004', 4.00, 1800000, 'CNPM'),
    ('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '22/2/1961', '12/1/2005', 4.50, 2025000, 'KTMT'),
    ('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '12/3/1958', '12/1/2005', 3.00, 1350000, 'HTTT'),
    ('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '11/3/1953', '12/1/2005', 4.50, 2025000, 'KHMT'),
    ('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam', '23/11/1971', '1/3/2005', 4.00, 1800000, 'KHMT'),
    ('GV08', 'Le Thi Tran', 'KS', NULL, 'Nu', '26/3/1974', '1/3/2005', 1.69, 760500, 'KHMT'),
    ('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '31/12/1966', '1/3/2005', 4.00, 1800000, 'HTTT'),
    ('GV10', 'Le Tran Anh Loan', 'KS', NULL, 'Nu', '17/7/1972', '1/3/2005', 1.86, 837000, 'CNPM'),
    ('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '12/1/1980', '15/5/2005', 2.67, 1201500, 'MTT'),
    ('GV12', 'Tran Van Anh', 'CN', NULL, 'Nu', '29/3/1981', '15/5/2005', 1.69, 760500, 'CNPM'),
    ('GV13', 'Nguyen Linh Dan', 'CN', NULL, 'Nu', '23/5/1980', '15/5/2005', 1.69, 760500, 'KTMT'),
    ('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '30/11/1976', '15/5/2005', 3.00, 1350000, 'MTT'),
    ('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam', '4/5/1978', '15/5/2005', 3.00, 1350000, 'KHMT');
GO

INSERT INTO LOP (MALOP, TENLOP, TRGLOP, SISO, MAGVCN)
VALUES
    ('K11', 'Lop 1 khoa 1', 'K1108', 11, 'GV07'),
    ('K12', 'Lop 2 khoa 1', 'K1205', 12, 'GV09'),
    ('K13', 'Lop 3 khoa 1', 'K1305', 12, 'GV14');
GO

INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA)
VALUES
    ('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT'),
    ('CTRR', 'Cau truc roi rac', 5, 0, 'KHMT'),
    ('CSDL', 'Co so du lieu', 3, 1, 'HTTT'),
    ('CTDLGT', 'Cau truc du lieu va giai thuat', 3, 1, 'KHMT'),
    ('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 0, 'KHMT'),
    ('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT'),
    ('KTMT', 'Kien truc may tinh', 3, 0, 'KTMT'),
    ('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT'),
    ('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 4, 1, 'HTTT'),
    ('HDH', 'He dieu hanh', 4, 0, 'KTMT'),
    ('NMCNPM', 'Nhap mon cong nghe phan mem', 3, 0, 'CNPM'),
    ('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM'),
    ('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM');
GO

INSERT INTO GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) 
VALUES
    ('K11', 'THDC', 'GV07', 1, 2006, '2/1/2006', '12/5/2006'),
    ('K12', 'THDC', 'GV06', 1, 2006, '2/1/2006', '12/5/2006'),
    ('K13', 'THDC', 'GV15', 1, 2006, '2/1/2006', '12/5/2006'),
    ('K11', 'CTRR', 'GV02', 1, 2006, '9/1/2006', '17/5/2006'),
    ('K12', 'CTRR', 'GV02', 1, 2006, '9/1/2006', '17/5/2006'),
    ('K13', 'CTRR', 'GV08', 1, 2006, '9/1/2006', '17/5/2006'),
    ('K11', 'CSDL', 'GV05', 2, 2006, '1/6/2006', '15/7/2006'),
    ('K12', 'CSDL', 'GV09', 2, 2006, '1/6/2006', '15/7/2006'),
    ('K13', 'CTDLGT', 'GV15', 2, 2006, '1/6/2006', '15/7/2006'),
    ('K13', 'CSDL', 'GV05', 3, 2006, '1/8/2006', '15/12/2006'),
    ('K13', 'DHMT', 'GV07', 3, 2006, '1/8/2006', '15/12/2006'),
    ('K11', 'CTDLGT', 'GV15', 3, 2006, '1/8/2006', '15/12/2006'),
    ('K12', 'CTDLGT', 'GV15', 3, 2006, '1/8/2006', '15/12/2006'),
    ('K11', 'HDH', 'GV04', 1, 2007, '2/1/2007', '18/2/2007'),
    ('K12', 'HDH', 'GV04', 1, 2007, '2/1/2007', '20/3/2007'),
    ('K11', 'DHMT', 'GV07', 1, 2007, '18/2/2007', '20/3/2007');
GO

INSERT INTO DIEUKIEN (MAMH, MAMH_TRUOC) 
VALUES
    ('CSDL', 'CTRR'),
    ('CSDL', 'CTDLGT'),
    ('CTDLGT', 'THDC'),
    ('PTTKTT', 'THDC'),
    ('PTTKTT', 'CTDLGT'),
    ('DHMT', 'THDC'),
    ('LTHDT', 'THDC'),
    ('PTTKHTTT', 'CSDL');
GO

INSERT INTO HOCVIEN (MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) 
VALUES
    ('K1101', 'Nguyen Van', 'A', '27/1/1986', 'Nam', 'TpHCM', 'K11'),
    ('K1102', 'Tran Ngoc', 'Han', '14/3/1986', 'Nu', 'Kien Giang', 'K11'),
    ('K1103', 'Ha Duy', 'Lap', '18/4/1986', 'Nam', 'Nghe An', 'K11'),
    ('K1104', 'Tran Ngoc', 'Linh', '30/3/1986', 'Nu', 'Tay Ninh', 'K11'),
    ('K1105', 'Tran Minh', 'Long', '27/2/1986', 'Nam', 'TpHCM', 'K11'),
    ('K1106', 'Le Nhat', 'Minh', '24/1/1986', 'Nam', 'TpHCM', 'K11'),
    ('K1107', 'Nguyen Nhu', 'Nhut', '27/1/1986', 'Nam', 'Ha Noi', 'K11'),
    ('K1108', 'Nguyen Manh', 'Tam', '27/2/1986', 'Nam', 'Kien Giang', 'K11'),
    ('K1109', 'Phan Thi Thanh', 'Tam', '27/1/1986', 'Nu', 'Vinh Long', 'K11'),
    ('K1110', 'Le Hoai', 'Thuong', '5/2/1986', 'Nu', 'Can Tho', 'K11'),
    ('K1111', 'Le Ha', 'Vinh', '25/12/1986', 'Nam', 'Vinh Long', 'K11'),
    ('K1201', 'Nguyen Van', 'B', '11/2/1986', 'Nam', 'TpHCM', 'K12'),
    ('K1202', 'Nguyen Thi Kim', 'Duyen', '18/1/1986', 'Nu', 'TpHCM', 'K12'),
    ('K1203', 'Tran Thi Kim', 'Duyen', '17/9/1986', 'Nu', 'TpHCM', 'K12'),
    ('K1204', 'Truong My', 'Hanh', '19/5/1986', 'Nu', 'Dong Nai', 'K12'),
    ('K1205', 'Nguyen Thanh', 'Nam', '17/4/1986', 'Nam', 'TpHCM', 'K12'),
    ('K1206', 'Nguyen Thi Truc', 'Thanh', '4/3/1986', 'Nu', 'Kien Giang', 'K12'),
    ('K1207', 'Tran Thi Bich', 'Thuy', '8/2/1986', 'Nu', 'Nghe An', 'K12'),
    ('K1208', 'Huynh Thi Kim', 'Trieu', '8/4/1986', 'Nu', 'Tay Ninh', 'K12'),
    ('K1209', 'Pham Thanh', 'Trieu', '23/2/1986', 'Nam', 'TpHCM', 'K12'),
    ('K1210', 'Ngo Thanh', 'Tuan', '14/2/1986', 'Nam', 'TpHCM', 'K12'),
    ('K1211', 'Do Thi', 'Xuan', '9/3/1986', 'Nu', 'Ha Noi', 'K12'),
    ('K1212', 'Le Thi Phi', 'Yen', '12/3/1986', 'Nu', 'TpHCM', 'K12'),
    ('K1301', 'Nguyen Thi Kim', 'Cuc', '9/6/1986', 'Nu', 'Kien Giang', 'K13'),
    ('K1302', 'Truong Thi My', 'Hien', '18/3/1986', 'Nu', 'Nghe An', 'K13'),
    ('K1303', 'Le Duc', 'Hien', '21/3/1986', 'Nam', 'Tay Ninh', 'K13'),
    ('K1304', 'Le Quang', 'Hien', '18/4/1986', 'Nam', 'TpHCM', 'K13'),
    ('K1305', 'Le Thi', 'Huong', '27/3/1986', 'Nu', 'TpHCM', 'K13'),
    ('K1306', 'Nguyen Thai', 'Huu', '30/3/1986', 'Nam', 'Ha Noi', 'K13'),
    ('K1307', 'Tran Minh', 'Man', '28/5/1986', 'Nam', 'TpHCM', 'K13'),
    ('K1308', 'Nguyen Hieu', 'Nghia', '8/4/1986', 'Nam', 'Kien Giang', 'K13'),
    ('K1309', 'Nguyen Trung', 'Nghia', '18/1/1987', 'Nam', 'Nghe An', 'K13'),
    ('K1310', 'Tran Thi Hong', 'Tham', '22/4/1986', 'Nu', 'Tay Ninh', 'K13'),
    ('K1311', 'Tran Minh', 'Thuc', '4/4/1986', 'Nam', 'TpHCM', 'K13'),
    ('K1312', 'Nguyen Thi Kim', 'Yen', '7/9/1986', 'Nu', 'TpHCM', 'K13');
GO

-- Nhập dữ liệu cho KETQUATHI --
insert into KETQUATHI values('K1101','CSDL',1,'20/7/2006',10.00,'Dat')
insert into KETQUATHI values('K1101','CTDLGT',1,'28/12/2006',9.00,'Dat')
insert into KETQUATHI values('K1101','THDC',1,'20/5/2006',9.00,'Dat')
insert into KETQUATHI values('K1101','CTRR',1,'13/5/2006',9.50,'Dat')
insert into KETQUATHI values('K1102','CSDL',1,'20/7/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1102','CSDL',2,'27/7/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1102','CSDL',3,'10/8/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',1,'28/12/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',2,'5/1/2007',4.00,'Khong Dat')
insert into KETQUATHI values('K1102','CTDLGT',3,'15/1/2007',6.00,'Dat')
insert into KETQUATHI values('K1102','THDC',1,'20/5/2006',5.00,'Dat')
insert into KETQUATHI values('K1102','CTRR',1,'13/5/2006',7.00,'Dat')
insert into KETQUATHI values('K1103','CSDL',1,'20/7/2006',3.50,'Khong Dat')
insert into KETQUATHI values('K1103','CSDL',2,'27/7/2006',8.25,'Dat')
insert into KETQUATHI values('K1103','CTDLGT',1,'28/12/2006',7.00,'Dat')
insert into KETQUATHI values('K1103','THDC',1,'20/5/2006',8.00,'Dat')
insert into KETQUATHI values('K1103','CTRR',1,'13/5/2006',6.50,'Dat')
insert into KETQUATHI values('K1104','CSDL',1,'20/7/2006',3.75,'Khong Dat')
insert into KETQUATHI values('K1104','CTDLGT',1,'28/12/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','THDC',1,'20/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',1,'13/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',2,'20/5/2006',3.50,'Khong Dat')
insert into KETQUATHI values('K1104','CTRR',3,'30/6/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1201','CSDL',1,'20/7/2006',6.00,'Dat')
insert into KETQUATHI values('K1201','CTDLGT',1,'28/12/2006',5.00,'Dat')
insert into KETQUATHI values('K1201','THDC',1,'20/5/2006',8.50,'Dat')
insert into KETQUATHI values('K1201','CTRR',1,'13/5/2006',9.00,'Dat')
insert into KETQUATHI values('K1202','CSDL',1,'20/7/2006',8.00,'Dat')
insert into KETQUATHI values('K1202','CTDLGT',1,'28/12/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTDLGT',2,'5/1/2007',5.00,'Dat')
insert into KETQUATHI values('K1202','THDC',1,'20/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','THDC',2,'27/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTRR',1,'13/5/2006',3.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTRR',2,'20/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1202','CTRR',3,'30/6/2006',6.25,'Dat')
insert into KETQUATHI values('K1203','CSDL',1,'20/7/2006',9.25,'Dat')
insert into KETQUATHI values('K1203','CTDLGT',1,'28/12/2006',9.50,'Dat')
insert into KETQUATHI values('K1203','THDC',1,'20/5/2006',10.00,'Dat')
insert into KETQUATHI values('K1203','CTRR',1,'13/5/2006',10.00,'Dat')
insert into KETQUATHI values('K1204','CSDL',1,'20/7/2006',8.50,'Dat')
insert into KETQUATHI values('K1204','CTDLGT',1,'28/12/2006',6.75,'Dat')
insert into KETQUATHI values('K1204','THDC',1,'20/5/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1204','CTRR',1,'13/5/2006',6.00,'Dat')
insert into KETQUATHI values('K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1301','CTDLGT',1,'25/7/2006',8.00,'Dat')
insert into KETQUATHI values('K1301','THDC',1,'20/5/2006',7.75,'Dat')
insert into KETQUATHI values('K1301','CTRR',1,'13/5/2006',8.00,'Dat')
insert into KETQUATHI values('K1302','CSDL',1,'20/12/2006',6.75,'Dat')
insert into KETQUATHI values('K1302','CTDLGT',1,'25/7/2006',5.00,'Dat')
insert into KETQUATHI values('K1302','THDC',1,'20/5/2006',8.00,'Dat')
insert into KETQUATHI values('K1302','CTRR',1,'13/5/2006',8.50,'Dat')
insert into KETQUATHI values('K1303','CSDL',1,'20/12/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',1,'25/7/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',2,'7/8/2006',4.00,'Khong Dat')
insert into KETQUATHI values('K1303','CTDLGT',3,'15/8/2006',4.25,'Khong Dat')
insert into KETQUATHI values('K1303','THDC',1,'20/5/2006',4.50,'Khong Dat')
insert into KETQUATHI values('K1303','CTRR',1,'13/5/2006',3.25,'Khong Dat')
insert into KETQUATHI values('K1303','CTRR',2,'20/5/2006',5.00,'Dat')
insert into KETQUATHI values('K1304','CSDL',1,'20/12/2006',7.75,'Dat')
insert into KETQUATHI values('K1304','CTDLGT',1,'25/7/2006',9.75,'Dat')
insert into KETQUATHI values('K1304','THDC',1,'20/5/2006',5.50,'Dat')
insert into KETQUATHI values('K1304','CTRR',1,'13/5/2006',5.00,'Dat')
insert into KETQUATHI values('K1305','CSDL',1,'20/12/2006',9.25,'Dat')
insert into KETQUATHI values('K1305','CTDLGT',1,'25/7/2006',10.00,'Dat')
insert into KETQUATHI values('K1305','THDC',1,'20/5/2006',8.00,'Dat')
insert into KETQUATHI values('K1305','CTRR',1,'13/5/2006',10.00,'Dat')
GO

--2. Thêm vào thuộc tính NAMSINH cho quan hệ HOCVIEN.
ALTER TABLE HOCVIEN
ADD NAMSINH INT NULL;
GO

--3. Thêm vào các thuộc tính THAMNIEN, PCTHAMNIEN (phụ cấp thâm niên) cho quan hệ GIAOVIEN
ALTER TABLE GIAOVIEN
ADD THAMNIEN TINYINT NULL;

ALTER TABLE GIAOVIEN
ADD PCTHAMNIEN MONEY NULL;
GO

--4. Thêm vào các ràng buộc toàn vẹn sau:
-- a. Thuộc tính GIOITINH chỉ có giá trị là “Nam” hoặc “Nu”. 
ALTER TABLE GIAOVIEN
ADD CONSTRAINT gt_gv CHECK (GIOITINH = 'Nam' OR GIOITINH = 'Nu')

ALTER TABLE HOCVIEN
ADD CONSTRAINT gt_hv CHECK (GIOITINH = 'Nam' OR GIOITINH = 'Nu')
GO

--b. Điểm số có giá trị từ 0 đến 10 
ALTER TABLE KETQUATHI
ADD CONSTRAINT d CHECK (DIEM>=0 AND DIEM <=10)
GO

--c. Học kỳ chỉ có giá trị từ 1 đến 3. 
ALTER TABLE GIANGDAY
ADD CONSTRAINT hk CHECK (HOCKY >=1 AND HOCKY <=3)
GO

--d. Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”.
ALTER TABLE GIAOVIEN
ADD CONSTRAINT hvi CHECK (HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS'))
GO

--e. Một môn học phải có ngày bắt đầu (TUNGAY) nhỏ hơn ngày kết thúc (DENNGAY). 
ALTER TABLE GIANGDAY
ADD CONSTRAINT ngay CHECK (TUNGAY < DENNGAY)
GO

--B. Ngôn ngữ thao tác dữ liệu (DML): 
--2. Cập nhật giá trị NAMSINH cho quan hệ HOCVIEN bằng giá trị year(NGAYSINH)
UPDATE HOCVIEN
SET NAMSINH = YEAR(NGSINH)
GO

--3. Cập nhật giá trị THAMNIEN cho quan hệ GIAOVIEN bằng giá trị year(GETDATE())-year(NGVL)UPDATE GIAOVIENSET THAMNIEN = YEAR(GETDATE()) - YEAR(NGVL)GOSELECT * FROM GIAOVIEN--4. Cập nhật giá trị PCTHAMNIEN cho quan hệ GIAOVIEN như sau:
-- Nếu THAMNIEN >5 : PCTHAMNIEN là 500000
-- Nếu 5>=THAMNIEN >3 : PCTHAMNIEN là 300000
-- Nếu 3>=THAMNIEN >1 : PCTHAMNIEN là 100000
UPDATE GIAOVIEN
SET PCTHAMNIEN = 500000
WHERE THAMNIEN > 5

UPDATE GIAOVIEN
SET PCTHAMNIEN = 300000
WHERE THAMNIEN >3 AND THAMNIEN <=5

UPDATE GIAOVIEN
SET PCTHAMNIEN = 100000
WHERE THAMNIEN <=3 AND THAMNIEN >1
GO

--C. Sử dụng ngôn ngữ SQL thực hiện các yêu cầu sau:
--1. Cho biết danh sách các khoa được thành lập trong 6 tháng cuối năm 2005SELECT * FROM KHOAWHERE YEAR(NGTLAP) = 2005 AND (MONTH(NGTLAP) >=6 AND MONTH(NGTLAP) <=12)GO--2. Cho biết danh sách các khoa chưa có trưởng khoaSELECT * FROM KHOAWHERE TRGKHOA IS NULLGO--3. Cho biết danh sách các khoa có tên khoa bắt đầu bởi ký tự ‘k’ và kết thúc bởi ký tự ‘h’SELECT * FROM KHOAWHERE TENKHOA LIKE 'k%h'GO--4. Cho biết danh sách các khoa được thành lập sớm nhấtSELECT * FROM KHOAWHERE NGTLAP = (SELECT MIN(NGTLAP) FROM KHOA)GO--5. Cho biết danh sách giáo viên có mức lương thấp nhấtSELECT * FROM GIAOVIENWHERE MUCLUONG = (SELECT MIN(MUCLUONG) FROM GIAOVIEN)GO--6. Cho biết danh sách giáo viên có hoc vị tiến sĩ và nhỏ hơn 50 tuổiSELECT * FROM GIAOVIENWHERE HOCVI = 'TS' AND YEAR(GETDATE()) - YEAR(NGSINH) < 50GO--7. Cho biết danh sách giáo viên nam có mức lương >1800000 SELECT * FROM GIAOVIENWHERE GIOITINH = 'Nam' AND MUCLUONG > 180000GO--8. Cho biết danh sách giáo viên lớn tuổi nhấtSELECT * FROM GIAOVIENWHERE YEAR(GETDATE()) - YEAR(NGSINH) = 	(SELECT MAX(YEAR(GETDATE()) - YEAR(NGSINH)) FROM GIAOVIEN)GO--9. Cho biết danh sách học viên nữ, sinh tại Vĩnh long và lớn hơn 30 tuổiSELECT * FROM HOCVIENWHERE GIOITINH = 'Nu' AND NOISINH = 'Vinh Long' AND 	YEAR(GETDATE()) - YEAR(NGSINH) >30GO--10. Cho biết danh sách học viên nhỏ tuổi nhấtSELECT * FROM HOCVIENWHERE NGSINH = 	(SELECT MAX(NGSINH) FROM HOCVIEN)GO--11. In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp. SELECT 