output "cloudwatch_event_rule_arn" {
  value = aws_cloudwatch_event_rule.every_ten_minutes.arn
}
