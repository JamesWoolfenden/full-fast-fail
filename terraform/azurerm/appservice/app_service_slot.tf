# fails
# CKV_AZURE_153 Ensure app service slot https only is enabled (R.6.3, R.3.4)
# CKV_AZURE_154 Ensure app service slot min tls version is 1.2 (R.6.4)
# CKV_AZURE_155 Ensure app service slot remote debugging enabled is false (R.6.4)
resource "azurerm_app_service_slot" "fail" {
  name                = random_id.server.hex
  app_service_name    = azurerm_app_service.example.name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  https_only = false #thedefault


  site_config {
    dotnet_framework_version = "v4.0"
    min_tls_version          = "1.1" #the default is 1.2
    remote_debugging_enabled = true  #default is false
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

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "uksouth"
}

resource "azurerm_app_service_plan" "example" {
  sku {
    tier = "free"
    size = "small"
  }
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  name                = "example"
}

resource "azurerm_app_service" "example" {
  name                = "simon"
  app_service_plan_id = azurerm_app_service_plan.example.id
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}


provider "azurerm" {
  features {}
}
