# fails
# Ensure that 'Public access level' is set to Private for blob containersCheckov CKV_AZURE_34
# Ensure Storage logging is enabled for Blob service for read requestsCheckov CKV2_AZURE_21
resource "azurerm_storage_container" "fail" {
  name                  = "terraform-container-storage"
  container_access_type = "blob"
  storage_account_name  = "any"

}
