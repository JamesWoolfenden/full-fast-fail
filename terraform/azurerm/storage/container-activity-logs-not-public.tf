

resource "azurerm_storage_container" "fail" {
  name                  = "terraform-container-storage"
  container_access_type = "public"
}
