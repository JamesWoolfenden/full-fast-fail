
resource "google_folder_iam_member" "folder-123" {
  folder = "folder-123"
  role   = "roles/whatever"
  member = "123-compute@developer.gserviceaccount.com"
}
