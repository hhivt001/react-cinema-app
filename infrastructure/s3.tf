################################################
#############     S3 RESOURCES     #############
################################################

resource "aws_s3_bucket" "hhreax_cinema_bucket" {
  bucket        = "${local.prefix}-app"
  force_destroy = true

  tags = local.common_tags
}

resource "aws_s3_bucket_acl" "hhreax_cinema_bucket_acl" {
  bucket = aws_s3_bucket.hhreax_cinema_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "hhreax_cinema_public_block" {
  bucket = aws_s3_bucket.hhreax_cinema_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

resource "aws_s3_bucket_versioning" "hhreax_cinema_bucket_versioning" {
  bucket = aws_s3_bucket.hhreax_cinema_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "hhreax_cinema_bucket_policy" {
  bucket = aws_s3_bucket.hhreax_cinema_bucket.id
  policy = data.aws_iam_policy_document.hhreax_cinema_bucket_policy_document.json
}

resource "aws_s3_bucket_website_configuration" "hhreax_cinema_website_config" {
  bucket = aws_s3_bucket.hhreax_cinema_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

data "aws_iam_policy_document" "hhreax_cinema_bucket_policy_document" {
  statement {
    actions = ["s3:GetObject"]

    resources = [
      aws_s3_bucket.hhreax_cinema_bucket.arn,
      "${aws_s3_bucket.hhreax_cinema_bucket.arn}/*"
    ]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.hhreax_cinema_cloudfront_origin.iam_arn]
    }
  }
}