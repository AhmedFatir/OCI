resource "oci_kms_vault" "my_vault" {
  compartment_id = var.compartment_ocid
  display_name   = "MyVault"
  vault_type     = "DEFAULT"
}
