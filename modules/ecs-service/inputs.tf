variable "ecs_service_name" {
  type        = string
  description = "Name of ECS Service"

}

variable "ecs_cluster_id" {
  type        = string
  description = "ECS Cluster Id"
}

variable "ecs_task_def" {
  type        = string
  description = "ECS Task Definition"
}

variable "ecs_subnets" {
  type        = list(string)
  description = "ECS subnets"
}

variable "load_balancer" {
  type = object({
    target_group_arn = string
    container_name   = string
    container_port   = number
  })

}
