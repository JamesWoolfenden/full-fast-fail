# fail
# Cloud Healthcare datasets must use a customer-managed encryption key (HLD_GCP_171)
resource "google_healthcare_dataset" "fail" {
  name     = "dataset-fail"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"
}

# fail
# Cloud Healthcare DICOM stores must use a customer-managed encryption key (HLD_GCP_198)
resource "google_healthcare_dicom_store" "fail" {
  name    = "dicom-store-fail"
  dataset = google_healthcare_dataset.fail.id
}

# fail
# Cloud Healthcare FHIR stores must use a customer-managed encryption key (HLD_GCP_197)
resource "google_healthcare_fhir_store" "fail" {
  name                 = "fhir-store-fail"
  dataset              = google_healthcare_dataset.fail.id
  version              = "R4"
  enable_update_create = true
}

# fail
# Cloud Healthcare HL7v2 stores must use a customer-managed encryption key (HLD_GCP_199)
resource "google_healthcare_hl7_v2_store" "fail" {
  name    = "hl7v2-store-fail"
  dataset = google_healthcare_dataset.fail.id
}
