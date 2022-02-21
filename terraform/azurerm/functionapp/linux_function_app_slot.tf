resource "azurerm_linux_function_app_slot" "example" {
  name           = "example-slot"
  app_service_id = azurerm_linux_web_app.example.id

  site_config {}
}
