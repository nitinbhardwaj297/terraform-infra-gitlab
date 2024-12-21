provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "vm1" {
    ami = var.ami_id
    instance_type = var.instance_type 
    vpc_security_group_ids = [aws_security_group.project_security_group.id]
    subnet_id = aws_subnet.public_subnet1.id
    associate_public_ip_address = true
    user_data = file("vm1file.sh")
    tags = {
        name = "ec2-vm1"
    }
}


resource "aws_instance" "vm2" {
    ami = var.ami_id
    instance_type = var.instance_type 
    vpc_security_group_ids = [aws_security_group.project_security_group.id]
    subnet_id = aws_subnet.public_subnet2.id
    associate_public_ip_address = true
    user_data = file("vm2file.sh")
    tags = {
        name = "ec2-vm2"
    }
}
