# 01_exploratory_analysis.py
# Simple EDA on the dbt-built DuckDB mart
import duckdb
import pandas as pd
from pathlib import Path

db_path = Path(__file__).resolve().parents[2] / "warehouse" / "ecommerce.duckdb"
con = duckdb.connect(str(db_path))

monthly = con.execute("""
    select date_trunc('month', order_date) as month, sum(line_revenue) as revenue
    from marts.fct_sales
    group by 1 order by 1
""").df()
print(monthly.head())

top_products = con.execute("""
    select product_id, product_name, category, sum(line_revenue) as revenue
    from marts.fct_sales group by 1,2,3 order by revenue desc limit 10
""").df()
print(top_products)
