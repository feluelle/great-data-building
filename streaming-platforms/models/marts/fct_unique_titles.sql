with fct_unique_titles as (

    select count(distinct title) as unique_titles
    from {{ ref('fct_all_titles') }}

)

select *
from fct_unique_titles