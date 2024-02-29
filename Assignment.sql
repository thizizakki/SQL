use classicmodels;
#Day3
/*1)	Show customer number, customer name, state and credit limit from customers table for below conditions. Sort the results by highest to lowest values of creditLimit.

●	State should not contain null values
●	credit limit should be between 50000 and 100000*/
select customerNumber, customerName, State, creditLimit 
from customers 
where state is not null and 
creditlimit between 50000 and 100000 
order by creditlimit desc;

/*2)	Show the unique productline values containing the word cars at the end from products table.*/
select productline 
from productlines 
where productline regexp 'cars$';

#Day4 1)	Show the orderNumber, status and comments from orders table for shipped status only. If some comments are having null values then show them as “-“.
select ordernumber, status, ifnull(comments, '-') 
from orders;

select ordernumber, status, coalesce(comments,'-') from orders;

/*2)	Select employee number, first name, job title and job title abbreviation from employees table based on following conditions.
If job title is one among the below conditions, then job title abbreviation column should show below forms.
●	President then “P”
●	Sales Manager / Sale Manager then “SM”
●	Sales Rep then “SR”
●	Containing VP word then “VP”*/

select EmployeeNumber,Firstname,JobTitle,
case
when jobTitle='president' then 'P' 
when jobTitle like '%sales manager%' then 'SM'
when jobTitle like'%sale manager%' then 'SM'
when jobTitle='Sales Rep' then 'SR'
when jobTitle like '%VP%' then 'VP'
end as jobTitle_abbr
from employees;

#Day5 1)	For every year, find the minimum amount value from payments table.
select year(paymentdate) as Year, min(amount) as amount 
from payments 
group by year 
order by year asc;

#2)	For every year and every quarter, find the unique customers and total orders from orders table. Make sure to show the quarter as Q1,Q2 etc

SELECT year(orderdate)as Years, concat('Q',quarter(orderdate)) as Quarters, count(distinct customernumber) as UniqueCustomers, count(ordernumber) 
FROM orders 
group by years ,quarters 
order by 1,2;

/*3)	Show the formatted amount in thousands unit (e.g. 500K, 465K etc.) for every month (e.g. Jan, Feb etc.) 
with filter on total amount as 500000 to 1000000. Sort the output by total amount in descending mode. */
select monthname(paymentdate) as months, concat(round(sum(amount)/1000.0),'K') as Amount from payments
group by months
having sum(amount) between 500000 and 1000000
order by sum(amount) desc;

#Day6
# 1)Create a journey table with following fields and constraints.
create table Journey(BusId Integer not null, 
BusName varchar(30) not null,
SourceDestination varchar(40) not null,
Destination varchar(40) not null,
Email varchar(30)unique not null);

#2) Create vendor table with following fields and constraints.
create table Vendor(VendorId integer unique not null,
Name varchar(30) not null,
Email varchar(30) unique,
Country varchar(20));

alter table vendor modify column country varchar(20) default 'N/A';

insert into vendor (VendorId,name,email) values(1,'ABC','abc@gmail.com');

#3)	Create movies table with following fields and constraints.
create table movies(MovieId integer unique not null,
Name varchar(20)not null,
Release_year date,
caste varchar(20) not null,
gender varchar(9) check(GENDER in ('Male', 'Female')),
No_of_Shows int check(No_of_Shows>0));

# 4)
create table Suppliers (Supplier_Id integer primary key,
Supplier_Name varchar(20),
Location varchar(20));

create table product(Product_id integer primary key,
Product_name varchar(20) unique not null,
Description varchar(60),
Supp_id integer, foreign key(Supp_id) references Suppliers(Supplier_id));

create table stock(id integer primary key,
prod_id integer, foreign key(prod_id) references product(product_id),
balance_stock integer);

# Day7 1)
select employeeNumber, concat(firstname,' ',lastname) as Sales_Person, count(customerNumber)as Unique_Customers 
from customers 
inner join employees on employeeNumber=salesRepEmployeeNumber
group by employeeNumber
order by unique_customers desc;

# 2)
select c.customerNumber, c.customername, p.productcode, p.productname, od.QuantityOrdered, p.quantityInStock, (p.quantityInStock-od.QuantityOrdered) as leftQuantity
from customers c
inner join orders o on o.customerNumber=c.customerNumber
inner join orderdetails od on od.OrderNumber=o.orderNumber
inner join products p on p.productcode=od.productcode
order by 1,2,3;

