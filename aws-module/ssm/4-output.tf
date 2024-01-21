output "parameter_arn" {
  description = "The Amazon Resource Name (ARN) of the parameter"
  value       = aws_ssm_parameter.example.arn
}

output "parameter_version" {
  description = "The version of the parameter value"
  value       = aws_ssm_parameter.example.version
}