resource "oci_core_security_list" "fail" {
  compartment_id = oci_identity_compartment.tf-compartment.id
  vcn_id         = oci_core_vcn.test_vcn.id
}
