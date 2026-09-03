# Creates and configures S3 bucket for Terraform state storage for the bucket and sets up the backend configuration.

resource "aws_s3_bucket" "terraform_state" {
  bucket = "ecs-threat-composer"
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

terraform {
  backend "s3" {
    bucket       = "ecs-threat-composer"
    key          = "bootstrap/terraform.tfstate"
    region       = "eu-west-2"
    use_lockfile = true
  }
}

# this creates ecr repository and threat_composer is the local terraform name for that resource 

resource "aws_ecr_repository" "threat_composer" {
  name                 = var.ecr_name
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

variable "ecr_name" {
  description = "The name of the ECR repository"
  type        = string
  default     = "threat-composer"
}


# output the ECR repository URL

output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.threat_composer.repository_url
}

