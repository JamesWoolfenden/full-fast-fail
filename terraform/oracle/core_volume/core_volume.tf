resource "oci_core_volume" "fail" {
  compartment_id      = var.compartment_id
  availability_domain = var.volume_availability_domain

  block_volume_replicas {
    availability_domain = var.volume_block_volume_replicas_availability_domain
    display_name        = var.volume_block_volume_replicas_display_name
  }
  defined_tags         = { "Operations.CostCenter" = "42" }
  display_name         = var.volume_display_name
  freeform_tags        = { "Department" = "Finance" }
  is_auto_tune_enabled = var.volume_is_auto_tune_enabled
  size_in_gbs          = var.volume_size_in_gbs
  size_in_mbs          = var.volume_size_in_mbs

  source_details {
    id   = var.volume_source_details_id
    type = var.volume_source_details_type
  }
  vpus_per_gb                    = var.volume_vpus_per_gb
  block_volume_replicas_deletion = true
}
