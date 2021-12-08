# fails
# CKV_LIN_5: "Ensure Inbound Firewall Policy is not set to ACCEPT"
# CKV_LIN_6: "Ensure Outbound Firewall Policy is not set to ACCEPT"

resource "linode_firewall" "test" {
  inbound_policy  = "ACCEPT"
  outbound_policy = "ACCEPT"
}
