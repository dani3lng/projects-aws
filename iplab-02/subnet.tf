# public subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.mainvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "IP Public Subnet"
  }
}

# private subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.mainvpc.id
  cidr_block        = "10.0.2.0/23"
  availability_zone = "us-east-1b"

  tags = {
    Name = "IP Private Subnet"
  }
}