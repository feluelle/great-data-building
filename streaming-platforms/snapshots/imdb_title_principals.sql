{% snapshot imdb_title_principals_snapshot %}

{{
    config(
      unique_key='imdb_title_id',
    )
}}

select * from {{ source('imdb', 'src_imdb_title_principals') }}

{% endsnapshot %}