# fail
# Cloud Workstation configs must use a customer-managed encryption key (HLD_PROPOSED_029)
resource "google_workstations_workstation_config" "fail" {
  workstation_config_id  = "workstation-config-fail"
  workstation_cluster_id = "workstation-cluster-fail"
  location               = "us-central1"
  project                = "gcp-bridgecrew-deployment"

  host {
    gce_instance {
      machine_type = "e2-standard-4"
    }
  }
}

# fail
# Cloud Workstation IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_PROPOSED_030)
resource "google_workstations_workstation_config_iam_binding" "fail" {
  workstation_cluster_id = "workstation-cluster-fail"
  location               = "us-central1"
  project                = "gcp-bridgecrew-deployment"
  workstation_config_id  = google_workstations_workstation_config.fail.workstation_config_id
  role                   = "roles/workstations.user"
  members                = ["allUsers"]
}

resource "google_workstations_workstation" "fail" {
  workstation_id         = "workstation-fail"
  workstation_config_id  = google_workstations_workstation_config.fail.workstation_config_id
  workstation_cluster_id = "workstation-cluster-fail"
  location               = "us-central1"
  project                = "gcp-bridgecrew-deployment"
}

# fail
# Cloud Workstation IAM bindings must not grant access to allUsers or allAuthenticatedUsers (HLD_PROPOSED_030)
resource "google_workstations_workstation_iam_binding" "fail" {
  workstation_id         = google_workstations_workstation.fail.workstation_id
  workstation_config_id  = google_workstations_workstation_config.fail.workstation_config_id
  workstation_cluster_id = "workstation-cluster-fail"
  location               = "us-central1"
  project                = "gcp-bridgecrew-deployment"
  role                   = "roles/workstations.user"
  members                = ["allUsers"]
}
