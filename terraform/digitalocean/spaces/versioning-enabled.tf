# fails
# todo
# tfsec
# Resource 'digitalocean_spaces_bucket.fail' does not have versioning block specified

resource "digitalocean_spaces_bucket" "fail3" {
  name   = "foobar"
  region = "nyc3"
}
