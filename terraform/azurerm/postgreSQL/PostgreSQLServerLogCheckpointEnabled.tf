# fails
# Ensure server parameter 'log_checkpoints' is set to 'ON' for PostgreSQL Database ServerCheckov CKV_AZURE_30

resource "azurerm_postgresql_configuration" "example_checkpoints" {
  name                = "log_checkpoints"
  resource_group_name = data.azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  value               = "off"
}
