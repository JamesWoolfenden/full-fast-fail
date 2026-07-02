# fail
# Firestore databases must have deletion protection enabled (HLD_GCP_051)
# Firestore database must have GCP-level deletion protection enabled (HLD_GCP_083)
resource "google_firestore_database" "fail" {
  project                 = "gcp-bridgecrew-deployment"
  name                    = "(default)"
  location_id             = "nam5"
  type                    = "FIRESTORE_NATIVE"
  deletion_policy         = "DELETE"
  delete_protection_state = "DELETE_PROTECTION_DISABLED"
}
