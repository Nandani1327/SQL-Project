select * from custome;

select * from satisfaction;

#1.Retrieve all customers with their satisfaction information.
select * from 
custome c 
join 
satisfaction s 
on c.id=s.id;

#2.Show Gender, Age, and satisfaction of customers.
select c.gender,c.age,s.satisfaction
from 
custome c 
join 
satisfaction s 
on c.id=s.id;

#3.Count total number of customers.
select count(*) as total_customers
from custome;

#4.Find the average age of customers.
select avg(age) as avg_age
from
custome;

#5.Find the number of male and female customers.
select count(*) ,gender
from 
custome
group by gender;

#6.Count customers by travel class.
select count(*),class
from 
custome
group by class;

#7.Find customers whose flight distance is greater than 1000.
select count(*),flight_distance 
from 
custome
where flight_distance > 1000
group by Flight_Distance ;

#8.Find the average flight distance by class.
select avg(flight_distance) ,class
from 
custome
group by class;

#9.Count how many customers are satisfied vs not satisfied.
select count(*),satisfaction
from 
satisfaction
group by satisfaction ;

#10.Find customers with departure delay greater than 30 minutes.
select * from satisfaction;
select count(*) as count_of_customer,departure_delay_in_minutes
from 
satisfaction
where Departure_Delay_in_Minutes > 30
group by Departure_Delay_in_Minutes ;

#11.Find the average seat comfort rating.
select round(avg(seat_comfort),2) as avg_seat_comfort_rating
from 
satisfaction;

#12.Find the maximum flight distance.
select max(flight_distance) as max_distance
from 
custome;

#13.Retrieve customers with age greater than 50.
select id,age
from 
custome
where age > 50;

#14.Find customers who gave seat comfort rating greater than 4.
select id,seat_comfort
from 
satisfaction
where Seat_comfort > 4;

#15.Find average cleanliness rating.
select round(avg(cleanliness),2)
from 
satisfaction ;

#16.Count customers by type of travel.
select count(*) as customer,type_of_travel
from 
custome c 
group by c.Type_of_Travel ;

#17.Find customers whose online boarding rating is greater than 4.
select * from custome;
select id,online_boarding
from 
custome c 
where c.Online_boarding > 4;

#18.Find customers with arrival delay greater than average delay.
select * from satisfaction s ;
select id,arrival_delay_in_minutes
from 
satisfaction
where arrival_delay_in_minutes > (select avg(arrival_delay_in_minutes) from satisfaction );

#19.Find the average inflight service rating.
select round(avg(inflight_service) ,2)
from 
satisfaction s ;

#20.Find the top 5 customers with highest flight distance.
select id,flight_distance as hightest_flight_distance
from 
custome
order by hightest_flight_distance desc
limit 5;