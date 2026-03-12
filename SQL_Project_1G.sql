select * from property_info;

select * from sales_info1;

#1. Retrieve all properties with their sale price.
select *
from 
property_info p
join 
sales_info1 s
on 
p.property_id = s.property_id;

#2.Display address, suburb, and price of all sold properties.
select p.suburb,p.address,s.price
from 
property_info p
join 
sales_info1 s
on 
p.property_id = s.property_id;

#3.Find the top 5 most expensive houses.
select price
from 
sales_info1
order by price desc
limit 5;

#4.Find the average house price for each suburb.
select p.suburb,round(avg(s.price),2) as avg_price
from 
property_info p
join 
sales_info1 s
on p.Property_id = s.Property_id
group by p.Suburb;

#5.Count total properties in each suburb.
select count(*) as property_count,suburb
from 
property_info 
group by Suburb;

#6.Find the regionname who sold the most properties.
select regionname,count(*) as count_property
from property_info 
group by Regionname 
order by count_property desc;

#7.Retrieve properties that have more than 3 rooms.
select address,rooms
from 
property_info 
where rooms > 3;

#8.Find properties with price greater than 1,000,000.
select p.address,s.price
from 
property_info p
join 
sales_info1 s
on p.Property_id =s.Property_id
where s.price > 100000;

#9.Calculate the average land size for each suburb.
select avg(s.landsize),p.suburb
from 
property_info p
join 
sales_info1 s
on p.Property_id =s.Property_id
group by p.Suburb;

#10.Find properties that were type = h.
select address,type
from 
property_info
where type = 'h';

#11.Retrieve houses located within 5 km distance from city.
select address,distance
from 
property_info
where Distance < 5;

#12.Count the number of properties by property type.
select count(*),type
from 
property_info
group by type;

#13.Find the maximum property price.
select max(price) as max_price
from 
sales_info1;

#14.Find the minimum property price.
select min(price) as min_price
from 
sales_info1;

#15.Calculate the average building area.
select round(avg(buildingarea),2) as avg_buildingarea
from sales_info1 ;

#16.Retrieve houses with parking space for more than 2 cars.
select p.address,s.car
from 
property_info p
join 
sales_info1 s
on p.Property_id = s.Property_id
where s.car > 2;

#17.Find houses where bedrooms are greater than bathrooms.
select p.address 
from 
property_info p
join 
sales_info1 s
on p.Property_id = s.Property_id
where s.Bedroom2  > s.Bathroom;

#18.Retrieve properties where price is greater than the average price.
select Property_id ,price
from 
sales_info1
where price > (select avg(price) from sales_info1);

#19.Find the highest priced house in each suburb.
select p.suburb,s.price
from 
property_info p
join 
sales_info1 s
on p.Property_id = s.Property_id
order by price desc 
limit 5;

#20.Count how many properties each seller sold in each suburb.
select count(*),suburb
from 
property_info
group by suburb;