# todo
resource "google_spanner_database" "fail" {
  instance = google_spanner_instance.main.name
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
