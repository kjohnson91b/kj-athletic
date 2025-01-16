resource "aws_s3_bucket" "terraform_state" {
  bucket = "kj-athletic-terraform-state"
  acl    = "private"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encrypt" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
