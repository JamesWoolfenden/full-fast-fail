# fails
# CKV_AZURE_2: "Ensure Azure managed disk has encryption enabled"
# CKV_AZURE_93: "Ensure that managed disks use a specific set of disk encryption sets for the customer-managed key encryption"
# tfsec
# azure-compute-enable-disk-encryption
resource "azurerm_managed_disk" "fail" {
  encryption_settings {
    enabled = false
  }
  name                 = "Warez"
  storage_account_type = "Standard_LRS"
  location             = "uksouth"
  create_option        = "Empty"
  resource_group_name  = azurerm_resource_group.example.name
}
