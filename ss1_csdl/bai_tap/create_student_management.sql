create database ss1_database_student_management;
create table ss1_database_student_management.class (
id int auto_increment,
`name` varchar (100),
primary key (id)
);
create table ss1_database_student_management.teacher (
id int auto_increment,
`name` varchar (100),
age int,
country varchar (100),
primary key (id)
);