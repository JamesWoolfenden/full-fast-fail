resource "azurerm_storage_account" "example" {
  name                      = "stor"
  resource_group_name       = azurerm_resource_group.example.name
  location                  = azurerm_resource_group.example.location
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  enable_https_traffic_only = false
  allow_blob_public_access  = true

  //to fail CKV_AZURE_35 && CKV_AZURE_36
  network_rules {
    default_action = "Deny"
    bypass         = ["Metrics"]
  }
}


resource "azurerm_resource_group" "example" {
  location = "uksouth"
  name     = "allfail"
}


provider "azurerm" {
  features {}
}