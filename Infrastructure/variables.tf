variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "publicsubnet1_az" {
  description = "The availability zone for the first public subnet"
  type        = string
}

variable "publicsubnet2_az" {
  description = "The availability zone for the second public subnet"
  type        = string
}

variable "privatesubnet1_az" {
  description = "The availability zone for the first private subnet"
  type        = string
}

variable "privatesubnet2_az" {
  description = "The availability zone for the second private subnet"
  type        = string
}

variable "publicsubnet1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
}

variable "publicsubnet2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
}

variable "privatesubnet1_cidr" {
  description = "The CIDR block for the first private subnet"
  type        = string
}

variable "privatesubnet2_cidr" {
  description = "The CIDR block for the second private subnet"
  type        = string
}

variable "ecr_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "ecr_image_tag" {
  description = "The tag of the container image used by ECS"
  type        = string
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "ecs_task_execution_role_name" {
  type = string
}

variable "ecs_task_cpu" {
  description = "The CPU units for the ECS task"
  type        = number
}

variable "ecs_task_memory" {
  description = "The memory (in MiB) for the ECS task"
  type        = number
}

variable "ecs_service_desired_count" {
  description = "The desired number of ECS service tasks"
  type        = number
}

variable "ecs_container_name" {
  description = "The name of the ECS container"
  type        = string
}

variable "ecs_container_port" {
  description = "The port on which the ECS container listens"
  type        = number
}


variable "aws_region" {
  description = "The AWS region"
  type        = string
}

variable "ecs_task_family" {
  description = "The family name of the ECS task definition"
  type        = string
}

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

variable "alb_target_group_protocol" {
  description = "The protocol used by the ALB target group (HTTP or HTTPS)"
  type        = string
}

variable "alb_security_group_name" {
  description = "The name of the security group for the ALB"
  type        = string
}

variable "certificate_domain_name" {
  description = "The domain name for the ACM certificate"
  type        = string
}

variable "route53_hosted_zone_name" {
  description = "The name of the Route 53 hosted zone"
  type        = string
}

variable "route53_record_name" {
  description = "The DNS record name for the ALB"
  type        = string
}

