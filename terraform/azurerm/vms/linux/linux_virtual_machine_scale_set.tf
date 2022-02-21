# fails
# Ensure Azure linux scale set does not use basic authentication(Use SSH Key Instead)Checkov CKV_AZURE_49
# Ensure that Virtual machine scale sets have encryption at host enabledCheckov CKV_AZURE_97
# ensure no password auth CKV_AZURE_149
resource "azurerm_linux_virtual_machine_scale_set" "example" {
  name                            = var.scaleset_name
  resource_group_name             = var.resource_group.name
  location                        = var.resource_group.location
  sku                             = var.sku
  instances                       = var.instance_count
  admin_username                  = var.admin_username
  disable_password_authentication = true
  tags                            = { test = "Fail" }
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "uksouth"
}
