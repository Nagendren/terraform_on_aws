resource "aws_ssm_parameter" "example" {
  name        = "/${var.env}/${var.parameter_name}"
  description = "The database password"
  type        = "SecureString"
  value       = var.parameter_value
}