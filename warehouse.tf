resource "snowflake_warehouse" "warehouse" {
  name                                = "secure_production"
  warehouse_type                      = "STANDARD"
  warehouse_size                      = "MEDIUM"
  max_cluster_count                   = 2
  min_cluster_count                   = 1
  scaling_policy                      = "ECONOMY"
  auto_suspend                        = 120
  auto_resume                         = true
  initially_suspended                 = true
  comment                             = "Warehouse for Kings County Ledger Analytical Platform"
}
