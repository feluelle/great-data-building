{% snapshot netflix_titles_snapshot %}

{{
    config(
      unique_key='show_id',
    )
}}

select * from {{ source('netflix', 'src_netflix_titles') }}

{% endsnapshot %}