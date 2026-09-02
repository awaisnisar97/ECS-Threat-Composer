output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.threat_composer.repository_url
}

output "ecs_cluster_id" {
  description = "The ID of the ECS cluster"
  value       = aws_ecs_cluster.main.id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [aws_subnet.public1.id, aws_subnet.public2.id]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [aws_subnet.private1.id, aws_subnet.private2.id]
}

output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

output "application_url" {
  description = "The URL of the application"
  value       = "https://tm.awaiscloud.click"
}
