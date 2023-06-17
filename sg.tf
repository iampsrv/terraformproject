resource "aws_security_group" "mysg" {
  name        = "mysgtf"
  description = "Created by terraform"
  vpc_id      = aws_vpc.vpctf.id

  ingress {
    description = "Custom Tcp"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpctf.cidr_block]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpctf.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysg"
  }
}