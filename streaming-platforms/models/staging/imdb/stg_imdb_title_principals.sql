with stg_imdb_title_principals as (

    select imdb_title_id as title_id,
           "ordering",
           imdb_name_id as name_id,
           category,
           job,
           characters
    from {{ source('imdb', 'src_imdb_title_principals') }}

)

select *
from stg_imdb_title_principals