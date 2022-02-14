resource "google_bigtable_instance" "fail" {
  name = "tf-instance"

  cluster {
    cluster_id   = "tf-instance-cluster"
    num_nodes    = 1
    storage_type = "HDD"
    # kms_key_name = "some value"
  }

  labels = {
    my-label = "prod-label"
  }
}
