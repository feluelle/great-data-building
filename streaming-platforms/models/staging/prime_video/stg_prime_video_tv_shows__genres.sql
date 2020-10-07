with stg_prime_video_tv_shows__genres as (

    select unnest(string_to_array(genres, ', ')) as genre,
           uid,
           show_number
    from {{ ref('stg_prime_video_tv_shows') }}
    group by genre, uid, show_number

)

select *
from stg_prime_video_tv_shows__genres