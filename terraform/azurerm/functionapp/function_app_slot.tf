# fails
# todo https_only=true
# todo backup
# todo builtin_logging_enabled
# todo client_certificate_enabled
# todo http2_enabled =true
# todo minimum_tls_version =1.2 defaults to 1.2
# todo scm_minimum_tls_version =1.2 defaults to 1.2
# to do # Ensure that function apps enables AuthenticationCheckov CKV_AZURE_56
resource "azurerm_linux_function_app_slot" "example" {
  name                 = "example-linux-function-app-slot"
  function_app_id      = azurerm_linux_function_app.example.id
  storage_account_name = azurerm_storage_account.example.name
auth_settings {
    enabled=false
}
  site_config {}
}