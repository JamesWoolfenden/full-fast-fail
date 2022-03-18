# fails
# todo Ensure all databricks_ip_access_list have valid ip list (Security Hardening 4.2)
# todo Ensure that databricks workspace has no public ip (Security Hardening 3.6, 3.8. 3.9) - public_network_access_enabled!=true

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_databricks_workspace" "example" {
  name                          = "databricks-test"
  resource_group_name           = azurerm_resource_group.example.name
  location                      = azurerm_resource_group.example.location
  sku                           = "standard"
  public_network_access_enabled = true #Defaults to true

  tags = {
    Environment = "Production"
  }
}
