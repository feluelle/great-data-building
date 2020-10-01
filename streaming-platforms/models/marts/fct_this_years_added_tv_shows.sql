select *
from {{ ref('dim_tv_shows') }}
where extract(year from date_added) = extract(year from current_date)