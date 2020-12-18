with all_actors as (

    select actor,
           uid
    from {{ ref('stg_imdb_movies__actors') }}

    union

    select actor,
           uid
    from {{ ref('stg_netflix_titles__actors') }}

), top_10_actors as (

    select actor, count(actor) as total
    from {{ ref('all_titles') }}
    left join all_actors
    on all_titles.uid = all_actors.uid
    group by actor
    order by total desc
    limit 10

)

select *
from top_10_actors