output "hhreax_cinema_bucket_name" {
  value = aws_s3_bucket.hhreax_cinema_bucket.id
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.hhreax_cinema_cloudfront_distribution.id
}