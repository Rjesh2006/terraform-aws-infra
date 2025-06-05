# S3 Bucket for Remote State
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_bucket_name
  tags   = var.s3_bucket_tags

  # Recommended for state buckets
  lifecycle {
    prevent_destroy = true # Prevent accidental deletion
  }
}

# Enable versioning (required for state buckets)
resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB for State Locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.dynamodb_table_name
  billing_mode = var.dynamodb_billing_mode
  hash_key     = var.dynamodb_hash_key

  attribute {
    name = var.dynamodb_hash_key
    type = "S"
  }

  tags = var.dynamodb_tags
}