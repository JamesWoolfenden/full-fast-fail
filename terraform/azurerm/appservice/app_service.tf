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
# todo  client_cert_enabled = false
# ensure https_only =true
# todo authsettings is set

# tfsec
# azure-appservice-account-identity-registered
# azure-appservice-authentication-enabled
# azure-appservice-detailed-error-messages-enabled
# azure-appservice-dotnet-framework-version
# azure-appservice-enable-http2
# azure-appservice-enable-https-only
# azure-appservice-failed-request-tracing-enabled
# azure-appservice-ftp-deployments-disabled
# azure-appservice-http-logs-enabled
# azure-appservice-php-version
# azure-appservice-python-version
# azure-appservice-require-client-cert
# azure-appservice-use-secure-tls-policy

resource "azurerm_app_service" "fail" {
  name                     = "example-app-service"
  location                 = azurerm_resource_group.example.location
  resource_group_name      = azurerm_resource_group.example.name
  app_service_plan_id      = azurerm_app_service_plan.example.id
  remote_debugging_enabled = true
  https_only               = false
  site_config {
    python_version           = "2.7"
    php_version              = "7.1"
    min_tls_version          = "1.0"
    java_version             = "7.0"
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    ftps_state               = "AllAllowed"
    cors {
      allowed_origins = ["*"]
    }
  }
  identity {

  }

  # auth_settings {

  # }
  client_cert_enabled = false
}
