# fails
# Ensure server parameter 'connection_throttling' is set to 'ON' for PostgreSQL Database ServerCheckov CKV_AZURE_32
resource "azurerm_postgresql_configuration" "example" {
  name                = "connection_throttling"
  resource_group_name = data.azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  value               = "off"
}
