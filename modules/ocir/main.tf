resource "oci_artifacts_repository" "ocir_repository" {
  compartment_id = var.compartment_ocid
  display_name   = "MyOCIRRepository"
  repository_type = "GENERIC"
}

resource "oci_artifacts_container_configuration" "ocir_container_configuration" {
  compartment_id = var.compartment_ocid
  is_repository_created_on_first_push = true
  is_scan_enabled = true
}
