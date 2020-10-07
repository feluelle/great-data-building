with stg_imdb_title_principals__characters as (

    select replace(unnest(string_to_array(regexp_replace(characters, '[[\]]', '', 'g'), '","')), '"', '') as "character",
           title_id,
           name_id
    from {{ ref('stg_imdb_title_principals') }}

)

select *
from stg_imdb_title_principals__characters