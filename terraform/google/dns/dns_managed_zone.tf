
resource "google_dns_managed_zone" "fail1" {
  # Fail because visibility is public and dnssec block is missing
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "public"

}

resource "google_dns_managed_zone" "fail2" {
  # Fail because visibility is public and value is off
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  visibility = "public"
  dnssec_config {
    state = "off"
  }
}

resource "google_dns_managed_zone" "fail3" {
  # Fail because visibility is public (by default) and value is off
  name        = "zone"
  dns_name    = "services.example.com."
  description = "Example DNS Service Directory zone"

  dnssec_config {
    state = "off"
  }
}
