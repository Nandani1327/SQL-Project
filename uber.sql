use uber_assignment;
show tables;
select * from rides;
select * from drivers;
select * from passengers;

#Basic level:
#1.  What are & how many unique pickup locations are there in the dataset?
select distinct (pickup_location) from rides;

select count(distinct(pickup_location)) from rides;

#2.What is the total number of rides in the dataset?
select count(ride_id) from rides;

#3. Calculate the average ride duration.
select avg(ride_duration) from rides;

#4.List the top 5 drivers based on their total earnings.
select driver_name,earnings from drivers order by earnings  desc limit 5;

#5.Calculate the total number of rides for each payment method.
select count(ride_id) , payment_method from rides group by payment_method;

#6.Retrieve rides with a fare amount greater than 20.
select * from rides where fare_amount > 20;

#7. Identify the most common pickup location.
select pickup_location , count(ride_id) from rides group by pickup_location order by pickup_location desc limit 1;

#8.Calculate the average fare amount.
select avg(fare_amount) from rides;

#9.List the top 10 drivers with the highest average ratings.
select driver_name,avg(rating) as high_rating from drivers group by driver_name order by high_rating desc limit 10;

#10.Calculate the total earnings for all drivers.
select sum(earnings) from drivers;

select * from rides;
select * from drivers;
select * from passengers;

#11. How many rides were paid using the "Cash" payment method?
select count(*) from rides where payment_method="cash";

#12.Calculate the number of rides & average ride distance for rides originating from the 'Dhanbad' pickup location.
select pickup_location ,count(ride_id),avg(ride_distance) from rides where pickup_location ="dhanbad";

#13.Retrieve rides with a ride duration less than 10 minutes.
select * from rides where ride_duration < 10;

#14.List the passengers who have taken the most number of rides.
select passenger_name,max(total_rides) rides from passengers group by passenger_name order by rides desc limit 1;

#15. Calculate the total number of rides for each driver in descending order.
select driver_name,count(*) ride_count from drivers group by driver_name order by ride_count desc;
select driver_id,count(*) ride_count from drivers group by driver_id order by ride_count desc;

#16.Identify the payment methods used by passengers who took rides from the 'Gandhinagar' pickup location.
select rides.payment_method,passengers.passenger_name,rides.pickup_location from rides join passengers on
rides.passenger_id = passengers.passenger_id where rides.pickup_location="gandhinagar"; 

#17.Calculate the average fare amount for rides with a ride distance greater than 10.
select avg(fare_amount),ride_distance from rides where ride_distance > 10 group by ride_distance;

#18.List the drivers in descending order according to their total number of rides.
select sum(total_rides) rides,driver_name from drivers group by driver_name order by rides desc;

# ERROR :19.Calculate the percentage distribution of rides for each pickup location.
SELECT pickup_location, COUNT(*) AS ride_count, ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM rides rc), 2) AS percentage 
FROM rides rc 
GROUP BY pickup_location       
order by percentage desc;

#20.Retrieve rides where both pickup and dropoff locations are the same.
select ride_id,pickup_location,dropoff_location from rides where pickup_location = dropoff_location ;

select * from rides;
select * from drivers;
select * from passengers;

#Intermediate Level:
#1.List the passengers who have taken rides from at least 300 different pickup locations.
select passenger_id, count(distinct(pickup_location)) as location from rides group by passenger_id having 
location >= 300;   

#2.Calculate the average fare amount for rides taken on weekdays.
select avg(fare_amount) from rides where DAYOFWEEK(STR_TO_DATE(ride_timestamp , '%m/%d/%Y %H:%i'))>5; 

#3.Identify the drivers who have taken rides with distances greater than 19.
select * from drivers;
select * from rides;
select rides.ride_distance , drivers.driver_name from rides join drivers on rides.driver_id = drivers.driver_id
where rides.ride_distance > 19;

#4.Calculate the total earnings for drivers who have completed more than 100 rides.
select  total_rides , sum(earnings) total_earnings from drivers where total_rides > 100 group by total_rides
order by total_rides asc;

SELECT driver_id, SUM(earnings) AS total_earnings
FROM drivers 
WHERE driver_id IN (SELECT driver_id FROM rides GROUP BY driver_id HAVING COUNT(*) > 100)
GROUP BY driver_id;

#5.Retrieve rides where the fare amount is less than the average fare amount.
select * from rides where fare_amount < (select avg(fare_amount) from rides);

#6. Calculate the average rating of drivers who have driven rides with both 'Credit Card' and 'Cash' payment methods.
select driver_id, avg(rating) as avg_rating from drivers where driver_id in (select driver_id from 
rides where payment_method in ("cash","credit card")
group by driver_id HAVING COUNT(DISTINCT payment_method) = 2) group by driver_id;

#7. List the top 3 passengers with the highest total spending.
select * from passengers;
select * from passengers where total_spent = (select max(total_spent) from passengers limit 3);

SELECT p.passenger_id, p.passenger_name, SUM(r.fare_amount) AS total_spending
FROM passengers p
JOIN Rides r ON p.passenger_id = r.passenger_id
GROUP BY p.passenger_id, p.passenger_name
ORDER BY total_spending DESC
LIMIT 3;

