use gencafe;
select * from sales_data;

select * from promotion;
drop table promotion;

select * from promotion;
alter table promotion rename column `Success Rate (%)` to Success_Rate;

select * from promotion;

alter table promotion rename column `Success Rate (%)` to Success_Rate;
select * from promotion;

use gencafe;
with monthlysales as (
    select 
        DATE_FORMAT(`Date`, '%Y-%m') AS month,
        `Product`,
        avg (`Quantity Sold` * `Sale Price`) AS month_sales
    from sales_data
    group by DATE_FORMAT(`Date`, '%Y-%m'), `Product`
),
monthlysales_rankvalue as (
    select 
        month,
        Product,
        month_sales,
        rank() over (partition by month order by month_sales desc) as rankvalue
    from monthlysales
)
select * 
from monthlysales_rankvalue
where rankvalue = 1
order by month;

-- the relationship between sales performance and time of Day
select 
	`Time of Day`,
    Sum(`Quantity Sold`*`Sale Price`) as total_revenue,
    count(*) as transaction_count,
    avg(`Quantity Sold`*`Sale Price`) as avg_revenue
from sales_data
group by `Time of Day`
order by field(`Time of Day`, 'Morning', 'Afternoon', 'Evening', 'Night');

-- which region has the highest average success rate?
select
	`Region`,
    avg(Success_Rate) as avg_success_rate,
    avg (`Quantity Sold`*`Sale Price`) as avg_revenue
from sales_data sd
join promotion p
on
sd.`Region`=p.`Regions Targeted`
group by
	sd.`Region`
order by avg_success_rate desc
limit 4;