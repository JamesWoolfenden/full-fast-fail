resource "google_iam_workload_identity_pool" "fail" {
  workload_identity_pool_id = "iam-fail-pool"
  project                   = "gcp-bridgecrew-deployment"
}

# fail
# Workload identity pool provider must have an attribute condition (HLD_GCP_080)
# GitHub Actions workload identity pool providers must scope attribute_condition to a specific repository (HLD_GCP_307)
resource "google_iam_workload_identity_pool_provider" "fail" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.fail.workload_identity_pool_id
  workload_identity_pool_provider_id = "iam-fail-provider"
  project                            = "gcp-bridgecrew-deployment"

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }

  attribute_mapping = {
    "google.subject" = "assertion.sub"
  }
}