# 3)
create table Laptops(Laptop varchar (10));
create table Colors(Color varchar (10));

insert into Laptops values('Dell');
insert into Laptops values('HP');

insert into colors values('White');
insert into colors values('Silver');
insert into colors values('Black');

select laptop,color from laptops cross join colors order by laptop;

# 4)Find out the names of employees and their related managers.
create table project(EmployeeId integer,FullName varchar(20),Gender varchar(7),ManagerId integer);

alter table project modify column MangerId integer default null;
alter table project rename column MangerId to ManagerId;
drop table project;

INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);
INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);
INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);
INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);
INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);
INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);
INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);

select mgr.fullname as ManagerName, pro.FullName as EmployeeName
from project pro
join project as mgr
on mgr.employeeid=pro.managerid;

# Day 8
create table Facility(facility_id integer, Name varchar(20),State varchar(20),Country varchar(20));

alter table facility modify column facility_id integer not null primary key auto_increment;

alter table facility add City varchar(20) not null after name;
desc facility;

# Day 9)
create table University(id integer,Name varchar(40));

INSERT INTO University
VALUES (1, "       Pune          University     "), 
               (2, "  Mumbai          University     "),
              (3, "     Delhi   University     "),
              (4, "Madras University"),
              (5, "Nagpur University");

select Id,name from university;
select Id, LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(name,CHAR(32),'()'),')(',''),'()',CHAR(32)))) as name from university;
select id,REPLACE(LTRIM(RTRIM(REPLACE(name,' ',''))),'University',' University') as name from university;

# Day 10
CREATE VIEW OrderCountByYear AS
SELECT
    YEAR(OrderDate) AS Year,
    CONCAT(
        COUNT(QuantityOrdered),
        ' (',
        ROUND(COUNT(QuantityOrdered) * 100.0 / (SELECT COUNT(*) FROM OrderDetails), 2),
        '%)'
    ) AS Value
FROM
    Orders o
INNER JOIN
    OrderDetails od ON od.OrderNumber = o.OrderNumber
GROUP BY
    Year;

select year(Orderdate)as Year, concat(count(quantityordered),' (',round(count(quantityordered) * 100 / (SELECT COUNT(*) FROM OrderDetails), 2),'%)') AS Value
from orders o
inner join orderdetails od on od.ordernumber=o.ordernumber
group by Year; 

#Day 11
# 1)
/* Stored Procedure
CREATE DEFINER=`root`@`localhost` PROCEDURE `cust`(x integer)
BEGIN
declare lcl_amount integer;
declare lcl_name varchar(100);

select customerName,creditlimit
into lcl_name,lcl_amount
from customers
where customerNumber=x;

if lcl_amount<25000 then
	select "Silver" as msg;
END if;    
if lcl_amount>100000 then
	select "Platinum" as msg;
end if;
if lcl_amount between 25000 and 100000 then
	select "Gold" as msg;
END if;
END*/
call cust(114);


# 2)
/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `Get_country_payments`(Yearss year, countries varchar(30))
BEGIN
SELECT  year(p.paymentDate) as years, c.country, concat(ceil(sum(p.amount)/1000),'K') as total 
		from payments p 
        inner join customers c on c.customernumber=p.customernumber
		where year(p.paymentdate)=Yearss
        and c.country=countries
        group by c.country,year(p.paymentDate);
END
*/
call Get_country_payments(2003,'France');

# Day 12 1)
with cte as(select year(orderdate) as years,month(orderdate) as mnth, count(ordernumber) as TotalOrders from orders group by year(orderdate),month(orderdate))
select years,case when mnth=1 then 'January'
 when mnth=2 then 'February'
 when mnth=3 then 'March'
 when mnth=4 then 'April'
 when mnth=5 then 'May'
 when mnth=6 then 'June'
 when mnth=7 then 'July'
 when mnth=8 then 'August'
 when mnth=9 then 'September'
 when mnth=10 then 'October'
 when mnth=11 then 'november'
 when mnth=12 then 'December'
end as 'Month',TotalOrders,
concat(round((TotalOrders-lag(TotalOrders,1) over (partition by years order by mnth))*100/lag(TotalOrders,1) over (partition by years order by mnth)),'%') as yoy from cte;

# 2) Executing user defined function
Create table emp_udf(empId integer,name varchar(30),DOB date);

