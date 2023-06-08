# eip for nat gateway
resource "aws_eip" "nat1" {
  vpc = true
  tags = {
    Name = "IPeip"
  }
  depends_on = [aws_internet_gateway.igw]
}