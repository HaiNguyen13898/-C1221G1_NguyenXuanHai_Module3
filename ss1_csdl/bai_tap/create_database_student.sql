create database student_management;

create table Class (
	id int  not null,
	`name` varchar (255) not null
);


create table Teacher (
	id int primary key not null,
    `name` varchar (255) not null,
    age int not null,
    country varchar (255) 
);
alter table Class
add primary key (id)






