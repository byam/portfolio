data "aws_route53_zone" "custom_domain" {
  name = var.domain_name
}

# Create a record for the www domain for static website hosting
resource "aws_route53_record" "www-portfolio" {
  zone_id = data.aws_route53_zone.custom_domain.zone_id
  name    = var.domain_name_www
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.www-portfolio.domain_name
    zone_id                = aws_cloudfront_distribution.www-portfolio.hosted_zone_id
    evaluate_target_health = false
  }
}

# Create a record for the root domain for static website hosting
resource "aws_route53_record" "portfolio" {
  zone_id = data.aws_route53_zone.custom_domain.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_cloudfront_distribution.portfolio.domain_name
    zone_id                = aws_cloudfront_distribution.portfolio.hosted_zone_id
    evaluate_target_health = false
  }
}
