
resource "linode_firewall" "test" {
  inbound_policy  = "ACCEPT"
  outbound_policy = "ACCEPT"
}
