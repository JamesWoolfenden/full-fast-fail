resource "aws_ecrpublic_repository" "foo" {
  provider = aws.us_east_1

  repository_name = "bar"

  catalog_data {
    about_text        = "About Text"
    architectures     = ["ARM"]
    description       = "Description"
    logo_image_blob   = filebase64(image.png)
    operating_systems = ["Linux"]
    usage_text        = "Usage Text"
  }
}
