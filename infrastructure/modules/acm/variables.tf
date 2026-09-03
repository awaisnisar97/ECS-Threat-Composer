variable "certificate_domain_name" {
  description = "The domain name for the ACM certificate"
  type        = string
}

variable "route53_hosted_zone_name" {
  description = "The name of the Route 53 hosted zone for the domain"
  type        = string
}

