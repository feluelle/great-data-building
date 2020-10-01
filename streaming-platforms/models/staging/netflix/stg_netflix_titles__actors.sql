select unnest(string_to_array(actors, ', ')) as actor, show_id
from {{ ref('stg_netflix_titles') }}
group by actor, show_id