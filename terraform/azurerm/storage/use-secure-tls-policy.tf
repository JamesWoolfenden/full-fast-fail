

resource "azurerm_storage_account" "fail" {
  name                = "storageaccountname"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}
