{% snapshot orders_snapshot %}

{{
    config(
      target_database='analytics',
      target_schema='snapshots_Data',
      unique_key='id',
      strategy='check',
      updated_at='order_date',
      check_cols='all'
    )
}}

select * from RAW.JAFFLE_SHOP.ORDERS

{% endsnapshot %}