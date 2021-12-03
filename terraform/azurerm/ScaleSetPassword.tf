
resource "azurerm_linux_virtual_machine_scale_set" "example" {
  name                            = var.scaleset_name
  resource_group_name             = var.resource_group.name
  location                        = var.resource_group.location
  sku                             = var.sku
  instances                       = var.instance_count
  admin_username                  = var.admin_username
  disable_password_authentication = false
  tags                            = var.common_tags
}
