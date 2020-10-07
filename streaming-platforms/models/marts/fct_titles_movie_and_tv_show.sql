with fct_titles_movie_and_tv_show as (

    select title
    from {{ ref('fct_all_titles') }}
    where "type" != 'Unknown'
    group by title
    having count(title) > 1
    order by title asc

)

select *
from fct_titles_movie_and_tv_show