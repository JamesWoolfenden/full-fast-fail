# fails
# Ensure function apps are not accessible from all regionsCheckov CKV_AZURE_62
# Ensure that 'HTTP Version' is the latest, if used to run the Function appCheckov CKV_AZURE_67
# Ensure Function app is using the latest version of TLS encryptionCheckov (CKV_AZURE_145)
# Ensure that Function apps is only accessible over HTTPSCheckov CKV_AZURE_70
# Ensure that function apps enables AuthenticationCheckov CKV_AZURE_56
# CKV_AZURE_145
# todo client_cert_mode is set The mode of the Function App's client certificates requirement for incoming requests. Possible values are Required and Optional
# todo identity is defined and not null
# CKV_AZURE_159 Ensure function app builtin logging is enabled (R.6.2, R.6.4, R.6.5 of generic Azure Infrastructure Hardening Standards) enable_builtin_logging!=false
# todo Ensure function app has at least one firewall rule defined so the Microsoft default 'deny all' rule is activated (R.7.1, R.7.2, of generic
# Azure Infrastructure Hardening Standards) ip_restriction block is set?


resource "azurerm_function_app" "fail" {
  name                       = "test-azure-functions"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  https_only                 = false
  enable_builtin_logging     = false #default is true

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    min_tls_version          = 1.1
    ftps_state               = "AllAllowed"
    http2_enabled            = false
    cors {
      allowed_origins = ["*"]
    }
  }
  # client_cert_mode=
  # identity {

  # }


}
