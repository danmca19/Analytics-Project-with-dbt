-- Quick exploratory queries you can run with `dbt compile` or from your warehouse UI

-- 1) Monthly revenue
select
  date_trunc('month', order_date) as month,
  sum(line_revenue) as revenue
from {{ ref('fct_sales') }}
group by 1
order by 1;

-- 2) Top products by revenue
select
  product_id, product_name, category,
  sum(line_revenue) as revenue
from {{ ref('fct_sales') }}
group by 1,2,3
order by revenue desc
limit 10;

-- 3) AOV (average order value)
with orders as (
  select order_id, sum(line_revenue) as order_value
  from {{ ref('fct_sales') }}
  group by 1
)
select avg(order_value) as aov from orders;
