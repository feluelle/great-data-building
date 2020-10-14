with pre__stg_prime_video_tv_shows as (

    select "S.no." as show_number,
           "Name of the show" as show_name,
           "Year of release" as release_year,
           "No of seasons available" as seasons,
           "Language" as "language",
           "Genre" as genres,
           "IMDb rating" as imdb_rating,
           "Age of viewers" as viewers_age
    from {{ source('prime_video', 'src_prime_video_tv_shows') }}

), stg_prime_video_tv_shows as (

    select {{ create_uid("show_name", "'TV Show'", "release_year", "seasons", "NULL") }} as uid,
           *
    from pre__stg_prime_video_tv_shows
)

select distinct on(uid) *
from stg_prime_video_tv_shows