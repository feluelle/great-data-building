with unique_titles as (

    select count(distinct title) as unique_titles
    from {{ ref('all_titles') }}

)

select *
from unique_titles