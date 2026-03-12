show tables;

select * from property_info;
select * from sales_info;

select p.property_id,p.suburb,s.price
from 
property_info p
join 
sales_info s
on 
p.property_id = s.property_id;

select property_id,price
from 
sales_info
order by price desc 
limit 10;

select p.regionname,round(avg(s.price),2)
from 
property_info p
join 
sales_info s
on 
p.property_id = s.property_id
group by p.regionname;

select `type`,count(*)
from property_info
group by `type`;

select p.property_id,p.bedroom2,s.price
from 
property_info p
join 
sales_info s
on 
p.property_id = s.property_id
where p.bedroom2 > 3
and
s.price > 10000000;

select property_id,yearbuilt
from 
property_info
order by yearbuilt asc
limit 5;

select p.regionname,sum(s.price)
from 
property_info p
join 
sales_info s
on 
p.property_id = s.property_id
group by p.regionname;

select sellerg,count(*) as total_sales
from sales_info
group by sellerg
order by total_sales  desc;

select p.property_id,s.`date`,s.price
from 
property_info p
join 
sales_info s
on 
p.property_id = s.property_id
where year(s.`date`) > 2018;

select property_id,price
from 
sales_info
where price > (select avg(price) from sales_info);