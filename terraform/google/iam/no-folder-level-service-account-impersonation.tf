
resource "google_folder_iam_binding" "folder-123" {
  folder = "folder-123"
  role   = "roles/iam.serviceAccountUser"
}
