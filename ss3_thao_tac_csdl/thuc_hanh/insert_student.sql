create database ss3_thuc_hanh_student;
use ss3_thuc_hanh_student;

create table class (
id_class int auto_increment not null,
name_class varchar (45) not null,
start_date date not null,
`status` varchar (255),
primary key (id_class)
);

create table student (
id_student int auto_increment not null,
name_student varchar (100) not null,
address varchar (100) not null,
phone int,
`status` varchar (255),
id_class int not null,
primary key (id_student),
foreign key (id_class) references class (id_class)
);

create table `subject` (
id_sub int auto_increment not null,
name_sub varchar (100) not null,
credit int not null,
`status` varchar (255),
primary key (id_sub)
);

create table mark (
id_mark int auto_increment not null,
id_sub int not null,
id_student int not null,
mark double not null,
exam_times int,
primary key (id_mark),
foreign key (id_sub) references `subject` (id_sub),
foreign key (id_student) references student (id_student)
);

insert into class (name_class, start_date, `status`) values ("A1", "2008-12-20", "1"), 
("A2", "2008-12-22", "1"), ("B3", current_date, "0");

insert into student (name_student, address, phone,`status`, id_class) values ("Hung", "Ha Noi", 0912113113, "1", 1),
 ("Manh", "Ho Chi Minh", 0123123123, "0", 2);
 
insert into student (name_student, address, `status`, id_class) values ("Hoa", "Hai Phong", "1", 1);
 
insert into `subject` (name_sub, credit, `status`) values ( "CF", 5, "1"), ( "C", 6, "1"), 
 ( "HDJ", 5, "1"), ( "RDBMS", 10, "1");
 
insert into mark (id_sub, id_student, mark, exam_times) values (1, 1, 8, 1), (1, 2, 10, 2), (2, 1, 12, 1);

alter table student modify `status` bit;
alter table class modify `status` bit;
alter table `subject` modify `status` bit;



















