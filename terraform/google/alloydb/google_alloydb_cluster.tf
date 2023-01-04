# fails
# todo automated_backup_policy= enabled

resource "google_alloydb_cluster" "full" {
  provider   = google-beta
  cluster_id = "alloydb-cluster-full"
  location   = "us-central1"
  network    = "projects/${data.google_project.project.number}/global/networks/${google_compute_network.default.name}"

  initial_user {
    user     = "alloydb-cluster-full"
    password = "alloydb-cluster-full"
  }

  automated_backup_policy {
    location      = "us-central1"
    backup_window = "1800s"
    enabled       = true

    weekly_schedule {
      days_of_week = ["MONDAY"]

      start_times {
        hours   = 23
        minutes = 0
        seconds = 0
        nanos   = 0
      }
    }

    quantity_based_retention {
      count = 1
    }

    labels = {
      test = "alloydb-cluster-full"
    }
  }

  labels = {
    test = "alloydb-cluster-full"
  }
}

data "google_project" "project" {
  provider = google-beta
}

resource "google_compute_network" "default" {
  provider = google-beta
  name     = "alloydb-cluster-full"
}
