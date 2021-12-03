# fails
# CKV_OCI_15: "Ensure OCI File System is Encrypted with a customer Managed Key"

resource "oci_file_storage_file_system" "fail" {
  availability_domain = var.file_system_availability_domain
  compartment_id      = var.compartment_id

  defined_tags       = { "Operations.CostCenter" = "42" }
  display_name       = var.file_system_display_name
  freeform_tags      = { "Department" = "Finance" }
  source_snapshot_id = oci_file_storage_snapshot.test_snapshot.id
}
