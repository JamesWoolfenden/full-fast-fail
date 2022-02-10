# fails
# todo

resource "google_container_cluster" "positive2" {
  name               = "marcellus-wallace"
  location           = "us-central1-a"
  initial_node_count = 3
  pod_security_policy_config {
    enabled = false
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}
