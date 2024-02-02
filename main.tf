provider "aws" {
  region = "your-region" # e.g., us-west-2
}

module "s3" {
  source = "./modules/s3"

  # Variables for the S3 module
  bucket_name = "your-bucket-name" # Update for your bucket name
}

module "kms" {
  source = "./modules/kms"

  # Variables for the KMS module
  key_description = "KMS key for S3 encryption"
}

module "iam" {
  source = "./modules/iam"

  # Variables for the IAM module
  lambda_role_name = "lambda_role"
}

module "lambda_uploader" {
  source = "./modules/lambda/uploader"

  # Variables for the uploader Lambda module
  uploader_function_name = "timestamp_uploader"
  lambda_role_arn       = module.iam.lambda_role_arn
  kms_key_id             = module.kms.kms_key_id
  uploader_zip_path      = "path-to-your-uploader.zip" # Update this to your zip file path
}

module "cloudwatch" {
  source = "./modules/cloudwatch"

  # Variables for the CloudWatch module
  event_rule_name        = "every-ten-minutes"
  uploader_function_arn  = module.lambda_uploader.uploader_function_arn
}

module "api_gateway" {
  source = "./modules/api_gateway"

  # Variables for the API Gateway module
  api_name               = "timestamp_api"
  api_resource_id        = "timestamp"
  retriever_function_arn = module.lambda_uploader.uploader_function_arn
}

module "alarms" {
  source = "./modules/alarms"

  # Variables for the Alarms module
  alarm_name   = "rate_limit_exceeded"
  api_name     = module.api_gateway.api_name
  api_resource_id = module.api_gateway.api_resource_id
}
