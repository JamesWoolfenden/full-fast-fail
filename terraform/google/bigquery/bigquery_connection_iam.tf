# fails
# todo check big query isnt to public

resource "google_bigquery_connection_iam_policy" "json" {
  project       = google_bigquery_connection.connection.project
  location      = google_bigquery_connection.connection.location
  connection_id = google_bigquery_connection.connection.connection_id
  policy_data   = jsonencode()
}

resource "google_bigquery_connection_iam_policy" "heredoc" {
  project       = google_bigquery_connection.connection.project
  location      = google_bigquery_connection.connection.location
  connection_id = google_bigquery_connection.connection.connection_id
  policy_data   = <<HERE
{
    "bindings": [{
      "role": "roles/viewer",
      "members": ["allUsers"]
    }]
}
HERE
}

resource "google_bigquery_connection_iam_binding" "fail" {
  project       = google_bigquery_connection.connection.project
  location      = google_bigquery_connection.connection.location
  connection_id = google_bigquery_connection.connection.connection_id
  role          = "roles/viewer"
  members = [
    "allUsers",
  ]
}

resource "google_bigquery_connection_iam_member" "fail" {
  project       = google_bigquery_connection.connection.project
  location      = google_bigquery_connection.connection.location
  connection_id = google_bigquery_connection.connection.connection_id
  role          = "roles/viewer"
  member        = "allUsers"
}
