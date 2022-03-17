# fails
# CKV_AZURE_107: "Ensure that API management services use virtual networks"
# CKV_AZURE_152 client_certificate_enabled =true only when sku_type=consumption
# todo Ensure frontend TLS is > 1.1
# todo Ensure frontend TLS is > 1.1
# todo Ensure managed identity is used

resource "azurerm_api_management" "example" {
  name                = "example-apim"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  publisher_name      = "My Company"
  publisher_email     = "company@terraform.io"

  sku_name = "Developer_1"

  policy {
    xml_content = <<XML
                    <policies>
                      <inbound />
                      <backend />
                      <outbound />
                      <on-error />
                    </policies>
                XML

  }
  security {
    enable_frontend_tls10 = false
    enable_frontend_tls11 = false
    enable_frontend_ssl30 = false
  }

  identity {

  }
}
