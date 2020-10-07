with stg_imdb_movies__languages as (

    select unnest(string_to_array(languages, ', ')) as "language",
           uid,
           title_id
    from {{ ref('stg_imdb_movies') }}
    group by "language", uid, title_id

)

select *
from stg_imdb_movies__languages