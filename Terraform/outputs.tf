output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.srv01.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.srv01.public_ip
}

output "rds_endpoint" {
  description = "Show endpoint of the RDS"
  value = aws_db_instance.techtvm-rds.endpoint
}
