   {{ config(materialized='table' ,schema='test') }}
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        {{ dbt_utils.generate_surrogate_key(['order_id','customer_id']) }} as hashkey,
        status
       

    from raw.jaffle_shop.orders
   
    