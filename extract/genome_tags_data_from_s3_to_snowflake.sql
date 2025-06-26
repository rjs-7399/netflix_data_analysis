-- Set defaults
USE WAREHOUSE COMPUTE_WH;
USE DATABASE MOVIELENS;
USE SCHEMA RAW;


-- Create the table to store the genome tags data in bronze layer
CREATE OR REPLACE TABLE raw_genome_tags (
    tagId INTEGER,
    tag STRING
);

-- COPY command to load the genome tag data from AWS S3 bucket to bronze layer
COPY INTO raw_genome_tags
FROM '@netflixstage/genome-tags.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');