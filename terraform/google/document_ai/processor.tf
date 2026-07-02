# fail
# Document AI processors must use a customer-managed encryption key (HLD_GCP_242)
resource "google_document_ai_processor" "fail" {
  project      = "gcp-bridgecrew-deployment"
  location     = "us"
  display_name = "fail-processor"
  type         = "OCR_PROCESSOR"
}
