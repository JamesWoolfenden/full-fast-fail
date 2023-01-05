# fails
# todo does not define public access

resource "google_bigquery_datapolicy_data_policy_iam_policy" "policy" {
  provider       = google-beta
  project        = google_bigquery_datapolicy_data_policy.data_policy.project
  location       = google_bigquery_datapolicy_data_policy.data_policy.location
  data_policy_id = google_bigquery_datapolicy_data_policy.data_policy.data_policy_id
  policy_data    = jsonencode()
}

resource "google_bigquery_datapolicy_data_policy_iam_policy" "policy" {
  provider       = google-beta
  project        = google_bigquery_datapolicy_data_policy.data_policy.project
  location       = google_bigquery_datapolicy_data_policy.data_policy.location
  data_policy_id = google_bigquery_datapolicy_data_policy.data_policy.data_policy_id
  policy_data    = <<HERE
HERE
}


resource "google_bigquery_datapolicy_data_policy_iam_binding" "binding" {
  provider       = google-beta
  project        = google_bigquery_datapolicy_data_policy.data_policy.project
  location       = google_bigquery_datapolicy_data_policy.data_policy.location
  data_policy_id = google_bigquery_datapolicy_data_policy.data_policy.data_policy_id
  role           = "roles/viewer"
  members = [
    "allUsers",
  ]
}

resource "google_bigquery_datapolicy_data_policy_iam_member" "member" {
  provider       = google-beta
  project        = google_bigquery_datapolicy_data_policy.data_policy.project
  location       = google_bigquery_datapolicy_data_policy.data_policy.location
  data_policy_id = google_bigquery_datapolicy_data_policy.data_policy.data_policy_id
  role           = "roles/viewer"
  member         = "allUsers"
}
