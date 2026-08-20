module "vpc" {
  source          = "./modules/vpc"
}

module "ecr" {
  source = "./modules/ecr"
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
