# fail
# Cloud Workflows must not use the default Compute Engine service account (HLD_GCP_267)
# Cloud Workflows should encrypt definition and execution data with a customer-managed key (HLD_GCP_268)
# Cloud Workflows must log step calls (HLD_GCP_269)
resource "google_workflows_workflow" "fail" {
  name           = "workflow-fail"
  project        = "gcp-bridgecrew-deployment"
  region         = "us-central1"
  call_log_level = "LOG_NONE"

  source_contents = <<-EOF
  - step1:
      call: http.get
      args:
        url: https://example.com
  EOF
}
