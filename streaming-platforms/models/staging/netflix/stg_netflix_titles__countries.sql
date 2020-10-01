select unnest(string_to_array(countries, ', ')) as country, show_id
from {{ ref('stg_netflix_titles') }}
group by country, show_id