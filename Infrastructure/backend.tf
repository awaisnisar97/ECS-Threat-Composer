# Terraform, don't store the state for this infrastructure project locally. Store it in this existing S3 bucket, at this specific key.
terraform {
  backend "s3" {
    bucket       = "ecs-threat-composer"
    key          = "infrastructure/terraform.tfstate"
    region       = "eu-west-2"
    use_lockfile = true
  }
}