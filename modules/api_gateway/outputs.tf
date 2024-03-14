output "api_id" {
  value = aws_api_gateway_rest_api.api.id
}

output "deployment_id" {
  value = aws_api_gateway_deployment.deployment.id
}
