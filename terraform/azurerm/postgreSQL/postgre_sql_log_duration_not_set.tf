# fails
# todo
resource "azurerm_postgresql_configuration" "fail" {
  name                = "log_duration"
  resource_group_name = "example1_resource_group_name"
  server_name         = "example1_server_name"
  value               = "off"
}
