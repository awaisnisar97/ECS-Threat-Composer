variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
}

variable "alb_access_log_bucket_name" {
  description = "The name of the S3 bucket for ALB access logs"
  type        = string
}

variable "alb_target_group_name" {
  description = "The name of the ALB target group"
  type        = string
}

variable "alb_target_group_port" {
  description = "The port on which the ALB target group will receive traffic"
  type        = number
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "alb_target_group_protocol" {
  description = "The protocol used by the ALB target group (HTTP or HTTPS)"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the ALB will be deployed"
  type        = string
}

variable "alb_certificate_arn" {
  description = "The ARN of the SSL certificate for HTTPS listener"
  type        = string
}

variable "alb_security_group_name" {
  description = "The name of the security group for the ALB"
  type        = string
}

