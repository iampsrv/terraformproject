resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet1.id
  security_groups             = [aws_security_group.mysg.id]
  associate_public_ip_address = true
  user_data                   = file("start.sh")
  tags = {
    Name = "dev-env"
  }
}

resource "aws_instance" "web1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet2.id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.mysg.id]
  user_data                   = file("start.sh")
  tags = {
    Name = "test-env"
  }
}

resource "aws_instance" "web2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet3.id
  security_groups             = [aws_security_group.mysg.id]
  associate_public_ip_address = true
  user_data                   = file("start.sh")
  tags = {
    Name = "prod-env"
  }
}

