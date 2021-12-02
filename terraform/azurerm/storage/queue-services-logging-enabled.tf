

resource "azurerm_storage_account" "fail" {
  name                     = "example"
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  queue_properties {
  }
}
