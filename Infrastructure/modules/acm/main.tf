# create an ACM certificate for the domain
resource "aws_acm_certificate" "cert" {
  domain_name       = var.certificate_domain_name
  validation_method = "DNS"


  lifecycle {
    create_before_destroy = true
  }
}

# look up the existing public route 53 hosted zone for the domain
data "aws_route53_zone" "cert" {
  name         = var.route53_hosted_zone_name
  private_zone = false
}

# create a Route 53 record for the ACM certificate validation
resource "aws_route53_record" "cert" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  # allow overwriting the record if it already exists

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.cert.zone_id
}

# validate the ACM certificate using the Route 53 record
resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert : record.fqdn]
}