with pre__stg_mixed as (

    select "ID" as id,
           "Title" as title,
           "Year" as release_year,
           "Age" as viewers_age,
           "IMDb" as imdb_rating,
           "Rotten Tomatoes" as rotten_tomatoes_rating,
           "Netflix" as netflix,
           "Hulu" as hulu,
           "Prime Video" as prime_video,
           "Disney+" as disney_plus,
           "Type" as "type",
           "Directors" as directors,
           "Genres" as genres,
           "Country" as countries,
           "Language" as languages,
           "Runtime" as runtime
    from {{ source('mixed', 'src_mixed_movies') }}
    where "Directors" is not null  -- A director is essential for the uniqueness of a title

), stg_mixed as (

    select {{ create_uid("title", "'Unknown'", "release_year", "runtime", "directors") }} as uid,
           *
    from pre__stg_mixed

)

select distinct on(uid) *
from stg_mixed