# fail
# todo isPvEncryptionInTransitEnabled
resource "oci_core_image" "fail" {
  #Required
  compartment_id = var.compartment_id
  instance_id    = oci_core_instance.test_instance.id

  #Optional
  defined_tags  = { "Operations.CostCenter" = "42" }
  display_name  = var.image_display_name
  launch_mode   = var.image_launch_mode
  freeform_tags = { "Department" = "Finance" }
}
