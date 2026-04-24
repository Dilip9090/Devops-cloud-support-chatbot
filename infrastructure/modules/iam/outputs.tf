output "instance_profile_id" {
  value = aws_iam_instance_profile.ollama_profile.id
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ollama_profile.name
}
