resource "aws_api_gateway_usage_plan" "usage_plan" {
  name         = var.usage_plan_name
  description  = "Usage plan for API rate limiting"
  product_code = "API_GATEWAY"
}

resource "aws_api_gateway_api_key" "api_key" {
  name    = var.api_key_name
  enabled = true
}

resource "aws_api_gateway_usage_plan_key" "usage_plan_key" {
  key_id        = aws_api_gateway_api_key.api_key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.usage_plan.id
}

resource "aws_api_gateway_usage_plan_quota" "quota" {
  usage_plan_id = aws_api_gateway_usage_plan.usage_plan.id
  limit         = var.request_limit
  period        = var.request_limit_period
}

resource "aws_api_gateway_usage_plan_throttle_settings" "throttle_settings" {
  usage_plan_id = aws_api_gateway_usage_plan.usage_plan.id
  throttle_settings {
    burst_limit = var.burst_limit
    rate_limit  = var.rate_limit
  }
}
