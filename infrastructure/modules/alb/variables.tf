variable "name_prefix" {
  type        = string
  description = "Prefix for ALB resources."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID used by the target group."
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs for the ALB."
}

variable "alb_security_group_id" {
  type        = string
  description = "Security group attached to the ALB."
}

variable "acm_certificate_arn" {
  type        = string
  description = "Optional ACM certificate ARN for HTTPS listener."
  default     = ""
}
