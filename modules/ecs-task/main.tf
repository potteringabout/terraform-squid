resource "aws_ecs_task_definition" "task" {
  family                   = var.task_family
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = var.task_role_arn
  execution_role_arn       = var.execution_role_arn

  container_definitions = jsonencode(var.container_definitions)

}
