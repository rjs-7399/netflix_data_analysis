-- Set defaults
USE WAREHOUSE COMPUTE_WH;
USE DATABASE MOVIELENS;
USE SCHEMA RAW;

-- Create the table to store the links data in bronze layer
CREATE OR REPLACE TABLE raw_links (
    movieId INTEGER,
    imdbId BIGINT,
    tmdbId INTEGER
);

-- COPY command to load the links data from AWS S3 bucket to bronxe layer
COPY INTO raw_links
FROM '@netflixstage/links.csv'
FILE_FORMAT = (TYPE='CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY= '"');