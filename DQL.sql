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

select * from students;

select * from film;
select filmid, title, releasedate, oscarnominations from film;
select * from myemp;
select emp_id, first_name, last_name,salary, salary*0.2 as bonus from myemp;
select first_name as fname, last_name as lname, salary, salary*0.2 as bonus, salary + salary*0.2 as total_salary from myemp; 
select * from myemp limit 10;
select * from myemp limit 5;
select * from myemp limit 2 offset 3;
select * from myemp limit 10;
select dep_id from myemp;
select distinct dep_id from myemp;
select distinct job_id from myemp;
select * from person;	
select distinct fname, lname from person;
select * from myemp limit 5;
select * from myemp where dep_id=60;

#find all the employess whose salary is greater than or equal to 15000 >
select * from myemp where salary>=15000;

#--in operation
select * from myemp where dep_id in (60,40,30);

#Find all employees who joined after the year 2000
select * from myemp where hire_date > '1999-12-31';
select * from myemp where year(hire_date) > '1999-12-31';

select * from film limit 5;

#Find all movies which have won 11 Oscars
select * from film where oscarwins = 11;
select title from film where oscarwins = 11;

#find all flop movies
select * from film where boxofficedollars < budgetdollars;

#all movies with 10-15 oscar nomincations  -- and
select * from film where oscarnominations between 10 and 15;

#movies released between 2000
select * from film where releasedate between '2000-01-01' and '2000-12-31';

#not in Find employee who dont belong dept 80 or 50
select * from myemp where dep_id not in (80,50);

/*--------------Pattern Matching----------------------------*/
#like operator. Pattern matching. Name starts with a 
select first_name from myemp where first_name like 'a%';

#name starts and ends with a 
select first_name from myemp where first_name like 'a%a';

#name contains z where ever in a name 
select first_name, last_name from myemp where first_name like '%Z%';

#Name starting with j and having 5 letter in name
select distinct first_name from myemp where first_name like 'j____';

#find movies whicha are having 4 letter names.
select title from film where title like '____';

/* ----------------------Regular Expression--------------------*/
#starts with
select title from film where title regexp '^Star';

#ends with
select title from film where title regexp 'wars$';

#or movies start with either star or rush 
select title from film where title regexp '^Star|^rush';

#[] movies contain no in titles
select title from film where title regexp '[0-9]';

#find all movies which starts with vowels
select title from film where title regexp '^[aeiou]';

#{} Find all movies that has 2times ee in a title
select title from film where title regexp 'e{2}';

#movies that contain numbers in a title at least 2 or more
select title from film where title regexp '[0-9]{2}';

/*--------------Logical Operations---------------------*/
#find all the employees in department 80 and salary >8000
select * from myemp where dep_id =80 and salary > 8000;

#or
select * from myemp where dep_id =60 or salary > 10000;

select * from employees limit 10;

/*-----------------------------Home Work---------------------*/
#1Display all Full time employees and only those contract employees with salary more than 80000
select * from employees
where (status like 'Full time%' or (status like 'Contract%' and salary > 80000)) order by status;

#2Display full time employees hired in 2000 year only
select * from employees where status = 'full time' and hiredate between '2000-01-01' and '2000-12-31';

#3Display both full time and contract employees with jobrating 1
select * from employees where status in ('full time','contract') and jobrating=1;

#4Display all employees from account management department who are not full time and got jobrating 1
select * from employees where department='account management' and status<>'full time' and jobrating=1; 

#5Display the list of films which start with h but end with od
select title from film where title like 'h%od';

#6Display the list of films which start and end with E
select title from film where title like 'e%e';

#7Display the list of films which contains only four characters in the title
select title from film where title like '____';

#8Display the list of films not containing star,king,die and won oscars
select title,oscarwins from film where title not regexp 'star|king|die' and oscarwins>=1;

#9Display the list of films which is a second part of a movie series
select title from film where title regexp '2$';

#------------------------------Order--------------------------------------------------------
#order clause
select * from myemp order by salary;

