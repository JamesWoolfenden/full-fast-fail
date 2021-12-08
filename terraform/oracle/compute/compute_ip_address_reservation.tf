# fails
# todo

# tfsec
# OCI001 Resource 'opc_compute_ip_address_reservation.fail' is using an IP from a public IP pool

resource "opc_compute_ip_address_reservation" "fail" {
  name            = "my-ip-address"
  ip_address_pool = "public-ippool"
}
