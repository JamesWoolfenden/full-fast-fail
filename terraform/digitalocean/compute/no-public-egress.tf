# fails
# todo
# tfsec

# Resource 'digitalocean_firewall.fail' defines a fully open outbound_rule.

resource "digitalocean_firewall" "fail" {
  name = "ssh-to-world"

  droplet_ids = [digitalocean_droplet.web.id]
  outbound_rule {
    protocol              = "tcp"
    port_range            = "80"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
