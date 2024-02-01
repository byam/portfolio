data "aws_route53_zone" "custom_domain" {
  name = var.domain_name
}
