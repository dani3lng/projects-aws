# public nat gateway
resource "aws_nat_gateway" "ipnat" {
  connectivity_type = "public"
  subnet_id         = aws_subnet.public.id
  allocation_id     = aws_eip.nat1.id
  tags = {
    Name = "IPnat"
  }
  depends_on = [aws_internet_gateway.igw]
}