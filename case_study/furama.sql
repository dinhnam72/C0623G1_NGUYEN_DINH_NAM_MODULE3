CREATE DATABASE furama;
use furama;
CREATE TABLE vi_tri(
	ma_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45),
    delete_flag INT
);
CREATE TABLE trinh_do(
	ma_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do  VARCHAR(45),
    delete_flag INT
);
CREATE TABLE bo_phan(
	ma_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan  VARCHAR(45),
    delete_flag INT
);
CREATE TABLE nhan_vien(
	ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
	ma_bo_phan INT,
	FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
	FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
	FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan),
    delete_flag INT
);
CREATE TABLE loai_khach(
	ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45),
    delete_flag INT
);
CREATE TABLE khach_hang(
	ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    ma_loai_khach INT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh bit(1) NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY(ma_loai_khach) REFERENCES loai_khach(ma_loai_khach),
    delete_flag INT
);
CREATE TABLE kieu_thue(
	ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45),
    delete_flag INT
);
CREATE TABLE loai_dich_vu(
	ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45),
    delete_flag INT
);
CREATE TABLE dich_vu(
	ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT,
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem text,
    FOREIGN KEY(ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    FOREIGN KEY(ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu),
    delete_flag INT
);
CREATE TABLE dich_vu_di_kem(
	ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45),
    delete_flag INT
);
CREATE TABLE hop_dong(
	ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    ngay_lam_hop_dong DATEtime NOT NULL,
    ngay_ket_thuc DATEtime NOT NULL,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY(ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY(ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY(ma_dich_vu) REFERENCES dich_vu(ma_dich_vu),
    delete_flag INT
);

CREATE TABLE hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    so_luong INT NOT NULL,
    FOREIGN KEY(ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem),
    FOREIGN KEY(ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    delete_flag INT
);
INSERT INTO vi_tri(ten_vi_tri,delete_flag)
VALUES
('Quản Lý',0),
('Nhân Viên',0);
INSERT INTO trinh_do(ten_trinh_do,delete_flag)
VALUES
('Trung Cấp',0),
('Cao Đẳng',0),
('Đại Học',0),
('Sau Đại Học',0);
INSERT INTO bo_phan(ten_bo_phan,delete_flag)
VALUES
('Sale-Marketing',0),
('Hành chính',0),
('Phục vụ',0),
('Quản lý',0);
INSERT INTO nhan_vien( ho_ten ,ngay_sinh ,so_cmnd ,luong ,so_dien_thoai ,email ,dia_chi,ma_vi_tri ,ma_trinh_do ,ma_bo_phan,delete_flag)
VALUES
('Nguyễn Văn An','1970-11-07','456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1,0),
('Lê Văn Bình','1997-04-09','654231234',7000000,'0934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2,0),
('Hồ Thị Yến','1995-12-12','999231723',14000000,'0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2,0),
('Võ Công Toản','1980-04-04','123231365',17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4,0),
('Nguyễn Bỉnh Phát','1999-12-09','454363232',6000000,'0902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1,0),
('Khúc Nguyễn An Nghi','2000-11-08','964542311',7000000,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,4,0),
('Nguyễn Hữu Hà','1993-01-01','534323231',8000000,'0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,1,0),
('Nguyễn Hà Đông','1989-09-03','234414123',9000000,'0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4,0),
('Tòng Hoang','1982-09-03','256781231',6000000,'0245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4,0),	
('Nguyễn Công Đạo','1994-01-08','755434343',8000000,'0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2,0);
INSERT INTO loai_khach(	ten_loai_khach,delete_flag)
VALUES 
('Diamond',0),
('Platinium',0),
('Gold',0),
('Silver',0),
('Member',0);

INSERT INTO khach_hang(ma_loai_khach ,ho_ten ,ngay_sinh ,gioi_tinh ,so_cmnd ,so_dien_thoai ,email ,dia_chi,delete_flag)
VALUES
(5,'Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',0),
(3,'Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị',0),
(1,'Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',0),
(1,'Dương Văn Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng',0),
(4,'Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',0),
(4,'Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',0),
(1,'Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',0),
(3,'Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',0),
(1,'Trần Đại Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',0),
(2,'Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng',0);
INSERT INTO kieu_thue(ten_kieu_thue,delete_flag)
VALUES
('year',0),
('month',0),
('day',0),
('hour',0);
INSERT INTO loai_dich_vu(ten_loai_dich_vu,delete_flag)
VALUES
('Villa',0),
('House',0),
('Room',0);
INSERT INTO dich_vu(ten_dich_vu ,dien_tich ,chi_phi_thue ,so_nguoi_toi_da ,ma_kieu_thue ,ma_loai_dich_vu ,tieu_chuan_phong ,
			mo_ta_tien_nghi_khac ,dien_tich_ho_boi ,so_tang ,dich_vu_mien_phi_di_kem, delete_flag)
VALUES
('Villa Beach Front',25000,1000000,10,3,1,'vip','Có hồ bơi',500,4,null,0),
('House Princess 01',14000,5000000,7,2,2,'vip','Có thêm bếp nướng',null,3,null,0),
('Room Twin 01',5000,1000000,2,4,3,'normal','Có tivi',null,null,'1 Xe máy, 1 Xe đạp',0),
('Villa No Beach Front',22000,9000000,8,3,1,'normal','Có hồ bơi',300,3,null,0),
('House Princess 02',10000,4000000,5,3,2,'normal','Có thêm bếp nướng',null,2,null,0),
('Room Twin 02',3000,900000,2,4,3,'normal','Có tivi',null,null,'1 Xe máy',0);
INSERT INTO dich_vu_di_kem( ten_dich_vu_di_kem ,gia,don_vi ,trang_thai ,delete_flag)
VALUES
('Karaoke',10000,'giờ','tiện nghi, hiện tại',0),
('Thuê xe máy',10000,'chiếc','hỏng 1 xe',0),
('Thuê xe đạp',20000,'chiếc','tốt',0),
('Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng',0),
('Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng',0),
('Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng',0);
INSERT INTO hop_dong(ngay_lam_hop_dong ,ngay_ket_thuc ,tien_dat_coc ,ma_nhan_vien ,ma_khach_hang ,ma_dich_vu ,delete_flag)
VALUES
('2020-12-08','2020-12-08',0,3,1,3,0),
('2020-07-14','2020-07-21',200000,7,3,1,0),
('2021-03-15','2021-03-17',50000,3,4,2,0),
('2021-01-14','2021-01-18',100000,7,5,5,0),
('2021-07-14','2021-07-15',0,7,2,6,0),
('2021-06-01','2021-06-03',0,7,7,6,0),
('2021-09-02','2021-09-05',100000,7,4,4,0),
('2021-06-17','2021-06-18',150000,3,4,1,0),
('2020-11-19','2020-11-19',0,3,4,3,0),
('2021-04-12','2021-04-14',0,10,3,5,0),
('2021-04-25','2021-04-25',0,2,2,1,0),
('2021-05-25','2021-05-27',0,7,10,1,0);
INSERT INTO hop_dong_chi_tiet(ma_hop_dong ,ma_dich_vu_di_kem ,so_luong ,delete_flag)
VALUES
(2,4,5,0),
(2,5,8,0),
(2,6,15,0),
(3,1,1,0),
(3,2,11,0),
(1,3,1,0),
(1,2,2,0),
(12,2,2,0);
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT * 
FROM nhan_vien
WHERE LENGTH(ho_ten) <=15 
AND (SUBString_INDEX(ho_ten,' ',-1) LIKE 'H%' 
OR SUBString_INDEX(ho_ten,' ',-1) LIKE 'T%' 
OR SUBString_INDEX(ho_ten,' ',-1) LIKE 'K%');
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
	SELECT * 
    FROM khach_hang
	WHERE (DATEDIFF(DATE_ADD(ngay_sinh,INTERVAL 18 YEAR),NOW())<0 
    AND DATEDIFF(DATE_ADD(ngay_sinh,INTERVAL 50 YEAR),NOW())>=0)  
    AND (dia_chi LIKE '%Đà Nẵng' OR dia_chi LIKE '%Quảng Trị');
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo 
-- số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
    SELECT khach_hang.ma_khach_hang,COUNT(khach_hang.ma_khach_hang),khach_hang.ho_ten, khach_hang.ma_loai_khach 
    FROM khach_hang 
    JOIN hop_dong
    ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
    JOIN loai_khach
    ON khach_hang.ma_loai_khach= loai_khach.ma_loai_khach
    WHERE khach_hang.ma_loai_khach=1
    GROUP BY khach_hang.ma_khach_hang
    ORDER BY COUNT(khach_hang.ma_khach_hang);
   
-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo 
-- công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
	SELECT    
     kh.ma_khach_hang, 
     kh.ho_ten,
     lk.ten_loai_khach, 
     hd.ma_hop_dong, 
     dv.ten_dich_vu,
     hd.ngay_lam_hop_dong,
     hd.ngay_ket_thuc,
	 ((dv.chi_phi_thue) + (hdct.so_luong * dvdk.gia)) AS tong_tien
     FROM khach_hang AS kh
     LEFT JOIN loai_khach AS lk ON kh.ma_loai_khach = lk.ma_loai_khach
     LEFT JOIN hop_dong AS hd ON kh.ma_khach_hang = hd.ma_khach_hang
     LEFT JOIN hop_dong_chi_tiet AS hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
     LEFT JOIN dich_vu_di_kem AS dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
     LEFT JOIN dich_vu AS dv ON hd.ma_dich_vu = dv.ma_dich_vu
    --  GROUP BY kh.ma_khach_hang 
     ORDER BY kh.ma_khach_hang;

-- Tong tiền cho mỗi mã hợp đồng
-- select  hdct.ma_hop_dong_chi_tiet, 
-- 		hdct.so_luong,
--         dvdk.gia,
-- 		hdct.so_luong * dvdk.gia  as tong
-- from hop_dong_chi_tiet  hdct
-- left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem

-- select kh.ma_khach_hang, hd.ma_hop_dong from khach_hang kh left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
-- select*from dich_vu
-- select*from hop_dong
-- (select hd.ma_hop_dong, dv.chi_phi_thue + sum(hdct.so_luong * dvdk.gia) as tong_tien from hop_dong as hd
-- join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
-- left join hop_dong_chi_tiet as hdct on hd.ma_hop_dong = hdct.ma_hop_dong
-- join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
-- group by hd.ma_hop_dong)
-- WITH bang_tam(ma_hop_dong,
-- ma_hop_dong_chi_tiet,
-- so_luong,
-- gia,
-- tong) AS (
-- SELECT
-- 	hdct.ma_hop_dong AS ma_hop_dong,
-- 	hdct.ma_hop_dong_chi_tiet AS ma_hop_dong_chi_tiet,
-- 	hdct.so_luong AS so_luong,
-- 	dvdk.gia AS gia,
-- 	hdct.so_luong * dvdk.gia AS tong
-- FROM
-- 	hop_dong_chi_tiet hdct
-- LEFT JOIN dich_vu_di_kem dvdk ON
-- 	hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem)  
-- SELECT
-- 	hd.ma_hop_dong,
--     hd.ma_khach_hang,
--     hd.ma_dich_vu,
--     bang_tam.ma_hop_dong_chi_tiet,
--     bang_tam.so_luong,
--     bang_tam.gia,
--     bang_tam.tong,
--     kh.ho_ten,
--     hd.ngay_lam_hop_dong

-- FROM
-- 	bang_tam,
-- 	hop_dong hd,
--     dich_vu dv,
--     khach_hang kh
--     
-- WHERE
-- 	bang_tam.ma_hop_dong = hd.ma_hop_dong 
--     and hd.ma_khach_hang = kh.ma_khach_hang 
--     and hd.ma_dich_vu = dv.ma_dich_vu;
--     -- and kh.ma_loai_khach = lk.ma_loai_khach;
     

 -- SET GLOBAL sql_mode='STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_ENGINE_SUBSTITUTION';
