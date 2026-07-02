# fail
# Vertex AI endpoints must use a customer-managed encryption key (HLD_GCP_205)
# Vertex AI endpoints must be deployed to a private network (HLD_GCP_232)
resource "google_vertex_ai_endpoint" "fail" {
  name         = "vertex-endpoint-fail"
  display_name = "vertex-endpoint-fail"
  location     = "us-central1"
  project      = "gcp-bridgecrew-deployment"
}

# fail
# Vertex AI index endpoints must not enable public endpoint access (HLD_GCP_233)
resource "google_vertex_ai_index_endpoint" "fail" {
  display_name            = "vertex-index-endpoint-fail"
  region                  = "us-central1"
  project                 = "gcp-bridgecrew-deployment"
  public_endpoint_enabled = true
}
