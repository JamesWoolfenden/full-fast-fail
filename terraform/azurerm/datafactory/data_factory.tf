# fails
# Ensure that Azure Data factory public network access is disabledCheckov CKV_AZURE_104
# Ensure that Azure Data Factory uses Git repository for source controlCheckov CKV_AZURE_103
# Ensure that Azure data factories are encrypted with a customer-managed keyCheckov CKV2_AZURE_15
resource "azurerm_data_factory" "fail" {
  name                = "example"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
