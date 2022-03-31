 -- task 2
  select * from nhan_vien where ho_ten regexp '^[HKT]' and char_length(ho_ten) <= 15; 

-- task 3
select * from khach_hang where (round(datediff(curdate(), ngay_sinh) / 365, 0) between 18 and 50) 
and ( dia_chi regexp  'Nẵng$' or dia_chi regexp  'Trị$');

-- task 4
select kh.ma_khach_hang, kh.ho_ten, count(hd.ma_hop_dong) as "so_lan_dat_phong"
from  hop_dong hd inner join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
where kh.ma_loai_khach = 1 group by kh.ho_ten order by count(hd.ma_hop_dong)











  