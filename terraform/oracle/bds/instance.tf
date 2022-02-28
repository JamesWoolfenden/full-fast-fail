# fails
# todo is_secure=true
resource "oci_bds_bds_instance" "test_bds_instance" {
  #Required
  cluster_admin_password = var.bds_instance_cluster_admin_password
  cluster_public_key     = var.bds_instance_cluster_public_key
  cluster_version        = var.bds_instance_cluster_version
  compartment_id         = var.compartment_id
  display_name           = var.bds_instance_display_name
  is_high_availability   = var.bds_instance_is_high_availability
  is_secure              = var.bds_instance_is_secure
  master_node {
    #Required
    shape                    = var.bds_instance_nodes_shape
    subnet_id                = oci_core_subnet.test_subnet.id
    block_volume_size_in_gbs = var.bds_instance_nodes_block_volume_size_in_gbs
    number_of_nodes          = var.bds_instance_number_of_nodes
  }
  util_node {
    #Required
    shape                    = var.bds_instance_nodes_shape
    subnet_id                = oci_core_subnet.test_subnet.id
    block_volume_size_in_gbs = var.bds_instance_nodes_block_volume_size_in_gbs
    number_of_nodes          = var.bds_instance_number_of_nodes
  }
  worker_node {
    #Required
    shape                    = var.bds_instance_nodes_shape
    subnet_id                = oci_core_subnet.test_subnet.id
    block_volume_size_in_gbs = var.bds_instance_nodes_block_volume_size_in_gbs
    number_of_nodes          = var.bds_instance_number_of_nodes
  }

  #Optional
  defined_tags  = var.bds_instance_defined_tags
  freeform_tags = var.bds_instance_freeform_tags
  network_config {

    #Optional
    cidr_block              = var.bds_instance_network_config_cidr_block
    is_nat_gateway_required = var.bds_instance_network_config_is_nat_gateway_required
  }
}
