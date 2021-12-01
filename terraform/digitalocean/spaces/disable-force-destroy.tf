
resource "digitalocean_spaces_bucket" "fail" {
  name   		= "foobar"
  region 		= "nyc3"
  force_destroy = true
}
