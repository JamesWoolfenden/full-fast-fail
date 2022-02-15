# fails
# CKV_GCP_89
resource "google_notebooks_instance" "fail1" {
  name         = "fail1-instance"
  location     = "us-west1-a"
  machine_type = "e2-medium"
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-latest-cpu"
  }

  # This configures a public Vertex AI instance
  no_public_ip = false
}
