# resource "aws_cloudfront_distribution" "portfolio" {
#   aliases = [var.domain_name]
#   origin {
#     connection_attempts = 3
#     connection_timeout  = 10
#     domain_name         = "${var.domain_name}.s3-website-us-east-1.amazonaws.com"
#     origin_id           = "${var.domain_name}.s3-website-us-east-1.amazonaws.com"

#     custom_origin_config {
#       http_port                = 80
#       https_port               = 443
#       origin_keepalive_timeout = 5
#       origin_protocol_policy   = "http-only"
#       origin_read_timeout      = 30
#       origin_ssl_protocols = [
#         "TLSv1.2",
#       ]
#     }
#   }

#   enabled         = true
#   is_ipv6_enabled = true

#   default_cache_behavior {
#     allowed_methods        = ["GET", "HEAD"]
#     cached_methods         = ["GET", "HEAD"]
#     target_origin_id       = "${var.domain_name}.s3-website-us-east-1.amazonaws.com"
#     cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
#     viewer_protocol_policy = "redirect-to-https"
#     # Set custom TTL values
#     min_ttl     = 0
#     default_ttl = 60  # 1 minute
#     max_ttl     = 300 # 5 minutes
#     compress    = true
#   }

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }
#   }

#   viewer_certificate {
#     acm_certificate_arn      = aws_acm_certificate.portfolio.arn
#     ssl_support_method       = "sni-only"
#     minimum_protocol_version = "TLSv1.2_2021"
#   }
# }

# resource "aws_cloudfront_distribution" "www-portfolio" {
#   aliases = [var.domain_name_www]
#   origin {
#     connection_attempts = 3
#     connection_timeout  = 10
#     domain_name         = "${var.domain_name_www}.s3-website-us-east-1.amazonaws.com"
#     origin_id           = "${var.domain_name_www}.s3-website-us-east-1.amazonaws.com"

#     custom_origin_config {
#       http_port                = 80
#       https_port               = 443
#       origin_keepalive_timeout = 5
#       origin_protocol_policy   = "http-only"
#       origin_read_timeout      = 30
#       origin_ssl_protocols = [
#         "TLSv1.2",
#       ]
#     }
#   }

#   enabled         = true
#   is_ipv6_enabled = true

#   default_cache_behavior {
#     allowed_methods        = ["GET", "HEAD"]
#     cached_methods         = ["GET", "HEAD"]
#     target_origin_id       = "${var.domain_name_www}.s3-website-us-east-1.amazonaws.com"
#     cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
#     viewer_protocol_policy = "redirect-to-https"
#     # Set custom TTL values
#     min_ttl     = 0
#     default_ttl = 60  # 1 minute
#     max_ttl     = 300 # 5 minutes
#     compress    = true
#   }

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }
#   }

#   viewer_certificate {
#     acm_certificate_arn      = aws_acm_certificate.portfolio.arn
#     ssl_support_method       = "sni-only"
#     minimum_protocol_version = "TLSv1.2_2021"
#   }
# }
