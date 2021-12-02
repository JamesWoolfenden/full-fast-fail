
resource "google_dns_managed_zone" "fail" {
  name        = "example-zone"
  dns_name    = "example-${random_id.rnd.hex}.com."
  description = "Example DNS zone"
  labels = {
    foo = "bar"
  }
  dnssec_config {
    state = "off"
  }
}

resource "random_id" "rnd" {
  byte_length = 4
}
