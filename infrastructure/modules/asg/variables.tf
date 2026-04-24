variable "name_prefix" {
  type        = string
  description = "Prefix for ASG resources."
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instances."
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for Ollama hosts."
}

variable "key_name" {
  type        = string
  description = "Optional EC2 key pair name."
}

variable "iam_instance_profile_name" {
  type        = string
  description = "IAM instance profile name to attach to EC2 instances."
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security groups for EC2 instances."
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "Private subnet IDs for ASG launch."
}


variable "min_size" {
  type        = number
  description = "Minimum ASG size."
}

variable "max_size" {
  type        = number
  description = "Maximum ASG size."
}

variable "desired_capacity" {
  type        = number
  description = "Desired ASG capacity."
}

variable "ollama_model" {
  type        = string
  description = "Ollama model to pre-pull in the EC2 bootstrap."
}
