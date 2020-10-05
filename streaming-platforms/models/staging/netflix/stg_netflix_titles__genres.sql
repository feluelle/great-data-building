with stg_netflix_titles__genres as (

    select unnest(string_to_array(genres, ', ')) as genre,
           show_id
    from {{ ref('stg_netflix_titles') }}
    group by genre, show_id

)

select *
from stg_netflix_titles__genres