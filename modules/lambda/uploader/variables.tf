variable "uploader_function_name" {
  description = "Name for the uploader Lambda function"
}

variable "lambda_role_arn" {
  description = "ARN of the Lambda IAM role"
}

variable "kms_key_id" {
  description = "ID of the KMS key"
}

variable "uploader_zip_path" {
  description = "Path to the uploader Lambda function code ZIP file"
}
