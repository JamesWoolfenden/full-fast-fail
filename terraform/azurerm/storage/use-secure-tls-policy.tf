
# fails
# Ensure default network access rule for Storage Accounts is set to denyCheckov CKV_AZURE_35
# Ensure Storage logging is enabled for Queue service for read, write and delete requestsCheckov CKV_AZURE_33
# Ensure Storage Account is using the latest version of TLS encryptionCheckov CKV_AZURE_44
# Ensure that 'Secure transfer required' is set to 'Enabled'Checkov CKV_AZURE_3
# Ensure that Storage Accounts use customer-managed key for encryptionCheckov CKV2_AZURE_18
# Ensure storage for critical data are encrypted with Customer Managed KeyCheckov CKV2_AZURE_1
resource "azurerm_storage_account" "fail_tls" {
  name                = "storageaccountname"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}
