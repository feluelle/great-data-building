with stg_mixed__countries as (

    select unnest(string_to_array(countries, ', ')) as country,
           uid,
           id
    from {{ ref('stg_mixed') }}
    group by country, uid, id

)

select *
from stg_mixed__countries