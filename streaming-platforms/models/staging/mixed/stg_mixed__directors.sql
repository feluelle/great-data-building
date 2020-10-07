with stg_mixed__directors as (

    select unnest(string_to_array(directors, ', ')) as director,
           uid,
           id
    from {{ ref('stg_mixed') }}
    group by director, uid, id

)

select *
from stg_mixed__directors