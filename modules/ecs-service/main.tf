resource "aws_ecs_service" "service" {
  name                               = var.ecs_service_name
  cluster                            = var.ecs_cluster_id
  task_definition                    = var.ecs_task_def
  desired_count                      = 1
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  #iam_role        = aws_iam_role.foo.arn
  # depends_on      = [aws_iam_role_policy.foo]

  network_configuration {
    subnets = var.ecs_subnets
  }

  load_balancer {
    target_group_arn = var.load_balancer["target_group_arn"]
    container_name   = var.load_balancer["container_name"]
    container_port   = var.load_balancer["container_port"]
  }

  /*ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  */

  /*placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  }*/
}
