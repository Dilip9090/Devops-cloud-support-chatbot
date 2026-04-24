resource "aws_lb" "app" {
  name               = "${var.name_prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids
  idle_timeout       = 60
  enable_deletion_protection = false
  tags = {
    Name = "${var.name_prefix}-alb"
  }
}

resource "aws_lb_target_group" "ollama" {
  name        = "${var.name_prefix}-tg"
  port        = 11434
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    path                = "/api/health"
    interval            = 30
    timeout             = 5
    unhealthy_threshold = 2
    healthy_threshold   = 3
    matcher             = "200-399"
  }

  tags = {
    Name = "${var.name_prefix}-tg"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ollama.arn
  }
}

resource "aws_lb_listener" "https" {
  count             = var.acm_certificate_arn != "" ? 1 : 0
  load_balancer_arn = aws_lb.app.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ollama.arn
  }
}
