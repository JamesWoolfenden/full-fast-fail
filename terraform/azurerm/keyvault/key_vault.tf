# fails
# Ensure the key vault is recoverableCheckov CKV_AZURE_42
# Ensure that key vault enables purge protectionCheckov CKV_AZURE_110
# Ensure that key vault enables soft deleteCheckov CKV_AZURE_111
# Ensure that key vault allows firewall rules settingsCheckov CKV_AZURE_109
# todo check for pairing with azurerm_monitor_diagnostic_setting to enable auditing
resource "azurerm_key_vault" "fail" {
  name                        = "testvault"
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  soft_delete_enabled         = false
  # network_acls {
  #   default_action = "Deny"
  #   bypass         = "AzureServices"
  # }
}
