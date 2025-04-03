

--select sum(total_price) as Total_Revenue from pizza_sales 

--select sum(total_price) / count(distinct order_id) as Avg_order from pizza_sales

--select sum(quantity) as Total_Pizza_Sold from pizza_sales

--select count(distinct order_id) as Total_order from pizza_sales

--select cast(cast(sum(quantity) as decimal(10,2)) / 
--cast(count(distinct order_id) as decimal(10, 2)) as decimal(10,2)) as Avg_Pizza_Per_Order from pizza_sales


--Daily Trend
--select Datename(DW, order_date) as order_day, count(distinct order_id) as total_orders
--from pizza_sales
--group by Datename(DW, order_date)

--Hourly Trend
--select Datepart(HOUR, order_time) as order_hours, count(distinct order_id) as total_orders
--from pizza_sales
--group by Datepart(HOUR, order_time)
--order by Datepart(HOUR, order_time)

--select * from pizza_sales

--select pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100 /
--(select sum(total_price) from pizza_sales where MONTH(order_date) = 1) as PCT
--from pizza_sales
--where MONTH(order_date) = 1
--group by pizza_category


--select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price) * 100 /
--(select sum(total_price) from pizza_sales where Datepart(quarter, order_date) = 1) as decimal(10, 2)) as PCT
--from pizza_sales
--where Datepart(quarter, order_date) = 1
--group by pizza_size


select top 5 pizza_name, sum(quantity) as Total_Pizza_Sold
from pizza_sales
group by pizza_name
order by Total_Pizza_Sold ASC