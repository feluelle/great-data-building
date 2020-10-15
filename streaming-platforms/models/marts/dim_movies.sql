with dim_movies as (

    select stg_imdb_movies.title_id as imdb_title_id,
           stg_imdb_movies.title as imdb_title,
           stg_imdb_movies.release_year as imdb_release_year,
           stg_imdb_movies.date_published as imdb_date_published,
           stg_imdb_movies.genres as imdb_genres,
           stg_imdb_movies.duration_in_minutes as imdb_duration_in_minutes,
           stg_imdb_movies.countries as imdb_countries,
           stg_imdb_movies.languages as imdb_languages,
           stg_imdb_movies.directors as imdb_directors,
           stg_imdb_movies.writers as imdb_writers,
           stg_imdb_movies.production_company as imdb_production_company,
           stg_imdb_movies.actors as imdb_actors,
           stg_imdb_movies.description as imdb_description,
           stg_imdb_movies.avg_vote as imdb_avg_vote,
           stg_imdb_movies.votes as imdb_votes,
           stg_imdb_movies.budget as imdb_budget,
           stg_imdb_movies.usa_gross_income as imdb_usa_gross_income,
           stg_imdb_movies.worldwide_gross_income as imdb_worldwide_gross_income,
           stg_imdb_movies.metascore as imdb_metascore,
           stg_imdb_movies.reviews_from_users as imdb_reviews_from_users,
           stg_imdb_movies.reviews_from_critics as imdb_reviews_from_critics,
           stg_netflix_titles__movies.show_id as netflix_show_id,
           stg_netflix_titles__movies.title as netflix_title,
           stg_netflix_titles__movies.directors as netflix_directors,
           stg_netflix_titles__movies.actors as netflix_actors,
           stg_netflix_titles__movies.countries as netflix_countries,
           stg_netflix_titles__movies.date_added as netflix_date_added,
           stg_netflix_titles__movies.release_year as netflix_release_year,
           stg_netflix_titles__movies.rating as netflix_rating,
           stg_netflix_titles__movies.duration as netflix_duration,
           stg_netflix_titles__movies.genres as netflix_genres,
           stg_netflix_titles__movies.description as netflix_description
    from {{ ref('stg_imdb_movies') }}
    full join {{ ref('stg_netflix_titles__movies') }}
    on stg_imdb_movies.uid = stg_netflix_titles__movies.uid

)

select *
from dim_movies