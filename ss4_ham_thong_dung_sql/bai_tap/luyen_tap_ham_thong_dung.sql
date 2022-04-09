
select s.*, max(credit)  from `subject` s;

select s.*, max(mark) as "điểm thi lớn nhất" 
from `subject` s inner join mark m on s.id_sub = m.id_sub;

select s.* , avg(mark) as "Điểm trung bình" 
from student s inner join mark m on s.id_student = m.id_student 
group by  s.id_student, s.name_student