#8.Calculate the average fare amount for rides taken during different months of the year.
select * from rides;
select month(STR_TO_DATE(ride_timestamp , '%m/%d/%Y %H:%i')) monthyear, avg(fare_amount) as 
avg_fare from rides group by monthyear ;

#9.Identify the most common pair of pickup and dropoff locations.
select pickup_location, dropoff_location from rides where pickup_location = dropoff_location;

SELECT pickup_location, dropoff_location, COUNT(*) AS ride_count
FROM rides rc
GROUP BY pickup_location, dropoff_location;

#10.Calculate the total earnings for each driver and order them by earnings in descending order.
select * from drivers;
select driver_name, sum(earnings) total_earnings from drivers group by driver_name order by total_earnings desc;

#11. List the passengers who have taken rides on their signup date.
select * from passengers;
select * from rides;

select  passengers.passenger_id  , passengers.passenger_name from rides join passengers 
on rides.passenger_id = passengers.passenger_id
where date(passengers.signup_date)= date(rides.ride_timestamp);

#12.Calculate the average earnings for each driver and order them by earnings in descending order.
select driver_name, avg(earnings) avg_earnings from drivers group by driver_name order by avg_earnings desc;

#13.Retrieve rides with distances less than the average ride distance.
select avg(ride_distance) from rides;
select ride_id ,avg(ride_distance)  from rides where  ride_distance < (select avg(ride_distance) from rides)
group by ride_id;

#14.List the drivers who have completed the least number of rides.
select driver_name,count(driver_id) ride_count from drivers group by driver_name order by ride_count asc;

#15. Calculate the average fare amount for rides taken by passengers who have taken at least 20 rides.
select avg(rides.fare_amount),passengers.passenger_name from rides join passengers 
on rides.passenger_id = passengers.passenger_id where passengers.total_rides < 20 
group by passengers.passenger_name;

#16. Identify the pickup location with the highest average fare amount.
select pickup_location ,avg(fare_amount) as avg_fare from rides group by pickup_location order by avg_fare desc;

#17.Calculate the average rating of drivers who completed at least 100 rides.
select avg(rating) as avg_rating ,driver_name from drivers where total_rides >= 100 group by driver_name ;
select * from drivers;

#18. List the passengers who have taken rides from at least 5 different pickup locations.
select passenger_id,count(distinct (pickup_location)) as different_location from rides
group by passenger_id having different_location >= 300;

#19.Calculate the average fare amount for rides taken by passengers with ratings above 4.
select * from passengers;
SELECT AVG(fare_amount) FROM rides WHERE passenger_id in
(SELECT passenger_id FROM passengers WHERE rating > 4);

#20.Retrieve rides with the shortest ride duration in each pickup location.
select * from rides;
select pickup_location,ride_duration from rides order by ride_duration asc;

#ADVANCE
#1.List the drivers who have driven rides in all pickup locations.
select driver_id from drivers where driver_id not in (
select distinct driver_id from rides where pickup_location not in 
(select distinct pickup_location from rides rdc));

#2.  Calculate the average fare amount for rides taken by passengers who have spent more than 300 in total.
select * from rides;
select * from drivers;
select * from passengers;
select avg(rides.fare_amount) avg_fare , passengers.total_spent from rides join passengers 
on rides.passenger_id = passengers.passenger_id where
 passengers.total_spent > 300 group by passengers.total_spent;

#3.  List the bottom 5 drivers based on their average earnings.
select avg(earnings) avg_earnings, driver_name from drivers group by driver_name order by 
avg_earnings desc limit 5;

#4. ERROR Calculate the sum fare amount for rides taken by passengers who have taken rides in different payment methods.
SELECT SUM(fare_amount)
FROM rides 
WHERE passenger_id IN (SELECT passenger_id FROM rides GROUP BY passenger_id
HAVING COUNT(DISTINCT payment_method) > 1
);

#5.  Retrieve rides where the fare amount is significantly above the average fare amount.
SELECT *FROM rides WHERE fare_amount > (SELECT AVG(fare_amount) from rides);

#6.ERROR  List the drivers who have completed rides on the same day they joined.
SELECT dc.driver_id, dc.driver_name FROM drivers dc JOIN rides rdc on
dc.driver_id = rdc.driver_id WHERE dc.join_date = rdc.ride_timestamp;

#7.Calculate the average fare amount for rides taken by passengers who have taken rides in different payment methods.
SELECT AVG(fare_amount) FROM rides WHERE passenger_id IN (SELECT passenger_id FROM 
rides GROUP BY passenger_id
    HAVING COUNT(DISTINCT payment_method) > 1);

#8.Identify the pickup location with the highest percentage increase in average fare amount compared to the overall average fare.
SELECT pickup_location, AVG(fare_amount) AS avg_fare,
(AVG(fare_amount) - (SELECT AVG(fare_amount) from rides)) * 100.0 / (SELECT AVG(fare_amount) FROM rides)
AS percentage_increase
FROM rides GROUP BY pickup_location ORDER BY percentage_increase desc;

#9.Retrieve rides where the dropoff location is the same as the pickup location.
SELECT * FROM rides WHERE pickup_location = dropoff_location;

#10. Calculate the average rating of drivers who have driven rides with varying pickup locations.
SELECT AVG(rating) FROM drivers WHERE driver_id IN (SELECT DISTINCT driver_id FROM rides 
GROUP BY driver_id HAVING COUNT(DISTINCT pickup_location) > 1);