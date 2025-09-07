with base as (
  select * from {{ ref('stg_customers') }}
)
select
  customer_id,
  first_name,
  last_name,
  email,
  city,
  state,
  registration_date,
  -- example attributes
  date_diff('day', registration_date, current_date) as days_since_registration
from base
