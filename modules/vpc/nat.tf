
locals {
  ingress_subnets = {
    for subnet in local.network_subnets : subnet.subnet_name => subnet if subnet.zone == "access" && var.ingress
  }
}

resource "aws_eip" "ip" {
  # checkov:skip=CKV2_AWS_19: "Ensure that all EIP addresses allocated to a VPC are attached to EC2 instances"
  domain   = "vpc"
  for_each = tomap(local.ingress_subnets)
}

resource "aws_nat_gateway" "nat" {
  for_each = tomap(local.ingress_subnets)

  allocation_id = aws_eip.ip[each.value.subnet_name].id
  subnet_id     = aws_subnet.subnet[each.value.subnet_name].id

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw[0]]
}
