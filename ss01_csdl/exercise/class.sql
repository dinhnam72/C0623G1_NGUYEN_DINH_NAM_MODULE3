create database bt;
create table class(
id int primary key auto_increment,
class_name varchar(100)
);
insert into class(class_name)
values ('C0623G1'),('C0723g1');

create table teacher(
id int primary key auto_increment,
teacher_name varchar(100),
age int,
country varchar(200)
);
insert into teacher(teacher_name,age,country)
values ('Nguyen Van A',25,'Da Nang'),('Tran Thi B',30,'Da Nang');