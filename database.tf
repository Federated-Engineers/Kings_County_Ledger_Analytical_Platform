## Minimal
resource "snowflake_database" "test_database" {
  name = "ATLANTIS_DEMO_DATABASE"
}

resource "snowflake_database_role" "test_database_role" {
  database = snowflake_database.test_database.name
  name     = "test_database_role"
  comment  = "my database role"
}
