# fails
# CKV_DIO_2: "Ensure the droplet specifies an SSH key"
# tfsec
# DIG003: Resource 'digitalocean_droplet.good_example' does not define ssh_keys

resource "digitalocean_droplet" "good_example" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "nyc2"
  size   = "s-1vcpu-1gb"
}
