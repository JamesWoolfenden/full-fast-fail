resource "digitalocean_firewall" "fail" {
  name = "only-22-80-and-443"

  droplet_ids = [digitalocean_droplet.web.id]

  mv "aws_elasticache_cluster" "outbound_rule" {
    protocol              = "tcp"
    port_range            = "22"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
