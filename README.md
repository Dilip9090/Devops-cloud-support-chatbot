# Ollama Llama 3 Chat Deployment

This workspace contains a Terraform-based AWS deployment for a ChatGPT-like web app using Ollama's Llama 3 model.

## Contents

- `infrastructure/`: Terraform configuration and reusable modules.
- `chatbot-ui/`: Static frontend files for a simple chat UI.

## How it works

- VPC with private subnets for EC2 instances.
- No public ALB endpoint.
- ASG launches EC2 instances with Ollama installed via user-data.
- EC2 access is restricted to SSH from a specific CIDR or via AWS SSM.
- S3 stores static assets and optional chat history.

## Quick start

1. Review `infrastructure/terraform.tfbackend` and update the S3 bucket and DynamoDB table names.
2. Run:
   ```bash
   cd infrastructure
   terraform init
   terraform plan
   terraform apply
   ```
3. Upload your static site files from `chatbot-ui/` to the `static_assets_bucket` created by Terraform.

## Notes

- There is no public ALB entry point.
- EC2 instances remain in private subnets.
- Access by SSH tunnel:
  ```bash
  ssh -i key.pem -L 11434:localhost:11434 ec2-user@<instance-private-ip>
  ```
  Then open `http://localhost:11434` in your browser.
- Or use AWS SSM Session Manager instead of SSH.
- Adjust `instance_type`, `ami_id`, and `ollama_model` in `infrastructure/variables.tf` for your workload.
