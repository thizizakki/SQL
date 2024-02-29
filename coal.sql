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