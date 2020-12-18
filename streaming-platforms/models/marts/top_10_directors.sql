with all_directors as (

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

), top_10_directors as (

    select director, count(director) as total
    from {{ ref('all_titles') }}
    left join all_directors
    on all_titles.uid = all_directors.uid
    group by director
    order by total desc
    limit 10

)

select *
from top_10_directors