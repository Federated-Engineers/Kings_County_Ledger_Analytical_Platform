resource "snowflake_warehouse" "test_warehouse" {
  name           = "WAREHOUSE"
  warehouse_type = "STANDARD"
  warehouse_size = "SMALL"
  generation     = "2"
}