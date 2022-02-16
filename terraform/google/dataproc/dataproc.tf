# fails
# CKV_GCP_91: "Ensure Dataproc cluster is encrypted with Customer Supplied Encryption Keys (CSEK)"
resource "google_dataproc_cluster" "fail" {
  name   = "simplecluster"
  region = "us-central1"
  cluster_config {
    # encryption_config{
    #   kms_key_name="SecretSquirrel"
    # }
  }
}
