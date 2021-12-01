resource "opc_compute_ip_address_reservation" "fail" {
	name            = "my-ip-address"
	ip_address_pool = "public-ippool"
  }
