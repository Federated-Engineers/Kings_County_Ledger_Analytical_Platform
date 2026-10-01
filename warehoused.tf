resource "snowflake_warehouse" "warehouse" {
  name           = "WAREHOUSE"
  warehouse_type = "STANDARD"
  warehouse_size = "SMALL"
  generation     = "2"
}