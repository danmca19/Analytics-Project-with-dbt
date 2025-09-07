with oi as (
  select * from {{ ref('stg_order_items') }}
), o as (
  select * from {{ ref('stg_orders') }}
), p as (
  select * from {{ ref('stg_products') }}
), c as (
  select * from {{ ref('stg_customers') }}
)
select
  oi.order_item_id,
  o.order_id,
  o.order_date,
  o.status as order_status,
  c.customer_id,
  p.product_id,
  p.category,
  p.product_name,
  oi.quantity,
  oi.unit_price,
  oi.total_price as line_revenue,
  p.cost * oi.quantity as line_cost,
  {{ safe_divide('oi.total_price - (p.cost * oi.quantity)', 'nullif(oi.total_price,0)') }} as line_margin_pct
from oi
join o on oi.order_id = o.order_id
join p on oi.product_id = p.product_id
join c on o.customer_id = c.customer_id