#Seniro most person at the top
select * from myemp order by hire_date;

#Juniormost person at the top
select * from myemp order by hire_date desc;

select * from myemp order by last_name;

#
select title,budgetdollars from film where budgetdollars is not null order by budgetdollars desc;

#Junior most to senior most
select * from myemp order by dep_id,hire_date desc;

select avg(SALARY) from myemp;

select dep_id, avg(salary) from myemp group by dep_id;

#counting base on column name
select dep_id, count(*) from myemp group by dep_id;

#counting no or records in the table and re-arranging some order
select dep_id, count(*) as Num_emp  from myemp group by dep_id order by num_emp desc;

#Find the count of employees by department and status of their employement 
select department, status, count(*) as CountofEmp from employees group by department, status order by department;

select dep_id, avg(salary) 
from myemp 
group by dep_id 
having dep_id in (50,60,100);

#select dep_id, avg(salary) from myemp where dep_id in (50,60,100);

select * from cats;

select breed, max(weight),min(weight),avg(weight) from cats group by breed;

select *from employees;

#find departmentwise no of employees based on their status of employment
select department, status ,count(*)as no_of_employees 
from employees 
group by department, status 
having department in ('quality assurance','quality control') and status in ('full time','contract');

#same above query using where clause
select department, status ,count(*)as no_of_employees 
from employees 
where department in ('quality assurance','quality control') and status in ('full time','contract')
group by department,status;

drop table books;
drop table authors;

create table authors ( authorid integer primary key, name Varchar(200));
desc authors;

create table books(bookId integer primary key,
title varchar(255),
aid integer, foreign key(aid) references authors(authorid)
on delete cascade
on update cascade);

select * from authors;
select * from books;
update authors set authorid=80 where authorid=8;
delete from authors where authorid=1;

create table Orderss(OrderId integer primary key, ProdId integer, foreign key(Prodid) references Product(PId),Quantity integer,CId integer, foreign key(CId)
 references Customers(CustId));
 desc orderss;
 
create table Customers(CustId integer primary key,CName varchar(50),Location varchar(100));
 
create table Product( PId integer primary key, PName varchar(30), MRP integer);

insert into product values(1,'Bat',700);
insert into product values(2,'Ball',200);
insert into product values(3,'Wicket',500);
insert into product values(4,'Pad',250);
insert into product values(5,'Glowse',150);
insert into product values(6,'Kit Bag',400);

select * from product;

insert into Customers values(1,'Sachin','Mumbai');
insert into Customers values(2,'Virat','Delhi');
insert into Customers values(3,'Sehwag','Mohali');
insert into Customers values(4,'Manish','Bangalore');
insert into Customers values(5,'Sourav','Kolkatta');
insert into Customers values(6,'Ashwin','Chennai');

select * from customers;

insert into orderss values(1,5,2,4);
insert into orderss values(2,3,3,1);
insert into orderss values(3,2,6,3);
insert into orderss values(4,4,2,6);
insert into orderss values(5,6,1,5);
insert into orderss values(6,1,2,2);
insert into orderss values(7,4,4,3),(8,2,1,2),(9,5,1,6),(10,6,2,4),(11,3,2,3),(12,1,3,1),(13,1,5,2),(14,6,5,3),(15,4,5,3);

select * from orderss;
drop table orderss;
drop table customers;
drop table product;

create table prod(
prodid integer PRIMARY KEY,
pname varchar(30),
mrp decimal);

create table cust(
custid integer PRIMARY KEY,
custname varchar(30),
location varchar(30));

create table ord(
ordid integer PRIMARY KEY,
custid integer,
prodid integer,
quantity integer,
FOREIGN KEY (custid) REFERENCES cust(custid) ON DELETE CASCADE ON UPDATE CASCADE ,
FOREIGN KEY (prodid) REFERENCES prod(prodid) ON DELETE CASCADE ON UPDATE CASCADE);

insert into prod values(1,'Laptop', 30000),(2,'Tablet',25000),(3,'Thumb Drive', 5000),(4,'iphone15', 85000),(5,'Smart Watch','50000');
select * from prod;

