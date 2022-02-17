# fails
# Ensure that managed disks use a specific set of disk encryption sets for the customer-managed key encryptionCheckov CKV_AZURE_93
# Ensure Azure managed disk has encryption enabledCheckov CKV_AZURE_2

# tfsec
# azure-compute-enable-disk-encryption
resource "azurerm_managed_disk" "example" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
  encryption_settings {
    enabled = false
  }
  tags = { test = "Fail" }
}
