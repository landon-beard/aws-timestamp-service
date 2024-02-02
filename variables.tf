variable "aws_region" {
  description = "AWS region"
  default     = "your-region"
}

# Variables for the S3 module
variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
}

# Variables for the KMS module
variable "kms_key_description" {
  description = "Description for the KMS key"
}

# Variables for the Lambda module
variable "uploader_function_name" {
  description = "Name for the uploader Lambda function"
}

variable "retriever_function_name" {
  description = "Name for the retriever Lambda function"
}

# Variables for the CloudWatch module
variable "event_rule_name" {
  description = "Name for the CloudWatch event rule"
}

# Variables for the API Gateway module
variable "api_name" {
  description = "Name for the API Gateway"
}

variable "api_resource_id" {
  description = "Resource ID for the API Gateway"
}

# Variables for the Alarms module
variable "alarm_name" {
  description = "Name for the CloudWatch alarm"
}