insert into cust values(1,'Tom','London'),(2,'Hugh','London'),(3,'Pete', 'Paris'),(4,'Hannah','Munich'),(5,'Jon','Paris');
select * from cust;

insert into ord values(1,1,2,6),
(2,2,1,3),
(3,2,2,10),
(4,3,3,12),
(5,1,3,5),
(6,4,4,3),
(7,4,4,13),
(8,2,1,10),
(9,5,1,6),
(10,5,2,13),
(11,3,2,12),
(12,1,3,1),
(13,1,5,2),
(14,5,5,3),
(15,4,5,3);

select * from ord;

select * from prod;

select * from cust;

create table test(
id integer primary key auto_increment,
name varchar(30),
age integer);

desc test;

insert into test (name,age) values ('Tom',45);

select * from test;

insert into test (name,age) values ('Tim',55);
insert into test (name,age) values ('Jim',40);

insert into test values (10,'Harry',34);

insert into test (name,age) values ('Harry',43);

insert into test (name,age) values ('Kate',55);

 #inner join
select * from movies;
select * from movies inner join members on movieid=id;

select title,first_name,category from movies inner join members on movieid=id where category='animations';

select * from authors;
select * from books;
select title, name from authors inner join books on books.authorid =authors.authorid;

select ordid,pname, quantity from ord inner join prod on prod.prodid=ord.prodid;

 select ordid,pname, quantity from ord inner join prod on prod.prodid=ord.prodid order by ordid;
 
 select * from director;
 select * from film;
 
 #title, film name and director
 select title,concat(firstname,' ',familyname) from film inner join director on director.directorId = film.directorid;
 
 select * from genre;
 select * from language;
 
select title, concat(director.firstname,' ',director.familyname)as Name,
language.Language, genre.Genre from film, director, language,genre 
where film.directorid=director.directorid
and language.languageid=film.languageid
and genre.genreid=film.genreid 
and language.language='French';

select film.Title, concat(director.firstname,' ',director.familyname)as Name,
 language.Language,
 genre.Genre 
 from film
 inner join director on film.directorid=director.directorid
 inner join language on film.languageid=language.languageid
 inner join genre on film.genreid=genre.genreid;
 
 select f.title, concat(d.firstname,' ',d.familyname)as Name,
l.Language, g.Genre from film f, director d, language l,genre g
where f.directorid=d.directorid
and l.languageid=f.languageid
and g.genreid=f.genreid 
and l.language='French';

select f.Title, concat(d.firstname,' ',d.familyname)as Name,
 l.Language,
 g.Genre 
 from film f
 inner join director as d on f.directorid=d.directorid
 inner join language as l on f.languageid=l.languageid
 inner join genre g on f.genreid=g.genreid;
 
 #left join
 select * from movies;
 select * from members;
select mv.title,ifnull(mm.first_name,'-')as firstName,ifnull(mm.last_name,'-') as lastName
from movies as mv 
left join members as mm 
on mv.id=mm.movieid;
 
 #right Join
 select mv.title,mm.first_name,mm.last_name 
 from movies as mv
 right join members as mm 
 on mv.id=mm.movieid;
 
 #cross join
 select * from meals cross join drinks;
 
select m.mealname, d.drinkname, m.rate from meals m cross join drinks d;

select m.mealname, d.drinkname, m.rate+d.rate as Rate from meals m cross join drinks d;

select * from myemp;
select emp.emp_id,emp.first_name,emp.last_name,mgr.first_name as Mname,mgr.last_name as Mlname
from myemp as emp join myemp as mgr
on emp.mgr_id=mgr.emp_id;

select emp.emp_id,emp.first_name,emp.last_name,mgr.emp_id,mgr.first_name as Mname,mgr.last_name as Mlname
from myemp as emp,myemp as mgr
where emp.mgr_id=mgr.emp_id
order  by emp.emp_id;
 
select c.name, c.age,p.name as ParentName, p.age as ParentAge 
from parents as c join parents as p
on c.parentid=p.id;

