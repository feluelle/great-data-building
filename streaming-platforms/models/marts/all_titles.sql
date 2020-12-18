with all_titles as (

    select uid,
           title,
           'Movie' as "type",
           release_year
    from {{ ref('stg_imdb_movies') }}

    union

    select uid,
           title,
           'Unknown' as "type",
           release_year
    from {{ ref('stg_mixed') }}

    union

    select uid,
           title,
           "type",
           release_year
    from {{ ref('stg_netflix_titles') }}

    union

    select uid,
           show_name as title,
           'TV Show' as "type",
           release_year
    from {{ ref('stg_prime_video_tv_shows') }}

)

select *
from all_titles