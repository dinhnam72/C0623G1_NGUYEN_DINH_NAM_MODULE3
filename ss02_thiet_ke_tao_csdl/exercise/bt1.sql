create database don_hang;
use don_hang;

create table nha_cung_cap(
	ma_ncc int primary key auto_increment,
    ten_ncc varchar(45) NOT NULL,
    dia_chi varchar(100) NOT NULL
);
create table sdt(
	ma_ncc int NOT NULL,
    sdt varchar(10),
    foreign key(ma_ncc) references nha_cung_cap(ma_ncc)
);
create table don_dat_hang(
	so_dh int primary key auto_increment,
    ma_ncc int NOT NULL,
    ngay_dh date NOT NULL,
    foreign key(ma_ncc) references nha_cung_cap(ma_ncc)
);
create table vat_tu(
	ma_vt int primary key auto_increment,
    ten_vt varchar(45) NOT NULL
);
create table don_dat_hang_chi_tiet(
	so_dh int ,
    ma_vt int ,
    primary key(so_dh,ma_vt),
    foreign key(so_dh) references don_dat_hang(so_dh),
    foreign key(ma_vt) references vat_tu(ma_vt)
);
create table phieu_xuat(
	so_px int primary key auto_increment,
    ngay_xuat date NOT NULL
);
create table phieu_xuat_chi_tiet(
	so_px int,
    ma_vt int,
    dg_xuat int DEFAULT 0,
    sl_xuat int DEFAULT 0,
    primary key(so_px,ma_vt),
    foreign key(so_px) references phieu_xuat(so_px),
    foreign key(ma_vt) references vat_tu(ma_vt)
);
create table phieu_nhap(
	so_pn int primary key auto_increment,
    ngay_nhap date NOT NULL
);
create table phieu_nhap_chi_tiet(
	so_pn int NOT NULL,
    ma_vt int NOT NULL,
    dg_nhap int DEFAULT 0,
    sl_nhap int DEFAULT 0,
    primary key(so_pn,ma_vt),
    foreign key(so_pn) references phieu_nhap(so_pn),
	foreign key(ma_vt) references vat_tu(ma_vt)
);