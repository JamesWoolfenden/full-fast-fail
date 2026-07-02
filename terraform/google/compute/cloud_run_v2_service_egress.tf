# fail
# Cloud Run ALL_TRAFFIC VPC egress requires Cloud NAT on the target network (HLD_GCP_291)
resource "google_cloud_run_v2_service" "fail" {
  name     = "run-service-egress-fail"
  location = "us-central1"
  project  = "gcp-bridgecrew-deployment"

  template {
    containers {
      image = "gcr.io/my-project/service@sha256:0000000000000000000000000000000000000000000000000000000000000000"
    }

    vpc_access {
      connector = google_vpc_access_connector.egress_fail.id
      egress    = "ALL_TRAFFIC"
    }
  }
}

resource "google_vpc_access_connector" "egress_fail" {
  name    = "vpc-conn-egress-fail"
  project = "gcp-bridgecrew-deployment"
  region  = "us-central1"
  network = google_compute_network.egress_fail.name
}

resource "google_compute_network" "egress_fail" {
  name                    = "network-egress-fail"
  project                 = "gcp-bridgecrew-deployment"
  auto_create_subnetworks = false
}
