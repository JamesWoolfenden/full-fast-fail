resource "azurerm_postgresql_configuration" "positive1" {
  name                = "log_disconnections"
  resource_group_name = data.azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  value               = "off"
}