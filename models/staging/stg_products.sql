with source as (
    select * from {{ ref('raw_products') }}
),

renamed as (
    select
        product_id,
        {{ trim_lower("product_name") }} as product_name,
        {{ trim_upper("category") }} as category,
        {{ safe_cast("price", "double") }} as price,
        {{ safe_cast("cost", "double") }} as cost
    from source
)

select * from renamed
