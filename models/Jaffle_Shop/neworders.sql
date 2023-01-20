select * 
from {{ metrics.calculate(
    metric('new_orders'),
    grain='year',
    dimensions=['status']
) }}