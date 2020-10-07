with stg_imdb_movies__actors as (

    select unnest(string_to_array(actors, ', ')) as actor,
           uid,
           title_id
    from {{ ref('stg_imdb_movies') }}
    group by actor, uid, title_id

)

select *
from stg_imdb_movies__actors