# fails
# Ensure that Network Interfaces disable IP forwardingCheckov CKV_AZURE_118
# todo ip_configuration.public_ip_address_id is not set

resource "azurerm_network_interface" "fail" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "IP"
  }

  enable_ip_forwarding = true
}
