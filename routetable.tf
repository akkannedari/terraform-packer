
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.env
  }
}


resource "aws_route_table" "terraform_public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.env
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "terrafomr_public" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.terraform_public.id

}