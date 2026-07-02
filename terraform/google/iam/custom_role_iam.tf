# fail
# Custom IAM roles must not grant project-level setIamPolicy (HLD_GCP_103)
resource "google_organization_iam_custom_role" "fail" {
  role_id     = "iamFailOrgRole"
  org_id      = "123456789012"
  title       = "IAM fail org role"
  description = "Custom role that can rewrite IAM policy"
  permissions = ["resourcemanager.projects.setIamPolicy"]
}

# fail
# Custom IAM roles must not grant project-level setIamPolicy (HLD_GCP_103)
resource "google_project_iam_custom_role" "fail" {
  role_id     = "iamFailProjectRole"
  project     = "gcp-bridgecrew-deployment"
  title       = "IAM fail project role"
  description = "Custom role that can rewrite IAM policy"
  permissions = ["resourcemanager.projects.setIamPolicy"]
}
