resource "aws_internet_gateway" "gw" {
  count  = var.egress || var.ingress ? 1 : 0
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}