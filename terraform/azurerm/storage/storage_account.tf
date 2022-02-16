# fails
# Ensure 'Trusted Microsoft Services' is enabled for Storage Account accessCheckov CKV_AZURE_36
# Ensure that Storage accounts disallow public accessCheckov CKV_AZURE_59
# Ensure that storage account enables secure transferCheckov CKV_AZURE_60
# Ensure Storage logging is enabled for Queue service for read, write and delete requestsCheckov CKV_AZURE_33
# Ensure Storage Account is using the latest version of TLS encryptionCheckov CKV_AZURE_44
# Ensure that 'Secure transfer required' is set to 'Enabled'Checkov CKV_AZURE_3
# Ensure that Storage Accounts use customer-managed key for encryptionCheckov CKV2_AZURE_18
resource "azurerm_storage_account" "example" {
  name                      = "this-is-wrong"
  resource_group_name       = azurerm_resource_group.example.name
  location                  = azurerm_resource_group.example.location
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  enable_https_traffic_only = false
  allow_blob_public_access  = true

  //to fail CKV_AZURE_35 && CKV_AZURE_36
  network_rules {
    default_action = "Deny"
    bypass         = ["Metrics"]
  }
}


resource "azurerm_resource_group" "example" {
  location = "uksouth"
  name     = "allfail"
}


provider "azurerm" {
  features {}
}
