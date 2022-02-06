
resource "google_project_iam_binding" "fail" {
  members = [
    "user:test@example.com",
  ]
}

resource "google_project_iam_member" "fail" {
  member = "user:test@example.com"
}
