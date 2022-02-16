# fails
# Ensure that key vault allows firewall rules settingsCheckov CKV_AZURE_109
# Ensure that key vault enables purge protectionCheckov CKV_AZURE_110
# Ensure the key vault is recoverableCheckov CKV_AZURE_42
# ensure azurerm_key_vault' is associated with 'azurerm_monitor_diagnostic_setting
resource "azurerm_key_vault" "fail" {
  name                        = "examplekeyvault"
  location                    = azurerm_resource_group.fail.location
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
}
