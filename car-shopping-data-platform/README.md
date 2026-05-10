# Car Shopping Data Platform

End-to-end modern ELT and analytics engineering project for an online car shopping platform.

## Tech Stack

- Terraform for infrastructure as code
- AWS S3 for raw data storage
- Snowflake for cloud data warehouse
- Fivetran for ingestion
- dbt for analytics engineering and transformations
- Airflow for orchestration
- GitHub Actions for CI/CD
- Looker for dashboards

## Business Goal

Analyze the online car shopping journey, including vehicle listings, pricing trends, dealer inventory, regional demand, and marketplace performance.

## Architecture

Raw vehicle listings data flows into Snowflake, is transformed using dbt, orchestrated with Airflow, tested through GitHub Actions, and visualized in Looker.
