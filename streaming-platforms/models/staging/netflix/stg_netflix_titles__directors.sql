with stg_netflix_titles__directors as (

    select unnest(string_to_array(directors, ', ')) as director,
           uid,
           show_id
    from {{ ref('stg_netflix_titles') }}
    group by director, uid, show_id

)

select *
from stg_netflix_titles__directors