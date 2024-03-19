terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


resource "aws_instance" "ec2" {
  ami           = "ami-08f7912c15ca96832"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2_Instance"
  }
}

