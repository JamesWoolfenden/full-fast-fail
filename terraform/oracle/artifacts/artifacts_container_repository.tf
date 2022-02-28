# fails
# todo is_immutable is true
# is_public is flase

resource "oci_artifacts_container_repository" "test_container_repository" {
  #Required
  compartment_id = var.compartment_id
  display_name   = var.container_repository_display_name

  #Optional
  is_immutable = var.container_repository_is_immutable
  is_public    = var.container_repository_is_public
  readme {
    #Required
    content = var.container_repository_readme_content
    format  = var.container_repository_readme_format
  }
}
