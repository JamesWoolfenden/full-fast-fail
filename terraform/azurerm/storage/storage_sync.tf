# fails
# Ensure that Azure File Sync disables public network accessCheckov CKV_AZURE_64
resource "azurerm_storage_sync" "test" {
  name                = "example-storage-sync"
  resource_group_name = azurerm_resource_group.test.name
  location            = azurerm_resource_group.test.location
  tags = {
    foo = "bar"
  }

}
