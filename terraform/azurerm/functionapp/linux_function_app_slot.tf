# todo same as function app
resource "azurerm_linux_function_app_slot" "example" {
  name                 = "example-linux-function-app-slot"
  function_app_id      = azurerm_linux_function_app.example.id
  storage_account_name = azurerm_storage_account.example.name

  site_config {}
}