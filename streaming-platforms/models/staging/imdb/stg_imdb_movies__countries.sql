select unnest(string_to_array(countries, ', ')) as country, title_id
from {{ ref('stg_imdb_movies') }}
group by country, title_id