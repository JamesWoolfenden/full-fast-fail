# fails
# Ensure default network access rule for Storage Accounts is set to denyCheckov CKV_AZURE_35
# Ensure that Storage accounts disallow public accessCheckov CKV_AZURE_59
# Ensure that storage account enables secure transferCheckov CKV_AZURE_60
# Ensure Storage logging is enabled for Queue service for read, write and delete requestsCheckov CKV_AZURE_33
# Ensure Storage Account is using the latest version of TLS encryptionCheckov CKV_AZURE_44
# Ensure that 'Secure transfer required' is set to 'Enabled'Checkov CKV_AZURE_3
# Ensure that Storage Accounts use customer-managed key for encryptionCheckov CKV2_AZURE_18
# Ensure storage for critical data are encrypted with Customer Managed KeyCheckov CKV2_AZURE_1
resource "azurerm_storage_account" "positive1" {
  name                      = "example1"
  resource_group_name       = data.azurerm_resource_group.example.name
  location                  = data.azurerm_resource_group.example.location
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  enable_https_traffic_only = false
  allow_blob_public_access  = true
}
