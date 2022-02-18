# fails
# CKV_AZURE_146

resource "azurerm_postgresql_configuration" "fail1" {
  name                = "log_retention"
  resource_group_name = data.azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  value               = "off"
}
