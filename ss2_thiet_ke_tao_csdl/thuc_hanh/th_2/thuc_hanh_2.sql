create database ss2_thuc_hanh_quan_ly_diem_thi;


create table ss2_thuc_hanh_quan_ly_diem_thi.hoc_sinh (
ma_hs int not null,
ten_hs varchar (100),
ngay_sinh date,
lop varchar (100),
gioi_tinh varchar (10),
primary key (ma_hs)
);

create table ss2_thuc_hanh_quan_ly_diem_thi.mon_hoc (
ma_mh int ,
ten_mh varchar (100),
primary key (ma_mh)
);

create table ss2_thuc_hanh_quan_ly_diem_thi.bang_diem (
diem_thi int,
ngay_kt date,
ma_hs int,
ma_mh int,
foreign key (ma_hs) references hoc_sinh(ma_hs),
foreign key (ma_mh) references mon_hoc(ma_mh)
);

create table ss2_thuc_hanh_quan_ly_diem_thi.giao_vien (
ma_gv int not null,
ten_gv varchar (100),
sdt int
);

alter table mon_hoc add ma_gv int;
alter table mon_hoc add foreign key (ma_gv) references giao_vien(ma_gv); 















