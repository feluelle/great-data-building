with fct_movies_from_usa as (

    select count(country) as total
    from {{ ref('dim_movies') }}
    left join {{ ref('stg_imdb_movies__countries') }}
    on dim_movies.imdb_title_id = stg_imdb_movies__countries.title_id and country = 'USA'

    union

    select count(country) as total
    from {{ ref('dim_movies') }}
    left join {{ ref('stg_netflix_titles__countries') }}
    on dim_movies.netflix_show_id = stg_netflix_titles__countries.show_id and country = 'United States'

)

select sum(total) as total
from fct_movies_from_usa