# fails
# todo uses cmk
resource "google_dataproc_cluster" "simplecluster" {
  name   = "simplecluster"
  region = "us-central1"
}
