resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet1.id
  security_groups             = ["sg-06d632dce2ab48177"]
  associate_public_ip_address = true
  user_data                   = file("start.sh")
  tags = {
    Name = "dev-ec2"
  }
}

resource "aws_instance" "web1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet2.id
  associate_public_ip_address = true
  security_groups             = ["sg-06d632dce2ab48177"]
  user_data                   = file("start.sh")
  tags = {
    Name = "test-ec2"
  }
}

resource "aws_instance" "web2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet3.id
  security_groups             = ["sg-06d632dce2ab48177"]
  associate_public_ip_address = true
  user_data                   = file("start.sh")
  tags = {
    Name = "prod-ec2"
  }
}