#1.
use project3;
show tables;
select * from hospital1;
select * from listing;

#2.Write a query to show names from Listings table
select name from listing;

#3.Write a query to fetch total listings from the listings table
select count(id) from listing;

#4.Write a query to fetch total listing_id from the booking_details table
select count(listing_id) from hospital1;

#5.Write a query to fetch host ids from listings table
select host_id from listing;

#6.Write a query to fetch all unique host name from listings table
select distinct(host_name) from listing;

#7.Write a query to show all unique neighbourhood_group from listings table
select distinct(neighbourhood_group) from listing;

#8.Write a query to show all unique neighbourhood from listings table
select distinct(neighbourhood) from listing;

#9.Write a query to fetch unique room_type from listings tables
select distinct(room_type) from listing;

#10.Write a query to show all values of Brooklyn & Manhattan from listings tables
select * from listing where neighbourhood_group in ("brooklyn","manhattan" ) ;

#11.Write a query to show maximum price from booking_details table
select max(price) from hospital1;

#12.Write a query to show minimum price fron booking_details table
select min(price) from hospital1;

#13.Write a query to show average price from booking_details table
select avg(price) from hospital1;

#14.Write a query to show minimum value of minimum_nights from booking_details table
select min(minimum_nights) from hospital1;

#15.Write a query to show maximum value of minimum_nights from booking_details table
select max(minimum_nights) from hospital1;

#16.Write a query to show average availability_365 
select avg(availability_365) from hospital1;

#17.Write a query to show id , availability_365 and all availability_365 values greater than 300
select listing_id,availability_365 from hospital1 where availability_365 > 300;

#18.Write a query to show count of id where price is in between 300 to 400
select count(listing_id) from hospital1  where price between 300 and 400;

#19.Write a query to show count of id where minimum_nights spend is less than 5
select count(listing_id) from hospital1  where minimum_nights < 5 ;

#20.Write a query to show count where minimum_nights spend is greater than 100
select count(listing_id) from hospital1  where minimum_nights > 100 ;

#21.Write a query to show all data of listings & booking_details
select * from listing join hospital1;

#22.Write a query to show host name and price 
select listing.host_name , hospital1.price from listing inner join hospital1 on listing.id=hospital1.listing_id;

#23.Write a query to show room_type and price
select listing.room_type , hospital1.price from listing inner join hospital1 on listing.id=hospital1.listing_id;

#24.Write a query to show neighbourhood_group & minimum_nights spend
select listing.neighbourhood_group , hospital1.minimum_nights from listing inner join hospital1 on listing.id=hospital1.listing_id;

#25.Write a query to show neighbourhood & availability_365
select listing.neighbourhood_group , hospital1.availability_365 from listing inner join hospital1 on listing.id=hospital1.listing_id;

#26.Write a query to show total price by neighbourhood_group
select listing.neighbourhood_group , sum(hospital1.price) from listing inner join hospital1 on listing.id=hospital1.listing_id group by listing.neighbourhood_group;

#27.Write a query to show maximum price by neighbourhood_group
select listing.neighbourhood_group , max(hospital1.price) from listing inner join hospital1 on listing.id=hospital1.listing_id group by listing.neighbourhood_group;

#28.Write a query to show maximum night spend by neighbourhood_group
select listing.neighbourhood_group , max(hospital1.minimum_nights) from listing inner join hospital1 on listing.id=hospital1.listing_id group by listing.neighbourhood_group;

#29.Write a query to show maximum reviews_per_month spend by neighbourhood
select listing.neighbourhood_group , max(hospital1.reviews_per_month) from listing inner join hospital1 on listing.id=hospital1.listing_id group by listing.neighbourhood_group;

#30.Write a query to show maximum price by room type
select listing.room_type , max(hospital1.price) from listing inner join hospital1 on listing.id=hospital1.listing_id group by listing.room_type;

#31.Write a query to show average number_of_reviews by room_type
select listing.room_type , avg(hospital1.number_of_reviews) from listing inner join hospital1 on listing.id=hospital1.listing_id group by listing.room_type;

#32.Write a query to show average price by room type
select listing.room_type , avg(hospital1.price) from listing inner join hospital1 on listing.id=hospital1.listing_id group by listing.room_type;

