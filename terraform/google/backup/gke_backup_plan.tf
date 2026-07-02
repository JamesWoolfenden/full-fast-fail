# fail
# GKE backup plans must encrypt backup data with a customer-managed key (HLD_PROPOSED_009)
resource "google_gke_backup_backup_plan" "fail" {
  name     = "gke-backup-plan-fail"
  cluster  = "projects/gcp-bridgecrew-deployment/locations/us-central1/clusters/fail"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"

  backup_config {
    include_volume_data = true
    all_namespaces      = true
  }
}
