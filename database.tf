resource "snowflake_database" "kings_county_ledger_DB" {
  name         = "kings_county_ledger_DB"
  is_transient = false
  comment      = "Database for Kings County Ledger Analytical Platform"
}

resource "snowflake_schema" "bronze" {
  name     = "bronze"
  database = snowflake_database.kings_county_ledger_DB.name
}

resource "snowflake_schema" "silver" {
  name     = "silver"
  database = snowflake_database.kings_county_ledger_DB.name
}

resource "snowflake_schema" "gold" {
  name     = "gold"
  database = snowflake_database.kings_county_ledger_DB.name
}

resource "snowflake_file_format" "file_format" {
  name        = "json_format"
  database    = snowflake_database.kings_county_ledger_DB.name
  schema      = snowflake_schema.bronze.name
  format_type = "JSON"
}

resource "snowflake_storage_integration_aws" "aws_integration" {
  name                      = "aws_integration"
  enabled                   = true
  storage_provider          = "S3"
  storage_allowed_locations = ["s3://kings-county-raw-ingestion/raw/"]
  storage_aws_role_arn      = "arn:aws:iam::049417293525:role/kcl_snowflake_role"
}

resource "snowflake_stage" "bronze_stage" {
  name        = "BRONZE_STAGE"
  url         = "s3://kings-county-raw-ingestion/raw/"
  database    = snowflake_database.kings_county_ledger_DB.name
  schema      = snowflake_schema.bronze.name
  file_format = "FORMAT_NAME = ${snowflake_file_format.file_format.name}"
  storage_integration = snowflake_storage_integration_aws.aws_integration.name
}