#33.Write a query to show average night spend by room type
select listing.room_type , avg(hospital1.minimum_nights) from listing inner join hospital1 on listing.id=hospital1.listing_id group by listing.room_type;

#34.Write a query to show average price by room type but average price is less than 100
select listing.room_type , avg(hospital1.price) avg_price from listing inner join hospital1 on listing.id=hospital1.listing_id group by listing.room_type having avg_price < 100;

#35.Write a query to show average night by neighbourhood and average_nights is greater than 5
select listing.neighbourhood_group , avg(hospital1.minimum_nights) avg_nights from listing inner join hospital1 on listing.id=hospital1.listing_id group by listing.neighbourhood_group having avg_nights > 5;

#36.Write a query to show all data from listings where price is greater than 200 using sub-query.
select * from listing where id in (select id from hospital1 where price > 200);

select * from hospital1;
select * from listing;

#37.Write a query to show all values from booking_details table where host id is 314941 using sub-query.
select * from hospital1 where listing_id in (select listing_id from listing where host_id = 314941);

select * from listing ;
show tables;

#38 *********.Find all pairs of id having the same host id, each pair coming once only
select distinct l1.id , 
       l1.host_id 
from listing l1, listing l2
where  l1.host_id = l2.host_id and l1.id  <> l2.id  
order by host_id;

select a.id as id1,
       b.id as id2,
       a.host_id
from listing a 
join listing b
on a.host_id = b.host_id
and a.id < b.id;

#39.Write an sql query to show fetch all records that have the term cozy in name
select * from listing where name like "%cozy%";

select * from hospital1;
select * from listing;
#40.Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group
select hospital1.price , listing.host_id,listing.neighbourhood_group from listing join hospital1 on listing.id=hospital1.listing_id where listing.neighbourhood_group="manhattan";

#41.Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, also make sure price is greater than 100
select listing.id,listing.host_name,listing.neighbourhood ,hospital1.price from listing join hospital1 on listing.id=hospital1.listing_id where listing.neighbourhood in ("upper west side","williamsburg") and hospital1.price > 100;

#42.Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant
select listing.id,listing.host_name,listing.neighbourhood ,hospital1.price from listing join hospital1 on listing.id=hospital1.listing_id where listing.host_name = "Elise" and listing.neighbourhood="bedford-stuyvesant";

#43.Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights
select listing.host_name ,hospital1.availability_365 ,hospital1.minimum_nights from listing join hospital1 on listing.id=hospital1.listing_id where availability_365 > 100 and minimum_nights > 100;

#44.Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+
select listing.id,listing.host_name ,hospital1.number_of_reviews,hospital1.reviews_per_month from listing join hospital1 on listing.id=hospital1.listing_id where hospital1.number_of_reviews > 500 and hospital1.reviews_per_month > 5;

#45.Write a query to show neighbourhood_group which have most total number of review
select listing.neighbourhood_group,sum(hospital1.number_of_reviews) as reviews from listing join hospital1 on listing.id=hospital1.listing_id group by listing.neighbourhood_group order by  reviews limit 1 desc;

#46.Write a query to show host name which have most cheaper total price 
select listing.host_name ,sum( hospital1.price) as total_price from listing join hospital1 on listing.id=hospital1.listing_id group by listing.host_name order by total_price asc limit 1;

#47.Write a query to show host name which have most costly total price 
select listing.host_name ,sum( hospital1.price) as total_price from listing join hospital1 on listing.id=hospital1.listing_id group by listing.host_name order by total_price desc limit 1;

#48.Write a query to show host name which have max price using sub-query
select listing.host_name,hospital1.price from listing join hospital1 on listing.id=hospital1.listing_id where hospital1.price in (select MAX(price) from hospital1);

#49.Write a query to show neighbourhood_group where price is less than 100
select listing.neighbourhood_group,hospital1.price from listing join hospital1 on listing.id=hospital1.listing_id where hospital1.price < 100; 

#50.Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price
select max(hospital1.price) max_price,avg(hospital1.availability_365) avg_avai,listing.room_type from listing join hospital1 on listing.id=hospital1.listing_id group by listing.room_type order by max_price asc;
