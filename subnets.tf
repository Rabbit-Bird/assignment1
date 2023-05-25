resource "aws_subnet" "pri_sn" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.10.10.0/25"

  tags = {
    Name = "pri_sn"
  }
}

resource "aws_subnet" "pub_sn" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.10.10.128/25"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "pub_sn"
  }
}