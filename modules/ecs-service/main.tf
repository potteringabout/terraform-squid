resource "aws_ecs_service" "service" {
  name                               = var.ecs_service_name
  cluster                            = var.ecs_cluster_id
  task_definition                    = var.ecs_task_def
  desired_count                      = 2
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  #iam_role        = aws_iam_role.foo.arn
  # depends_on      = [aws_iam_role_policy.foo]

  network_configuration {
    subnets = ["subnet-04f97c9cceed57385", "subnet-096691818e717fd28", "subnet-037e3aff7e6b5b2c0"]
  }

  /*ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.foo.arn
    container_name   = "mongo"
    container_port   = 8080
  }*/

  /*placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  }*/
}
