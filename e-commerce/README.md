# Analysis of E-commerce Sales and Orders

This repository is a playground project for testing and experimenting with dbt Cloud and BigQuery,
using public BigQuery data. Specifically, I worked with the Looker E-commerce dataset.

The goal was to explore and validate various dbt features in a controlled environment.

## Getting Started
### Prerequisites
1. Google BigQuery account with access to public datasets.
2. dbt Cloud account.

### Setup
1. **Clone this repository:**
```bash
git clone https://github.com/your_username/dbt-bigquery-playground.git
cd dbt-bigquery-playground
```

2. **Connect dbt Cloud to BigQuery:**
- Navigate to your dbt Cloud workspace.
- Add a BigQuery connection and configure access to the public datasets.

3. **Install dependencies:**
```bash
dbt deps
````

4. **Run dbt commands:**
```bash
dbt debug # test connection between the data platform and the dbt
dbt build # build and test the models
```

## Data Sources
This project uses the [Looker E-commerce dataset](https://console.cloud.google.com/marketplace/product/bigquery-public-data/thelook-ecommerce), a public dataset hosted on BigQuery. The dataset simulates e-commerce transactions and includes tables for:

- `distribution_centers` - Information about distribution centers.
- `events` - Information about user interaction on e-commerce website.
- `inventory_items` - Information about inventory items.
- `order_items` - Information about order items.
- `orders` -  Information about the orders.
- `products` - Information about the products.
- `users` -  Information about the customers.


## Data Models Structure

```plaintext
models/
├── staging/   # Staging models for raw data cleaning
├── marts/     # Final models for reporting (fact & dimension tables)
├── source.yml # Source configuration for Looker E-commerce dataset
```

### Staging models
Prepare and clean raw data from the Looker E-commerce dataset for downstream transformations.
- `stg_distribution_centers`
- `stg_events`
- `stg_inventory_items`
- `stg_order_items`
- `stg_orders`
- `stg_products`
- `stg_users`

### Marts models
Final transformations for creating facts and dimensions used for analytics.
- `dim_distribution_center`
- `dim_product`
- `dim_user`
- `dim_website_event`
- `fct_inventory_items`
- `fct_order_items`
- `fct_orders`

## Features Tested
In this project, the following dbt features were explored:

- ✅ **Native Unit Tests**: Schema and custom tests to validate data quality.
- ✅ **Test and Documentation Coverage**: Exploring dbt_meta_testing package to configure test and documentation coverage.
-
- ✅ **Data Contracts**: Enforcing schema compatibility to ensure robust pipelines.
- ✅ **Snapshots**: Using the `Check` strategy to track changes over time.
- ✅ **Semantic Models**: Exploring semantic layer functionality to define metrics and dimensions.


## Further Readings
- Unit tests: https://docs.getdbt.com/docs/build/unit-tests
- dbt Meta Testing: https://hub.getdbt.com/tnightengale/dbt_meta_testing/latest/
- dq_tools package: https://infinitelambda.com/dbt-data-quality-tests-implementation/
- Data Contracts: https://docs.getdbt.com/docs/collaborate/govern/model-contracts
- Snapshots: https://docs.getdbt.com/docs/build/snapshots
- Semantic Models: https://docs.getdbt.com/docs/build/semantic-models
