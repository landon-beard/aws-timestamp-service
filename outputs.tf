# Outputs statements if needed
output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "api_gateway_url" {
  value = module.api_gateway.api_url
}

output "alarm_name" {
  value = module.alarms.alarm_name
}
