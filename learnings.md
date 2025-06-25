## Prerequisite

- Basics of SQL
- Snowflake Data Warehouse
- Data Engineering

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
