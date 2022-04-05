# fails
# CKV_GCP_98: "Ensure that Dataproc clusters are not anonymously or publicly accessible"
resource "google_dataproc_cluster_iam_binding" "fail1" {
  cluster = "my-public-cluster-binding1"
  role    = "roles/dataproc.hubAgent"
  members = [
    "allAuthenticatedUsers",
  ]
}
