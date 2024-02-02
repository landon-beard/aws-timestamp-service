variable "event_rule_name" {
  description = "Name for the CloudWatch event rule"
}

resource "aws_cloudwatch_event_rule" "every_ten_minutes" {
  name                = var.event_rule_name
  description         = "Trigger every 10 minutes"
  schedule_expression = "cron(*/10 * * * ? *)"
}

resource "aws_cloudwatch_event_target" "trigger_uploader" {
  rule      = aws_cloudwatch_event_rule.every_ten_minutes.name
  target_id = "uploadTimestamp"
  arn       = var.uploader_function_arn
}

