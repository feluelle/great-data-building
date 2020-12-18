with titles_movie_and_tv_show as (

    select title
    from {{ ref('all_titles') }}
    where "type" != 'Unknown'
    group by title
    having count(title) > 1
    order by title asc

)

select *
from titles_movie_and_tv_show