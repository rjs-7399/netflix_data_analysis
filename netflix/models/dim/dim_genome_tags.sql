WITH src_tags AS (
    SELECT * FROM {{ ref('src_genome_tags') }}
)
SELECT
    tag_id,
    INITCAP(TRIP(tag)) AS tag_name
FROM src_tags