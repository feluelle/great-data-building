with pre__stg_imdb_movies as (

    select imdb_title_id as title_id,
           title,
           original_title,
           {{ extract_number_from_string("year") }}::int as release_year,
           {{ extract_number_from_string("date_published") }} as date_published,
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
    where director is not null  -- A director is essential for the uniqueness of a title

), stg_imdb_movies as (

    select {{ create_uid("original_title", "'Movie'", "release_year", "duration_in_minutes", "directors") }} as uid,
           *
    from pre__stg_imdb_movies

)

select distinct on(uid) *
from stg_imdb_movies