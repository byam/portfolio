data "aws_route53_zone" "custom_domain" {
  name = var.domain_name
}

resource "aws_route53_record" "portfolio_root" {
  zone_id = data.aws_route53_zone.custom_domain.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.portfolio.domain_name
    zone_id                = aws_cloudfront_distribution.portfolio.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_portfolio" {
  zone_id = data.aws_route53_zone.custom_domain.zone_id
  name    = var.domain_name_www
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.portfolio.domain_name
    zone_id                = aws_cloudfront_distribution.portfolio.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_zone" "api_custom_domain" {
  name = var.api_domain_name
}

# resource "aws_route53_record" "api_gateway" {
#   zone_id = aws_route53_zone.api_custom_domain.zone_id
#   name    = var.api_domain_name
#   type    = "CNAME"
#   records = [aws_api_gateway_domain_name.api_custom_domain.regional_domain_name]
#   ttl     = 300
# }
