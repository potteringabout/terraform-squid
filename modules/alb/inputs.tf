variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "alb" {
  type = object({
    name = string
  })
}

variable "target_group" {
  type = object({
    name = string
    port = number
  })
}
