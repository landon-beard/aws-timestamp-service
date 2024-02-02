resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  # Optional: Customize other S3 bucket settings as needed
  acl    = "private"
  force_destroy = true
}