INSERT INTO Emp_UDF(empId,Name, DOB)
VALUES (1,"Piyush", "1990-03-30"), (2,"Aman", "1992-08-15"), (3,"Meena", "1998-07-28"), 
(4,"Ketan", "2000-11-21"), (5,"Sanjay", "1995-05-21");

/*CREATE DEFINER=`root`@`localhost` FUNCTION `age_calc`(DOB Date) RETURNS varchar(20) CHARSET latin1
BEGIN
	declare years integer;
    declare months integer;
    declare age varchar(20);
    SET years = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    SET months = TIMESTAMPDIFF(MONTH, DOB, CURDATE()) - years * 12;
	SET age = CONCAT(years, ' years ', months, ' months');
    return age;
END */

SELECT empid, Name, age_calc(DOB) AS Age FROM Emp_UDF;

select year(paymentDate) as years, country, concat(ceil(sum(amount)/1000),'K') as total 
from customers c
inner join payments p on p.customerNumber=c.customernumber  
group by years, country
order by 1,2;

#Day 13 1)
select customerNumber,customerName from customers 
where customerNumber not in	(select customernumber from orders);	

# 2)
select c.customerNumber, c.customerName, count(orderNumber) as Totalorders from customers c left join orders o on c.customerNumber=o.customerNumber 
group by c.customerNumber
union
select c.customerNumber, c.customerName, count(orderNumber) as Totalorders from customers c right join orders o on c.customerNumber=o.customerNumber
group by c.customerNumber;

#Same query using left join
select c.customerNumber, c.customerName, count(orderNumber) as Totalorders
from customers c
left join orders o on c.customerNumber=o.customerNumber
group by c.customerNumber ;

# 3)
select orderNumber, quantityordered, dense_rank() over (partition by ordernumber order by quantityordered desc) as ranks from orderdetails;
with cte as(select orderNumber, quantityordered, dense_rank() over (partition by ordernumber order by quantityordered desc) as ranks from orderdetails)
select ordernumber,quantityordered from cte where ranks=3;

# 4)
select ordernumber, count(productcode) from orderdetails group by ordernumber;
with cte as(select ordernumber, count(productcode) as products from orderdetails group by ordernumber)
select max(products)as Maximum, min(products) as Minimum from cte;

# Day 5)
select distinct(productline), count(productname) over (partition by productline order by count(productname)desc) as total from products;

#without using windows function
select productline,count(productname) as total from products group by productline order by total desc;

#Day 14
create table Emp_EH(Emp_Id integer primary key, Emp_Name varchar(50),EmailAddress varchar(30));
/*CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertIntoEmp_EH`(
    in p_EmpID integer,
    in p_EmpName varchar(50),
    in p_EmailAddress varchar(30)
)
begin
    declare exit handler for sqlexception
    begin
        select 'Error occurred' as ErrorMessage;
    end;

    insert into Emp_EH (Emp_ID, Emp_Name, EmailAddress)
    values (p_EmpID, p_EmpName, p_EmailAddress);

    select 'Values Inserted Successfully' as SuccessMessage;
end*/
call InsertIntoEmp_EH(1,'Akshay','akshay@gmail.com');
call InsertIntoEmp_EH(1, 'John Doe', 'john.doe@example.com');
call InsertIntoEmp_EH(2, 'Sachin','sachin@gmail.com');
call InsertIntoEmp_EH(2, 'Ricky','Ricky@gmail.com');
call InsertIntoEmp_EH(3, 'Ricky','Ricky@gmail.com');

#Day 15
create table Emp_BIT (Name varchar(40),Occupation varchar(30),Working_date date,Working_hours integer);

INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12), 
('Warner', 'Engineer', '2020-10-04', 10), 
('Peter', 'Actor', '2020-10-04', 13), 
('Marco', 'Doctor', '2020-10-04', 14), 
('Brayden', 'Teacher', '2020-10-04', 12), 
('Antonio', 'Business', '2020-10-04', 11);

/*CREATE DEFINER=`root`@`localhost` TRIGGER `emp_bit_BEFORE_INSERT` BEFORE INSERT ON `emp_bit` FOR EACH ROW BEGIN
    if new.Working_hours < 0 then
        set new.Working_hours = -new.Working_hours;
    end if;
END*/

INSERT INTO Emp_BIT VALUES
    ('David', 'Scientist', '2020-10-04', -10),
    ('Eve', 'Actor', '2020-10-04', -12);
INSERT INTO Emp_BIT VALUES
	('Davy', 'Doctor', '2020-10-04', 10);

select * from Emp_BIT;