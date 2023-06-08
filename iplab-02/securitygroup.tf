# security group for public route table
resource "aws_security_group" "publicsg" {
  name        = "publicsg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.mainvpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "publicsg"
  }
}

# security group for private route table
resource "aws_security_group" "privatesg" {
  name        = "privatesg"
  description = "Allow traffic from Public Subnet"
  vpc_id      = aws_vpc.mainvpc.id

  ingress {
    description     = "Allow traffic to/from Public Subnet"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.publicsg.id]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "privatesg"
  }
}