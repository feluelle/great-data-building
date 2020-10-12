with fct_all_actors as (

    select actor,
           uid
    from {{ ref('stg_imdb_movies__actors') }}

    union

    select actor,
           uid
    from {{ ref('stg_netflix_titles__actors') }}

), fct_top_10_actors as (

    select actor, count(actor) as total
    from {{ ref('fct_all_titles') }}
    left join fct_all_actors
    on fct_all_titles.uid = fct_all_actors.uid
    group by actor
    order by total desc
    limit 10

)

select *
from fct_top_10_actors