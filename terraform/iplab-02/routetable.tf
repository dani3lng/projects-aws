# route table for public subnet
resource "aws_route_table" "rtPublic" {
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "Public RT"
  }
}
resource "aws_route_table_association" "rtaPublic" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rtPublic.id
}
# resource "aws_route" "plocal" {
#   route_table_id         = aws_route_table.rtPublic.id
#   destination_cidr_block = "10.0.0.0/24"
#   gateway_id             = aws_internet_gateway.igw.id
#   # depends_on             = [aws_route_table.rtPublic]
# }
resource "aws_route" "pigw" {
  route_table_id         = aws_route_table.rtPublic.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_route_table.rtPublic]
}

# route table for private subnet
resource "aws_route_table" "rtPrivate" {
  vpc_id = aws_vpc.mainvpc.id
  tags = {
    Name = "Private RT"
  }
}
resource "aws_route_table_association" "rtaPrivate" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.rtPrivate.id
}
# # resource "aws_route" "prlocal" {
# #   route_table_id         = aws_route_table.rtPrivate.id
# #   destination_cidr_block = "10.0.0.0/16"
# #   nat_gateway_id         = aws_nat_gateway.ipnat.id
# #   # depends_on             = [aws_route_table.rtPrivate]
# }
resource "aws_route" "pnat" {
  route_table_id         = aws_route_table.rtPrivate.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ipnat.id
  depends_on             = [aws_route_table.rtPrivate]
}