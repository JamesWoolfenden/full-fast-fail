# fails
# Ensure Storage logging is enabled for Queue service for read, write and delete requestsCheckov CKV_AZURE_33
# Ensure Storage Account is using the latest version of TLS encryptionCheckov CKV_AZURE_44
# Ensure that 'Secure transfer required' is set to 'Enabled'Checkov CKV_AZURE_3
# Ensure that Storage Accounts use customer-managed key for encryptionCheckov CKV2_AZURE_18
# Ensure storage for critical data are encrypted with Customer Managed KeyCheckov CKV2_AZURE_1
resource "azurerm_storage_account" "positive1" {
  name                = "storageaccountname"
  resource_group_name = azurerm_resource_group.example.name

  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["0.0.0.0/0"]
    virtual_network_subnet_ids = [azurerm_subnet.example.id]
  }

  tags = {
    environment = "staging"
  }
}
