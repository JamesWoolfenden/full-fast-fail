# fails
# CKV_AZURE_126: "Ensures that Active Directory is used for authentication for Service Fabric"
# CKV_AZURE_125: "Ensures that Service Fabric use three levels of protection available"
# todo cluster protection
resource "azurerm_service_fabric_cluster" "example_level" {
  name                 = "example-servicefabric"
  resource_group_name  = azurerm_resource_group.example.name
  location             = azurerm_resource_group.example.location
  reliability_level    = "Bronze"
  upgrade_mode         = "Manual"
  cluster_code_version = "7.1.456.959"
  vm_image             = "Windows"
  management_endpoint  = "https://example:80"
  # fabric_settings {
  #   name = "Security"
  #   parameters = {
  #     name  = "ClusterProtectionLevel"
  #     value = "EncryptAndSign"
  #   }
  # }


  node_type {
    name                 = "first"
    instance_count       = 3
    is_primary           = true
    client_endpoint_port = 2020
    http_endpoint_port   = 80
  }
}
