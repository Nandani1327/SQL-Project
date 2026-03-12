use fingertips;
show tables;
create table abc(Name varchar(25),Age int(99),City varchar(25));
select * from abc;
insert into abc(Name,Age,City) values ("Abhishek",25,"Jaipur");
insert into abc(Name,City,Age) values ("Abhi","Dehli",22);
select Name,Age from abc;

create table prefessionals(
Professional_ID int(3),
First_name varchar(10),
Last_name varchar(10),
Salaray int(10),
Joining_Date DATETIME,
Department varchar(10)
);


insert into prefessionals(professional_id,First_Name,Last_Name,Salaray,Joining_Date,Department)values
(001,"Mayank","Srivastava",100000,"2021-02-20 09:00:00","ENGINEER "),
(002,"Virat","Agnihotri",80000,"2021-06-11 09:00:00","Architect"),
(003,"Shubham","Srivastava",300000,"2021-02-20 09:00:00","ENGINEER"),
(004,"Sunil","Khurana",500000,"2021-02-20 09:00:00","Architect"),
(005,"Mohammad","Salman",500000,"2021-06-11 09:00:00","Architect"),
(006,"Prem","Modi",200000,"2021-06-11 09:00:00","Sales"),
(007,"Harsh","Shukla",75000,"2021-01-20 09:00:00","Sales"),
(008,"Pryag","Agarwal",9000,"2021-04-11 09:00:00","Architect"),
(009,"Anil","Rastogi",120000,"2021-02-20 09:00:00","Accounts"),
(010,"Amitabh","Singh",60000,"2021-06-11 09:00:00","Finance"),
(011," Jasbeer","Kaur",280000,"2021-02-20 09:00:00","Accounts"),
(012,"Srijan","Mahadev",500000,"2021-02-20 09:00:00","Sales"),
(013,"Mohammad","Salman",500000,"2021-06-11 09:00:00","Finance"),
(014,"Shakti","Khanna",230000,"2021-06-11 09:00:00","Engineer"),
(015,"Anand","Kapoor",45000,"2021-01-20 09:00:00","Accounts"),
(016,"Shiwali","Sethiya",22000,"2021-04-11 09:00:00","Architect"),
(017,"Virat","Jadeja",500000,"2021-06-11 09:00:00","Finance"),
(018,"Maan","Singh",200000,"2021-06-11 09:00:00","Engineer"),
(019,"Deepak","Pandey",78000,"2021-01-20 09:00:00","Accounts"),
(020,"Rahul","Sharma",9000,"2021-04-11 09:00:00","Architect");

#import book1.csv file
show tables;
select * from book1;


select department from prefessionals;

select upper(first_name) from prefessionals;
select lower(Last_name) from prefessionals;
select upper(first_name),lower(Last_name) from prefessionals;
# distinct : for use remove duplicate value . show uniqe value
select distinct (Department) from prefessionals;
# trim : for use remove space 
select distinct (Department) from prefessionals;
# trim : for use remove right side space 
select distinct rtrim(Department) from prefessionals;
# trim : for use remove left side space 
select distinct ltrim(Department) from prefessionals;
select distinct joining_Date from prefessionals;
# concat : for use murge two fields
select concat(First_name,Last_name) from prefessionals;
# Add space between two fields
select concat(First_name," ",Last_name) from prefessionals;
# Alias : Alias  for give temporary name 
# for give temporary name to concat fields
select concat(First_name," ",Last_name) as Full_name from prefessionals;
#length : count char length
select length(First_name) from prefessionals;
select First_name,length(First_name) from prefessionals;
# when we use keyword as name that time use ``
select First_name,length(First_name) as `length` from prefessionals;
select Last_name,length(First_name) as `length` from prefessionals;

# single line comment
/*multi line
 * comment
 */
#where condition
#find details of employee working in architect department
select * from prefessionals where trim(Department)='Architect';

# Find first_name , last_name of employee having more than 2 lakhs.
select First_name,Last_name from prefessionals where Salaray > 200000;

# Find first_name , last_name,Depertment of employee having more than 2 lakhs.
select First_name,Last_name,Department from prefessionals where Salaray > 200000;

# logical oprator : 
#And oprator : when we wants to person who is having lassthan 200000 salaray and in Engineer department  ... when we wants multiple details for one person or department 
select First_name,Last_name,Department from prefessionals where Salaray > 200000 and trim(Department)="Engineer";
     
# find the details of sales department having salaray grearer than equal to 1 lakh
select * from prefessionals where Department="sales"and Salaray >= 100000;

# OR operator :  ese person ki details chahiye jo sales m or engineer m ho.
select * from prefessionals where Department="sales" or Department="Engineer";


#find details of employee whose department=sales,account,architect,finance
select * from prefessionals where Department="sales" or Department="Accounts" or Department="Architect" or Department="finanace";

