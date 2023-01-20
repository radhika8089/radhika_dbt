{{ config (materialized='incremental',unique_key='ID') }}
select ID,ORderID,Paymentmethod,status,amount,created 
from
RAW.RAWSTRIPE.PAYMENTS where Paymentmethod in {{ var('paymeth') }}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where created > (select max(created) from {{ this }})

{% endif %}