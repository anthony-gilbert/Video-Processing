resource "aws_s3_bucket" "vide-processing-website" {
  bucket = "vide-processing-website"   # must be globally unique
  force_destroy = true            # optional: delete bucket even if it has objects

  tags = {
    Name        = "my-app-bucket"
    Environment = "dev"
    Project     = "video-processing-project"
  }
}

# Enable versioning
resource "aws_s3_bucket_versioning" "vide-processing-website_versioning" {
  bucket = aws_s3_bucket.vide-processing-website.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "vide-processing-website_encryption" {
  bucket = aws_s3_bucket.vide-processing-website.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Public access block (recommended)
resource "aws_s3_bucket_public_access_block" "vide-processing-website_block" {
  bucket = aws_s3_bucket.vide-processing-website.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# (Optional) Bucket policy example
resource "aws_s3_bucket_policy" "vide-processing-website_policy" {
  bucket = aws_s3_bucket.vide-processing-website.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowSSLRequestsOnly"
        Effect = "Deny"
        Principal = "*"
        Action   = "s3:*"
        Resource = [
          "${aws_s3_bucket.vide-processing-website.arn}/*",
          "${aws_s3_bucket.vide-processing-website.arn}"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}
