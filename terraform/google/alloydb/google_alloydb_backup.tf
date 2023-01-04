

resource "google_alloydb_backup" "default" {
  provider     = google-beta
  location     = "us-central1"
  backup_id    = "alloydb-backup"
  cluster_name = google_alloydb_cluster.default.name

  description = "example description"
  labels = {
    "label" = "key"
  }
  depends_on = [google_alloydb_instance.default]
}
