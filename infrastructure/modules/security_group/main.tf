resource "aws_security_group" "ec2" {
  name        = "${var.name_prefix}-ec2-sg"
  description = "Allow SSH access to EC2 instances from a restricted CIDR"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ssh_cidr != "" ? [var.ssh_cidr] : []
    content {
      description = "SSH from allowed CIDR"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-ec2-sg"
  }
}
