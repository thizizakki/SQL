create database excelrdb;
use excelrdb;

create table Students(
Sid integer,
Sname char(20),
Age integer,
Course char(20) );

show tables;
desc Students;
insert into Students values (1,"Sandeep",20,"MySQL");
insert into Students values (2,"Mandeep",23,"Analytics");
select * from Students;

create table Patient(
PId int,
PName varchar(20),
DOB date,
DOA datetime);
desc patient;
insert into Patient values(1,'Lara','1995-02-03','2023-09-07 07:30:00');
insert into Patient values(2,'Bara','1994-03-12','2023-08-04 03:30:00');
select * from patient;

use excelrdb;
select * from Students;

alter table Students add column Marks integer default 0;

select * from Students;

alter table Students drop column age;

alter table Studnets change column sid StdId integer;
select * from Students;
alter table Students change column sid Std_Id integer;
alter table Students modify column sname varchar(20);
desc Students;
alter table Students rename Myclass;
show tables;
alter table Myclass rename Students;
rename table students to My_class;

create table test(id integer, name varchar(20));
show tables;
select * from test;
drop table test;

insert into my_class values (1,"Tim",null,30);
insert into my_class (std_id,sname,marks) values (4,'Pete',77);
insert into my_class values(5,'sas','magic',34),(6,'dfs','rere',88),(7,'asd','fff',45),(8,'asw','ee',null);
select * from my_class;
set sql_safe_updates=0;
update my_class set sname='Sad' where Std_id=7;
update my_class set marks=100 where Sname='Tim';
update my_class set course='mysql' where course is null;
update my_class set sname='Mim',course='analystics', marks=75 where Std_id=7;
delete from my_class where Std_id=6;
delete from my_class where Marks is null;
drop table my_class;

#Constraints
create table students(
Sid integer unique, 
Sname varchar(30) not null,
age integer check (age>18),
course varchar(30));
desc students;
insert into students values(1,'Tom',23,'MYsql');
#Unique Constrian
insert into students values(2,'Jon',24,'MYsql');
insert into students values(2,'Jon',24,'MYsql');
select * from students;

#Check Constraints
insert into students values(3,'Joim',13,'MYsql');
insert into students values(3,'Joim',23,'MYsql');

#not null constraint
insert into students values(4,null,22,'Analytics');
insert into students (sid, age, course) values(5,22,'Analytics');

#default 
alter table students modify column sname varchar(30) not null default 'Kumar';

insert into students values(6,null,22,'Analytics');# Here it is not accepting null value
insert into students (sid, age, course) values(7,22,'Analytics');#Here it is accepting default value
