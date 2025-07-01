## Prerequisite

- Basics of SQL
- Snowflake Data Warehouse
- Data Engineering

## Things to explore

- Best way to load the data from s3 to snowflake in production grade systems.
- Explore these two things to load the data from external systems to snowflake warehouse: 
  - Snowflake stage
  - Storage integration

## Notes

- Here the main goal of this project is to learn DBT.
- DBT is entirely based on SQL.
- DBT actually works on serving layer.
- When we run the Extract and Load the data from multiple sources, that's where the DBT plays the major role.
- So DBT plays the role after transformation at the time of serving the data.

## What is DBT ?

- At its core, DBT is a transformation tool that allows us to write modular SQL queries to transform raw data into analytics-ready data models.
- Transformations means we apply some logic on the data we got. 
- Like we apply renaming on column, we reformat the date structure, we remove the NULL values, etc.
- All of these operations are called as a transformations.
- Till now, we are doing ETL which means we are extracting data from multiple sources, applying transformations on it and ingesting quality data into multiple sinks as per the business needs.
- So DBT gives us the flexibility to write the modular SQL queries, we can divide the SQL queries into different chunks based on use-cases and build the data model.
- It is a smaller pipeline inside the transformation step itself which makes the data ready for the analytics.
- In short, it is basically a SQL pipeline tool. We can write transformation code directly on top of data warehouse and directly start analysing the data.
- So it removes the manual layer of transformation in ETL and, we can move to ELT.
- DBT doesn't extract or load data; it focuses extensively on the transformation steps in ELT process.

## Flow Diagram of DBT

- For performing any data engineering operation we are using the data platforms.
- Like in the data platforms we take the data from multiple sources, we use the medallion architecture, we ingest the quality data into analytical layer for BI/ML teams.
- Here we use snowflake, databricks, Bigquery, Redshift as a data platforms.
- DBT sits on top of the data warehouses or the data platforms on the serving side.
- Here serving means when we are done with all the extraction and transformations we load the final quality data into the gold layer.
- So DBT sits on top of the gold layer data. In this case we load our entire data to gold layer in data warehouse after the extraction.
- So here our entire data is available in the data warehouse. So DBT will connect to all of our data warehouses such as snowflake or bigquery or redshift and performs all of these operations on top of it.
- So first the raw data is directly available in as it is form in the data warehouse. Then we can develop, Test & Document, Deploy our entire transformation pipeline on DBT.
- So here is the brief of all these steps:
  - First we can develop the pipeline.
  - Then DBT allows us to test the code, also it automatically generates the documentation based on the code that we have written, so we don't need to write it manually.
  - We can deploy the pipeline so that it can automatically run.
- At the final step, we have the quality data generated so, we can connect it to any dashboard like power BI or provide it to ML model.
- Here we need to keep one thing in mind that we can extract the data from multiple sources, keep it in the data warehouse and, then it is responsibility of DBT to develop the modular SQL to perform the transformation.

## DBT overview

- Whatever we see above is a high-level overview of DBT.
- Now DBT sits on the top of data warehouse means we can set up the connection between data warehouse and DBT.
- So we can set up the data loader which loads the data into raw layer of data warehouse.
- We can set up the connector between data warehouse and DBT so that we can consume the data form raw layer from data warehouse to DBT for processing.
- Now DBT has various detailed steps like keeping the snapshot of data, transform, test, deploy, document, version control, alerting and logging.
- After doing all of these steps we can generate the quality data which is transformed data and use that data in serving layer.

## Data Engineering Lifecycle

- Generation: We generate the data from multiple sources like API, webapp, OLTP systems and consume it in our system.
- Ingestion: After getting the data from multiple data sources, we create the Raw/Staging layer to keep as it is copy of the data from source and ingest the data in it.
- Transformation: We create the silver layer where we perform the data quality checks and minor transformations on the data from bronze layer.
- Serving: We create the gold layer where we keep the quality data which we can serve to multiple systems like to train the ML model or to BI team or to Data Analytics team.
- Storage: For all these three layers, ingestion, transformation, serving we need the storage system which can store the data efficiently and optimally. So we use the data warehouse.
- Under the hood of every data application, we use these things:
  - Security
  - Data management
  - DataOps
  - Data architecture (Model)
  - Orchestration
  - Software engineering (SOLID principles)