select * from tt;

start transaction;
create table tt(id varchar(1));

insert into tt values('a'),('b');
savepoint sb;
insert into tt values('c'),('d');
savepoint sd;
insert into tt values('e'),('f');
savepoint sf;
rollback to sd;
drop table tt;

create view myview as select first_name,last_name,email,hire_date from myemp;

select * from myview limit 10;

show tables; 

create view aview as select * from authors where authorid < 20 with check option;

select * from aview;
insert into aview values(9,'Sam Hunk');
insert into aview values(28,'Tom Hank');

select * from authors;
delete from authors where authorid in (9,18,28);

drop view aview;

select *, if(mark>50,'pass','fail') as grades from marks;

select *, case when mark>=80 then 'distinnction'
when mark>=60 then 'First class'
else 'fail'
end as grades from marks;

select * from myemp;

select first_name,last_name,salary, case when salary<5000 then 'OK'
when salary between 5000 and 10000 then'Good'
when salary >10000 then 'Excellent'
end as status from myemp;

CREATE TABLE coal (
  id int DEFAULT NULL,
  name varchar(29) DEFAULT NULL,
  add1 char(20) DEFAULT NULL,
  add2 char(20) DEFAULT NULL,
  add3 char(20) DEFAULT NULL,
  city char(50) DEFAULT NULL,
  state char(30) DEFAULT NULL
);

insert into coal values(1,'Harry','123 Road','7th Street',null,'Bangalore','Karnataka'),
                        (2,'Meghan','123 Road',null,'Choolaimedu','Chennai','TN'),
                        (3,'William',null,'7th Street',null,'Bangalore','Karnataka'),
                        (4,'Kate',null,null,null,'Bangalore','Karnataka'),
                        (5,'Charles','123 Road','7th Street',null,'Bangalore',null),
                        (6,'Camilla',null,null,null,'Bangalore','Karnataka');
                  
                  
select * from coal;

select id,name, ifnull(add1,state) as address from coal; 

select id,name, coalesce(add1,add2,add3,city,state) as address from coal; 

call myprog;

call myproc2(2);
call PosNeg(-3);

call PosNeg(4);

call days(6);

call get_grade(55);

call cases(22);

call loopcase(4);

call repeatloop(6);

call whileloop(7);

select * from payments;

call gradecursor;

call makePayment(1,100);

call makePayment(3,null);
desc fraud;
call makePayment(1,200);

call placeOrder();

alter table books add column sales integer default 0;

# Triggers
update books set sales= sales +3 where bookid=1;

select * from book_sales;

select * from books;

update books set sales= sales +6 where bookid=6;

show indexes from authors;

create unique index eidx on emp(eid);
create index sidex using hash on students(sid);

select * from orders;

#Function
select first_name,last_name,hire_date,experience(emp_id) from myemp limit 15;

#Windows Function
select * from myemp limit 10;

select first_name, last_name, dep_id, salary, avg(salary) over (partition by dep_id) as dep_avg from myemp;

with e as (select first_name, last_name, salary, salary*0.2 as bonus from myemp)
select salary, bonus from e limit 15;

with e as (select first_name, last_name, dep_id, salary, avg(salary) over (partition by dep_id) as dep_avg from myemp) 
select * from e where salary>dep_avg;

use excelrdb;
select first_name, last_name, dep_id, count(*) over (partition by dep_id) as Countofemp from myemp;

with a as (select first_name, last_name, dep_id, count(first_name) over (partition by dep_id) as Countofemp from myemp)
select * from a where countofemp > 20;

select *, rank() over(order by mark desc)as Ranks from marks;
 
 insert into marks  values(7,'Kate',56),(8,'Charles',78),(9,'Bill',56);
 
select *, dense_rank() over(order by mark desc)as Ranks from marks;

with e as (select *, dense_rank() over(order by mark desc)as Ranks from marks)
select * from e;#where ranks = 3

