# fail
# Vertex AI Featurestore must use a customer-managed encryption key (HLD_GCP_228)
resource "google_vertex_ai_featurestore" "fail" {
  name     = "vertex-featurestore-fail"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"
}

# fail
# Vertex AI Reasoning Engine must use a customer-managed encryption key (HLD_PROPOSED_018)
resource "google_vertex_ai_reasoning_engine" "fail" {
  display_name = "vertex-reasoning-engine-fail"
  location     = "us-central1"
  project      = "gcp-bridgecrew-deployment"

  spec {
    package_spec {
      pickle_object_gcs_uri = "gs://my-bucket/reasoning-engine.pkl"
    }
  }
}

# fail
# Vertex AI Tensorboard must use a customer-managed encryption key (HLD_GCP_229)
resource "google_vertex_ai_tensorboard" "fail" {
  display_name = "vertex-tensorboard-fail"
  location     = "us-central1"
  project      = "gcp-bridgecrew-deployment"
}
