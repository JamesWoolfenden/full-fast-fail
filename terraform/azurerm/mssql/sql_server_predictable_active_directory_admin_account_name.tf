# fails

# todo 'azurerm_sql_active_directory_administrator[%s].login is not predictable
# {"admin", "administrator", "sqladmin", "root", "user", "azure_admin", "azure_administrator", "guest"}
resource "azurerm_sql_active_directory_administrator" "fail" {
  server_name         = azurerm_sql_server.example.name
  resource_group_name = azurerm_resource_group.example.name
  login               = ""
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
}
