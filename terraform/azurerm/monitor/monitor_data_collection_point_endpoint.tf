#fail
#todo public_network_access_enabled isnt
resource "azurerm_monitor_data_collection_endpoint" "example" {
  name                          = "example-mdce"
  resource_group_name           = azurerm_resource_group.example.name
  location                      = azurerm_resource_group.example.location
  kind                          = "Windows"
  public_network_access_enabled = true
  description                   = "monitor_data_collection_endpoint example"
  tags = {
    foo = "bar"
  }
}