# NOT operetor
select * from prefessionals where not Department="architect";

#using IN keyword
select * from prefessionals where Department in("sales","architect","finance");

#Find the name,department of employees whose salaray is between 2 lakh and 3 lakh.
select First_name,Department ,salaray from prefessionals where Salaray>=200000 and salaray<=300000;

#Between
select First_name,Department ,salaray from prefessionals where Salaray between 200000 and 300000;
select * from prefessionals where  Joining_Date between "2021-02-20 09:00:00"  and "2021-06-11 09:00:00";

#find details of employee who have joined in month of feb. MONTH function using find month details
select * from prefessionals where  MONTH(Joining_Date) = 2;

#find details of sales department who have joined in month of june
select * from prefessionals where Department="sales" and MONTH(Joining_Date) = 6;

#DROP : parmanentaly delete table ,rows
show tables;
drop table book1;
#TRUNCATE: data delete , Hard delete we can't undu and rollback
select * from abc;
truncate table abc;
#DELETE : soft delete , we can undu and rollback ,temporary
set autocommit = 0;
delete from prefessionals where Professional_ID=1;
select * from prefessionals;
#Rollback:
#delete kr diya h vo vapas aa jata h ..
rollback;

#Type of copy .. create table and joint query .. which data you want 
select * from prefessionals where trim(Department)="Engineer";
create table Eng_info as select * from prefessionals where trim(Department)="Engineer";
select * from Eng_info;

#wild card(%) keyword like
# M%: for first name
select * from prefessionals where First_name like "m%";
# %M: for last name 
select * from prefessionals where First_name like "%m";
# M%S: for first name and last name both
select * from prefessionals where First_name like "s%m";
# %AB%: For anything in word .. like between 
select * from prefessionals where First_name like "%ab%";
# for salary(numbers) 
select * from prefessionals where salaray like "2%";

#AGGRECATE FUNCTIONS : 
#1) COUNT():
select * from prefessionals;
select count(Professional_ID) from prefessionals;
select count(Department) from prefessionals where trim(Department) ="Engineer";
select count(First_name) from prefessionals where First_name like "s%";
select count(Professional_ID) from prefessionals where First_name like "s%";
#2) MAX():
select max(salaray) from prefessionals where department="Accounts";
#3) MIN():
select min(salaray) from prefessionals where department="Accounts";
#4)AVG();
select avg(salaray) from prefessionals where trim(department)="Engineer";
#5)SUM();
select sum(salaray) from prefessionals where department="Architect";
#SUM OF SALARY OF EMPLOYEE WHOSE NAME START FROM "S" AND DEPARTMENT IS ENGINEER AND HAVING JOIN MONTH IS FEB
select sum(salaray) from prefessionals where First_name like "s%" and  trim(department) in("Engineer","Architect") and month(Joining_Date)=2  ;

#GROUP BY :
select count(Professional_id),trim(department) from prefessionals group by trim(department);
select max(salaray),trim(Department) from prefessionals group by trim(department);


# Round : nearest value of the amount
select round(2.4);
# Floor : bottom value of the amount
select floor(2.9);
# Ceil : Top value of the amount
select ceil(2.1);

use fingertips;
select joining_date as `date`,count(professional_Id) as hiring from prefessionals group by joining_date;


#ORDER BY : Sorting value in ascending and descending order
select salaray from prefessionals order by salaray; # Default Ascending
select salaray from prefessionals order by salaray asc; # Ascending 
select salaray from prefessionals order by salaray desc; # Descending

select  trim(first_name) from prefessionals order by trim(first_name);

# Having clause : when we wants to apply condition  in group by that time using having condintion .. 
select trim(department),sum(salaray) from prefessionals group by trim(department) having sum(salaray)>700000;

select trim(department) dept,count(professional_ID) from prefessionals group by trim(department) having count(professional_id) > 3;

select first_name,count(first_name) from prefessionals group by first_name having count(first_name)>1;

#Limit :shows top rows which you want
select * from prefessionals limit 5;

# OFF SET : 5 skip kr k 6th ki details show kregi ... between value syntax : 5,1
select * from prefessionals limit 5,1;

#subquery:query k under query
select max(salaray) from prefessionals;

select max(salaray) from prefessionals where salaray <(select max(salaray) from prefessionals);

select * from prefessionals where salaray= (select max(salaray) from prefessionals where salaray <(select max(salaray) from prefessionals));

select min(salaray) from prefessionals where salaray > (select min(salaray) from prefessionals where department="Architect");
#2nd lowest
select * from prefessionals where salaray =(select min(salaray) from prefessionals where salaray > (select min(salaray) from prefessionals where department="Architect"));

