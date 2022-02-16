
# fails
# Ensure 'Trusted Microsoft Services' is enabled for Storage Account accessCheckov CKV_AZURE_36
# Ensure Storage logging is enabled for Queue service for read, write and delete requestsCheckov CKV_AZURE_33
# Ensure Storage Account is using the latest version of TLS encryptionCheckov CKV_AZURE_44
# Ensure that 'Secure transfer required' is set to 'Enabled'Checkov CKV_AZURE_3
# Ensure that Storage Accounts use customer-managed key for encryptionCheckov CKV2_AZURE_18
# Ensure storage for critical data are encrypted with Customer Managed KeyCheckov CKV2_AZURE_1
# todo check rule
resource "azurerm_storage_account" "fail" {
  name                = "storageaccountname"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
    bypass                     = ["Metrics"]
  }

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_account_network_rules" "test" {
  resource_group_name  = azurerm_resource_group.test.name
  storage_account_name = azurerm_storage_account.test.name

  default_action             = "Allow"
  ip_rules                   = ["127.0.0.1"]
  virtual_network_subnet_ids = [azurerm_subnet.test.id]
  bypass                     = ["Metrics"]
}
