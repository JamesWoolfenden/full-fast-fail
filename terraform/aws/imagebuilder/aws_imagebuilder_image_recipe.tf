# fails
# CKV_AWS_200

resource "aws_imagebuilder_image_recipe" "fail" {
  block_device_mapping {
    device_name = "/dev/xvdb"

    # ebs {
    # #   encrypted             = true
    # #   kms_key_id            = aws_kms_key.fail.arn
    #   delete_on_termination = true
    #   volume_size           = 100
    #   volume_type           = "gp2"
    # }

  }

  component {
    component_arn = aws_imagebuilder_component.fail.arn
  }

  name         = "example"
  parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
  version      = "1.0.0"
  tags         = { test = "fail" }
}

data "aws_partition" "current" {}
data "aws_region" "current" {}

# resource "aws_kms_key" "fail" {

# }
