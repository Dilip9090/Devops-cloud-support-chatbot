variable "name_prefix" {
  type        = string
  description = "Prefix for VPC resource names."
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones for subnet creation."
}
