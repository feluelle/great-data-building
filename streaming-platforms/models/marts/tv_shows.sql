with tv_shows as (

    select stg_netflix_titles__tv_shows.show_id as netflix_show_id,
           stg_netflix_titles__tv_shows.title as netflix_title,
           stg_netflix_titles__tv_shows.directors as netflix_directors,
           stg_netflix_titles__tv_shows.actors as netflix_actors,
           stg_netflix_titles__tv_shows.countries as netflix_countries,
           stg_netflix_titles__tv_shows.date_added as netflix_date_added,
           stg_netflix_titles__tv_shows.release_year as netflix_release_year,
           stg_netflix_titles__tv_shows.rating as netflix_rating,
           stg_netflix_titles__tv_shows.duration as netflix_seasons,
           stg_netflix_titles__tv_shows.genres as netflix_genres,
           stg_netflix_titles__tv_shows.description as netflix_description,
           stg_prime_video_tv_shows.show_number as prime_video_show_number,
           stg_prime_video_tv_shows.show_name as prime_video_show_name,
           stg_prime_video_tv_shows.release_year as prime_video_release_year,
           stg_prime_video_tv_shows.seasons as prime_video_seasons,
           stg_prime_video_tv_shows.language as prime_video_language,
           stg_prime_video_tv_shows.genres as prime_video_genres,
           stg_prime_video_tv_shows.imdb_rating as imdb_rating,
           stg_prime_video_tv_shows.viewers_age as prime_video_viewers_age
    from {{ ref('stg_netflix_titles__tv_shows') }}
    full join {{ ref('stg_prime_video_tv_shows') }}
    on stg_netflix_titles__tv_shows.uid = stg_prime_video_tv_shows.uid

)

select *
from tv_shows