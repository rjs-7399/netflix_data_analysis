-- Set defaults
USE WAREHOUSE COMPUTE_WH;
USE DATABASE MOVIELENS;
USE SCHEMA RAW;

-- Create the table to store the tags data in bronze layer
CREATE OR REPLACE TABLE raw_tags (
    userId INTEGER,
    movieId INTEGER,
    tag STRING,
    timestamp BIGINT
);

-- COPY command to load the tags data from AWS S3 bucket to bronze layer
COPY INTO raw_tags
FROM '@netflixstage/tags.csv'
FILE_FORMAT= (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"')
ON_ERROR = 'CONTINUE';