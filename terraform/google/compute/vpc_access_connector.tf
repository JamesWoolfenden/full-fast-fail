# fail
# VPC Access Connector must not use the default VPC network (HLD_GCP_284)
resource "google_vpc_access_connector" "fail" {
  name    = "vpc-connector-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"
  network = "default"
}
