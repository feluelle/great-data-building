with fct_type_percentage as (

    select distinct "type",
                    count(*) over(partition by "type") * 100.0 / count(*) over() as percentage
    from {{ ref('fct_all_titles') }}

)

select *
from fct_type_percentage