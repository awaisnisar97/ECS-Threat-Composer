output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = data.aws_ecr_repository.threat_composer.repository_url
}

output "ecs_cluster_id" {
  description = "The ID of the ECS cluster"
  value       = module.ecs.ecs_cluster_id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

output "application_url" {
  description = "The URL of the application"
  value       = "https://tm.awaiscloud.click"
}