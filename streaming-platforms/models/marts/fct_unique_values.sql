with fct_unique_values as (

    select count(distinct title) as unique_titles
    from {{ ref('stg_netflix_titles') }}

)

select *
from fct_unique_values