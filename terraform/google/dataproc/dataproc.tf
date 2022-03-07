# fails
# Ensure Dataproc Clusters do not have public IPsCheckov (CKV_GCP_103)
# Ensure Dataproc cluster is encrypted with Customer Supplied Encryption Keys (CSEK)Checkov (CKV_GCP_91)
resource "google_dataproc_cluster" "fail" {
  name   = "simplecluster"
  region = "us-central1"
  cluster_config {
    # encryption_config{
    #   kms_key_name="SecretSquirrel"
    # }

    gce_cluster_config {
      zone = "us-central1-a"
      # internal_ip_only=true
    }
  }
}
