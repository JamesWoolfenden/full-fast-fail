# fail
# Document AI Warehouse locations must use a customer-managed encryption key (HLD_GCP_243)
resource "google_document_ai_warehouse_location" "fail" {
  project  = "gcp-bridgecrew-deployment"
  location = "us"
}
