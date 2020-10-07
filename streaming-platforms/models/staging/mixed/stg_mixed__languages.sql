with stg_mixed__languages as (

    select unnest(string_to_array(languages, ', ')) as "language",
           uid,
           id
    from {{ ref('stg_mixed') }}
    group by "language", uid, id

)

select *
from stg_mixed__languages