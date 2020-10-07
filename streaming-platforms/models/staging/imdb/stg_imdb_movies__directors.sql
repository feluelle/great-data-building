with stg_imdb_movies__directors as (

    select unnest(string_to_array(directors, ', ')) as director,
           uid,
           title_id
    from {{ ref('stg_imdb_movies') }}
    group by director, uid, title_id

)

select *
from stg_imdb_movies__directors