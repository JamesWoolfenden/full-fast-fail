
# fails
# CKV_AZURE_93: "Ensure that managed disks use a specific set of disk encryption sets for the customer-managed key encryption"

resource "azurerm_managed_disk" "source" {
  name                 = "acctestmd1"
  location             = "West US 2"
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1"

  tags = {
    environment = "staging"
  }
}
