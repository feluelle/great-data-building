select show_id,
       "type",
       title,
       director as directors,
       "cast" as actors,
       country as countries,
       to_date(date_added, 'MONTH DD, YYYY') as date_added,
       release_year,
       rating,
       duration,
       listed_in as categories,
       description
from {{ source('netflix', 'src_netflix_titles') }}