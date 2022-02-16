# fails
# Ensure that key vault key is backed by HSMCheckov CKV_AZURE_112
# Ensure that the expiration date is set on all keysCheckov CKV_AZURE_40
resource "azurerm_key_vault_key" "fail" {
  name         = "generated-certificate"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
  # expiration_date =
}
