provider "aws" {
  region = "us-west-2"
}

#VPC

resource "aws_vpc" "myVPC" {
  cidr_block = "10.0.0.0/16"
}

#Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myVPC.id

  tags = {
    Name = "IG"
  }
}

#Subnet

resource "aws_subnet" "mySubnet" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "SN"
  }
}

#Route table

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myVPC.id

  route = []

  tags = {
    Name = "example"
  }
}

#Route

resource "aws_route" "route" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_route_table.rt]
}

#Security group

resource "aws_security_group" "sg" {
  name        = "allow_all_traffic"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.myVPC.id

  ingress = [
    {
      description      = "all traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null
      description      = "outbound rule"
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  tags = {
    Name = "all_traffic"
  }
}

#Route table Association

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.mySubnet.id
  route_table_id = aws_route_table.rt.id
}

#EC2 Instance

resource "aws_instance" "ec2" {
  ami           = "ami-08f7912c15ca96832"
  instance_type = "t2.micro"


  tags = {
    Name = "ec2-instance"
  }
}


