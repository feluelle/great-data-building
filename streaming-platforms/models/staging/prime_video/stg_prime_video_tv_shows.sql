with stg_prime_video_tv_shows as (

    select md5(row("Name of the show", 'TV Show', "Year of release")::text) as uid,
           "S.no." as show_number,
           "Name of the show" as show_name,
           "Year of release" as release_year,
           "No of seasons available" as seasons,
           "Language" as "language",
           "Genre" as genres,
           "IMDb rating" as imdb_rating,
           "Age of viewers" as viewers_age
    from {{ source('prime_video', 'src_prime_video_tv_shows') }}

)

select *
from stg_prime_video_tv_shows