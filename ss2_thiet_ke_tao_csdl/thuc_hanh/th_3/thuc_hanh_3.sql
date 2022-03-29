create database ss2_thuc_hanh_quan_ly_sinh_vien;

create table ss2_thuc_hanh_quan_ly_sinh_vien.class (
id_class int auto_increment not null,
name_class varchar (60) not null,
start_date date not null,
`status` bit,
primary key (id_class)
);


create table ss2_thuc_hanh_quan_ly_sinh_vien.student (
id_student int auto_increment not null,
name_student varchar (30) not null,
adress varchar (50),
phone varchar (30),
`status` bit,
id_class int not null, 
foreign key (id_class) references class (id_class),
primary key (id_student) 
);


create table ss2_thuc_hanh_quan_ly_sinh_vien.subjects (
id_sub int auto_increment not null,
name_sub varchar (30) not null,
credit tinyint not null default 1 check (credit >= 1),
`status` bit default 1,
primary key (id_sub)
);


create table ss2_thuc_hanh_quan_ly_sinh_vien.mark (
id_mark int auto_increment not null,
mark float default 0 check (mark  between 0 and 100),
id_sub int not null,
id_student int not null,
exam_time tinyint default 1,
foreign key (id_sub) references subjects (id_sub),
foreign key (id_student) references student (id_student),
unique (id_sub, id_student),
primary key (id_mark)
 );








