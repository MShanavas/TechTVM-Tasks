variable "access_key" {
        description = "Access key to AWS console"
}

variable "secret_key" {
        description = "Secret key to AWS console"
}

variable "ami" {
        default = "ami-06d5c50c30a35fb88" 
}

variable "instance_name" {
        description = "Name of the instance to be created"
        default = "srv01"
}

variable "instance_type" {
        default = "t2.micro"
}
