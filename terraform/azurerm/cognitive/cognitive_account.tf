# fails
# CKV_AZURE_134: "Ensure that Cognitive Services accounts disable public network access"
# CKV2_AZURE_22: "Ensure that Cognitive Services enables customer-managed key for encryption"
resource "azurerm_cognitive_account" "cognitive_account_good" {
  name                          = "example-account"
  location                      = azurerm_resource_group.example.location
  resource_group_name           = azurerm_resource_group.example.name
  kind                          = "Face"
  sku_name                      = "E0"
  public_network_access_enabled = true
}
