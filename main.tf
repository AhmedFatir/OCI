provider "oci" {
  region = "us-ashburn-1" # Change this to your OCI region
}

resource "oci_identity_compartment" "my_compartment" {
  name            = "my-compartment"
  compartment_id  = var.compartment_ocid
  description     = "Compartment for all resources"
  enable_delete   = true
}

module "vcn" {
  source           = "./modules/vcn"
  compartment_ocid = oci_identity_compartment.my_compartment.id
}

module "security" {
  source           = "./modules/security"
  compartment_ocid = oci_identity_compartment.my_compartment.id
}

module "oke" {
  source           = "./modules/oke"
  compartment_ocid = oci_identity_compartment.my_compartment.id
  vcn_id           = module.vcn.vcn_id
  public_subnet_id = module.vcn.public_subnet_id
  private_subnet_id = module.vcn.private_subnet_1_id
  subnet_ids       = [
    module.vcn.public_subnet_id,
    module.vcn.private_subnet_1_id
  ]
}

module "bastion" {
  source           = "./modules/bastion"
  compartment_ocid = oci_identity_compartment.my_compartment.id
  private_subnet_id = module.vcn.private_subnet_1_id
}

module "ocir" {
  source           = "./modules/ocir"
  compartment_ocid = oci_identity_compartment.my_compartment.id
}