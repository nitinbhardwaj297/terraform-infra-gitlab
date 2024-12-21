resource "aws_vpc" "project_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.project_vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.project_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true
}

resource "aws_route_table" "project_rt" {
    vpc_id = aws_vpc.project_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.vpc_igw.id
    } 
}

resource "aws_route_table_association" "public_subnet1_association" {
    subnet_id = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.project_rt.id
}

resource "aws_route_table_association" "public_subnet2_association"{
    subnet_id = aws_subnet.public_subnet2.id
    route_table_id = aws_route_table.project_rt.id
}

resource "aws_internet_gateway" "vpc_igw" {
    vpc_id = aws_vpc.project_vpc.id
  
}



