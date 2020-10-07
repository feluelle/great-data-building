with stg_imdb_movies__countries as (

    select unnest(string_to_array(countries, ', ')) as country,
           uid,
           title_id
    from {{ ref('stg_imdb_movies') }}
    group by country, uid, title_id

)

select *
from stg_imdb_movies__countries