# fails
# Ensure default network access rule for Storage Accounts is set to denyCheckov CKV_AZURE_35
resource "azurerm_storage_account_network_rules" "fail" {

  default_action             = "Allow"
  ip_rules                   = ["127.0.0.1"]
  virtual_network_subnet_ids = [azurerm_subnet.test.id]
  bypass                     = ["Metrics"]
}
