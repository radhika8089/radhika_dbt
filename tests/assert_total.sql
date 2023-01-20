select orderid ,sum(Amount) as TotalAmount
from {{ ref('stg_payments')}} group by orderid having not( TotalAmount >=0  )