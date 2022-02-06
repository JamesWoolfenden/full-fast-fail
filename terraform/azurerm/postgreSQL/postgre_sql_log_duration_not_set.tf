#this is a problematic code where the query should report a result(s)
resource "azurerm_postgresql_configuration" "positive1" {
  name                = "log_duration"
  resource_group_name = "example1_resource_group_name"
  server_name         = "example1_server_name"
  value               = "off"
}
