with stg_netflix_titles as (

    select md5(row(title, "type", release_year)::text) as uid,
           show_id,
           "type",
           title,
           director as directors,
           "cast" as actors,
           country as countries,
           to_date(date_added, 'MONTH DD, YYYY') as date_added,
           release_year,
           rating,
           duration,
           listed_in as genres,
           description
    from {{ source('netflix', 'src_netflix_titles') }}

)

select *
from stg_netflix_titles