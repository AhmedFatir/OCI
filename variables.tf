variable "compartment_ocid" {
  description = "The OCID of the compartment where the resources will be created"
  type        = string
  validation {
    condition     = length(var.compartment_ocid) > 0
    error_message = "Compartment OCID must be provided"
  }
}