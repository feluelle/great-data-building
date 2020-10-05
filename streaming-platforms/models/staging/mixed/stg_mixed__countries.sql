with stg_mixed__countries as (

    select unnest(string_to_array(countries, ', ')) as country,
           id
    from {{ ref('stg_mixed') }}
    group by country, id

)

select *
from stg_mixed__countries