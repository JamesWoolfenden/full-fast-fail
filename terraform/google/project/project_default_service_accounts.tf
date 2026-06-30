# fails HLD_GCP_321 — action = "DELETE" is irreversible and breaks managed services
resource "google_project_default_service_accounts" "fail_delete" {
  project = "my-project-id"
  action  = "DELETE"
}

# passes HLD_GCP_321 — DEPRIVILEGE revokes Editor role without deleting accounts
resource "google_project_default_service_accounts" "pass_deprivilege" {
  project = "my-project-id"
  action  = "DEPRIVILEGE"
}
