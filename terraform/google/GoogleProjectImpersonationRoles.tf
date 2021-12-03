
            resource "google_project_iam_binding" "project" {
              project = "your-project-id"
              role    = "roles/resourcemanager.organizationAdmin"

              members = [
                "user",
                "serviceAccount:test-compute@developer.gserviceaccount.com",
              ]
            }
