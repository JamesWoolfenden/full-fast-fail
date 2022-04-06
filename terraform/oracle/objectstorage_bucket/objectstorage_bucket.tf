# fails
# CKV_OCI_7: "Ensure OCI Object Storage bucket can emit object events"
# CKV_OCI_8: "Ensure OCI Object Storage has versioning enabled"
# CKV_OCI_9: "Ensure OCI Object Storage is encrypted with Customer Managed Key"
# CKV_OCI_10: "Ensure OCI Object Storage is not Public"

resource "oci_objectstorage_bucket" "fail" {
  compartment_id = "jameswoolfenden" #var.compartment_id
  name           = "jgw1-test"
  namespace      = "lr3vho9vk2x9" #var.namespace

  access_type           = "ObjectReadWithoutList"
  storage_tier          = "standard"
  object_events_enabled = false


  versioning = "Disabled"
}

terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.69.0"
    }
  }
}

provider "oci" {
  region = "uk-london-1"
  #these to be provided by env vars
  #private_key_path
  #fingerprint
  # tenancy_ocid = var.tenancy_id
  # user_ocid    = var.user_ocid
}


variable "defined_tags" {
  type = map(any)
  default = {
    "Oracle-Tags.CreatedBy" = "james.woolfenden@gmail.com"
    "Oracle-Tags.CreatedOn" = "2021-10-22T13:16:04.607Z"
  }
}
