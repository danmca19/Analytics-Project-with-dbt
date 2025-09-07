{% macro deduplicate(relation, partition_by, order_by) -%}
-- relation: a ref/source, eg. ref('stg_orders')
-- partition_by: comma-separated columns (string) to deduplicate on
-- order_by: comma-separated columns (string) used to pick the "best" row (first wins)
with ranked as (
  select
    *,
    row_number() over (partition by {{ partition_by }} order by {{ order_by }}) as _rn
  from {{ relation }}
)
select * from ranked where _rn = 1
{%- endmacro %}
