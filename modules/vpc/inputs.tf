
variable "vpc_cidr" {
  type = string
}

variable "subnets" {
  type = map(object({
    size = number
    description = "Size of subnet.  Eg. for /24, enter 24"
  }))
}

variable "egress" {
  type = bool
  default = false  
}

variable "ingress" {
  type = bool
  default = false  
}