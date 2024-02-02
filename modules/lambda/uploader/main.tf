variable "uploader_function_name" {
  description = "Name for the uploader Lambda function"
}

variable "uploader_zip_path" {
  description = "Path to the uploader Lambda function code ZIP file"
}

resource "aws_lambda_function" "uploader" {
  filename      = var.uploader_zip_path
  function_name = var.uploader_function_name
  role          = var.lambda_role_arn
  handler       = "uploader.handler"
  runtime       = "python3.8"

  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.bucket.id
      KMS_KEY_ID  = var.kms_key_id
    }
  }
}
