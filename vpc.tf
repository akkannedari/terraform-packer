resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = var.env
  }
}

resource "aws_vpc" "main2" {
  cidr_block = var.vpc2_cidr

  tags = {
    Name = var.env
  }
}


resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1_cidr
  map_public_ip_on_launch = true

  depends_on = [
    aws_internet_gateway.igw
  ]

  tags = {
    Name = "Public Subnet 1"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet2_cidr

  tags = {
    Name = "Public Subnet 2"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet1_cidr

  tags = {
    Name = "private subnet 1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet2_cidr

  tags = {
    Name = "private subnet 2"
  }
}

