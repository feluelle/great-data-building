with fct_movies_from_usa as (

    select uid
    from {{ ref('stg_imdb_movies__countries') }}
    where country = 'USA'

    union

    select uid
    from {{ ref('stg_netflix_titles__countries') }}
    where country = 'United States'

)

select count(*) as total
from fct_movies_from_usa