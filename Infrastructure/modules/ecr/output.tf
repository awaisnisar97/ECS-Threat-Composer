# output the ECR repository URL

output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.threat_composer.repository_url
}

