Create Database Top2000CF;
Use top2000CF;
select * from top2000cf;
select sum(sales) from top2000cf;

-- Question 2: Top 10 Companies
# Goal: Rank companies by Sales, Profit, or Market Value.

Select Name,country, sales
 from top2000cf
order by sales desc 
limit 10;

select Name, country, profit 
from top2000cf
order by profit desc limit 10;

select name, country, `market value` 
from top2000cf
order by `market value` desc 
limit 10;

-- Total and average metrics by country
Select country,
sum(sales) as Total_sales,
avg(sales) as Avg_sales,
sum(profit) as Total_profit,
avg(profit) as avg_profit,
sum(`market value`) as Total_market_value,
avg(`market value`) as avg_market_value
from top2000cf group by country 
order by Total_sales desc;

-- Aggregate data by region
select country, count(*) as Number_of_companies,
sum(sales) as Total_sales,
sum(profit) as Total_profit
from top2000cf
group by country order by Number_of_companies  desc;

-- Display all companies located in united states.
Select * from top2000cf where country = "United States" ;

-- Identify companies with zero or negative profit.
select name, country, sales, profit from top2000cf
where profit <=0;

-- Identify companies where market value is less than 20% of their Assests.
select name, country,`market value`, Assets from top2000cf
where (`market value`/Assets) <0.2;

-- find comapnies from china, india, or germany.
Select name,country,sales,profit from top2000cf
where country = "china" or country="india" or country="germany";

use top2000cf;

-- Count the number of companies in each Country.
select country,count(name) as country_name
from top2000cf 
group by country
order by country_name desc;


-- Determine the maximum Market Value of companies in each Country.
select country,max(`market value`) as max_market_value
from top2000cf 
group by country
order by max_market_value desc;

-- Group data by Country and calculate the total Assets and Profit.
select country, sum(assets) as Total_assets,
sum(profit) as Total_profit
from top2000cf
group by country
order by Total_assets desc;

-- Group by Country and calculate: Total Sales.
select country,sum(sales) as Total_sales
from top2000cf
group by country
order by Total_sales desc;

-- Group by Country and calculate: Total Profit, Average Profit
select country, sum(profit) as Total_profit,
avg(profit) as avg_profit
from top2000cf
group by country
order by Total_profit desc;

-- Calculate the average Profit-to-Sales Ratio for companies in each Country
select country, avg(profit/sales) as avg_profit_to_sales_ratio
from top2000cf
group by country
order by avg_profit_to_sales_ratio;

-- Group companies by Country and calculate:Total Market Value.Average Market Value.
select country, sum(`market value`) as Total_market_value,
avg(`market value`) as Avg_market_value
from top2000cf
group by country
order by total_market_value;