### Notes: 

- You can visit the dream-11 data platform architecture to see the tech stack they have used in their platform.
- The dream-11 data platform is following the architecture that we have mentioned above in the data engineering lifecycle.

## Where does the DBT fit?

- DBT works mainly with Data warehouses.
- Data Engineering lifecycle works on the platforms following ETL.
- DBT mainly works on the pattern following ELT.
- Here the question is we have to transform the data before loading it. Because we receive the data from multiple source system in a different format. So how we can directly load it in our warehouse without converting it in a proper format.
- In DBT we consider the multiple sources systems to receive the data in a different format. We store that data into data lake i.e. S3. Then in DBT we use seed file which will take the data from datalake and load it in the raw layer of warehouse like snowflake.
- In ETL system we first extract the data from multiple systems then we perform the transformations using multiple steps like batch processing, near real time in structured streaming and actual real time in flink. After that we load the quality data in gold layer.
- Here the power of DBT is, it solves the entire problem of transformation within it. So we don't need to setup multiple pipelines to solve the problem.
- Here we need only one tool to handle the transformation process and we can directly serve the quality data to stakeholders.

## Why DBT?

- The question is if entire ETL process is working fine and the architecture is scalable then why do we even need DBT ?
- Before DBT, data transformation work was often done through:
  - SQL scripts: Manually maintained, often with no version control.
  - ETL tools: Complex and expensive tools that required specialized knowledge.
  - Custom Code: Python with pandas, Pyspark, Scala were used to transform data.
- Issues:
  - Maintainability
  - Lack of testing
  - Poor documentation
  - Dependency management
  - Collaboration difficulties
- Like in some projects we were used to write the stored procedures in SQL. Now if we want to add or remove new column in particular layer of our project then we need to manually modify all the SPs and if something misses then entire workflow will fail.
- Also in ETL, we write the sql code in pyspark so if we want to add some new columns in the silver layer from some source then we need to manually modify the code, test the entire workflow if it runs successfully then we need to run the backfill dag to reprocess the data.
- Even version control was not managed properly in both the cases.
- And to manage the entire project, we need to set up the proper team of developers who are experts in certain domain. So there are collaboration and dependency issues.

## Benefits of DBT

- Modularity: Break down the complex transformations into managable pieces.
- Reusability: Create and reuse common SQL patterns across the project.
- Testing framework: Built-in testing capabilities to ensure data quality.
- Documenatation generation: Automatically generates documentation for the data models.
- Dependency management: Automatically handle the order of model execution.
- Development workflow: Support for development environments separate from production.

## Fundamentals for DBT

- Data warehouses: It is a central repository designed for storing and analyzing large volumes of structured data from various sources.
- Data Lake: It is a storage repository that holds a vast amount of raw data in its native format until it's needed.
- Data Lakehouse: It is relatively new architecture that combines the best elements of adta warehouses and data lakes.
- Previously all of these data warehouse require structured data only. Now the modern data warehouses such as snowflake, bigquery they can handle any type of data like structured, non-structured, semi-structured.
- So with the data warehouses having these capabilities the tools Like DBT is so powerful to manage the things seamlessly.
- So here we need to set up the tools in our architecture based on the needs. 
- Like when the client wants to perform adhoc analysis then we can directly use the amazon athena on top of the data came in s3 bucket. So let's say today client wants only 3 columns from the data came in s3, but tomorrow client might need 4 columns so we don't need to change our transformation logic. But we can just use athena where we can do these things easily.

## Data Source

