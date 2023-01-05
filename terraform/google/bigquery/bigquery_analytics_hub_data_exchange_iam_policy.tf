# fails
# ensure policy does not define public access

resource "google_bigquery_analytics_hub_data_exchange_iam_policy" "policy" {
  project          = google_bigquery_analytics_hub_data_exchange.data_exchange.project
  location         = google_bigquery_analytics_hub_data_exchange.data_exchange.location
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.data_exchange.data_exchange_id
  policy_data      = jsonencode()
}

resource "google_bigquery_analytics_hub_data_exchange_iam_policy" "here" {
  project          = google_bigquery_analytics_hub_data_exchange.data_exchange.project
  location         = google_bigquery_analytics_hub_data_exchange.data_exchange.location
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.data_exchange.data_exchange_id
  policy_data      = <<HERE

HERE
}

resource "google_bigquery_analytics_hub_data_exchange_iam_binding" "binding" {
  project          = google_bigquery_analytics_hub_data_exchange.data_exchange.project
  location         = google_bigquery_analytics_hub_data_exchange.data_exchange.location
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.data_exchange.data_exchange_id
  role             = "roles/viewer"
  members = [
    "allUsers",
  ]
}

resource "google_bigquery_analytics_hub_data_exchange_iam_member" "member" {
  project          = google_bigquery_analytics_hub_data_exchange.data_exchange.project
  location         = google_bigquery_analytics_hub_data_exchange.data_exchange.location
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.data_exchange.data_exchange_id
  role             = "roles/viewer"
  member           = "allUsers"
}
