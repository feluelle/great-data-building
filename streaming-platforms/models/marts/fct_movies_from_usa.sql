select count(country) as total
from {{ ref('stg_imdb_movies__countries') }}
right join {{ ref('dim_movies') }}
on dim_movies.title_id = stg_imdb_movies__countries.title_id
where country = 'USA'