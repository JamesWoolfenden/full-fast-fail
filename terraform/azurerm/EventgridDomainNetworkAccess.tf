# fails
# CKV_AZURE_106: "Ensure that Azure Event Grid Domain public network access is disabled"

resource "azurerm_eventgrid_domain" "example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
