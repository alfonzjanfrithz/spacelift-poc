provider "aws" {
  region = "us-west-2"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "this" {
  bucket = "my-bucket-${random_id.bucket_id.hex}"
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

output "bucket_name" {
  value = aws_s3_bucket.this.bucket
}
