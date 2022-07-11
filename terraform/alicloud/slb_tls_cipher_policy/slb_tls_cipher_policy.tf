# fails
#  ensure policy is defined with tls 1.2 or greater
resource "alicloud_slb_tls_cipher_policy" "fail" {
  tls_cipher_policy_name = "itsbaditsdverybad"
  tls_versions           = ["TLSv1.1", "TLSv1.2"]
  ciphers                = ["AES256-SHA", "AES256-SHA256", "AES128-GCM-SHA256"]
}
