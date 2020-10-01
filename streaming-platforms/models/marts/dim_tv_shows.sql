select 'Netflix' as provider,
       title,
       directors,
       actors,
       countries,
       date_added,
       release_year,
       rating,
       regexp_replace(duration, '\D', '', 'g')::integer as seasons,
       categories,
       description,
       NULL as viewers_age,
       NULL as imdb_rating
from {{ ref('stg_netflix_titles') }}
where stg_netflix_titles."type" = 'TV Show'
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
       categories,
       NULL as description,
       viewers_age,
       imdb_rating
from {{ ref('stg_prime_video_tv_shows') }}