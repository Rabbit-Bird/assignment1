resource "aws_route_table" "pri_rt" {
  vpc_id = aws_vpc.my_vpc.id


  tags = {
    Name = "pri_rt"
  }
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "pub_rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.pri_sn.id
  route_table_id = aws_route_table.pri_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.pub_sn.id
  route_table_id = aws_route_table.pub_rt.id
}