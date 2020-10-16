{% snapshot mixed_movies_snapshot %}

{{
    config(
      unique_key='"ID"',
    )
}}

select * from {{ source('mixed', 'src_mixed_movies') }}

{% endsnapshot %}