# fails
# CKV2_GCP_5: "Ensure that Cloud Audit Logging is configured properly across all services and all users from a project"
# CKV_GCP_27: "Ensure that the default network does not exist in a project"
# todo google_project_iam_policy cannot be used in conjunction with google_project_iam_binding, google_project_iam_member, or google_project_iam_audit_config or they will fight over what your policy should be.
# todo google_project_iam_binding resources can be used in conjunction with google_project_iam_member resources only if they do not grant privilege to the same role.

resource "google_project" "fail" {
  name                = "My Project"
  project_id          = "your-project-id"
  org_id              = "1234567"
  auto_create_network = true
}

resource "google_compute_network" "vpc_network_bad" {
  name                    = "vpc-legacy"
  auto_create_subnetworks = true
  project                 = google_project.fail.id
}
