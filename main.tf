provider "aws" {
    region = "us-east-1"
    access_key = "AKIASWWF23TWPNPCEMN4"
    secret_key = "xEqK0zCGC1M8Aj/WasRtWy1LsSMu1VaFiRK9tIk9"
}

resource "aws_instance" "server01" {
  instance_type = "t2.micro" 

  tags = {
    Name = "Example Instance"
  }
}