##Resource with all fields
resource "snowflake_warehouse" "test_warehouse" {
  name                                = "ATLANTIS_TEST_WAREHOUSE"
  warehouse_type                      = "STANDARD"
  warehouse_size                      = "X-SMALL"
}
