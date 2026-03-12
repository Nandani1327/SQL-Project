use uber;

show tables;

select * from drivers;
select * from passengers;
select * from rides;

#1.What are & how many unique pickup locations are there in the dataset?
select pickup_location,count(pickup_location) 
	from rides 
	group by pickup_location;


#2.     What is the total number of rides in the dataset?
select count(ride_id) 
	from rides;

#Calculate the average ride duration
select round(avg(ride_duration),2) 
	from rides;

#List the top 5 drivers based on their total earnings
select sum(earnings) as total_earnings,driver_name
	from drivers 
	group by driver_name 
	order by total_earnings desc 
	limit 5;

#Calculate the total number of rides for each payment method
select count(ride_id),payment_method
	from rides 
	group by payment_method ;

#Retrieve rides with a fare amount greater than 20.
select * from rides;
select * from rides
	where fare_amount > 20;

#   Identify the most common pickup location.
select pickup_location , count(*)
	from rides 
	group by pickup_location 
	order by count(*) desc
	limit 1;

#Calculate the average fare amount.
select round(avg(fare_amount),2)
from rides;

#List the top 10 drivers with the highest average ratings.
select driver_name,avg(rating) as avg_ratings
from drivers
group by driver_name 
order by avg_ratings desc 
limit 10;

#Calculate the total earnings for all drivers.
select driver_name,sum(earnings)
from drivers
group by driver_name; 

# How many rides were paid using the "Cash" payment method?
select count(*) 
from rides
where payment_method ="Cash";

#Calculate the number of rides & average ride distance for rides originating from the 'Dhanbad' pickup location
select count(*),round(avg(ride_distance),2) 
from rides
where pickup_location = "Dhanbad";

#Retrieve rides with a ride duration less than 10 minutes.
select ride_id,ride_duration
from rides
where ride_duration < 10;

#List the passengers who have taken the most number of rides.
select passenger_name,count(total_rides) as totalrides
from passengers
group by passenger_name 
order by totalrides desc
limit 5;

#Calculate the total number of rides for each driver in descending order.
select driver_id,count(*) as totalrides
from rides
group by driver_id  
order by totalrides desc;

#Identify the payment methods used by passengers who took rides from the 'Gandhinagar' pickup location.
select distinct payment_method 
from rides
where pickup_location ="Gandhinagar";

#Calculate the average fare amount for rides with a ride distance greater than 10.
select round(avg(fare_amount),2)
from rides
where ride_distance > 10;

#List the drivers in descending order accordinh to their total number of rides
select driver_name,total_rides as total
from drivers 	 
order by total desc;

#Calculate the percentage distribution of rides for each pickup location.
select pickup_location,count(*) as ride_count,
count(*)*100.0/(select count(*) from rides) as Percentage
from rides
group by pickup_location
order by Percentage desc;

# 145 * 100 / total rows = give percentage of 145.

select count(*) from rides;
select count(ride_id) from rides;

select distinct  pickup_location from rides;

#Retrieve rides where both pickup and dropoff locations are the same.
select pickup_location,dropoff_location 
from rides
where pickup_location = dropoff_location;


















# 1.List the passengers who have taken rides from at least 300 different pickup locations.
select*from passengers;
select*from rides;
select passenger_id,count(distinct(pickup_location)) as ride from rides
group by passenger_id
having ride>=300;

#2.  Calculate the average fare amount for rides taken on weekdays.
select avg(fare_amount) 
from rides
where DAYOFWEEK(ride_timestamp) not in (1,7);


select * from rides;

#3   Identify the drivers who have taken rides with distances greater than 19.
select*from drivers;
select driver_id,ride_distance from rides
where ride_distance>19;

#4 Calculate the total earnings for drivers who have completed more than 100 rides.
select sum(earnings),driver_name from drivers 
where total_rides>100
group by driver_name;

#5 Retrieve rides where the fare amount is less than the average fare amount.
select fare_amount,ride_id 
from rides
where fare_amount < (select avg(fare_amount) from rides);

#6.Calculate the average rating of drivers who have driven rides with both 'Credit Card' and 'Cash' payment methods.
select avg(d.rating) as avg_rating
from drivers d 
where d.driver_id in(select driver_id from rides where payment_method in ("Cash","Credit Card") group by driver_id having count(distinct payment_method)=2);

#List the top 3 passengers with the highest total spending.
select * from passengers order by total_spent desc limit 3;

#8.Calculate the average fare amount for rides taken during different months of the year.
select month(ride_timestamp) as months,
	MONTHNAME(ride_timestamp) as monthsname,
	avg(fare_amount) as avg_fareamount
	from rides 
	group by months , monthsname 
	order by months;

#9.Identify the most common pair of pickup and dropoff locations.
select pickup_location,dropoff_location,count(*) as total_tips
from rides
group by pickup_location,dropoff_location
order by total_tips desc;

#10.Calculate the total earnings for each driver and order them by earnings in descending order.
select round(sum(earnings),2) as total_earnings,driver_name
from drivers
group by driver_name
order by total_earnings desc;