select *, 
rank() over(order by mark desc) as Rnks,
dense_rank() over(order by mark desc) as Ranks,
row_number() over(order by mark desc) as rnum
from marks;

select *,
 rank() over w as rnk,
 dense_rank() over w as asds_rank,
 row_number() over w as rnum
 from marks
 window w as(order by mark desc);

select * from trains; 

#analytical Functions lead and lag
select *, lead(time,1) over(partition by train_id order by time) as nxt_station from trains;

with e as(select *, lead(time,1) over(partition by train_id order by time) as nxt_station from trains)
select *, subtime(nxt_station,time) as Journey_time from e;

#Find the employee who earns the 3rd highest salary from myemp
with e as (select *, dense_rank() over(order by salary desc)as Ranks from myemp)
select * from e where ranks = 3;

# find all the employees in each department getting 2nd highest in each department
with e as (select *, dense_rank() over(partition by dep_id order by salary desc)as Ranks from myemp)
select * from e where ranks = 3;

select * from students_d;


select *, lead(gdp,1) over(order by fiscal_year) as nextgdp,(lead(gdp,1)over (order by fiscal_year)-gdp)/gdp as pct_change from gdp;

select *, (lead(gdp,1)over (order by fiscal_year)-gdp)/gdp as pct_change from gdp;

with cte as (select *, max(weight) over(partition by breed)as max_weight from cats)
select * from cte;

select *,dense_rank() over (partition by fiscal_year order by sale desc)as rnk from sales;

# -------------------- Window Functions -------------------------------------------

# 1 Find the employee who earns the third highest salalry (Table:myemp)

with cte as (select * , dense_rank() over (order by salary desc ) as rnk from myemp)
select * from cte where rnk = 3;

# 1 a.Within each department find the person getting the second highest salary

with cte as (select * , dense_rank() over (partition by dep_id order by salary desc ) as rnk from myemp) select * from cte where rnk = 2;


# 2. Find students who were present on 3 consecutive days (Table:students_d)
select * from students_d;
with cte as (select *, 
		lead(attendance,1) over (partition by student_id order by date_id) as day2, 
		lead(attendance,2) over(partition by student_id order by date_id) as day3 
		from students_d) 
select distinct student_id 
from cte 
where attendance='p' 
and day2='p' 
and day3='p';

# 3. Find the percentage increase in gdp each year. (Table:gdp)
-- With cte
with cte as (select *, lead(gdp,1) over(order by fiscal_year) as nxt_gdp from gdp)
select *, (nxt_gdp - gdp)/gdp from cte;

-- Without cte
select *, lead(gdp,1) over(order by fiscal_year) as nxt_gdp, (lead(gdp,1) over(order by fiscal_year) - gdp)/gdp as pct_change from gdp;

# 4. Find the heaviest cat in each breed. (Table:cats)

with cte as (select * , max(weight) over(partition by breed) as max_weight from cats)
select * from cte where weight = max_weight;

# 5. Get the yearwise leaderboard based on sales.(Table:sales)
select * from sales;
select *, dense_rank() over(partition by fiscal_year order by sale desc) as rnk from sales;

select * from movies;

#--------------------------------SubQueries-------------------------------------------------
# 6. Movie titles with maximum number of oscars
use excelrdb;
select title ,oscarwins
from film
where oscarwins =(select max(oscarwins) from movies,film);

# 7. Movie titles in which runtimeminutes is greater than average runtimeminutes

select title ,runtimeminutes
from film
where runtimeminutes>(select avg(runtimeminutes) from film);

# 8. display the firstnames which are same in actor table and director table
select firstname ,familyname
from actor
where firstname in (select firstname from director);

# 9. Display the names of employess getting maximum and minimum salary 
select 
concat(first_name,' ',last_name) as fullname,salary
from myemp
where salary = (select max(salary) from myemp) or 
salary =(select min(salary) from myemp);

select officecode from offices where country ='usa';

select * from employee where officecode in (select officecode from offices where country ='usa');

#Co-related sub-query
select * from myemp as e where salary = (select max(salary) from myemp where dep_id = e.dep_id);
