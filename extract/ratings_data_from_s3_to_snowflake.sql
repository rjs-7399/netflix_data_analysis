-- Set defaults
USE WAREHOUSE COMPUTE_WH;
USE DATABASE MOVIELENS;
USE SCHEMA RAW;

-- Create the table to store the ratings data in bronze layer
CREATE OR REPLACE TABLE raw_ratings (
    userId INT,
    movieId INT,
    rating FLOAT,
    timestamp BIGINT
);

-- COPY command to load the ratings data from AWS S3 bucket to bronze layer
COPY INTO raw_ratings
FROM '@netflixstage/ratings.csv'
FILE_FORMAT= (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');