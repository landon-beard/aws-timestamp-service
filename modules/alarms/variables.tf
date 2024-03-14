variable "alarm_name" {
  description = "Name for the CloudWatch alarm"
}

variable "api_name" {
  description = "Name for the API Gateway"
}

variable "api_resource_id" {
  description = "Resource ID for the API Gateway"
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic to receive alarm notifications"
}
