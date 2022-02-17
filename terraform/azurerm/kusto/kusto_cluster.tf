# fails
# Ensure that Azure Data Explorer uses double encryptionCheckov CKV_AZURE_75
# Ensure that Azure Data Explorer uses disk encryptionCheckov CKV_AZURE_74
# Ensure that Azure Data Explorer encryption at rest uses a customer-managed keyCheckov CKV2_AZURE_11
resource "azurerm_kusto_cluster" "example" {
  name                = "kustocluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    name     = "Standard_D13_v2"
    capacity = 2
  }

  tags = {
    Environment = "Production"
  }
}
