# fails
# Ensure that Public Access is disabled for Machine Learning Workspace CKV_AZURE_144
resource "azurerm_machine_learning_workspace" "ckv_unittest_fail" {
  name                          = "example-workspace"
  location                      = azurerm_resource_group.example.location
  resource_group_name           = azurerm_resource_group.example.name
  application_insights_id       = azurerm_application_insights.example.id
  key_vault_id                  = azurerm_key_vault.example.id
  storage_account_id            = azurerm_storage_account.example.id
  public_network_access_enabled = true

  identity {
    type = "SystemAssigned"
  }

  encryption {
    key_vault_id = azurerm_key_vault.example.id
    key_id       = azurerm_key_vault_key.example.id
  }
}
