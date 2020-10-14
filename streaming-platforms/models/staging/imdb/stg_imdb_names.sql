with stg_imdb_names as (

    select imdb_name_id as name_id,
           "name",
           birth_name,
           height as height_in_cm,
           bio,
           {{ clean_text("birth_details") }} as birth_details,
           nullif(date_of_birth, birth_details)::date as date_of_birth,
           {{ clean_text("place_of_birth") }} as place_of_birth,
           {{ clean_text("death_details") }} as death_details,
           nullif(date_of_death, death_details)::date as date_of_death,
           {{ clean_text("place_of_death") }} as place_of_death,
           {{ clean_text("reason_of_death") }} as reason_of_death,
           {{ clean_text("spouses_string") }} as spouses_string,
           spouses,
           divorces,
           spouses_with_children,
           children
    from {{ source('imdb', 'src_imdb_names') }}

)

select *
from stg_imdb_names