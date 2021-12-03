
                            resource "azurerm_linux_virtual_machine" "example" {
                              name                  = "${var.prefix}-vm"
                              location              = azurerm_resource_group.main.location
                              resource_group_name   = azurerm_resource_group.main.name
                              network_interface_ids = [azurerm_network_interface.main.id]
                              vm_size               = "Standard_DS1_v2"

                              storage_image_reference {
                                publisher = "Canonical"
                                offer     = "UbuntuServer"
                                sku       = "16.04-LTS"
                                version   = "latest"
                              }
                              storage_os_disk {
                                name              = "myosdisk1"
                                caching           = "ReadWrite"
                                create_option     = "FromImage"
                                managed_disk_type = "Standard_LRS"
                                vhd_uri           = "someURI"
                              }
                              os_profile {
                                computer_name  = "hostname"
                                admin_username = "testadmin"
                                admin_password = "Password1234!"
                              }
                              tags = {
                                environment = "staging"
                              }
                            }
