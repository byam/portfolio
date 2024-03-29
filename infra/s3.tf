###############################
# Buckets
###############################

resource "aws_s3_bucket" "portfolio" {
  bucket = var.domain_name
}

resource "aws_s3_bucket" "www-portfolio" {
  bucket = var.domain_name_www
}

###############################
# Public Bucket Access
###############################
resource "aws_s3_bucket_ownership_controls" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "portfolio" {
  depends_on = [
    aws_s3_bucket_ownership_controls.portfolio,
    aws_s3_bucket_public_access_block.portfolio,
  ]

  bucket = aws_s3_bucket.portfolio.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${aws_s3_bucket.portfolio.bucket}/*",
      },
    ],
  })
}

###############################
# Enable static website hosting
###############################

resource "aws_s3_bucket_website_configuration" "portfolio" {
  bucket = aws_s3_bucket.portfolio.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_website_configuration" "www-portfolio" {
  bucket = aws_s3_bucket.www-portfolio.id
  redirect_all_requests_to {
    host_name = var.domain_name
    protocol  = "http"
  }
}
