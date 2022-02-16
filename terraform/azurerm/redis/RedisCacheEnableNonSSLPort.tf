# fails
# todo   check is no enable_non_ssl_port           = true
resource "azurerm_redis_cache" "example" {
  name                          = "example-cache"
  location                      = azurerm_resource_group.example.location
  resource_group_name           = azurerm_resource_group.example.name
  capacity                      = 2
  family                        = "C"
  sku_name                      = "Standard"
  enable_non_ssl_port           = true
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true
  redis_configuration {
  }
}
