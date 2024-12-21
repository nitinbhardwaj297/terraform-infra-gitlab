variable "aws_region" {
    description = "use to define the aws region"
    type = string
    default = "us-east-1"
}

variable "ami_id" {
    description = "use to define instance image"
    type = string 
    default = "ami-0885b1f6bd170450c"
}

variable "instance_type"{
    description = "use to define instance type"
    type = string
    default = "t2.micro"
}



# resource "tls_private_key" "key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "deploy_key" {
#     key_name = "vm-key"
#     public_key = file(var.public_key_path)  
# }


