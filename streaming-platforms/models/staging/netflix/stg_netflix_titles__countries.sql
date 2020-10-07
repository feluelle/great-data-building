with stg_netflix_titles__countries as (

    select unnest(string_to_array(countries, ', ')) as country,
           uid,
           show_id
    from {{ ref('stg_netflix_titles') }}
    group by country, uid, show_id

)

select *
from stg_netflix_titles__countries