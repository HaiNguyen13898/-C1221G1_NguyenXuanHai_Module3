

use resort_furama;
-- task 2
  select * from nhan_vien where ho_ten regexp '^[HKT]' and char_length(ho_ten) <= 15; 

-- task 3
select * from khach_hang where (round(datediff(curdate(), ngay_sinh) / 365, 0) between 18 and 50) 
and ( dia_chi regexp 'Nẵng$' or dia_chi regexp  'Trị$');
-- and ( dia_chi like "%Đà nẵng" or dia_chi like '%Quảng trị');
-- and ( dia_chi regexp 'Đà nẵng|Quảng Trị');


-- task 4
select kh.ma_khach_hang, kh.ho_ten, count(hd.ma_hop_dong) as so_lan_dat_phong
from  hop_dong hd inner join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
where kh.ma_loai_khach = 1 group by kh.ho_ten order by count(hd.ma_hop_dong);


-- task 5 
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, 
hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(dv.chi_phi_thue + coalesce(hdct.so_luong * dvdk.gia,0)) as tong_tien
from hop_dong hd 
right join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang 
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on  hd.ma_hop_dong = hdct.ma_hop_dong 
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
group by kh.ma_khach_hang, hd.ma_hop_dong;


-- task 6
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,  dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv left join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu 
left join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu  
where dv.ten_dich_vu not in ( select dv.ten_dich_vu 
from dich_vu join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where hd.ngay_lam_hop_dong >= '2021-01-01' and hd.ngay_lam_hop_dong <= '2021-03-31')
group by dv.ma_dich_vu;

 
 -- task 7 
 select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, 
 ldv.ten_loai_dich_vu from dich_vu dv 
 left join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
 left join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 where  year (hd.ngay_lam_hop_dong) = '2020' and dv.ma_dich_vu not in 
 ( select dv.ma_dich_vu from dich_vu dv 
 left join loai_dich_vu ldv on dv.ma_dich_vu = ldv.ma_loai_dich_vu
 left join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu where  year (hd.ngay_lam_hop_dong) = '2021') 
 group by dv.ma_dich_vu; 
  
 
 -- task 8 
 select distinct ho_ten from khach_hang; -- cách 1 
 select ho_ten from khach_hang group by ho_ten; -- cách 2
 select ho_ten from khach_hang union select ho_ten from khach_hang; -- cách 3
 
 -- task 9
 select month(ngay_lam_hop_dong) as  "# thang", count(ma_khach_hang) as so_luong_khach
 from hop_dong where year(ngay_lam_hop_dong) ='2021'
 group by month(ngay_lam_hop_dong) order by month(ngay_lam_hop_dong);
 
 -- task 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, 
ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem -- hoặc có thể dùng coalesce(column_name,0) 
from hop_dong hd left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong  group by hd.ma_hop_dong;

-- task 11 
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where  lk.ten_loai_khach = 'Diamond' and ( kh.dia_chi like '%Vinh' or  kh.dia_chi like '%Quảng Ngãi') ;
 
 -- task 12
select hd.ma_hop_dong, nv.ho_ten as ho_ten_nhan_vien, kh.ho_ten as ho_ten_khach_hang, 
kh.so_dien_thoai as So_dien_thoai_khach_hang, 
dv.ten_dich_vu, sum( hdct.so_luong) as So_luong_dich_vu_di_kem, hd.tien_dat_coc
from nhan_vien nv 
left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
left join hop_dong_chi_tiet hdct on  hd.ma_hop_dong = hdct.ma_hop_dong
left join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
where (hd.ngay_lam_hop_dong >= '2020-10-01' and hd.ngay_lam_hop_dong <='2020-12-31') 
and dv.ma_dich_vu not in ( 
select dv.ma_dich_vu from dich_vu dv 
left join loai_dich_vu ldv on dv.ma_dich_vu = ldv.ma_loai_dich_vu
left join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu 
where  hd.ngay_lam_hop_dong >= '2021-01-01' and  hd.ngay_lam_hop_dong <= '2021-06-30')
group by hd.ma_hop_dong; 

-- task 13 
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(so_luong) as So_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong group by dvdk.ma_dich_vu_di_kem  having sum(so_luong) = (
select sum(so_luong) as So_luong_dich_vu_di_kem
from hop_dong_chi_tiet  group by ma_dich_vu_di_kem
order by So_luong_dich_vu_di_kem desc limit 1);


