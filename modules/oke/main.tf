resource "oci_containerengine_cluster" "oke_cluster" {
  name               = "my-oke-cluster"
  compartment_id     = var.compartment_ocid
  vcn_id             = var.vcn_id
  kubernetes_version = "v1.25.5" # Example

  endpoint_config {
    subnet_id = var.public_subnet_id
    is_public_ip_enabled = true
  }
}

resource "oci_containerengine_node_pool" "oke_node_pool" {
  name              = "my-oke-node-pool"
  compartment_id    = var.compartment_ocid
  cluster_id        = oci_containerengine_cluster.oke_cluster.id
  node_shape        = "VM.Standard.E3.Flex"  # Example
  node_config_details {
    placement_configs {
      availability_domain = "Uocm:PHX-AD-1"  # Example
      subnet_id           = var.private_subnet_id
    }
    size = 1
  }
}

resource "oci_containerengine_node_pool" "oke_virtual_node_pool" {
  name                = "my-oke-virtual-node-pool"
  compartment_id      = var.compartment_ocid
  cluster_id          = oci_containerengine_cluster.oke_cluster.id
  is_virtual_node_pool = true
  node_shape          = "VM.Standard.E3.Flex"
  node_config_details {
    placement_configs {
      availability_domain = "Uocm:PHX-AD-1"
      subnet_id           = var.private_subnet_id
    }
    size = 1
  }
}