output "static_assets_bucket_name" {
  value = aws_s3_bucket.static_assets.bucket
}

output "chat_history_bucket_name" {
  value = aws_s3_bucket.chat_history.bucket
}
