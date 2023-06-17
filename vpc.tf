resource "aws_vpc" "vpctf" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-tf"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.vpctf.id

  tags = {
    Name = "myigw"
  }
}

resource "aws_route_table" "myrt" {
  vpc_id = aws_vpc.vpctf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
  tags = {
    Name = "myrt"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.vpctf.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.vpctf.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id            = aws_vpc.vpctf.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "subnet3"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.myrt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.myrt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.myrt.id
}