with fct_actors as (

    select actor, count(actor) as total
    from {{ ref('fct_all_titles') }}
    left join {{ ref('stg_imdb_movies__actors') }}
    on fct_all_titles.uid = stg_imdb_movies__actors.uid
    group by actor

    union

    select actor, count(actor) as total
    from {{ ref('fct_all_titles') }}
    left join {{ ref('stg_netflix_titles__actors') }}
    on fct_all_titles.uid = stg_netflix_titles__actors.uid
    group by actor

)

select actor, sum(total) as total
from fct_actors
group by actor
order by total desc
limit 10