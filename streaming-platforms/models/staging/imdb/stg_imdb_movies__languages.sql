with stg_imdb_movies__languages as (

    select unnest(string_to_array(languages, ', ')) as "language",
           title_id
    from {{ ref('stg_imdb_movies') }}
    group by "language", title_id

)

select *
from stg_imdb_movies__languages