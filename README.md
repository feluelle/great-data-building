# great-data-building

> ..with [dbt](https://www.getdbt.com/) :factory: & postgres :elephant:

## Projects

The projects are basically dbt projects which you usually create via `dbt init`.

### streaming-platforms

In here we are _analytics-engineering_ public data from streaming platforms like Netflix, Prime Video, and more with the 
source data collected from [kaggle](https://www.kaggle.com/).

## How to run a project

Follow all the steps below to successfully setup and **build great data**.

### Prerequisites

- docker
- docker-compose
- Python

### Database

First make sure to have the postgres database up & running:

`$ docker-compose up -d`

### DBT

To install dbt into a Python 3 environment of your choice, run:

`$ pip install dbt`

Then define the directory of the project you want to run:

`$ export PROJECT_DIR=$(pwd)/streaming-platforms`

Next download the data sets from kaggle to the projects `data` directory. You can find the names of the source csv 
files in the `seeds` section of the `dbt_project.yml`.

After you've downloaded the source data, you can load them into the database by running:

`$ dbt seed --profiles-dir $PROJECT_DIR --project-dir $PROJECT_DIR`

Finally you can generate the tables and/or views based of the `models`, run:

`$ dbt run --profiles-dir $PROJECT_DIR --project-dir $PROJECT_DIR`

To validate your data and schemas, run:

`$ dbt test --profiles-dir $PROJECT_DIR --project-dir $PROJECT_DIR`
