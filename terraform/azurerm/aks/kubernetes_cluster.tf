# fails
# Ensure AKS has an API Server Authorized IP Ranges enabledCheckov CKV_AZURE_6
# Ensure that AKS enables private clustersCheckov CKV_AZURE_115
# Ensure AKS local admin account is disabledCheckov (CKV_AZURE_141)
# Ensure AKS logging to Azure Monitoring is ConfiguredCheckov CKV_AZURE_4
# Ensure AKS cluster has Network Policy configuredCheckov CKV_AZURE_7
# Ensure RBAC is enabled on AKS clustersCheckov CKV_AZURE_5
# Ensure that AKS uses Azure Policies Add-onCheckov CKV_AZURE_116
# Ensure that AKS uses disk encryption setCheckov CKV_AZURE_117
# todo Ensure subnet is defined (R.7.6, R.9.2a)
resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"
  # disk_encryption_set_id =
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    kube_dashboard {
      enabled = true
    }
  }
  # network_profile {

  # }
  tags = {
    Environment = "Production"
  }
}
