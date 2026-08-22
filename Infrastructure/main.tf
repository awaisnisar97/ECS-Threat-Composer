module "vpc" {
  source = "./modules/vpc"

}

module "ecr" {
  source   = "./modules/ecr"
  ecr_name = var.ecr_name
}

module "ecs" {
  source = "./modules/ecs"
}

module "alb" {
  source = "./modules/alb"
}

module "acm" {
  source = "./modules/acm"
}

module "route53" {
  source = "./modules/route53"
}
