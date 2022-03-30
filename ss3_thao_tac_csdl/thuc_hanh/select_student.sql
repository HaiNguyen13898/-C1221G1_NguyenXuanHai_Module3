use ss3_thuc_hanh_student;

SELECT * FROM Student;

SELECT * FROM Student WHERE Status = true;

SELECT * FROM Subject WHERE Credit < 10;

SELECT S.id_student, S.name_student , C.name_class
FROM Student as S join Class as C on S.id_class = C.id_class;


SELECT S.id_student, S.name_student, C.name_class
FROM Student S join Class C on S.id_class = C.id_class
WHERE C.name_class = 'A1';

SELECT S.id_student, S.name_student, Sub.name_sub, M.Mark
FROM Student S join Mark M on S.id_student = M.id_student join Subject Sub on M.id_sub = Sub.id_sub;

SELECT S.id_student, S.name_student, Sub.name_sub, M.Mark
FROM Student S join Mark M on S.id_student = M.id_student join Subject Sub on M.id_sub = Sub.id_sub
WHERE Sub.name_sub = 'CF';






