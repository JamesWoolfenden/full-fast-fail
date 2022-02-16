# fails
# Ensure that key vault secrets have "content_type" setCheckov CKV_AZURE_114
# Ensure that the expiration date is set on all secretsCheckov CKV_AZURE_41
# todo contentype is set
resource "azurerm_key_vault_secret" "example" {
  name         = "secret-sauce"
  value        = "szechuan"
  key_vault_id = azurerm_key_vault.example.id
  # content_type =
  # expiration_date =
  tags = {
    environment = "Production"
  }
}