select first_name, max(salaray) from prefessionals group by salaray,first_name order by salaray DESC limit 1,1 ;
#2nd highest
select * from prefessionals where salaray= (select max(salaray) from prefessionals where salaray <(select max(salaray) from prefessionals));

#3rd highest
select max(salaray) from prefessionals where department="sales" and  salaray < (select max(salaray) from prefessionals where department="sales" and salaray < (select max(salaray)  from prefessionals) where department="sales"));

use fingertips;
# Modulo : (%) : in sql it's called divide return reminder 
select * from prefessionals where professional_id % 2;

#divide (/):
select * from prefessionals where professional_id <= (select count(professional_id)/2 from prefessionals);

select count(professional_id)/2 from prefessionals;

CREATE TABLE products (
 id INT PRIMARY KEY,
 name VARCHAR(255) NOT NULL,
 price DECIMAL(10,2) NOT NULL,
 size VARCHAR(10),
 color VARCHAR(20),
 description VARCHAR(250)
);

#create table customers
CREATE TABLE customers (
 id INT PRIMARY KEY,
 name VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL,
 phone VARCHAR(20),
 address VARCHAR(255)
);

#create table orders
CREATE TABLE orders (
 id INT PRIMARY KEY,
 customer_id INT NOT NULL,
 product_id INT NOT NULL,
 quantity INT NOT NULL,
 order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (customer_id) REFERENCES customers(id),
 FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO products (id, name, price, size, color, description)
VALUES 
(1, 'T-shirt', 19.99, 'M', 'Blue', 'A comfortable and stylish t-shirt'),
(2, 'Jeans', 49.99, '32x34', 'Black', 'A classic pair of black jeans'),
(3, 'Sneakers', 79.99, '10.5', 'White', 'A pair of comfortable and 
stylish sneakers'),
(4, 'Sweater', 34.99, 'L', 'Gray', 'A cozy and warm sweater'),
(5, 'Dress', 59.99, 'S', 'Red', 'A beautiful and elegant dress'),
(6, 'Jacket', 99.99, 'XL', 'Green', 'A warm and stylish jacket'),
(7, 'Skirt', 29.99, 'M', 'Yellow', 'A cute and flirty skirt'),
(8, 'Blouse', 39.99, 'L', 'Pink', 'A flowy and feminine blouse'),
(9, 'Shorts', 24.99, 'S', 'Orange', 'A comfortable pair of shorts for 
summer'),
(10, 'Hoodie', 49.99, 'L', 'Black', 'A cozy and casual hoodie'),
(11, 'Boots', 89.99, '9.5', 'Brown', 'A stylish pair of boots for any 
occasion'),
(12, 'Sweatpants', 29.99, 'M', 'Gray', 'A comfortable and casual 
pair of sweatpants'),
(13, 'Sunglasses', 19.99, NULL, 'Black', 'A cool and trendy pair of 
sunglasses'),
(14, 'Scarf', 14.99, NULL, 'Purple', 'A warm and cozy scarf for the 
winter'),
(15, 'Hat', 9.99, 'One size', 'Navy', 'A stylish and versatile hat for
any outfit'),
(16, 'Jumpsuit', 69.99, 'M', 'Black', 'A chic and trendy jumpsuit 
for any occasion'),
(17, 'Blazer', 79.99, 'L', 'White', 'A sophisticated and stylish blazer 
for work or events'),
(18, 'Sweatshirt', 39.99, 'XL', 'Pink', 'A comfortable and cozy 
sweatshirt for lounging'),
(19, 'Leggings', 24.99, 'S', 'Black', 'A versatile and comfortable 
pair of leggings'),
(20, 'Pants', 54.99, '32x30', 'Khaki', 'A classic and stylish pair of 
khaki pants');

#insert values into customers
INSERT INTO customers (id, name, email, phone, address)
VALUES 
(1, 'John Smith', 'john.smith@gmail.com', '+1 555-123-4567', 
'123 Main St, Anytown, USA'),
(2, 'Jane Doe', 'jane.doe@yahoo.com', '+1 555-987-6543', '456 
Maple Ave, Anytown, USA'),
(3, 'Bob Johnson', 'bob.johnson@yahoo.com', NULL, '789 Oak St, 
Anytown, USA'),
(4, 'Emily Williams', 'emily.williams@gmail.com', '+1 555-555-
1212', '321 Elm St, Anytown, USA'),
(5, 'David Lee', 'david.lee@yahoo.com', '+1 555-555-5555', '567 
Pine St, Anytown, USA'),
(6, 'Sarah Kim', 'sarah.kim@gmail.com', '+1 555-123-7890', '890 
Cedar Ave, Anytown, USA'),
(7, 'Michael Chen', 'michael.chen@yahoo.com', '+1 555-999-
8888', '246 Birch Blvd, Anytown, USA'),
(8, 'Jessica Brown', 'jessica.brown@yahoo.com', '+1 555-777-
6666', '369 Spruce St, Anytown, USA'),
(9, 'Kevin Garcia', 'kevin.garcia@gmail.com', '+1 555-111-2222', 
'802 Maplewood Dr, Anytown, USA'),
(10, 'Ashley Davis', 'ashley.davis@gmail.com', NULL, '135 Walnut 
St, Anytown, USA');

#insert values into orders
INSERT INTO orders (id, customer_id, product_id, quantity, 
order_date)
VALUES 
(1, 1, 1, 2, '2022-03-08 14:25:00'),
(2, 2, 1, 1, '2022-03-07 09:32:00'),
(3, 3, 3, 4, '2022-03-06 18:05:00'),
(4, 4, 5, 3, '2022-03-05 10:12:00'),
(5, 5, 2, 2, '2022-03-04 15:22:00'),
(6, 1, 3, 1, '2022-03-03 12:48:00'),
(7, 2, 4, 2, '2022-03-02 17:09:00'),
(8, 3, 1, 3, '2022-03-01 11:35:00'),
(9, 4, 2, 1, '2022-02-28 16:02:00'),
(10, 5, 5, 2, '2022-02-27 13:24:00'),
(11, 1, 2, 3, '2022-02-26 10:49:00'),
(12, 2, 3, 2, '2022-02-25 14:56:00'),
(13, 3, 4, 1, '2022-02-24 09:17:00'),
(14, 4, 1, 2, '2022-02-23 12:40:00'),
(15, 5, 3, 3, '2022-02-22 16:58:00');

#JOIN : horizontally
#Fetch details of the customer and the number of quantites that they have ordered?
select  customers.name, sum(orders.quantity)from customers inner join orders on customers.id = orders.customer_id group by customers.name;

# which products orders how many times
select products.name , orders.quantity from products inner join orders on products.id = orders.customer_id;
select products.name , sum(orders.quantity) from products inner join orders on products.id = orders.customer_id group by products.name;

use fingertips;
select * from orders;

#How many quantities of each sized product are orderd ?
select products.size,sum(orders.quantity) from products left join orders on orders.product_id = products.id group by products.size ;

#Name the products which were orders and number of quantities ordered
select products.name , sum(orders.quantity) from products right join orders on orders.product_id=products.id group by products.name ;

#fULL OUTER JOIN
#UNION : vertically 


create table w1 (Name varchar(10), Age int(5));
create table w2 (Name varchar(10), Age int(5));

insert into w1 values
("Sachin", 45),
("Kohli", 33),
("Manish", 22),
("Kohli", 33);

insert into w2 values
("Maxwell", 45),
("Amit", 33),
("Rahul", 22),
("Rahul", 33);

select * from w1 union select * from w2;
select * from w1 union all select * from w2;

#Cross or Cartesian join :
select * from products cross join orders;

#Multiple Join :
# Name the customers who have orders atleast 6 quantites and for price>140
select c.name,sum(quantity) ,sum(price) from (customers c join  orders o on c.id=o.customer_id  ) join products p on p.id=o.product_id 
group by c.id having sum(quantity)>=6 and sum(price)>140;

#Update
update prefessionals set salaray =90000 where professional_id=2;

select * from prefessionals;

update prefessionals set department = "Data_sci" where first_name ="maan";

alter table prefessionals rename column professional_id to id;
alter table prefessionals add column xyz varchar(10);
alter table prefessionals modify column department varchar(20);
alter table prefessionals drop column xyz;

#REGULAR EXPRESSION :
# when find first latter of name that time use ^
select * from prefessionals where first_name regexp "^s";
# when find last latter of name that time use $
select * from customers where email regexp "@gmail.com$";
select * from customers where name regexp "john|jane|bob";
select * from products where size regexp "[aeiou]";
select * from products where size regexp "[0-9]";

select * from products where size regexp "[a-pA-P]";


select customers.name c,
       count(orders.quantity) count_qty
from orders right join customers
on customers.id = orders.customer_id
group by customers.name;


#INDEX : it's take time less for searching and finding data
create index my_index on prefessionals (first_name,last_name,salaray);
select salaray from prefessionals;
drop index my_index on prefessionals;

#PROCEDURE : one type of function 
create procedure z1() select * from prefessionals;
call z1();
create procedure pd(in x int) select * from prefessionals where id = x;
call pd(1);

#View: it's just create a view .. one type of permission
create view my_view as select * from prefessionals where department="sales";
create view my_view1 as select first_name,last_name,department from prefessionals;
select * from my_view1;

#IF :
select first_name,last_name,salaray,if(salaray>100000,"class A","class B") as class from prefessionals;

#CASE :
select * ,
case
when salaray<100000 then "class c"
when salaray>=100000 and salaray<=200000 then "class b"
else "class a" end as class from prefessionals;
end



