from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    "owner": "farnaz",
}

with DAG(
    dag_id="car_shopping_pipeline",
    start_date=datetime(2026, 5, 10),
    schedule="@daily",
    catchup=False,
    default_args=default_args,
    tags=["dbt", "snowflake", "analytics"],
) as dag:

    run_staging = BashOperator(
        task_id="run_staging_models",
        bash_command="""
        cd ~/car-shopping-data-platform/dbt/car_shopping_analytics && \
        source ~/car-shopping-data-platform/.venv/bin/activate && \
        dbt run --select staging
        """
    )

    run_marts = BashOperator(
        task_id="run_mart_models",
        bash_command="""
        cd ~/car-shopping-data-platform/dbt/car_shopping_analytics && \
        source ~/car-shopping-data-platform/.venv/bin/activate && \
        dbt run --select marts
        """
    )

    run_tests = BashOperator(
        task_id="run_dbt_tests",
        bash_command="""
        cd ~/car-shopping-data-platform/dbt/car_shopping_analytics && \
        source ~/car-shopping-data-platform/.venv/bin/activate && \
        dbt test
        """
    )

    run_staging >> run_marts >> run_tests