- We will be using movie-lens dataset. [Link](https://grouplens.org/datasets/movielens/20m/)
- To understand the data, go through this readme [Link](https://files.grouplens.org/datasets/movielens/ml-20m-README.html)
- Rating Data File Structure:
  - Schema: userId, movieId, rating, timestamp
  - Rating: range(0.5, 5)
  - timestamp: UTC
- Tags Data File Structure:
  - Schema: userId, movieId, tag, timestamp
  - Tag: single word or short phrase showing the feedback of movie provided by user.
  - Timestamp: UTC
- Movie Data File Structure:
  - Schema: movieId, title, genres
  - title: Shows movie title, it might contain inconsistency in name.
  - genres: pipe-separated list.
- Links Data File Structure:
  - Schema: movieId, imdbId, tmdbId
  - movieId: Identifier for particular movie in movie-lens dataset.
  - imdbId: Identifier for particular movie used in imdb.
  - tmdbId: Identifier for particular movie used in the movie DB.
- Tag Genome:
  - Here genome contains tag relevance scores for movies.
  - The genome is split in two files: genome-scores.csv & genome-tags.csv.
  - genome-scores.csv Schema: movieId, tagId, relevance
  - genome-tags.csv Schema: tagId, tag
  - The tagId values are generated when the dataset is exported, so they may vary from version to version of the MovieLens dataset.

## Loading data from local to snowflake

- There are few ways:
  - We can manually create a table in snowflake warehouse and load the data from local to snowflake.
  - We can copy the files from local to AWS s3 using aws cp command.
  - We can set up the airflow dag which loads the data from local to s3 bucket.
- In the production grade systems we receive the data from multiple source systems.
- So we use the data lake to keep all the data from multiple source systems in as it is format.
- Then we ingest the data from s3 bucket to our bronze layer but here we take care of structure of the data.
- So in production grade systems we have to setup a DAG which will have a daily trigger to load the data from multiple source system.
- But for our project purpose we will just load all the files directly to the S3 using AWS CLI command.

## Creating a role with specific access in snowflake

- Now we have created the `instructions.sql` script which contains following steps:
    - create the admin and transform role
    - create the warehouse
    - create the dbt user
    - create the database and schema for movie-lens
    - grant the permissions to transform role
      - data warehouse, database, schema, future schema, tables, future tables
- Till now we created a role that has a customize access and a user that has a permission to go through that role.
- So in case our creadentials get leaked, the hacker will have limited access to the snowflake account.

## Loading data from s3 to snowflake bronze layer

- There are multiple ways to connect with s3 from snowflake:
  - Snowflake stage: We can create a stage to load the data from external system to snowflake data warehouse.
  - Snowflake storage integration: This is more secured way to do the same. Here we don't need to integrate internal permission to access the data.
- Here we will go with the snowflake stage which requires aws access key and id.
- So we will create the user in aws and add the key and id in the snowflake stage sql command.
- Here we will give s3FullAccess with attach policy directly in aws.
- So this will create `snowflakenetflixuser7399` in AWS IAM.
- Now to get the access key we need to click on the user > security credentials > Local code.
- So extract folder contains all the sql scripts required to load the data from AWS s3 to snowflake bronze.

## DBT setup

- You can refer to this (Link)[https://notes.datavidhya.com/]
- There are two main ways to install and set up the DBT.
  - DBT Cloud: A web-based service that provides a development environment, job scheduler, and documentation hosting.
  - DBT Core: The open-source command-line version that you can run locally or on your servers.
- Commands that I ran for initiallizing DBT
  - pip install -r requirements.txt
  - mkdir ~/.dbt
  - dbt init netflix
  - cat ~/.dbt/profiles.yml
    netflix:
    outputs:
      dev:
        account: LKNNSSN-MZ10071
        database: MOVIELENS
        password: dbtPassword123
        role: TRANSFORM
        schema: RAW
        threads: 1
        type: snowflake
        user: dbt
        warehouse: COMPUTE_WH
    target: dev
- This was the first configuration and connection with the snowflake from any DBT project.
- To work on any DBT project we must need to do this setup in the beginning. This will setup the connection.

## DBT Models

- What are DBT models ?
  - DBT models are SQL select statement that transform your data.
  - Each model:
    - Is defined in .sql file
    - Contains a single SELECT statement
    - Produces a table or view in your data warehouse
    - Can reference other models, creating a dependency graph
  - Models are the core building blocks of DBT project and represent the transformations applied to your data.

- Running first DBT model
  - Here we have established the connection from dbt local to the snowflake cloud.
  - So whatever the model we run from local, it will be executed on the snowflake cloud.
  - So here we are first interacting with RAW and STAGING.
  - RAW bucket contains as it is copy of the data came from multiple source systems.
  - Now we will perform minimum transformation on the data came in RAW layer and copy it to the STAGING.
  - Once you create the dbt model under models/staging/src_movies.sql.
  - You need to run the sql with command: dbt run
  - This will execute the sql script on snowflake and create the view named as src_movies.