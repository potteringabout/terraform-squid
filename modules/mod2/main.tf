resource "aws_ssm_parameter" "favourite" {
  name        = var.my_favourite_key
  description = "The parameter description"
  type        = "SecureString"
  value       = var.my_favourite_value
  key_id      = "alias/aws/ssm"
  #overwrite   = true

  tags = {
    Name = var.my_favourite_key
  }
}
