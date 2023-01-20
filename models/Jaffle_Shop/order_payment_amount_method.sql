{% set paymentmethods = get_payment_methods() %}

select
orderid,
{% for paymentmethod in paymentmethods %}
sum(case when paymentmethod = '{{paymentmethod}}' then amount end) as {{paymentmethod}}_amount
{% if not loop.last %},{% endif %}
{% endfor %}
from {{ ref('stg_payments') }}
group by 1
