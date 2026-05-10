resource "snowflake_warehouse" "analytics_wh" {
  name                = "CAR_SHOPPING_WH"
  warehouse_size      = "XSMALL"
  auto_suspend        = 60
  auto_resume         = true
  initially_suspended = true
}

resource "snowflake_database" "car_shopping_db" {
  name = "CAR_SHOPPING_ANALYTICS"
}

resource "snowflake_schema" "raw" {
  database = snowflake_database.car_shopping_db.name
  name     = "RAW"
}

resource "snowflake_schema" "staging" {
  database = snowflake_database.car_shopping_db.name
  name     = "STAGING"
}

resource "snowflake_schema" "marts" {
  database = snowflake_database.car_shopping_db.name
  name     = "MARTS"
}