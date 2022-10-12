#! /bin/bash
set -e

echo "Activating Python virtual environment ..."
source env/bin/activate

echo "Connecting dbt with database ..."
dbt debug --profiles-dir .

echo "Installing dbt dependencies ..."
dbt deps --profiles-dir .

echo "Compiling code ..."
dbt compile --profiles-dir .

echo "Loading CSV files on database ..."
dbt seed --profiles-dir .

echo "Running referrals models ..."
dbt run --profiles-dir .

echo "Testing referrals models ..."
dbt test --profiles-dir .

echo "Generating documentation for the models ..."
dbt docs generate --profiles-dir .

echo "Serving dbt documentatioon on localhost:8000 ..."
dbt docs serve --profiles-dir . --port 8000
