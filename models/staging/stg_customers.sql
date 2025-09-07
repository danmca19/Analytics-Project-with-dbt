with source as (
    select * from {{ ref('raw_customers') }}
),

renamed as (
    select
        customer_id,
        {{ initcap("first_name") }} as first_name,
        {{ initcap("last_name") }}  as last_name,
        {{ trim_lower("email") }} as email,
        {{ trim_lower("city") }} as city,
        {{ trim_upper("state") }} as state,
        {{ safe_cast("registration_date", "date") }} as registration_date
    from source
)

select * from renamed
