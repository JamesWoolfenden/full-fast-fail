

resource "azurerm_key_vault_secret" "fail" {
  name         = "secret-sauce"
  value        = "szechuan"
  key_vault_id = azurerm_key_vault.example.id
}
