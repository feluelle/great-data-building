with stg_netflix_titles__tv_shows as (

    select *
    from {{ ref('stg_netflix_titles') }}
    where "type" = 'TV Show'

)

select *
from stg_netflix_titles__tv_shows