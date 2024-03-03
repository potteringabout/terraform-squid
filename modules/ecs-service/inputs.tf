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
