with stg_netflix_titles__actors as (

    select unnest(string_to_array(actors, ', ')) as actor,
           uid
    from {{ ref('stg_netflix_titles') }}
    group by actor, uid

)

select *
from stg_netflix_titles__actors