output "lambda_name" {
  value = aws_lambda_function.rds_lambda.function_name
}

output "lambda_arn" {
  value = aws_lambda_function.rds_lambda.arn
}
