WITH ratings AS (
    SELECT DISTINCT user_id FROM {{ src('src_ratings') }}
),

tags AS (
    SELECT DISTINCT user_id FROM {{ src('src_tags') }}
)
SELECT DISTINCT user_id
FROM (
    SELECT * from ratings
    UNION
    SELECT * from tags
)