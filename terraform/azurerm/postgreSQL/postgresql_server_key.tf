# fails
# CKV2_AZURE_17: "Ensure that PostgreSQL server enables customer-managed key for encryption"

resource "azurerm_postgresql_server_key" "not_ok" {
  server_id        = azurerm_postgresql_server.example.id
  key_vault_key_id = azurerm_key_vault_key.example.id
}
