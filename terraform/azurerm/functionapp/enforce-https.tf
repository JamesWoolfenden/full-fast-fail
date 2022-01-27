# fails
# CKV_AZURE_13: "Ensure App Service Authentication is set on Azure App Service"
# CKV_AZURE_14: "Ensure web app redirects all HTTP traffic to HTTPS in Azure App Service"
# CKV_AZURE_16: "Ensure that Register with Azure Active Directory is enabled on App Service"
# CKV_AZURE_17: "Ensure the web app has 'Client Certificates (Incoming client certificates)' set"
# CKV_AZURE_18: "Ensure that 'HTTP Version' is the latest if used to run the web app"
# CKV_AZURE_63: "Ensure that App service enables HTTP logging"
# CKV_AZURE_65: "Ensure that App service enables detailed error messages"
# CKV_AZURE_66: "Ensure that App service enables failed request tracing"
# CKV_AZURE_71: "Ensure that Managed identity provider is enabled for app services"
# CKV_AZURE_78: "Ensure FTP deployments are disabled"
# CKV_AZURE_80: "Ensure that 'Net Framework' version is the latest, if used as a part of the web app"
# CKV_AZURE_88: "Ensure that app services use Azure Files"

resource "azurerm_function_app" "fail" {
  name                       = "test-azure-functions"
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  os_type                    = "linux"
}
