with fct_type_percentage as (

    select distinct "type",
                    round(count(*) over(partition by "type") * 100.0 / count(*) over(), 2) as percentage
    from {{ ref('fct_all_titles') }}

)

select *
from fct_type_percentage