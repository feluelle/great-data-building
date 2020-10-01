select count(distinct title) as unique_titles
from {{ ref('stg_netflix_titles') }}