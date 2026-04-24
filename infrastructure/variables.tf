variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "ap-south-1"
}

variable "name_prefix" {
  description = "Prefix for AWS resource names."
  type        = string
  default     = "ollama-chat"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability Zones to use for public and private subnets."
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances. Use Amazon Linux 2023 or Ubuntu 22.04." 
  type        = string
  default     = "ami-0c2b8ca1dad447f8a"
}

variable "instance_type" {
  description = "EC2 instance type for Ollama inference servers."
  type        = string
  default     = "g5.xlarge"
}

variable "key_name" {
  description = "Optional EC2 key pair name for SSH access. Leave empty to disable."
  type        = string
  default     = ""
}

variable "ssh_cidr" {
  description = "CIDR block allowed to SSH into EC2 instances. Leave empty to disable SSH access."
  type        = string
  default     = ""
}

variable "asg_min_size" {
  description = "Minimum size of the Auto Scaling Group."
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Maximum size of the Auto Scaling Group."
  type        = number
  default     = 2
}

variable "asg_desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group."
  type        = number
  default     = 2
}

variable "acm_certificate_arn" {
  description = "Optional ACM certificate ARN for HTTPS on the ALB."
  type        = string
  default     = ""
}

variable "ollama_model" {
  description = "Model to pre-pull in Ollama."
  type        = string
  default     = "llama3"
}

variable "enable_waf" {
  description = "Whether to attach AWS WAF to the ALB."
  type        = bool
  default     = false
}

variable "waf_rate_limit" {
  description = "Maximum requests per IP over 5 minutes for the WAF rate-based rule."
  type        = number
  default     = 60
}
