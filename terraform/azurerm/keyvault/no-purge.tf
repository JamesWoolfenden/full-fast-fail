

resource "azurerm_key_vault" "fail" {
  name                        = "examplekeyvault"
  location                    = azurerm_resource_group.fail.location
  enabled_for_disk_encryption = true
  purge_protection_enabled    = false
}
