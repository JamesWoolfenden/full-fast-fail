
resource "oci_core_security_list" "fail2" {
  compartment_id = oci_identity_compartment.tf-compartment.id
  vcn_id         = oci_core_vcn.test_vcn.id
  ingress_security_rules {
    protocol  = "all"
    source    = "192.168.1.0/24"
    stateless = false
  }
}
