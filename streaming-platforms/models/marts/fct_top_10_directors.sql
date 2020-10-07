with fct_directors as (

    select director, count(director) as total
    from {{ ref('fct_all_titles') }}
    left join {{ ref('stg_imdb_movies__directors') }}
    on fct_all_titles.uid = stg_imdb_movies__directors.uid
    group by director

    union

    select director, count(director) as total
    from {{ ref('fct_all_titles') }}
    left join {{ ref('stg_netflix_titles__directors') }}
    on fct_all_titles.uid = stg_netflix_titles__directors.uid
    group by director

    union

    select director, count(director) as total
    from {{ ref('fct_all_titles') }}
    left join {{ ref('stg_mixed__directors') }}
    on fct_all_titles.uid = stg_mixed__directors.uid
    group by director

)

select director, sum(total) as total
from fct_directors
group by director
order by total desc
limit 10