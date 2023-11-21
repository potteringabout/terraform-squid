locals {
  container_definitions = [
    {
      name                   = var.squid_service_name
      image                  = var.squid_container_image
      cpu                    = 10
      memory                 = 512
      essential              = true
      readonlyRootFilesystem = true
      portMappings = [
        {
          containerPort = 3128
          hostPort      = 3128
        }
      ]
    }
  ]
}

module "squid_ecr" {
  source   = "./modules/ecr"
  ecr_name = "squid"
  kms_key  = aws_kms_key.key.arn
}


resource "aws_kms_key" "key" {
  description             = "ECR Key"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

data "aws_iam_policy_document" "ecs_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "squid_execution" {
  name               = "squid-execution-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "squid_execution_policy" {
  role       = aws_iam_role.squid_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


module "squid_task" {
  source                = "./modules/ecs-task"
  task_family           = "squid"
  task_role_arn         = "squid"
  execution_role_arn    = aws_iam_role.squid_execution.arn
  container_definitions = local.container_definitions

}
