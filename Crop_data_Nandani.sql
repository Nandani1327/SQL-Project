select * from climate_agriculture;

select * from crop;

#1.Display total production for each state. Sort in descending order.
select round(sum(production),2),state
from 
crop
group by State 
order by sum(production) desc;

#2.Find average annual rainfall. 
select avg(annual_rainfall)  as avg_annual_rainfall
from 
climate_agriculture;

#3.Display crops with production greater than 50,000.
select distinct crop,production
from crop
where Production > 50000;

#4. Show total production and average rainfall for each crop.
select sum(c.production) as total_production, round(avg(ca.annual_rainfall),2) as avg_rainfall,c.crop
from 
climate_agriculture ca 
join 
crop c 
on ca.Record_ID =c.Record_ID 
group by c.Crop;

#5.Display states where total production is greater than 200000. 
select state,sum(production) as total_production
from 
crop
group by State 
having sum(production) > 200000;

#6.Find crops whose average production is higher than overall average production. 
select crop
from crop
group by crop
having avg(production) > (select avg(production) from crop);

#7.Display state-wise total production and average fertilizer usage. 
select c.state,sum(c.production) as total_production,round(avg(ca.fertilizer),2) as avg_fer
from 
climate_agriculture ca
join 
crop c 
on
ca.Record_ID = c.Record_ID 
group by c.state;

#8.Find the state with the highest total production.
select state,sum(production) as total_production
from 
crop
group by State 
order by sum(production) desc;

#9.Find crops grown where rainfall is above overall average rainfall.
select c.crop,ca.annual_rainfall
from 
climate_agriculture ca 
join 
crop c 
on ca.Record_ID = c.Record_ID 
where ca.Annual_Rainfall > (select avg(Annual_Rainfall) from climate_agriculture);

#10.Find states where the total production is greater than 200000 and 
#the average annual rainfall is greater than 800 mm. Display state, total 
#production, and average rainfall. Sort by total production in descending 
#order.
select c.state,sum(c.production) as total_product,avg(ca.annual_rainfall) as avg_annual_rainfall
from 
climate_agriculture ca 
join 
crop c 
on 
ca.Record_ID = c.Record_ID 
group by c.State 
having sum(c.Production) > 200000 and avg(ca.Annual_Rainfall) > 800
order by sum(c.production) desc;