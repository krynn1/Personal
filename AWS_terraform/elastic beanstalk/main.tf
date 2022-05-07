terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  # Configuration options
}


resource "aws_s3_bucket" "b" {
  bucket = "jf-tf-test-bucket-134"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
/*
resource "aws_s3_bucket_object" "example" {
  key                    = "jfordobject"
  bucket                 = aws_s3_bucket.b.id
  source                 = "index.html"
  server_side_encryption = "aws:kms"
}*/
