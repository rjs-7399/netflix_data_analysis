-- Set defaults
USE WAREHOUSE COMPUTE_WH;
USE DATABASE MOVIELENS;
USE SCHEMA RAW;

-- Create a Stage to load the data from AWS S3 bucket
CREATE STAGE netflixstage
URL ='s3://netflixdataset7399'
CREDENTIALS=(AWS_KEY_ID='snowflakenetflixuser7399' AWS_SECRET_KEY='snowflakenetflixuser7399')

