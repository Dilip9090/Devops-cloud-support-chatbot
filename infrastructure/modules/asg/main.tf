resource "aws_launch_template" "ollama" {
  name_prefix   = "${var.name_prefix}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  iam_instance_profile {
    name = var.iam_instance_profile_name
  }

  vpc_security_group_ids = var.security_group_ids

  key_name = var.key_name != "" ? var.key_name : null

  user_data = base64encode(templatefile("${path.module}/user_data.tpl", {
    ollama_model = var.ollama_model
  }))

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.name_prefix}-instance"
    }
  }
}

resource "aws_autoscaling_group" "ollama" {
  name                      = "${var.name_prefix}-asg"
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  launch_template {
    id      = aws_launch_template.ollama.id
    version = "$Latest"
  }
  vpc_zone_identifier        = var.vpc_zone_identifier
  health_check_type          = "EC2"
  health_check_grace_period  = 60
  force_delete               = false
  wait_for_capacity_timeout  = "10m"

  tag {
    key                 = "Name"
    value               = "${var.name_prefix}-asg-instance"
    propagate_at_launch = true
  }
}
