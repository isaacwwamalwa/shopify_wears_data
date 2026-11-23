
# Shopify Wears Data Analytics

## Project Overview

This project demonstrates an end-to-end e-commerce analytics pipeline built using synthetic Shopify apparel store data.

The objective is to transform raw Shopify data into structured, tested, and documented analytical models that support business reporting across sales, products, customers, order statuses, and inventory.

The project also demonstrates practical dbt engineering practices, including incremental models, snapshots, reusable macros, data tests, source freshness monitoring, and analytical data marts.

## Technology Stack

- **Shopify:** Source e-commerce platform and development store.
- **Fivetran:** Data ingestion from Shopify into BigQuery.
- **Google BigQuery:** Cloud data warehouse.
- **dbt Cloud:** Data transformation, testing, documentation, and snapshot management.
- **dbt Charts:** Analytical dashboards and reporting.

## Data Pipeline

Shopify → Fivetran → BigQuery → dbt Cloud → Analytical Data Marts → dbt Charts

## Analytical Models

The project produces five analytical marts:

1. **Daily Sales:** Order counts, recorded order value, discounts, and recorded refunds by date and currency.
2. **Product Performance:** Product-level order activity, units sold, sales values, and discounts.
3. **Customer Performance:** Customer order frequency, lifetime recorded spend, average order value, and purchasing dates.
4. **Order Status:** Order counts and recorded order values grouped by financial and fulfillment statuses.
5. **Inventory Performance:** Available, on-hand, committed, incoming, damaged, and reserved inventory quantities by item and location.

## dbt Engineering Features

- **Staging Models:** Standardize raw Shopify source data.
- **Fact and Dimension Models:** Establish analytical foundations for reporting.
- **Incremental Processing:** `fct_orders` uses a merge strategy with `order_updated_at` and a three-day lookback window.
- **Snapshots:** `snap_shopify_products` tracks changes to product attributes using a timestamp strategy.
- **Reusable Macros:** `safe_divide` and `convert_to_date` standardize common SQL transformations.
- **Data Quality Tests:** Uniqueness, not-null, and relationship tests.
- **Documentation:** Model and column descriptions.
- **Source Freshness:** Monitors the latest Fivetran sync timestamp for the Shopify order source.

## Reporting

The project includes an executive Shopify analytics dashboard built using dbt Charts.

Dashboard:
https://dbtcharts.com/hercops/shopify-wears-data/d/executive_shopify_analytics

## Dataset Limitations

The project uses synthetic development-store data with limited historical coverage.

- The available sample contains orders from one observed sales date, so it does not support meaningful multi-day sales trend analysis.
- The dataset does not contain actual refund transaction records.
- No discount activity was recorded in the sample.
- A dedicated shipping charge or shipping method source was not available.
- Recorded order value should not be interpreted as net revenue or cash collected.
- Source freshness depends on the latest successful Fivetran synchronization.

These limitations are documented to distinguish observed data from assumptions and avoid overstating business performance.

## Project Status

The analytical models, data quality tests, reusable macros, incremental order processing, product snapshot, and source freshness configuration have been implemented and validated.

