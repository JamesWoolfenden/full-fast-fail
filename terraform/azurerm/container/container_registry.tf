# fails
# Ensure ACR admin account is disabled Checkov (CKV_AZURE_137)
# Ensure ACR set to disable public networkingCheckov (CKV_AZURE_139)


resource "azurerm_container_registry" "fail" {
  name                          = "containerRegistry1"
  resource_group_name           = azurerm_resource_group.fail.name
  location                      = azurerm_resource_group.fail.location
  sku                           = "Premium"
  admin_enabled                 = true
  georeplication_locations      = ["East US", "West Europe"]
  public_network_access_enabled = true
}

resource "azurerm_resource_group" "fail" {
  name     = "resourceGroup1"
  location = "West US"
}
