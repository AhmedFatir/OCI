# Create Virtual Cloud Network (VCN)
resource "oci_core_vcn" "my_vcn" {
  cidr_block = "10.0.0.0/16"
  compartment_id = var.compartment_ocid
  display_name = "MyVCN"
}

# Create Internet Gateway (for public access)
resource "oci_core_internet_gateway" "my_igw" {
  compartment_id = var.compartment_ocid
  vcn_id        = oci_core_vcn.my_vcn.id
  display_name  = "InternetGateway"
}

# Create Public Subnet
resource "oci_core_subnet" "public_subnet" {
  vcn_id            = oci_core_vcn.my_vcn.id
  cidr_block        = "10.0.1.0/24"
  compartment_id    = var.compartment_ocid
  display_name      = "PublicSubnet"
  dhcp_options_id   = oci_core_vcn.my_vcn.default_dhcp_options_id
  route_table_id    = oci_core_route_table.public_route_table.id
  security_list_ids = [oci_core_vcn.my_vcn.default_security_list_id]
  prohibit_public_ip_on_vnic = false  # Allows public IP assignment
}

# Create Private Subnet 1
resource "oci_core_subnet" "private_subnet_1" {
  vcn_id            = oci_core_vcn.my_vcn.id
  cidr_block        = "10.0.2.0/24"
  compartment_id    = var.compartment_ocid
  display_name      = "PrivateSubnet1"
  dhcp_options_id   = oci_core_vcn.my_vcn.default_dhcp_options_id
  prohibit_public_ip_on_vnic = true  # No public IPs
}

# Create Private Subnet 2
resource "oci_core_subnet" "private_subnet_2" {
  vcn_id            = oci_core_vcn.my_vcn.id
  cidr_block        = "10.0.3.0/24"
  compartment_id    = var.compartment_ocid
  display_name      = "PrivateSubnet2"
  dhcp_options_id   = oci_core_vcn.my_vcn.default_dhcp_options_id
  prohibit_public_ip_on_vnic = true  # No public IPs
}

# Route Table for Public Subnet (Allow Internet Access)
resource "oci_core_route_table" "public_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id        = oci_core_vcn.my_vcn.id
  display_name  = "PublicRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.my_igw.id
  }
}

# Output VCN and Subnet IDs
output "vcn_id" {
  value = oci_core_vcn.my_vcn.id
}

output "public_subnet_id" {
  value = oci_core_subnet.public_subnet.id
}

output "private_subnet_1_id" {
  value = oci_core_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  value = oci_core_subnet.private_subnet_2.id
}
