select category, count(category) as total
from {{ ref('stg_netflix_titles__categories') }}
right join {{ ref('stg_netflix_titles') }}
on stg_netflix_titles.show_id = stg_netflix_titles__categories.show_id
group by category
order by total desc
limit 10