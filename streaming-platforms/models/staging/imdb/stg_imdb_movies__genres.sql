with stg_imdb_movies as (

    select unnest(string_to_array(genres, ', ')) as genre,
           title_id
    from {{ ref('stg_imdb_movies') }}
    group by genre, title_id

)

select *
from stg_imdb_movies