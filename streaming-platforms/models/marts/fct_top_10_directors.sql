with fct_all_directors as (

    select uid,
           director
    from {{ ref('stg_imdb_movies__directors') }}

    union

    select uid,
           director
    from {{ ref('stg_netflix_titles__directors') }}

    union

    select uid,
           director
    from {{ ref('stg_mixed__directors') }}

), fct_top_10_directors as (

    select director, count(director) as total
    from {{ ref('fct_all_titles') }}
    left join fct_all_directors
    on fct_all_titles.uid = fct_all_directors.uid
    group by director
    order by total desc
    limit 10

)

select *
from fct_top_10_directors