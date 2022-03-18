# fails
# todo admin login?
# todo admin password?
# Ensure ssl enforcement is enabled (R.2.7, R.4.4)
# Ensure ssl minimal tls version is enforced (R.4.3)
# Ensure to configure Azure MySQLDB to be accessible only from an approved set of machines, subnets, IPs (i.e. allowed list) and/or cloud services (R.2.4)

resource "azurerm_mysql_flexible_server" "example" {
  name                   = "example-fs"
  resource_group_name    = azurerm_resource_group.example.name
  location               = azurerm_resource_group.example.location
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  backup_retention_days  = 7
  delegated_subnet_id    = azurerm_subnet.example.id
  private_dns_zone_id    = azurerm_private_dns_zone.example.id
  sku_name               = "GP_Standard_D2ds_v4"

  depends_on = [azurerm_private_dns_zone_virtual_network_link.example]
}
