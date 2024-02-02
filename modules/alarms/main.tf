variable "alarm_name" {
  description = "Name for the CloudWatch alarm"
}

resource "aws_cloudwatch_metric_alarm" "rate_limit_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "4XXError"
  namespace           = "AWS/ApiGateway"
  period              = 300 # 5 minutes
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Rate limit exceeded for timestamp API"
  actions_enabled     = true

  # Replace 'your_sns_topic_arn' with the actual SNS topic ARN
  alarm_actions = [your_sns_topic_arn]

  dimensions = {
    ApiName      = var.api_name
    ResourcePath = var.api_resource_id
    Stage        = aws_api_gateway_deployment.deployment.stage_name
  }
}