-- task 14
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem dvdk 
left join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
right join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu 
group by dvdk.ten_dich_vu_di_kem having count(dvdk.ma_dich_vu_di_kem) = 1;


-- task 15
select nv.ma_nhan_vien, nv.ho_ten, trd.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv 
left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
left join trinh_do trd on nv.ma_trinh_do = trd.ma_trinh_do
left join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan 
group by nv.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3 and nv.ma_nhan_vien in( 
select nv.ma_nhan_vien from nhan_vien nv left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where ngay_lam_hop_dong >= '2020-01-01' and ngay_lam_hop_dong <= '2021-12-31');

-- task 16
set sql_safe_updates = 0;
delete from nhan_vien where nhan_vien.ma_nhan_vien not in (
select ma_nhan_vien
from hop_dong 
where ngay_lam_hop_dong >= '2019-01-01' and ngay_lam_hop_dong <= '2021-12-31'
);
set sql_safe_updates = 1;

-- task 17
set sql_safe_updates = 0;
update khach_hang set ma_loai_khach = 1 where ma_khach_hang in ( 
select ma_khach_hang  from (select ma_khach_hang from  khach_hang_view) as y);
set sql_safe_updates = 1;

create view khach_hang_view as 
select  kh.ma_khach_hang, kh.ho_ten, kh.ma_loai_khach 
from khach_hang kh 
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where hd.ngay_lam_hop_dong between '2021-01-01' and '2021-12-31' and lk.ten_loai_khach = 'Platinium' 
group by kh.ma_khach_hang
having sum(dv.chi_phi_thue + coalesce(hdct.so_luong * dvdk.gia,0)) >10000000;


-- task 18
set sql_safe_updates = 0;
set foreign_key_checks = off;
delete from khach_hang kh where ma_khach_hang in (
select ma_khach_hang 
from hop_dong 
where year (ngay_lam_hop_dong) < '2021');
set foreign_key_checks = on;
set sql_safe_updates = 1;

-- task 19 cách 1
set sql_safe_updates = 0;
update dich_vu_di_kem set gia= gia*2 
where ma_dich_vu_di_kem in(
select ma_dich_vu_di_kem from (select dich_vu_di_kem.ma_dich_vu_di_kem from dich_vu_di_kem
join hop_dong_chi_tiet hdct on dich_vu_di_kem.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong 
where hdct.so_luong > 10 and hd.ngay_lam_hop_dong between '2020-01-01' and '2020-12-31')as x);
set sql_safe_updates = 1;

-- task 19 cách 2
create view  ma_dich_vu_di_kem_views as 
select dvdk.ma_dich_vu_di_kem from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong 
where hdct.so_luong > 10 and hd.ngay_lam_hop_dong between '2020-01-01' and '2020-12-31';

set sql_safe_updates = 0;
update dich_vu_di_kem set gia= gia*2 where ma_dich_vu_di_kem in (
select ma_dich_vu_di_kem from ( 
select ma_dich_vu_di_kem from ma_dich_vu_di_kem_views) as x);
set sql_safe_updates = 1;


-- task 20
select  ma_nhan_vien as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien 
union
select ma_khach_hang as id, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;

-- task 21
create view v_nhan_vien as
select nv.ma_nhan_vien, nv.ho_ten, count(hd.ma_nhan_vien) as so_lan_lam_hop_dong 
from nhan_vien nv 
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where nv.dia_chi like '%Huế' and hd.ngay_lam_hop_dong = '2021-09-02'
group by hd.ma_nhan_vien;

-- task 22 (SAI VỚI YÊU CẦU CỦA ĐỀ)
set sql_safe_updates = 0;
update nhan_vien set dia_chi = 'Liên Chiểu' where ma_nhan_vien in
(select ma_nhan_vien from (select ma_nhan_vien from v_nhan_vien) as x);
set sql_safe_updates = 1;





 







































 
 
 
	

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
-- create view nhan_vien_view as select ma_nhan_vien, ho_ten, ngay_sinh from nhan_vien;
-- select * from nhan_vien_view (sử dụng hàm view để hiển thị dữ liệu)
-- create index ma_nhan_vien on nhan_vien (ma_nhan_vien);
-- create unique index ho_ten_idx on khac_hang ( ho_ten);



















  