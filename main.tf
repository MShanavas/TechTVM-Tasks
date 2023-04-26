provider "aws" {
    region = "us-east-2"
    access_key = var.access_key
    secret_key = var.secret_key
}

resource "aws_key_pair" "tech_key" {
  
  key_name = "TechTVM"
  public_key = file("TechTVM-key.pub")
}
resource "aws_instance" "srv01" {
  ami           = "ami-0578f2b35d0328762"
  instance_type = "t2.micro"
  key_name = aws_key_pair.tech_key.key_name
  tags = {
    Name = "TechTVM-Tasks"
  }
}
