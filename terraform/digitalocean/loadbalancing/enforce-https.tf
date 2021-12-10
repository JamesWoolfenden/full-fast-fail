# fails
# todo -
# check entry_protocol not http
# check target_protocol not http

# tfsec
# Resource 'digitalocean_loadbalancer.fail' uses plain HTTP instead of HTTPS.

resource "digitalocean_loadbalancer" "fail" {
  name   = "fail-1"
  region = "nyc3"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  droplet_ids = [digitalocean_droplet.web.id]
}
