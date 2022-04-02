-- task 2
  select * from nhan_vien where ho_ten regexp '^[HKT]' and char_length(ho_ten) <= 15; 

-- task 3
select * from khach_hang where (round(datediff(curdate(), ngay_sinh) / 365, 0) between 18 and 50) 
and ( dia_chi regexp 'Nẵng$' or dia_chi regexp  'Trị$');
-- and ( dia_chi like "%Đà nẵng" or dia_chi like '%Quảng trị');
-- and ( dia_chi regexp 'Đà nẵng|Quảng Trị');


-- task 4
select kh.ma_khach_hang, kh.ho_ten, count(hd.ma_hop_dong) as "so_lan_dat_phong"
from  hop_dong hd inner join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
where kh.ma_loai_khach = 1 group by kh.ho_ten order by count(hd.ma_hop_dong);


-- task 5 vẫn chưa ra thầy ơi
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, 
hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(dv.chi_phi_thue + hdct.so_luong * dvdk.gia) as "tong_tien"
from hop_dong hd 
right join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang 
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
join dich_vu dv on hd.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on  hd.ma_hop_dong = hdct.ma_hop_dong 
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
group by kh.ma_khach_hang, hd.ma_hop_dong;


-- task 6
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,  dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu 
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu 
where hd.ngay_lam_hop_dong >= '2021-01-01' and  hd.ngay_lam_hop_dong <= '2021-03-31'  
group by  dv.ma_dich_vu;
 
-- select ngay_lam_hop_dong from hop_dong where ngay_lam_hop_dong >= '2021-01-01' and ngay_lam_hop_dong <= '2021-03-31' ; 

 
 -- task 7 
 select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
 from dich_vu dv join loai_dich_vu ldv;
 
 
 -- task 8 
 select distinct ho_ten from khach_hang; -- cách 1 
 select ho_ten from khach_hang group by ho_ten; -- cách 2
 select ho_ten from khach_hang union select ho_ten from khach_hang; -- cách 3
 
 -- task 9
 select month(ngay_lam_hop_dong) as  "# thang", count(ma_khach_hang) as "so_luong_khach" 
 from hop_dong where year(ngay_lam_hop_dong) ="2021" 
 group by month(ngay_lam_hop_dong) order by month(ngay_lam_hop_dong);
 
 -- task 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, 
ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem -- hoặc có thể dùng coalesce(column_name,0) 
from hop_dong hd left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong  group by hd.ma_hop_dong;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
-- create view nhan_vien_view as select ma_nhan_vien, ho_ten, ngay_sinh from nhan_vien;
-- select * from nhan_vien_view (sử dụng hàm view để hiển thị dữ liệu)
-- create index ma_nhan_vien on nhan_vien (ma_nhan_vien);
-- create unique index ho_ten_idx on khac_hang ( ho_ten);



















  