with this_years_added_tv_shows_to_netflix as (

    select *
    from {{ ref('stg_netflix_titles__tv_shows') }}
    where extract(year from date_added) = extract(year from current_date)

)

select *
from this_years_added_tv_shows_to_netflix