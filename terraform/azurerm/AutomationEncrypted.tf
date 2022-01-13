# fails
# CKV_AZURE_73: "Ensure that Automation account variables are encrypted"

resource "azurerm_automation_variable_string" "example" {
  name                    = "tfex-example-var"
  resource_group_name     = azurerm_resource_group.example.name
  automation_account_name = azurerm_automation_account.example.name
  value                   = "Hello, Terraform Basic Test."
  encrypted               = false
}
