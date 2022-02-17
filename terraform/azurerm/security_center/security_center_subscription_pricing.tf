# fails
# CKV_AZURE_55: "Ensure that Azure Defender is set to On for Servers"
# CKV_AZURE_61: "Ensure that Azure Defender is set to On for App Service"
# CKV_AZURE_69: "Ensure that Azure Defender is set to On for Azure SQL database servers"
# CKV_AZURE_85: "Ensure that Azure Defender is set to On for Kubernetes"
# CKV_AZURE_79: "Ensure that Azure Defender is set to On for SQL servers on machines"
# CKV_AZURE_86: "Ensure that Azure Defender is set to On for Container Registries"
# CKV_AZURE_84: "Ensure that Azure Defender is set to On for Storage"
# CKV_AZURE_87: "Ensure that Azure Defender is set to On for Key Vault"
# CKV_AZURE_19: "Ensure that standard pricing tier is selected"

resource "azurerm_security_center_subscription_pricing" "fail_pricing" {
  tier          = "Free"
  resource_type = "StorageAccounts"
}
