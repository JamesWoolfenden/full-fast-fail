# fails
# triggered pass but should not
# todo CKV_AZURE_83: "Ensure that 'Java version' is the latest, if used to run the web app"
# CKV_AZURE_81: "Ensure that 'PHP version' is the latest, if used to run the web app"
# CKV_AZURE_82: "Ensure that 'Python version' is the latest, if used to run the web app"


resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
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
