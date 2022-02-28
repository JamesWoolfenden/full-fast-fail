# fails
# todo - endpoint_type is not public - is private -required
# todo response_cache_details/is_ssl_enabled

resource "oci_apigateway_gateway" "test_gateway" {
  #Required
  compartment_id = var.compartment_id
  endpoint_type  = var.gateway_endpoint_type
  subnet_id      = oci_core_subnet.test_subnet.id

  #Optional
  certificate_id = oci_apigateway_certificate.test_certificate.id
  ca_bundles {
    #Required
    type = var.gateway_ca_bundles_type

    #Optional
    ca_bundle_id             = oci_apigateway_ca_bundle.test_ca_bundle.id
    certificate_authority_id = oci_apigateway_certificate_authority.test_certificate_authority.id
  }
  defined_tags               = { "Operations.CostCenter" = "42" }
  display_name               = var.gateway_display_name
  freeform_tags              = { "Department" = "Finance" }
  network_security_group_ids = var.gateway_network_security_group_ids
  response_cache_details {
    #Required
    type = var.gateway_response_cache_details_type

    #Optional
    authentication_secret_id             = oci_vault_secret.test_secret.id
    authentication_secret_version_number = var.gateway_response_cache_details_authentication_secret_version_number
    connect_timeout_in_ms                = var.gateway_response_cache_details_connect_timeout_in_ms
    is_ssl_enabled                       = var.gateway_response_cache_details_is_ssl_enabled
    is_ssl_verify_disabled               = var.gateway_response_cache_details_is_ssl_verify_disabled
    read_timeout_in_ms                   = var.gateway_response_cache_details_read_timeout_in_ms
    send_timeout_in_ms                   = var.gateway_response_cache_details_send_timeout_in_ms
    servers {

      #Optional
      host = var.gateway_response_cache_details_servers_host
      port = var.gateway_response_cache_details_servers_port
    }
  }
}
