data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_route53_zone" "main" {
  name         = "kjohnson.io"
  private_zone = false
}