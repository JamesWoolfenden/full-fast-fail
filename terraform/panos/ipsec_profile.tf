# fails
# Ensure IPsec profiles do not specify use of insecure authentication algorithmsCheckov (CKV_PAN_12)
# Ensure IPsec profiles do not specify use of insecure encryption algorithmsCheckov (CKV_PAN_11)

resource "panos_ipsec_crypto_profile" "fail1" {
  name            = "fail1"
  authentications = ["sha1"]
  encryptions     = ["des"]
  dh_group        = "group14"
  lifetime_type   = "hours"
  lifetime_value  = 4
  lifesize_type   = "mb"
  lifesize_value  = 1
}
