# fails
# CKV2_AZURE_9: "Ensure Virtual Machines are utilizing Managed Disks"
# CKV2_AZURE_12: "Ensure that virtual machines are backed up using Azure Backup"
# CKV2_AZURE_10: "Ensure that Microsoft Antimalware is configured to automatically updates for Virtual Machines"
# CKV_AZURE_1: "Ensure Azure Instance does not use basic authentication(Use SSH Key Instead)"

# tfsec
# azure-compute-ssh-authentication
# general-secrets-sensitive-in-attribute-value
# azure-compute-no-secrets-in-custom-data
# azure-compute-disable-password-authentication
resource "azurerm_virtual_machine" "fail" {
  name                  = "fail"
  location              = "uksouth"
  network_interface_ids = ["azurerm_network_interface.main.id"]
  vm_size               = ""
  resource_group_name   = azurerm_resource_group.example.name

  os_profile_linux_config {
    disable_password_authentication = false

  }

  os_profile {
    computer_name  = "HAL"
    admin_username = "DAVE"
    custom_data    = <<EOF
export DATABASE_PASSWORD=\"SomeSortOfPassword\"
EOF
  }
  storage_os_disk {
    name          = "toxic"
    create_option = "empty"
  }
}



resource "azurerm_virtual_network" "example" {
  name                = "network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}


provider "azurerm" {
  features {

  }
}
