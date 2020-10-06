with stg_imdb_names as (

    select imdb_name_id as name_id,
           "name",
           birth_name,
           height as height_in_cm,
           bio,
           regexp_replace(birth_details, E'[\\n\\r ]+', ' ', 'g') as birth_details,
           nullif(date_of_birth, birth_details)::date as date_of_birth,
           regexp_replace(place_of_birth, E'[\\n\\r ]+', ' ', 'g') as place_of_birth,
           regexp_replace(death_details, E'[\\n\\r ]+', ' ', 'g') as death_details,
           nullif(date_of_death, death_details)::date as date_of_death,
           regexp_replace(place_of_death, E'[\\n\\r ]+', ' ', 'g') as place_of_death,
           regexp_replace(reason_of_death, E'[\\n\\r ]+', ' ', 'g') as reason_of_death,
           regexp_replace(spouses_string, E'[\\n\\r ]+', ' ', 'g') as spouses_string,
           spouses,
           divorces,
           spouses_with_children,
           children
    from {{ source('imdb', 'src_imdb_names') }}

)

select *
from stg_imdb_names