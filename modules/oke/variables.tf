variable "compartment_ocid" {
  type        = string
  description = "Compartment OCID for OKE"
}
variable "vcn_id" {
  type        = string
  description = "VCN ID for OKE"
}
variable "public_subnet_id" {
  type        = string
  description = "Public Subnet ID for OKE API endpoint"
}
variable "private_subnet_id" {
  type        = string
  description = "Private Subnet ID for OKE worker nodes"
}
variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for OKE"
}