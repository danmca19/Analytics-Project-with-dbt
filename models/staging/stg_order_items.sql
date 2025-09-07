with src as (
  select * from {{ ref('raw_order_items') }}
)
select
  cast(order_item_id as integer)           as order_item_id,
  cast(order_id as integer)                as order_id,
  cast(product_id as integer)              as product_id,
  cast(quantity as integer)                as quantity,
  cast(unit_price as decimal(18,2))        as unit_price,
  coalesce(cast(total_price as decimal(18,2)), cast(quantity as decimal(18,2)) * cast(unit_price as decimal(18,2))) as total_price
from src
