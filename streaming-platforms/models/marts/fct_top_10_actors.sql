with fct_top_10_actors as (

    select actor, count(actor) as total
    from {{ ref('stg_netflix_titles__actors') }}
    right join {{ ref('stg_netflix_titles') }}
    on stg_netflix_titles.show_id = stg_netflix_titles__actors.show_id
    group by actor
    order by total desc
    limit 10

)

select *
from fct_top_10_actors