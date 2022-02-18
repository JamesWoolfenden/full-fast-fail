# fails
# Ensure that Application Gateway enables WAFCheckov CKV_AZURE_120
resource "azurerm_application_gateway" "positive1" {
  name                = "example-appgateway"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  waf_configuration {
    enabled = false
  }
}
