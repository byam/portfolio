# #######################################
# # Certificates for domain
# #######################################
resource "aws_acm_certificate" "cert_portfolio" {
  domain_name               = var.domain_name
  subject_alternative_names = [var.domain_name_www, var.api_domain_name]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_portfolio_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert_portfolio.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = data.aws_route53_zone.custom_domain.zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "cert_portfolio" {
  certificate_arn         = aws_acm_certificate.cert_portfolio.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_portfolio_validation : record.fqdn]
}
