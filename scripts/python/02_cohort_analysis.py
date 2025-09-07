# 02_cohort_analysis.py
# Build simple registration month x order month cohort heatmap dataset
import duckdb, pandas as pd
from pathlib import Path

db_path = Path(__file__).resolve().parents[2] / "warehouse" / "ecommerce.duckdb"
con = duckdb.connect(str(db_path))

sql = """
with orders as (
  select distinct order_id, customer_id, order_date
  from marts.fct_sales
),
first_order as (
  select customer_id, min(order_date) as first_order_date
  from orders group by 1
)
select
  date_trunc('month', f.first_order_date) as cohort,
  date_diff('month', date_trunc('month', f.first_order_date), date_trunc('month', o.order_date)) as period_number,
  count(distinct o.order_id) as orders_in_period
from first_order f
join orders o using (customer_id)
group by 1,2
order by 1,2;
"""

df = con.execute(sql).df()
print(df.head())
df.to_csv("cohort_table.csv", index=False)
print("Saved cohort_table.csv")
