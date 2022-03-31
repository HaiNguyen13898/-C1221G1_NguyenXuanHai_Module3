use ss3_thuc_hanh_student;

select address, COUNT(id_student) as 'Số lượng học viên'
from student group by Address;


select s.id_student, s.name_student, avg(mark) as "Điểm trung bình" from student s 
inner join mark m on s.id_student = m.id_student 
group by s.id_student, s.name_student;


select s.id_student, s.name_student, avg(mark) as "Điểm trung bình" from student s 
inner join mark m on s.id_student = m.id_student 
group by s.id_student, s.name_student having avg(mark) > 15;


select s.id_student, s.name_student, avg(mark) as "Điểm trung bình" from student s 
inner join mark m on s.id_student = m.id_student 
group by s.id_student, s.name_student having avg (mark) >= all  (select avg(mark) from mark group by mark.id_student);


 