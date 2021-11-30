resource "aws_ecr_repository" "name" {
  name                 = "bar"
  image_tag_mutability = "MUTABLE"
}
