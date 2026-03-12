use Ecommer_data;

show tables;

select * from  customer_info1;
select * from  transaction_data;

#Q1. Show Customer_ID, City, Total_Amount
select c.Customer_ID,c.city,t.total_amount
from customer_info c
join 
transaction_data t
on c.Customer_ID=t.customer_id;

#Q2. Top 10 Customers by Total Spending
select sum(total_amount)as Total_spending,Customer_ID 
from transaction_data
group by customer_id 
order by total_spending  desc 
limit 10;

#Q3. Total Revenue by Product_Category
select sum(Total_Amount) ,product_category
from  
transaction_data 
group by Product_Category;

#Q4. Membership type having total revenue > 500000
select c.Membership_Type,round(sum(t.Total_Amount),2)
from
customer_info1 c
join 
transaction_data t
on c.Customer_ID = t.Customer_ID
group by c.Membership_Type
having sum(t.Total_Amount) > 500000;

#Q5. Cities where average rating > 4.2
select c.City,avg(t.Rating) as avg_rating
from
customer_info1 c
join 
transaction_data t
on c.Customer_ID = t.Customer_ID
group by c.City
having avg_rating > 4.2;

#Q6. Product category with highest return rate
select product_category,
avg(Returned ="Yes")*100 as return_rate
from transaction_data
group by Product_Category 
order by return_rate desc;

#Q7. Customers who purchased more than 3 quantity in single order
select customer_id,Quantity
from transaction_data
where Quantity > 3;

#Q8. Average delivery time by Payment_Method
select avg(Delivery_Time_Days) as delivery_time,Payment_Method
from transaction_data
group by Payment_Method;

#Q9. Signup year wise total revenue
select c.Signup_Year,round(sum(t.Total_Amount),2)
from
customer_info1 c
join 
transaction_data t
on c.Customer_ID = t.Customer_ID
group by c.Signup_Year;

#Q10. Find customers who never returned any product
select customer_id,returned
from transaction_data
where Returned = "No";
