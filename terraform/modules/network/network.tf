# RESOURCE: VPC

resource "aws_vpc" "vpc" {
    cidr_block           = "${var.vpc_cidr}"
    enable_dns_hostnames = "${var.vpc_dns_hostnames}"
}


# RESOURCE: INTERNET GATEWAY

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
}


# RESOURCE: SUBNETS

resource "aws_subnet" "sn_az1_pub" {
    vpc_id                  = aws_vpc.vpc.id
    availability_zone       = "${var.vpc_sn_az1}"
    cidr_block              = "${var.vpc_sn_az1_pub_cidr}"
    map_public_ip_on_launch = "${var.vpc_sn_pub_map_public_ip_on_launch}"
}

resource "aws_subnet" "sn_az2_pub" {
    vpc_id                  = aws_vpc.vpc.id
    availability_zone       = "${var.vpc_sn_az2}"
    cidr_block              = "${var.vpc_sn_az2_pub_cidr}"
    map_public_ip_on_launch = "${var.vpc_sn_pub_map_public_ip_on_launch}"
}

resource "aws_subnet" "sn_az1_priv1" {
    vpc_id                  = aws_vpc.vpc.id
    availability_zone       = "${var.vpc_sn_az1}"
    cidr_block              = "${var.vpc_sn_az1_priv1_cidr}"
}

resource "aws_subnet" "sn_az2_priv1" {
    vpc_id                  = aws_vpc.vpc.id
    availability_zone       = "${var.vpc_sn_az2}"
    cidr_block              = "${var.vpc_sn_az2_priv1_cidr}"
}

resource "aws_subnet" "sn_az1_priv2" {
    vpc_id                  = aws_vpc.vpc.id
    availability_zone       = "${var.vpc_sn_az1}"
    cidr_block              = "${var.vpc_sn_az1_priv2_cidr}"
}

resource "aws_subnet" "sn_az2_priv2" {
    vpc_id                  = aws_vpc.vpc.id
    availability_zone       = "${var.vpc_sn_az2}"
    cidr_block              = "${var.vpc_sn_az2_priv2_cidr}"
}


# RESOURCE: ROUTE TABLES FOR THE SUBNETS

resource "aws_route_table" "rt_pub" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "${var.vpc_cidr_all}"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table" "rt_priv" {
    vpc_id = aws_vpc.vpc.id
}


# RESOURCE: ROUTE TABLES ASSOCIATION TO SUBNETS

resource "aws_route_table_association" "rt_pub_sn_az1_pub" {
  subnet_id      = aws_subnet.sn_az1_pub.id
  route_table_id = aws_route_table.rt_pub.id
}

resource "aws_route_table_association" "rt_pub_sn_az2_pub" {
  subnet_id      = aws_subnet.sn_az2_pub.id
  route_table_id = aws_route_table.rt_pub.id
}

resource "aws_route_table_association" "rt_priv_sn_az1_priv1" {
  subnet_id      = aws_subnet.sn_az1_priv1.id
  route_table_id = aws_route_table.rt_priv.id
}

resource "aws_route_table_association" "rt_priv_sn_az2_priv1" {
  subnet_id      = aws_subnet.sn_az2_priv1.id
  route_table_id = aws_route_table.rt_priv.id
}

resource "aws_route_table_association" "rt_priv_sn_az1_priv2" {
  subnet_id      = aws_subnet.sn_az1_priv2.id
  route_table_id = aws_route_table.rt_priv.id
}

resource "aws_route_table_association" "rt_priv_sn_az2_priv2" {
  subnet_id      = aws_subnet.sn_az2_priv2.id
  route_table_id = aws_route_table.rt_priv.id
}


# RESOURCE: SECURITY GROUPS

# resource "aws_security_group" "vpc_sg_priv" {
#     vpc_id = aws_vpc.vpc.id
#     egress {
#         from_port   = "${var.vpc_sg_port_all}"
#         to_port     = "${var.vpc_sg_port_all}"
#         protocol    = "${var.vpc_sg_protocol_any}"
#         cidr_blocks = ["${var.vpc_cidr_all}"]
#     }
#     ingress {
#         from_port   = "${var.vpc_sg_port_all}"
#         to_port     = "${var.vpc_sg_port_all}"
#         protocol    = "${var.vpc_sg_protocol_any}"
#         cidr_blocks = ["${var.vpc_cidr}"]
#     }
# }