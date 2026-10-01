resource "snowflake_warehouse" "warehouse" {
  name           = "WAREHOUSE"
  warehouse_type = "STANDARD"
  warehouse_size = "MEDIUM"
  generation     = "2"
}