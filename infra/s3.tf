###############################
# Buckets
###############################

resource "aws_s3_bucket" "portfolio" {
  bucket = "bya.github.io"
}

resource "aws_s3_bucket" "www-portfolio" {
  bucket = "www.bya.github.io"
}

###############################
# Public Bucket Access
###############################
resource "aws_s3_bucket_ownership_controls" "www-portfolio" {
  bucket = aws_s3_bucket.www-portfolio.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "www-portfolio" {
  bucket = aws_s3_bucket.www-portfolio.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "www-portfolio" {
  depends_on = [
    aws_s3_bucket_ownership_controls.www-portfolio,
    aws_s3_bucket_public_access_block.www-portfolio,
  ]

  bucket = aws_s3_bucket.www-portfolio.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "www-portfolio" {
  bucket = aws_s3_bucket.www-portfolio.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${aws_s3_bucket.www-portfolio.bucket}/*",
      },
    ],
  })
}
