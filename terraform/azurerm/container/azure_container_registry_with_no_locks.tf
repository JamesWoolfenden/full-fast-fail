# todo graph check link registry with management lock
resource "azurerm_container_registry" "acr" {
  name                = "containerRegistry1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
  admin_enabled       = false
}


resource "azurerm_management_lock" "public_ip" {
  name       = "resource-ip"
  scope      = azurerm_container_registry.acr1.id
  lock_level = "CanNotDelete"
  notes      = "Locked because it's needed by a third-party"
}
