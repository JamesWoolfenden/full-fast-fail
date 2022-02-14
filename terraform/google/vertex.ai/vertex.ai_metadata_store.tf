resource "google_vertex_ai_metadata_store" "store" {
  name        = "test-store"
  description = "Store to test the terraform module"
  region      = "us-central1"
  #   encryption_spec {
  #       kms_key_name=
  #   }
}
