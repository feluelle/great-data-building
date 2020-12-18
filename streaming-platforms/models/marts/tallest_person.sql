with tallest_person as (

    select name,
           height_in_cm
    from {{ ref('stg_imdb_names') }}
    where height_in_cm is not null
    order by height_in_cm desc
    limit 1

)

select *
from tallest_person