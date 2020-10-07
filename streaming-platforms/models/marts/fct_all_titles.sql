with fct_all_titles as (

    select title,
           'Movie' as "type",
           release_year
    from {{ ref('stg_imdb_movies') }}

    union

    select title,
           'Unknown' as "type",
           release_year
    from {{ ref('stg_mixed') }}

    union

    select title,
           "type",
           release_year
    from {{ ref('stg_netflix_titles') }}

    union

    select show_name as title,
           'TV Show' as "type",
           release_year
    from {{ ref('stg_prime_video_tv_shows') }}

)

select *
from fct_all_titles