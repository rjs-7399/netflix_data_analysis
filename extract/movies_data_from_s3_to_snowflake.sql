-- Set defaults
USE WAREHOUSE COMPUTE_WH;
USE DATABASE MOVIELENS;
USE SCHEMA RAW;

-- Create a Stage to load the data from AWS S3 bucket
CREATE STAGE netflixstage
URL ='s3://netflixdataset7399'
CREDENTIALS=(AWS_KEY_ID='snowflakenetflixuser7399' AWS_SECRET_KEY='snowflakenetflixuser7399')

-- Create the table to store the movies data in bronze layer
CREATE OR REPLACE TABLE raw_movies (
    movieId INTEGER,
    title STRING,
    genres STRING
)

-- COPY command to load the data from AWS S3 bucket to bronze layer
COPY INTO raw_movies
FROM '@netflixstage/movies.csv'
FILE_FORMAT= (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

select count(*) from raw_movies;