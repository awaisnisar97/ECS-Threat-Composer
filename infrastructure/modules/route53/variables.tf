variable "route53_hosted_zone_name" {
  description = "The name of the Route 53 hosted zone for the domain"
  type        = string
}

variable "route53_record_name" {
  description = "The name of the Route 53 record for the ALB"
  type        = string
}

variable "alb_dns_name" {
  description = "The DNS name of the ALB"
  type        = string
}

variable "alb_zone_id" {
  description = "The zone ID of the ALB"
  type        = string
}
