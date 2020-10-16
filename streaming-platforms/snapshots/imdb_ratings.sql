{% snapshot imdb_ratings_snapshot %}

{{
    config(
      unique_key='imdb_title_id',
    )
}}

select * from {{ source('imdb', 'src_imdb_ratings') }}

{% endsnapshot %}