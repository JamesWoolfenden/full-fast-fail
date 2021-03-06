# fails
# CKV_GCP_104 enable_stackdriver_logging = true
# CKV_GCP_105 enable_stackdriver_monitoring = true
#Ensure Data fusion instances are privateCheckov (CKV_GCP_87)
resource "google_data_fusion_instance" "fail" {
  project     = "examplea"
  provider    = google-beta
  name        = "my-instance"
  description = "My Data Fusion instance"
  region      = "us-central1"
  type        = "BASIC"
  # enable_stackdriver_logging    = false
  # enable_stackdriver_monitoring = false
  labels = {
    example_key = "example_value"
  }
  //private_instance = false
  network_config {
    network       = "default"
    ip_allocation = "10.89.48.0/22"
  }
  version                  = "6.3.0"
  dataproc_service_account = data.google_app_engine_default_service_account.default.email
}

data "google_app_engine_default_service_account" "default" {
  provider = google-beta
  project  = "examplea"
}
