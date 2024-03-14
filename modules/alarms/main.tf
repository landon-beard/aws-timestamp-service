resource "aws_cloudwatch_metric_alarm" "rate_limit_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "4XXError"
  namespace           = "AWS/ApiGateway"
  period              = 300 # 5 minutes
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Rate limit exceeded for ${var.api_name} API"
  actions_enabled     = true
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    ApiName      = var.api_name
    ResourcePath = var.api_resource_id
    # Replace 'your_deployment_id' with the actual deployment ID
    Stage        = aws_api_gateway_deployment.deployment.stage_name
  }
}
