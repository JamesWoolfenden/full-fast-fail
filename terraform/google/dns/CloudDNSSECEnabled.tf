resource "google_dns_managed_zone" "fail" {
  name        = "example-zone"
  dns_name    = "example-de13he3.com."
  description = "Example DNS zone"
}
