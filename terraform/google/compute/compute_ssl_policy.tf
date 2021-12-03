
resource "google_compute_ssl_policy" "modern-profile" {
  name    = "nonprod-ssl-policy"
  profile = "MODERN"
}
