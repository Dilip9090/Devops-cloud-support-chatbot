output "static_assets_bucket" {
  description = "S3 bucket name for static frontend assets."
  value       = module.s3.static_assets_bucket_name
}

output "chat_history_bucket" {
  description = "S3 bucket name for chat history and logs."
  value       = module.s3.chat_history_bucket_name
}

output "asg_name" {
  description = "Name of the Auto Scaling Group."
  value       = module.asg.asg_name
}

output "vpc_id" {
  description = "VPC ID created for the deployment."
  value       = module.vpc.vpc_id
}
