variable "api_id" {
  description = "ID of the API Gateway"
}

variable "stage_name" {
  description = "Name of the API Gateway stage"
}

variable "usage_plan_name" {
  description = "Name for the API Gateway usage plan"
}

variable "api_key_name" {
  description = "Name for the API Gateway API key"
}

variable "api_resource_id" {
  description = "Resource ID for the API Gateway"
}

variable "request_limit" {
  description = "Limit on the number of requests for the usage plan"
}

variable "request_limit_period" {
  description = "Period for the request limit (e.g., MONTH, WEEK, DAY, etc.)"
}

variable "burst_limit" {
  description = "Burst limit for the throttle settings"
}

variable "rate_limit" {
  description = "Rate limit for the throttle settings"
}