use ss3_thuc_hanh_student;

select * from student as s where s.name_student like "h%";
select * from class where month (start_date) = 12;
select * from `subject` where credit between 3 and 5;

set sql_safe_updates = 0;
update student set id_class = 2 where name_student = "Hung";
set sql_safe_updates = 1;

select s.name_student, sb.name_sub, m.mark 
from student s join mark m on s.id_student = m.id_student join `subject` sb on m.id_sub = sb.id_sub 
order by mark , name_student desc;





