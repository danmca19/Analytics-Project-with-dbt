with src as (
  select * from {{ ref('raw_orders') }}
)
select
  cast(order_id as integer)          as order_id,
  cast(customer_id as integer)       as customer_id,
  cast(order_date as date)           as order_date,
  lower(trim(status))                as status,
  cast(total_amount as decimal(18,2)) as total_amount
from src
