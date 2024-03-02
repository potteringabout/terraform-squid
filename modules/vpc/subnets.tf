locals {

  network = {
    access = {
      subnets = {
        01 = {
          cidr              = "10.0.0.0/25"
          availability_zone = "${var.region}a"
        }
        02 = {
          cidr              = "10.0.0.128/25"
          availability_zone = "${var.region}b"
        }
      }
    }
    data = {
      subnets = {
        01 = {
          cidr              = "10.0.2.0/25"
          availability_zone = "${var.region}a"
        }
        02 = {
          cidr              = "10.0.2.128/25"
          availability_zone = "${var.region}b"
        }
      }
    }
    app = {
      subnets = {
        01 = {
          cidr              = "10.0.1.0/25"
          availability_zone = "${var.region}a"
        }
        02 = {
          cidr              = "10.0.1.128/25"
          availability_zone = "${var.region}b"
        }
      }
    }
  }


  # flatten ensures that this local value is a flat list of objects, rather
  # than a list of lists of objects.
  network_subnets = flatten([
    for network_key, network in local.network : [
      for subnet_key, subnet in network.subnets : {
        subnet_name       = "${network_key}${subnet_key}"
        cidr_block        = subnet.cidr_block
        availability_zone = subnet.availability_zone
      }
    ]
  ])
}

resource "aws_subnet" "subnet" {
  # local.network_subnets is a list, so we must now project it into a map
  # where each key is unique. We'll combine the network and subnet keys to
  # produce a single unique key per instance.
  for_each = tomap({
    for subnet in local.network_subnets : subnet.subnet_name => subnet
  })

  vpc_id            = aws_vpc.main.id
  availability_zone = each.value.subnet_key
  cidr_block        = each.value.cidr_block
}
