output "target_group_arn" {
  value = aws_lb_target_group.target_group.arn
}

output "security_group_arn" {
  value = aws_security_group.alb.arn
}
