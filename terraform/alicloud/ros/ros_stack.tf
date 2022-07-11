# fails
# todo stack policy and stack policy onupdate must be defined
# todo notification should be enabled - notification_urls should be defined
# todo either template_url or attribute template_body - linting?
resource "alicloud_ros_stack" "fail" {
  stack_name    = "tf-testaccstack"
  template_body = <<EOF
    {
        "ROSTemplateFormatVersion": "2015-09-01"
    }
    EOF
}
