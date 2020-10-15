with fct_movies_from_usa as (

    select uid
    from {{ ref('stg_imdb_movies__countries') }}
    where country = 'USA'

    union

    select stg_netflix_titles__movies.uid
    from {{ ref('stg_netflix_titles__countries') }}
    right join {{ ref('stg_netflix_titles__movies') }}
    on stg_netflix_titles__countries.uid = stg_netflix_titles__movies.uid
    where country = 'United States'

)

select count(*) as total
from fct_movies_from_usa