select unnest(string_to_array(categories, ', ')) as category, show_id
from {{ ref('stg_netflix_titles') }}
group by category, show_id