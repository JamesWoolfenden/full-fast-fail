# fails
# CKV_AZURE_115: "Ensure that AKS enables private clusters"
# CKV_AZURE_116: "Ensure that AKS uses Azure Policies Add-on"
# CKV_AZURE_117: "Ensure that AKS uses disk encryption set"
# CKV_AZURE_4: "Ensure AKS logging to Azure Monitoring is Configured"
# CKV_AZURE_5: "Ensure RBAC is enabled on AKS clusters"
# CKV_AZURE_6: "Ensure AKS has an API Server Authorized IP Ranges enabled"
# CKV_AZURE_7: "Ensure AKS cluster has Network Policy configured"
# CKV_AZURE_8: "Ensure Kubernetes Dashboard is disabled"

resource "azurerm_kubernetes_cluster" "fail-cluster" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }


  role_based_access_control {
    enabled = false
  }
  addon_profile {
      kube_dashboard {
          enabled=true}
  }
  tags = { Environment = "Production" }
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "uksouth"
}

provider "azurerm" {
  features {}
}
