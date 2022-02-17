# fails
# Ensure that Data Lake Store accounts enables encryptionCheckov CKV_AZURE_105
resource "azurerm_data_lake_store" "example" {
  name                = "consumptiondatalake"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  encryption_state = "Disabled"
}
