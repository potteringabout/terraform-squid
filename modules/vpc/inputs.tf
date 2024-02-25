
variable "vpc_cidr" {
  type = string
}
/*
variable "subnets" {
  type = map(object({
    size = number
  }))
}*/

variable "egress" {
  type = bool
  default = false  
}

variable "ingress" {
  type = bool
  default = false  
}