with stg_mixed as (

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

)

select *
from stg_mixed