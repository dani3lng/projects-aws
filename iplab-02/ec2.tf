# public ec2 resource
resource "aws_instance" "IPec2-public" {
  ami           = "ami-02396cdd13e9a1257"
  instance_type = "t2.micro"
  # associate_public_ip_address = true
  availability_zone    = aws_subnet.public.availability_zone
  subnet_id            = aws_subnet.public.id
  security_groups      = [aws_security_group.publicsg.id]
  iam_instance_profile = "EC2InstanceProfile"
  tags = {
    Name = "IPec2-public"
  }
}

# private ec2 resource
resource "aws_instance" "IPec2-private" {
  ami           = "ami-0889a44b331db0194"
  instance_type = "t2.micro"
  # associate_public_ip_address = true
  # availability_zone = aws_subnet.public.availability_zone
  subnet_id            = aws_subnet.private.id
  security_groups      = [aws_security_group.privatesg.id]
  iam_instance_profile = "EC2InstanceProfile"
  tags = {
    Name = "IPec2-private"
  }
}