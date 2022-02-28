# fails
# todo is_immutable is true

resource "oci_artifacts_repository" "test_repository" {
  #Required
  compartment_id  = var.compartment_id
  is_immutable    = var.repository_is_immutable
  repository_type = var.repository_repository_type

  #Optional
  defined_tags  = { "Operations.CostCenter" = "42" }
  description   = var.repository_description
  display_name  = var.repository_display_name
  freeform_tags = { "Department" = "Finance" }
}
