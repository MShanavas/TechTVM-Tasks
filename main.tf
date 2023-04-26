provider "aws" {
    region = "us-east-1"
    access_key = "KEY"
    secret_key = "KEY"
}

resource "aws_instance" "server01" {
  instance_type = "t2.micro" 

  tags = {
    Name = "Example Instance"
  }
}
