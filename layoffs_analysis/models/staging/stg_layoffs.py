import pandas as pd


def model(dbt, session):
    dbt.config(materialized="table")
    layoffs: pd.DataFrame = dbt.ref("layoffs")

    layoffs.columns = layoffs.columns.str.upper()

    return layoffs
