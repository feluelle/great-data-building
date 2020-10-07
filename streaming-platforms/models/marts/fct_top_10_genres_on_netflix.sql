with fct_top_10_genres_on_netflix as (

    select genre, count(genre) as total
    from {{ ref('stg_netflix_titles__genres') }}
    right join {{ ref('stg_netflix_titles') }}
    on stg_netflix_titles.show_id = stg_netflix_titles__genres.show_id
    group by genre
    order by total desc
    limit 10

)

select *
from fct_top_10_genres_on_netflix