{% snapshot prime_video_tv_shows_snapshot %}

{{
    config(
      unique_key='"S.no."',
    )
}}

select * from {{ source('prime_video', 'src_prime_video_tv_shows') }}

{% endsnapshot %}