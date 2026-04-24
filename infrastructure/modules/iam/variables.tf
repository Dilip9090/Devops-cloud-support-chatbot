variable "name_prefix" {
  type        = string
  description = "Prefix for IAM resource names."
}

variable "history_bucket_name" {
  type        = string
  description = "S3 bucket name for chat history access."
}
