resource "oci_bastion_bastion" "my_bastion" {
  compartment_id = var.compartment_ocid
  target_subnet_id = var.private_subnet_id
  display_name   = "MyBastion"
  bastion_type   = "STANDARD"
  # ...additional configuration...
}
