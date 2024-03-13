resource "aws_s3_bucket" "my_web_assets" {
  bucket = "my-web-assets"
  acl    = "private"  # Setting ACL to private restricts access by default

  tags = {
    Name = "My Web Assets"
  }
}

resource "aws_s3_bucket_policy" "my_web_assets_policy" {
  bucket = aws_s3_bucket.my_web_assets.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = [
          "s3:GetObject",
          "s3:PutObject"
        ],
        Resource  = "arn:aws:s3:::my-web-assets/*"
      }
    ]
  })
}
