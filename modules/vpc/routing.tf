resource "aws_route_table" "access" {
  count  = var.egress || var.ingress ? 1 : 0
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw[0].id
  }
}

resource "aws_route_table_association" "access" {
  for_each       = tomap(var.egress || var.ingress ? local.access_subnets : {})
  subnet_id      = aws_subnet.subnet[each.value.subnet_name].id
  route_table_id = aws_route_table.access[0].id
}
