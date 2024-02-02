variable "retriever_function_name" {
  description = "Name for the retriever Lambda function"
}

variable "retriever_zip_path" {
  description = "Path to the retriever Lambda function code ZIP file"
}

resource "aws_lambda_function" "retriever" {
  filename      = var.retriever_zip_path
  function_name = var.retriever_function_name
  role          = var.lambda_role_arn
  handler       = "retriever.handler"
  runtime       = "python3.8"

  environment {
    variables = {
      BUCKET_NAME = aws_s3_bucket.bucket.id
    }
  }
}
