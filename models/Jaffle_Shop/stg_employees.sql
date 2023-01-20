{{ config (materialized='incremental' ,unique_key='EmpID' ) }}
select EmpID,LastName,FirstName,Title,HireDate,Office,Extension,ReportsTo,YearSalary 
from
RAW.JAFFLE_SHOP.EMPLOYEES

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where created > (select max(HireDate) from {{ this }})

{% endif %}