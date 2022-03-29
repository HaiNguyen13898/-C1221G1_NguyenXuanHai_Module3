create database ss2_bai_tap_don_hang;
use ss2_bai_tap_don_hang;


create table phieu_xuat (
so_px int primary key,
ngay_xuat date
); 

create table vat_tu (
ma_vtu int primary key,
ten_vtu varchar (100)
);

create table phieu_nhap (
so_pn int primary key,
ngay_nhap date
);

create table chi_tiet_phieu_xuat (
dg_xuat varchar (100),
sl_xuat int,
so_px int,
ma_vtu int,
primary key (so_px, ma_vtu),
foreign key (so_px) references phieu_xuat (so_px),
foreign key (ma_vtu) references vat_tu (ma_vtu)
);

create table chi_tiet_phieu_nhap (
dg_nhap int,
sl_nhap int,
ma_vtu int,
so_pn int,
primary key (ma_vtu, so_pn),
foreign key (ma_vtu) references vat_tu (ma_vtu),
foreign key (so_pn) references phieu_nhap (so_pn)
);



create table nhacc (
ma_nacc int not null primary key,
ten_ncc varchar (100),
dia_chi varchar (100)
);

create table dondh (
so_dh int not null primary key,
ngay_dh date,
ma_nacc int,
foreign key (ma_nacc) references nhacc (ma_nacc)
);

create table chi_tiet_don_dat_hang (
ma_vtu int,
so_dh int ,
primary key (ma_vtu, so_dh),
foreign key (ma_vtu) references vat_tu (ma_vtu),
foreign key (so_dh) references dondh (so_dh)
);


create table sđt (
ma_sđt int primary key,
ma_nacc int,
foreign key (ma_nacc) references nhacc (ma_nacc)
); 










