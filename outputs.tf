output "lambda_function_name" {
  value = module.lambda.lambda_name
}

output "api_gateway_url" {
  value = module.apigateway.api_endpoint
}
