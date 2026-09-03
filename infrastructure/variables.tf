variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "threat-composer-vpc"
}

variable "publicsubnet1_az" {
  description = "The availability zone for the first public subnet"
  type        = string
  default     = "eu-west-2a"
}

variable "publicsubnet2_az" {
  description = "The availability zone for the second public subnet"
  type        = string
  default     = "eu-west-2b"
}

variable "privatesubnet1_az" {
  description = "The availability zone for the first private subnet"
  type        = string
  default     = "eu-west-2a"
}

variable "privatesubnet2_az" {
  description = "The availability zone for the second private subnet"
  type        = string
  default     = "eu-west-2b"
}

variable "publicsubnet1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
  default     = "10.0.1.0/24"
}


variable "publicsubnet2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "privatesubnet1_cidr" {
  description = "The CIDR block for the first private subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "privatesubnet2_cidr" {
  description = "The CIDR block for the second private subnet"
  type        = string
  default     = "10.0.4.0/24"
}


variable "ecr_image_tag" {
  description = "The tag of the container image used by ECS"
  type        = string
  default     = "latest"
}

variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
  default     = "threat-composer-cluster"
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
  default     = "threat-composer-service"
}

variable "ecs_task_execution_role_name" {
  type    = string
  default = "threat-composer-ecs-execution-role"
}

variable "ecs_task_cpu" {
  description = "The CPU units for the ECS task"
  type        = number
  default     = 256
}

variable "ecs_task_memory" {
  description = "The memory (in MiB) for the ECS task"
  type        = number
  default     = 512
}

variable "ecs_service_desired_count" {
  description = "The desired number of ECS service tasks"
  type        = number
  default     = 2
}

variable "ecs_container_name" {
  description = "The name of the ECS container"
  type        = string
  default     = "threat-composer"
}

variable "ecs_container_port" {
  description = "The port on which the ECS container listens"
  type        = number
  default     = 8080
}


variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "ecs_task_family" {
  description = "The family name of the ECS task definition"
  type        = string
  default     = "threat-composer-task"
}

variable "alb_name" {
  description = "The name of the Application Load Balancer"
  type        = string
  default     = "threat-composer-alb"
}
variable "alb_access_log_bucket_name" {
  description = "The name of the S3 bucket for ALB access logs"
  type        = string
  default     = "ecs-threat-composer"
}

variable "alb_target_group_name" {
  description = "The name of the ALB target group"
  type        = string
  default     = "threat-composer-tg"
}

variable "alb_target_group_port" {
  description = "The port on which the ALB target group will receive traffic"
  type        = number
  default     = 8080
}

variable "alb_target_group_protocol" {
  description = "The protocol used by the ALB target group (HTTP or HTTPS)"
  type        = string
  default     = "HTTP"
}

variable "alb_security_group_name" {
  description = "The name of the security group for the ALB"
  type        = string
  default     = "threat-composer-alb-sg"
}

variable "certificate_domain_name" {
  description = "The domain name for the ACM certificate"
  type        = string
  default     = "tm.awaiscloud.click"
}

variable "route53_hosted_zone_name" {
  description = "The name of the Route 53 hosted zone"
  type        = string
  default     = "awaiscloud.click"
}

variable "route53_record_name" {
  description = "The DNS record name for the ALB"
  type        = string
  default     = "tm"
}

