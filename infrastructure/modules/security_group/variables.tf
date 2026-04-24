variable "name_prefix" {
  type        = string
  description = "Resource name prefix."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to attach security groups."
}

variable "ssh_cidr" {
  type        = string
  description = "CIDR block authorized for SSH."
  default     = ""
}
