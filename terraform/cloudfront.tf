resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "OAI for CloudFront to access S3 bucket nba.kjohnson.io"
}


resource "aws_route53_record" "frontend" {
  zone_id = data.aws_route53_zone.kjohnson.zone_id
  name    = "nba.kjohnson.io"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.frontend_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.frontend_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_cloudfront_distribution" "frontend_distribution" {
  origin {
    domain_name = aws_s3_bucket.frontend_bucket.bucket_regional_domain_name
    origin_id   = "S3-nba-frontend"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  default_root_object = "index.html"

default_cache_behavior {
  target_origin_id       = "S3-nba-frontend"
  viewer_protocol_policy = "redirect-to-https"

  allowed_methods  = ["GET", "HEAD"]
  cached_methods   = ["GET", "HEAD"]

  # Use the cache policy ID only
  cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
}
  aliases = ["nba.kjohnson.io"]


  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.frontend.arn
    ssl_support_method   = "sni-only"
  }

  # Add restrictions block
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "NBA Frontend CloudFront"
  }
}

