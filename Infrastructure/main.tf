# this file calls for the variables found in variable.tf and passes them to the stated modules in the modules folder
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name

  publicsubnet1_az  = var.publicsubnet1_az
  publicsubnet2_az  = var.publicsubnet2_az
  privatesubnet1_az = var.privatesubnet1_az
  privatesubnet2_az = var.privatesubnet2_az

  publicsubnet1_cidr  = var.publicsubnet1_cidr
  publicsubnet2_cidr  = var.publicsubnet2_cidr
  privatesubnet1_cidr = var.privatesubnet1_cidr
  privatesubnet2_cidr = var.privatesubnet2_cidr
}

module "ecr" {
  source   = "./modules/ecr"
  ecr_name = var.ecr_name
}

module "ecs" {
  source = "./modules/ecs"

  load_balancer_sg_id          = module.alb.alb_security_group_id
  ecs_service_name             = var.ecs_service_name
  vpc_id                       = module.vpc.vpc_id
  ecs_task_execution_role_name = var.ecs_task_execution_role_name
  ecr_image_tag                = var.ecr_image_tag
  ecs_cluster_name             = var.ecs_cluster_name
  ecs_task_cpu                 = var.ecs_task_cpu
  ecs_task_memory              = var.ecs_task_memory
  ecr_repository_url           = module.ecr.ecr_repository_url
  private_subnet_ids           = module.vpc.private_subnet_ids
  ecs_service_desired_count    = var.ecs_service_desired_count
  ecs_container_name           = var.ecs_container_name
  ecs_container_port           = var.ecs_container_port
  target_group_arn             = module.alb.target_group_arn
  aws_region                   = var.aws_region
  ecs_task_family              = var.ecs_task_family
}

module "alb" {
  source = "./modules/alb"

  alb_name                   = var.alb_name
  alb_access_log_bucket_name = var.alb_access_log_bucket_name
  public_subnet_ids          = module.vpc.public_subnet_ids
  alb_target_group_name      = var.alb_target_group_name
  alb_target_group_port      = var.alb_target_group_port
  alb_target_group_protocol  = var.alb_target_group_protocol
  vpc_id                     = module.vpc.vpc_id
  alb_certificate_arn        = module.acm.certificate_arn
  alb_security_group_name    = var.alb_security_group_name
}

module "acm" {
  source = "./modules/acm"

  certificate_domain_name  = var.certificate_domain_name
  route53_hosted_zone_name = var.route53_hosted_zone_name
}

module "route53" {
  source = "./modules/route53"

  route53_hosted_zone_name = var.route53_hosted_zone_name
  alb_dns_name             = module.alb.alb_dns_name
  alb_zone_id              = module.alb.alb_zone_id
  route53_record_name      = var.route53_record_name
}
