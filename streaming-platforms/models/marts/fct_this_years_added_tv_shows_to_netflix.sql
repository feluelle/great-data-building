with fct_this_years_added_tv_shows_to_netflix as (

    select *
    from {{ ref('dim_tv_shows') }}
    where extract(year from netflix_date_added) = extract(year from current_date)

)

select *
from fct_this_years_added_tv_shows_to_netflix