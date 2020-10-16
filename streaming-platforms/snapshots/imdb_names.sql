{% snapshot imdb_names_snapshot %}

{{
    config(
      unique_key='imdb_name_id',
    )
}}

select * from {{ source('imdb', 'src_imdb_names') }}

{% endsnapshot %}