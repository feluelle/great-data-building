with fct_tv_shows_per_provider as (

    select 'Netflix' as provider,
           title,
           directors,
           actors,
           countries,
           date_added,
           release_year,
           rating,
           regexp_replace(duration, '\D', '', 'g')::integer as seasons,
           genres,
           description,
           NULL as viewers_age,
           NULL as imdb_rating
    from {{ ref('stg_netflix_titles') }}
    where "type" = 'TV Show'

    union

    select 'Prime Video' as provider,
           show_name as title,
           NULL as directors,
           NULL as actors,
           NULL as countries,
           NULL as date_added,
           release_year,
           NULL as rating,
           seasons,
           genres,
           NULL as description,
           viewers_age,
           imdb_rating
    from {{ ref('stg_prime_video_tv_shows') }}

    union

    select 'Hulu' as provider,
           title,
           directors,
           NULL as actors,
           countries,
           NULL as date_added,
           release_year,
           NULL as rating,
           NULL as seasons,
           genres,
           NULL as description,
           viewers_age,
           imdb_rating
    from {{ ref('stg_mixed') }}
    where hulu = 1

    union

    select 'Disney+' as provider,
           title,
           directors,
           NULL as actors,
           countries,
           NULL as date_added,
           release_year,
           NULL as rating,
           NULL as seasons,
           genres,
           NULL as description,
           viewers_age,
           imdb_rating
    from {{ ref('stg_mixed') }}
    where disney_plus = 1

    union

    select 'Netflix' as provider,
           title,
           directors,
           NULL as actors,
           countries,
           NULL as date_added,
           release_year,
           NULL as rating,
           NULL as seasons,
           genres,
           NULL as description,
           viewers_age,
           imdb_rating
    from {{ ref('stg_mixed') }}
    where netflix = 1

    union

    select 'Prime Video' as provider,
           title,
           directors,
           NULL as actors,
           countries,
           NULL as date_added,
           release_year,
           NULL as rating,
           NULL as seasons,
           genres,
           NULL as description,
           viewers_age,
           imdb_rating
    from {{ ref('stg_mixed') }}
    where prime_video = 1

)

select *
from fct_tv_shows_per_provider