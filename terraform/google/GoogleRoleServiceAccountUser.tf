
            resource "google_project_iam_member" "project" {
              project = "your-project-id"
              role    = "roles/iam.serviceAccountUser"
              member  = "user:jane@example.com"
            }
