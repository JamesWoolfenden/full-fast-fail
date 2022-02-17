# fails
# Ensure that 'HTTP Version' is the latest, if used to run the Function appCheckov CKV_AZURE_67
# Ensure that Function apps is only accessible over HTTPSCheckov CKV_AZURE_70
# Ensure that function apps enables AuthenticationCheckov CKV_AZURE_56
# todo min_tls_version -1.2
# todo client_cert_mode is set
# todo identity' is defined and not null
resource "azurerm_function_app" "fail" {
  name                       = "test-azure-functions"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  https_only                 = false

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    min_tls_version          = 1.1
    ftps_state               = "AllAllowed"
  }
  # client_cert_mode=
  # identity {

  # }
}
