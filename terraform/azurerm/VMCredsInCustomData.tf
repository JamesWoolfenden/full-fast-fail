
resource "azurerm_virtual_machine" "secret" {
  name                  = "${var.prefix}-vm"

  os_profile {
    computer_name  = "hostname"
    custom_data = <<EOF
0000-0000-0000-0000-000000000000
EOF
  }
}
