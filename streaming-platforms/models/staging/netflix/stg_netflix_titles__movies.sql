with stg_netflix_titles__tv_shows as (

    select *
    from {{ ref('stg_netflix_titles') }}
    where "type" = 'Movie'

)

select *
from stg_netflix_titles__tv_shows