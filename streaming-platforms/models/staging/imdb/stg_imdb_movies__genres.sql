with stg_imdb_movies as (

    select unnest(string_to_array(genres, ', ')) as genre,
           uid,
           title_id
    from {{ ref('stg_imdb_movies') }}
    group by genre, uid, title_id

)

select *
from stg_imdb_movies