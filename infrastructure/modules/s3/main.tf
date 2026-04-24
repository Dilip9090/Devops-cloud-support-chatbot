resource "aws_s3_bucket" "static_assets" {
  bucket = "${var.name_prefix}-static-assets"

  tags = {
    Name = "${var.name_prefix}-static-assets"
  }
}

resource "aws_s3_bucket_acl" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_versioning" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket" "chat_history" {
  bucket = "${var.name_prefix}-history"

  tags = {
    Name = "${var.name_prefix}-history"
  }
}

resource "aws_s3_bucket_acl" "chat_history" {
  bucket = aws_s3_bucket.chat_history.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "chat_history" {
  bucket = aws_s3_bucket.chat_history.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "chat_history" {
  bucket = aws_s3_bucket.chat_history.id
  versioning_configuration {
    status = "Enabled"
  }
}
