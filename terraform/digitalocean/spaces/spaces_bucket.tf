# fails
# CKV_DIO_1: "Ensure the Spaces bucket has versioning enabled"
# CKV_DIO_3: "Ensure the Spaces bucket is private"

# tfsec
# digitalocean-spaces-versioning-enabled
# digitalocean-spaces-acl-no-public-read
# digitalocean-spaces-disable-force-destroy

resource "digitalocean_spaces_bucket" "fail" {
  name          = "public_space"
  region        = "nyc3"
  acl           = "public-read"
  force_destroy = true
}

resource "digitalocean_spaces_bucket_object" "index" {
  region       = digitalocean_spaces_bucket.fail.region
  bucket       = digitalocean_spaces_bucket.fail.name
  key          = "index.html"
  content      = "<html><body><p>This page is empty.</p></body></html>"
  content_type = "text/html"
  acl          = "public-read"
}
