

resource "azurerm_key_vault" "fail" {
  name                        = "examplekeyvault"
  location                    = azurerm_resource_group.fail.location
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
}
