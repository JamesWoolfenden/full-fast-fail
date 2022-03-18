# fails
# todo https_only=true
# todo backup
# todo builtin_logging_enabled
# todo client_certificate_enabled
# todo minimum_tls_version =1.2 defaults to 1.2
# todo scm_minimum_tls_version =1.2 defaults to 1.2
# to do # Ensure that function apps enables AuthenticationCheckov CKV_AZURE_56
resource "azurerm_function_app_slot" "fail" {
  name                       = "test-azure-functions-slot"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  function_app_name          = azurerm_function_app.example.name
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  enable_builtin_logging     = false
  site_config {
    http2_enabled = false
  }
  auth_settings {
    enabled = false
  }
}
