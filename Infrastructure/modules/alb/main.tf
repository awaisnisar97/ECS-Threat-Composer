# creating an application load balancer with the specified name, security group, and public subnets
resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = true

  # enabling access logs for the ALB and specifying the S3 bucket and prefix for storing the logs
  access_logs {
    bucket  = var.alb_access_log_bucket_name
    prefix  = "test-lb"
    enabled = true
  }
}

# creating a target group for the ALB with the specified name, port, protocol, and VPC ID
resource "aws_lb_target_group" "alb_tg" {
  name        = var.alb_target_group_name
  port        = var.alb_target_group_port
  protocol    = var.alb_target_group_protocol
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    path                = "/health"
  }
}

# creating a listener for the ALB to handle HTTP traffic
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    # redirecting HTTP traffic to HTTPS with a 301 status code
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# creating a listener for the ALB to handle HTTPS traffic with the specified SSL certificate
resource "aws_lb_listener" "https_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn = var.alb_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

# creating a security group for the ALB with the specified name, description, and VPC ID
resource "aws_security_group" "alb_sg" {
  name        = var.alb_security_group_name
  description = "Security group for the ALB"
  vpc_id      = var.vpc_id
}

# creating an ingress rule for the ALB security group to allow inbound HTTP traffic on port 80 from any IP address
resource "aws_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.alb_sg.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

# creating an ingress rule for the ALB security group to allow inbound HTTPS traffic on port 443 from any IP address
resource "aws_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.alb_sg.id
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

# creating an egress rule for the ALB security group to allow all outbound traffic to any IP address
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.alb_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}
