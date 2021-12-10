# fails
# CKV_DIO_4: "Ensure the firewall ingress is not wide open"
# tfsec
# DIO_1: Resource 'digitalocean_firewall.fail' defines a fully open inbound_rule.

resource "digitalocean_firewall" "fail" {
  name = "only-22-80-and-443"

  droplet_ids = [digitalocean_droplet.web.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}
