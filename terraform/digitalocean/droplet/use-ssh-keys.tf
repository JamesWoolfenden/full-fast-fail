# fails
# todo
# tfsec
# Resource 'digitalocean_droplet.good_example' does not define ssh_keys

resource "digitalocean_droplet" "fail" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "nyc2"
  size   = "s-1vcpu-1gb"
}
