select distinct "type",
                count(*) over(partition by "type") * 100.0 / count(*) over() as percentage
from {{ ref('stg_netflix_titles') }}