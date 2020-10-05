with stg_imdb_movies as (

    select imdb_title_id as title_id,
           title,
           original_title,
           "year" as release_year,
           date_published,
           genre as genres,
           duration as duration_in_minutes,
           country as countries,
           "language" as languages,
           director as directors,
           writer as writers,
           production_company,
           actors,
           description,
           avg_vote,
           votes,
           budget,
           usa_gross_income,
           worlwide_gross_income as worldwide_gross_income,
           metascore,
           reviews_from_users,
           reviews_from_critics
    from {{ source('imdb', 'src_imdb_movies') }}

)

select *
from stg_imdb_movies