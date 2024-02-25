locals {
  vpc_cidr = "10.0.0.0/22"
  region   = "eu-west-1"

  access_subnets = {
    "access01" = {
      cidr              = "10.0.0.0/25"
      availability_zone = "${local.region}a"
    }
    "access02" = {
      cidr              = "10.0.1.128/25"
      availability_zone = "${local.region}b"
    }
  }


  app_subnets = [
    {
      cidr              = "10.0.1.0/25"
      availability_zone = "${local.region}a"
    },
    {
      cidr              = "10.0.1.128/25"
      availability_zone = "${local.region}b"
    },
  ]
  data_subnets = [
    {
      cidr              = "10.0.2.0/25"
      availability_zone = "${local.region}a"
    },
    {
      cidr              = "10.0.2.128/25"
      availability_zone = "${local.region}b"
    },
  ]


  /*subnets = flatten([
    for subnet_type, subnet_defs  in local.subs: 
      [
        for idx, subnet_def in subnet_defs: merge(subnet_def, {type = subnet_type, name = "${subnet_type}${idx+1}"})
      ]
  ])*/

}

resource "aws_subnet" "subnets" {
  for_each = local.access_subnets

  vpc_id            = aws_vpc.main.id
  availability_zone = each.value.availability_zone


  # each.value here is a value from var.vpcs
  cidr_block = each.value.cidr_block
}
