with pre__stg_netflix_titles as (

    select show_id,
           "type",
           title,
           director as directors,
           "cast" as actors,
           country as countries,
           to_date(date_added, 'MONTH DD, YYYY') as date_added,
           release_year,
           rating,
           {{ extract_number_from_string("duration") }}::int as duration,
           listed_in as genres,
           description
    from {{ source('netflix', 'src_netflix_titles') }}
    where director is not null  -- A director is essential for the uniqueness of a title

), stg_netflix_titles as (

    select {{ create_uid("title", "type", "release_year", "duration", "directors") }} as uid,
           *
    from pre__stg_netflix_titles

)

select distinct on(uid) *
from stg_netflix_titles