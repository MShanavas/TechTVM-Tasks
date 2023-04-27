variable "access_key" {
        description = "Access key to AWS console"
}

variable "secret_key" {
        description = "Secret key to AWS console"
}

variable "ami" {
        default = "ami-0578f2b35d0328762"
        description = "Image should be available on the same region"
}

variable "instance_name" {
        description = "Name of the instance to be created"
        default = "srv01"
}

variable "instance_type" {
        description = "instance type"
        default = "t2.micro"
}
variable "aws_s3_bucket_name" {
        default = "techtvm-s3"
        description = "Name of the Bucket"
}
variable "environment" {
        default = "Prod"
        description = "Environment type"
}
variable "project_name" {
        default = "TechTVM"
        description = "Name of the project"
}
