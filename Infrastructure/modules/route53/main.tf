# look up the existing public route 53 hosted zone for the domain

data "aws_route53_zone" "selected" {
  name         = var.route53_hosted_zone_name
  private_zone = false
}

# create a Route 53 record for the ALB

resource "aws_route53_record" "alb" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.route53_record_name
  type    = "A"

# create an alias record for the ALB
  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}
