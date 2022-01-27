# fails
# CKV_AZURE_39: "Ensure that no custom subscription owner roles are created"
# tfsec
# azure-authorization-limit-role-actions

data "azurerm_subscription" "primary" {
}

resource "azurerm_role_definition" "example" {
  name        = "my-custom-role"
  scope       = data.azurerm_subscription.primary.id
  description = "This is a custom role created via Terraform"

  permissions {
    actions     = ["*"]
    not_actions = []
  }

  assignable_scopes = [
    "/"
  ]
}
