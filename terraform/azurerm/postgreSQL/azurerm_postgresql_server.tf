
# fails
# Ensure that PostgreSQL server enables infrastructure encryptionCheckov CKV_AZURE_130
# Ensure that PostgreSQL server disables public network accessCheckov CKV_AZURE_68
# Ensure that PostgreSQL server enables Threat detection policyCheckov CKV_AZURE_128
# Ensure that PostgreSQL server enables geo-redundant backupsCheckov CKV_AZURE_102
resource "azurerm_postgresql_server" "fails" {
  name                = "dbserver"
  location            = "usgovvirginia"
  resource_group_name = azurerm_resource_group.jira_rg.name

  sku_name   = "GP_Gen5_4"
  version    = "9.6"
  storage_mb = 640000

  backup_retention_days             = var.jira_postgre_data_retention
  auto_grow_enabled                 = true
  geo_redundant_backup_enabled      = false
  administrator_login               = var.mp_db_username
  administrator_login_password      = azurerm_key_vault_secret.db_pswd.value
  infrastructure_encryption_enabled = false
  ssl_enforcement_enabled           = false
  public_network_access_enabled     = true

  threat_detection_policy {
    enabled = false
  }

  tags = local.postgresqlserver_tags
}
