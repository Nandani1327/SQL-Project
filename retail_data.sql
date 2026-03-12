use Retail_data;

select * from customer_info2;

select * from sales_data;

#Show Customer_ID, Region, Sales_Amount
select s.customer_id,c.region,s.sales_amount
from 
customer_info2 c
join 
sales_data s
on c.Customer_ID = s.Customer_ID;

#Top 10 orders by Sales_Amount
select Sales_Amount,Order_ID
from sales_data
order by Sales_Amount desc
limit 10;

#Total revenue by Product_Category
select round(sum(sales_amount),2) as total_revenue,Product_category
from sales_data
group by Product_Category;

#Region-wise total revenue
select c.Region,sum(s.sales_amount)
from 
customer_info2 c
join 
sales_data s
on c.Customer_ID = s.Customer_ID
group by c.Region;

#Payment mode with highest average sales
select payment_mode,round(avg(sales_amount),2) as avg_sales
from sales_data
group by Payment_Mode 
order by avg_sales desc;

#Product category with highest return rate
select product_category,
avg(Returned="Yes")*100 as return_rate
from 
sales_data
group by product_category 
order by return_rate
desc;

#Year-wise total revenue
select c.Order_Date_Year,round(sum(s.sales_amount),2) as total_revenue
from 
customer_info2 c
join 
sales_data s
on c.Customer_ID = s.Customer_ID
group by c.Order_Date_Year;

#Customers with more than 3 orders
select customer_id,count(Quantity)
from 
sales_data
group by customer_id 
having  count(Quantity)  > 3;

#Average rating by Product_Category
select avg(customer_rating),product_category
from sales_data
group by Product_Category;

#Customers who never returned any product
SELECT distinct Customer_ID
FROM Sales_Data
where Customer_ID not in 
(select Customer_ID from sales_data 
where Returned = "Yes");
