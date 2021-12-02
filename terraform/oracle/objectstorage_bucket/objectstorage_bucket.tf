# fails
# CKV_OCI_7: "Ensure OCI Object Storage bucket can emit object events"
# CKV_OCI_8: "Ensure OCI Object Storage has versioning enabled"
# CKV_OCI_9: "Ensure OCI Object Storage is encrypted with Customer Managed Key"
# CKV_OCI_10: "Ensure OCI Object Storage is not Public"

resource "oci_objectstorage_bucket" "fail" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.namespace

  access_type           = "ObjectReadWithoutList"
  defined_tags          = var.defined_tags
  freeform_tags         = var.freeform_tags
  metadata              = var.metadata
  storage_tier          = var.bucket_storage_tier
  object_events_enabled = false

  retention_rules {
    display_name = var.retention_rule_display_name

    duration {
      time_amount = var.retention_rule_duration_time_amount
      time_unit   = var.retention_rule_duration_time_unit
    }
    time_rule_locked = var.retention_rule_time_rule_locked
  }

  versioning = "Disabled"
}
