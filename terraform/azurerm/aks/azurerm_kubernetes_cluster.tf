# fails
# Ensure that AKS uses Azure Policies Add-onCheckov CKV_AZURE_116
# Ensure that AKS uses disk encryption setCheckov CKV_AZURE_117
# Ensure that AKS enables private clustersCheckov CKV_AZURE_115
# Ensure AKS logging to Azure Monitoring is ConfiguredCheckov CKV_AZURE_4
# Ensure AKS cluster has Network Policy configuredCheckov CKV_AZURE_7
# Ensure Kubernetes Dashboard is disabledCheckov CKV_AZURE_8
# Ensure AKS has an API Server Authorized IP Ranges enabledCheckov CKV_AZURE_6
# Ensure RBAC is enabled on AKS clustersCheckov CKV_AZURE_5
# Ensure AKS cluster nodes do not have public IP addresses CKV_AZURE_143
# todo automatic_channel_upgrade is not none the default

# tfsec
# azure-container-limit-authorized-ips
# azure-container-logging
# azure-container-use-rbac-permissions
resource "azurerm_kubernetes_cluster" "fail_cluster" {
  name                = "example-aks1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"
  default_node_pool {
    enable_node_public_ip = true
    name                  = "default"
    node_count            = 1
    vm_size               = "Standard_D2_v2"
  }
  identity {
    type = "SystemAssigned"
  }


  role_based_access_control {
    enabled = false
  }
  addon_profile {

    azure_policy {

      enabled = false

    }
    kube_dashboard {
      enabled = true
    }
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
