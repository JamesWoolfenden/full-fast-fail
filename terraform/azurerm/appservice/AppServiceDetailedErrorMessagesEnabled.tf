# fails
# CKV_AZURE_13: "Ensure App Service Authentication is set on Azure App Service"
# CKV_AZURE_14: "Ensure web app redirects all HTTP traffic to HTTPS in Azure App Service"
# CKV_AZURE_15: "Ensure web app is using the latest version of TLS encryption"
# CKV_AZURE_16: "Ensure that Register with Azure Active Directory is enabled on App Service"
# CKV_AZURE_17: "Ensure the web app has 'Client Certificates (Incoming client certificates)' set"
# CKV_AZURE_18: "Ensure that 'HTTP Version' is the latest if used to run the web app"
# CKV_AZURE_57: "Ensure that CORS disallows every resource to access app services"
# CKV_AZURE_63: "Ensure that App service enables HTTP logging"
# CKV_AZURE_65: "Ensure that App service enables detailed error messages"
# CKV_AZURE_66: "Ensure that App service enables failed request tracing"
# CKV_AZURE_71: "Ensure that Managed identity provider is enabled for app services"
# CKV_AZURE_72: "Ensure that remote debugging is not enabled for app services"
# CKV_AZURE_78: "Ensure FTP deployments are disabled"
# CKV_AZURE_80: "Ensure that 'Net Framework' version is the latest, if used as a part of the web app"
# CKV_AZURE_81: "Ensure that 'PHP version' is the latest, if used to run the web app"
# CKV_AZURE_82: "Ensure that 'Python version' is the latest, if used to run the web app"
# CKV_AZURE_83: "Ensure that 'Java version' is the latest, if used to run the web app"
# CKV_AZURE_88: "Ensure that app services use Azure Files"

# tfsec
# Resource 'azurerm_app_service.fail' does not have logs enabled
# Resource 'azurerm_app_service.fail' does not have logs enabled
# Resource 'azurerm_app_service.fail' does not have site_config.min_tls_version set to 1.2
# Resource 'azurerm_app_service.fail' does not have site_config.php_version set to 7.4 which is the latest version
# Resource 'azurerm_app_service.fail' does not have site_config.python_version set to 3.4 which is the latest version
# Resource 'azurerm_app_service.fail' does not set identity
# Resource 'azurerm_app_service.fail' has an site_config.ftps_state which enables FTP/FTPS.
# Resource 'azurerm_app_service.fail' uses default value (true) for https_only
# Resource 'azurerm_app_service.fail' uses default value for auth_settings.enabled
# Resource 'azurerm_app_service.fail' uses default value for client_cert_enabled
# Resource 'azurerm_app_service.fail' uses default value for site_config.http2_enabled

resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    python_version  = "2.7"
    php_version     = "7.1"
    min_tls_version = "1.0"
    java_version    = "7.0"
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  logs {
    application_logs {
      azure_blob_storage {
        level             = "warning"
        sas_url           = "www.example.com"
        retention_in_days = 4
      }
    }
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}
