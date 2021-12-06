# fails
# CKV_GCP_17: "Ensure that RSASHA1 is not used for the zone-signing and key-signing keys in Cloud DNS DNSSEC"
# CKV_GCP_16: "Ensure that DNSSEC is enabled for Cloud DNS"

resource "google_dns_managed_zone" "fail" {
  name        = "example-zone"
  dns_name    = "example-de13he3.com."
  description = "Example DNS zone"
  dnssec_config {
    state = "off"
    default_key_specs {
      algorithm  = "rsasha1"
      key_type   = "zoneSigning"
      key_length = "1024"
    }
    default_key_specs {
      algorithm  = "rsasha256"
      key_type   = "keySigning"
      key_length = 2048
    }
  }
}
