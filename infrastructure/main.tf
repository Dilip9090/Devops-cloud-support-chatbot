terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source      = "./modules/vpc"
  name_prefix = var.name_prefix
  vpc_cidr    = var.vpc_cidr
  azs         = var.azs
}

module "security_group" {
  source      = "./modules/security_group"
  name_prefix = var.name_prefix
  vpc_id      = module.vpc.vpc_id
  ssh_cidr    = var.ssh_cidr
}

module "iam" {
  source              = "./modules/iam"
  name_prefix         = var.name_prefix
  history_bucket_name = module.s3.chat_history_bucket_name
}

module "s3" {
  source      = "./modules/s3"
  name_prefix = var.name_prefix
}

module "asg" {
  source                       = "./modules/asg"
  name_prefix                  = var.name_prefix
  ami_id                       = var.ami_id
  instance_type                = var.instance_type
  key_name                     = var.key_name
  desired_capacity             = var.asg_desired_capacity
  min_size                     = var.asg_min_size
  max_size                     = var.asg_max_size
  vpc_zone_identifier          = module.vpc.private_subnet_ids
  security_group_ids           = [module.security_group.ec2_security_group_id]
  iam_instance_profile_name    = module.iam.instance_profile_name
  ollama_model                 = var.ollama_model
}

