variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "ecs_task_execution_role_name" {
  description = "Name of the ECS task execution IAM role"
  type        = string
}

variable "ecs_task_family" {
  description = "Family name for the ECS task definition"
  type        = string
}

variable "ecs_task_cpu" {
  description = "CPU units allocated to the ECS task"
  type        = number
}

variable "ecs_task_memory" {
  description = "Memory allocated to the ECS task in MiB"
  type        = number
}

variable "ecs_container_name" {
  description = "Name of the container in the ECS task definition"
  type        = string
}

variable "ecr_repository_url" {
  description = "URL of the ECR repository containing the application image"
  type        = string
}

variable "ecr_image_tag" {
  description = "Tag of the container image to deploy"
  type        = string
}

variable "ecs_container_port" {
  description = "Port the ECS container listens on"
  type        = number
}

variable "aws_region" {
  description = "AWS region where the ECS resources are deployed"
  type        = string
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "ecs_service_desired_count" {
  description = "Number of ECS tasks the service should maintain"
  type        = number
}

variable "target_group_arn" {
  description = "ARN of the ALB target group used by the ECS service"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of the private subnets used by ECS tasks"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC where the ECS security group is created"
  type        = string
}

variable "load_balancer_sg_id" {
  description = "ID of the security group attached to the application load balancer"
  type        = string
}