#11.List the passengers who have taken rides on their signup date.
select*from passengers;
select*from rides;
select p.passenger_id,p.passenger_name,p.signup_date ,r.ride_timestamp
from rides r inner join passengers p
on p.passenger_id =r.passenger_id
where date(p.signup_date) =date(r.ride_timestamp);

#12.Calculate the average earnings for each driver and order them by earnings in descending order.
select avg(earnings) as avg_earnings,driver_name
from drivers
group by driver_name 
order by avg_earnings desc;

#13.Retrieve rides with distances less than the average ride distance.
select * from rides;
select ride_distance
from rides
where ride_distance < (select avg(ride_distance) from rides);

#14.List the drivers who have completed the least number of rides.
select driver_name,driver_id,total_rides
from drivers
where total_rides = (select min(total_rides) from drivers);

#15.Calculate the average fare amount for rides taken by passengers who have taken at least 20 rides.
select round(avg(r.fare_amount),2),p.total_rides
from rides r
inner join passengers p 
on r.passenger_id = p.passenger_id
group by p.total_rides
having p.total_rides >= 20;	

#16.Identify the pickup location with the highest average fare amount.
select pickup_location,round(avg(fare_amount),2) as highest_fareamount
from rides
group by pickup_location 
order by highest_fareamount desc;

#17.Calculate the average rating of drivers who completed at least 100 rides.
select avg(rating),total_rides 
from drivers
where total_rides >= 100
group by total_rides;

#18.List the passengers who have taken rides from at least 5 different pickup locations.
select p.passenger_id,p.passenger_name ,count(distinct(r.pickup_location)) as pick
from passengers p 
inner join rides r 
on p.passenger_id = r.passenger_id
group by p.passenger_id,p.passenger_name
having count(distinct(r.pickup_location)) >= 5;

#19.Calculate the average fare amount for rides taken by passengers with ratings above 4.

select p.passenger_id ,p.passenger_name ,round(avg(r.fare_amount),2),p.rating
from passengers p inner join rides r 
on p.passenger_id = r.passenger_id
where p.rating > 4
group by p.rating,p.passenger_id ,p.passenger_name ;

select*from passengers;
select * from rides;

#20.Retrieve rides with the shortest ride duration in each pickup location.
select min(ride_duration),pickup_location
from rides
group by pickup_location 
order by min(ride_duration) asc;

#----------------------------------------- 

#1.List the drivers who have driven rides in all pickup locations.
select d.driver_name
from rides r 
inner join drivers d 
on r.ride_id = d.driver_id
group by d.driver_name
having  count(distinct r.pickup_location) = (
    select count(distinct pickup_location)
    from rides);

#2.Calculate the average fare amount for rides taken by passengers who have spent more than 300 in total.
select round(avg(r.fare_amount),2),p.passenger_id,p.passenger_name
from passengers p inner join rides r 
on p.passenger_id = r.passenger_id
group by p.passenger_id,p.passenger_name
having avg(r.fare_amount)> 300;

select*from passengers;

#3.List the bottom 5 drivers based on their average earnings.
select driver_name,avg(earnings) as ear
from drivers
group by driver_name 
order by ear asc
limit 5;

#4. Calculate the sum fare amount for rides taken by passengers who have taken rides in different payment methods.
select round(sum(r.fare_amount),2),p.passenger_id,p.passenger_name
from rides r 
inner join passengers p 
on r.passenger_id = p.passenger_id 
group by  p.passenger_id,p.passenger_name
having count(distinct r.payment_method) > 1;

#5.  Retrieve rides where the fare amount is significantly above the average fare amount
select ride_id, 
       fare_amount 
from ( 
  select avg(fare_amount) as avg_fare, 
         STDDEV(fare_amount) as std_dev 
  from rides 
) as stats, rides 
where fare_amount > ( 
  stats.avg_fare + 1 * stats.std_dev
);

#6.List the drivers who have completed rides on the same day they joined.
select distinct d.driver_id,
       d.driver_name,
       d.join_date,
       r.ride_timestamp
from drivers d
join rides r 
    on d.driver_id = r.driver_id
where date(d.join_date) = date(r.ride_timestamp);

#7. Calculate the average fare amount for rides taken by passengers who have taken rides in different payment methods.
select avg(fare_amount),passenger_id from rides 
group by passenger_id 
having count(distinct(payment_method ))>1;

#8.  Identify the pickup location with the highest percentage increase in average fare amount compared to the overall average fare.
select pickup_location,
          (
               avg(fare_amount) - (select avg(fare_amount) from rides)
          ) / (select avg(fare_amount) from rides) * 100 as Percentage_increase
from rides
group by pickup_location
order by percentage_increase desc
limit 1;

#9.Retrieve rides where the dropoff location is the same as the pickup location.
select ride_id from rides 
where dropoff_location =pickup_location ;

#10.Calculate the average rating of drivers who have driven rides with varying pickup locations
select avg(d.rating),d.driver_id from drivers d inner join rides r
on d.driver_id =r.driver_id
group by d.driver_id
having count(distinct(r.pickup_location))>1;





