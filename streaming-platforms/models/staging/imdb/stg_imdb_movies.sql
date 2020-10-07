with stg_imdb_movies as (

    select md5(row(title, 'Movie', regexp_replace("year", '\D', '', 'g')::int)::text) as uid,
           imdb_title_id as title_id,
           title,
           original_title,
           regexp_replace("year", '\D', '', 'g')::int as release_year,
           regexp_replace(date_published, '\D', '', 'g') as date_published,
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