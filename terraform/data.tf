data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_route53_zone" "main" {
  name         = "kjohnson.io"
  private_zone = false
}

data "aws_acm_certificate" "frontend" {
  domain   = "nba.kjohnson.io"
  statuses = ["ISSUED"]
}

data "aws_acm_certificate" "backend" {
  domain   = "api.kjohnson.io"
  statuses = ["ISSUED"]
}