select director, count(director) as total
from {{ ref('stg_netflix_titles__directors') }}
right join {{ ref('stg_netflix_titles') }}
on stg_netflix_titles.show_id = stg_netflix_titles__directors.show_id
group by director
order by total desc
limit 10