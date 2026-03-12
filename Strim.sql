use strime_platform;

show tables;

select * from show_information;

select * from viewership_data;

#Q1. Show Title, Platform, Revenue_Million
select s.Title,s.Platform,v.Revenue_Million
from show_information s
join 
viewership_data v
on s.Show_ID = v.Show_ID;

#Q2. Top 10 shows by Revenue
select s.Title,v.Revenue_Million
from show_information s
join 
viewership_data v
on s.Show_ID = v.Show_ID
order by v.Views_Millions desc 
limit 10;

#Q3. Total revenue per Genre
select round(sum(v.Revenue_Million),2),s.Genre
from show_information s
join 
viewership_data v
on s.Show_ID = v.Show_ID
group by s.Genre;

#Q4. Count shows released per year
select count(Title),Release_Year
from show_information
group by Release_Year;

#Q5. Platforms with total revenue > 800
select s.Platform,round(sum(v.Revenue_Million),2) as total_revenue
from show_information s
join 
viewership_data v
on s.Show_ID = v.Show_ID
group by s.Platform
having sum(v.Revenue_Million) > 800;

#Q6. Directors with more than 30 shows
select count(Title),Director
from show_information
group by Director 
having count(Title) > 30;

#Q7. Genres having more than 100 shows with their total revenue
select round(sum(v.Revenue_Million),2),s.Genre,count(s.Title)
from show_information s
join 
viewership_data v
on s.Show_ID = v.Show_ID
group by s.Genre 
having count(s.Title) > 100;

#Q8. Platforms where avg IMDB_Rating > 7.5 after 2015
select s.Platform,s.Release_Year,avg(v.IMDB_Rating)
from show_information s
join 
viewership_data v
on s.Show_ID = v.Show_ID
where s.Release_Year > 2015
group by s.Platform,s.Release_Year
having avg(v.IMDB_Rating) > 7.5 ;

#Q9. Directors with >10 shows on Netflix and their total revenue
select s.Director,count(s.Title),sum(v.Revenue_Million),s.Platform
from show_information s
join 
viewership_data v
on s.Show_ID = v.Show_ID
where s.Platform = "Netflix"
group by s.Director,s.Platform 
having count(s.Title) > 10 ;

#Q10. Genres where avg Views > 40 between 2010–2020
select s.Genre,round(avg(v.Views_Millions),2),s.Release_Year
from show_information s
join 
viewership_data v
on s.Show_ID = v.Show_ID
where s.Release_Year between "2010" and "2020"
group by s.Genre,s.Release_Year
having avg(v.Views_Millions) > 40;

