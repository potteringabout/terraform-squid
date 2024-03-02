
/*resource "aws_eip" "ip" {
  domain = "vpc"
  count = var.egress ? length(var.access_subnets) : 0
}

resource "aws_nat_gateway" "nat" {
  count = var.egress ? length(var.access_subnets) : 0
  allocation_id = aws_eip.ip[count.index].id
  subnet_id     = aws_subnet.example.id

  #tags = {
   # Name = "gw NAT"
  #}

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw[0]]
}*/
