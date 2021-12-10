# fails
# todo
# tfsec
# Resource 'digitalocean_spaces_bucket.fail' does not have versioning block specified
resource "digitalocean_spaces_bucket" "fail2" {
  name          = "foobar"
  region        = "nyc3"
  force_destroy = true
}
