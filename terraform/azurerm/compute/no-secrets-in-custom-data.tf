
resource "azurerm_virtual_machine" "fail" {
  name        = "fail"
  custom_data = <<EOF
export DATABASE_PASSWORD=\"SomeSortOfPassword\"
EOF
}
