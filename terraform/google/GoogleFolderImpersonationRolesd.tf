
            resource "google_folder_iam_binding" "folder" {
              folder  = "folders/1234567"
              role    = "roles/editor"

              members = [
                "user:jane@example.com",
                "serviceAccount:test-compute@appspot.gserviceaccount.com",
              ]
            }
