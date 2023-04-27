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
  ami           = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.tech_key.key_name
  tags = {
    Name = var.instance_name
    Environment = var.environment
    Project_name = var.project_name
  }
}
resource "aws_s3_bucket" "techtvm-s3" {
  bucket = var.aws_s3_bucket_name

  tags = {
    Name        = var.aws_s3_bucket_name
    Environment = var.environment
    Project_name = var.project_name
  }
}
resource "aws_db_instance" "techtvm-rds" {
  allocated_storage    = 10
  db_name              = "techtvm_db"
  identifier           = "techtvm-db01" 
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "dbadmin"
  password             = "dbPass123"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
    tags = {
      Name = "techtvm_rds"
      Environment = var.environment
      Project_name = var.project_name
    }
}
