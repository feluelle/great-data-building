with type_percentage as (

    select distinct "type",
                    round(count(*) over(partition by "type") * 100.0 / count(*) over(), 2) as percentage
    from {{ ref('all_titles') }}

)

select *
from type_percentage