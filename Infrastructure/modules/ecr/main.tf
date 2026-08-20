# this creates ecr repository and threat_composer is the local terraform name for that resource 

resource "aws_ecr_repository" "threat_composer" {
  name                 = var.ecr_name
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}