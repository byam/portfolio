#######################################
# Certificates for domain
#######################################
resource "aws_acm_certificate" "portfolio" {
  domain_name               = "*.${data.aws_route53_zone.custom_domain.name}"
  subject_alternative_names = ["${data.aws_route53_zone.custom_domain.name}"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    "Name" = "acm-${var.project}"
  }
}

resource "aws_route53_record" "portfolio_validation" {
  for_each = {
    for dvo in aws_acm_certificate.portfolio.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.custom_domain.zone_id
}

resource "aws_acm_certificate_validation" "portfolio_validation" {
  certificate_arn         = aws_acm_certificate.portfolio.arn
  validation_record_fqdns = [for record in aws_route53_record.portfolio_validation : record.fqdn]
}
