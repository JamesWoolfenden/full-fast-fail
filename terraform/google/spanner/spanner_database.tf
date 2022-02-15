# fails
# CKV_GCP_93
resource "google_spanner_database" "fail" {
  instance = google_spanner_instance.example.name
  name     = "my-database"
  ddl = [
    "CREATE TABLE t1 (t1 INT64 NOT NULL,) PRIMARY KEY(t1)",
    "CREATE TABLE t2 (t2 INT64 NOT NULL,) PRIMARY KEY(t2)",
  ]
  deletion_protection = false
  #   encryption_config {
  #     kms_key_name=
  #   }
}

resource "google_spanner_instance" "example" {
  config       = "regional-us-central1"
  display_name = "Test Spanner Instance"
  num_nodes    = 2
  labels = {
    "foo" = "bar"
  }
}
