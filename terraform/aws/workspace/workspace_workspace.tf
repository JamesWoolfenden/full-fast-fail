#fail
#CKV_AWS_155: "Ensure that Workspace user volumes are encrypted"
#CKV_AWS_156: "Ensure that Workspace root volumes are encrypted"

#tfsec
#AWS084 Resource 'aws_workspaces_workspace.fail' should have user volume encryption enabled

resource "aws_workspaces_workspace" "fail" {
  directory_id = aws_workspaces_directory.main.id
  bundle_id    = data.aws_workspaces_bundle.bundle.id
  user_name    = var.user_name

  workspace_properties {
    compute_type_name                         = "VALUE"
    user_volume_size_gib                      = 10
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

  tags = var.common_tags
}
