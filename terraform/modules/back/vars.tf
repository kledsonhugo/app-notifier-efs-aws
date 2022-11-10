# NETWORK VARS DEFAULT VALUES (INPUT IS REQUIRED BECAUSE NO DEFAULT IS DEFINED)

variable "network_vpc_cidr" {}
variable "network_vpc_id" {}
variable "network_vpc_sn_az1_priv1_id" {}
variable "network_vpc_sn_az2_priv1_id" {}


# COMPUTE VARS DEFAULT VALUES

variable "back_ec2_lt_name" {
    type    = string
    default = "ec2_lt_name"
}

variable "back_ec2_lt_ami" {
    type    = string
    default = "ami-02e136e904f3da870"
}

variable "back_ec2_lt_instance_type" {
    type    = string
    default = "t2.micro"
}

variable "back_ec2_lt_ssh_key_name" {
    type    = string
    default = "ec2_lt_ssh_key_name"
}

variable "back_ec2_lb_name" {
    type    = string
    default = "ec2-lb-name"
}

variable "back_ec2_lb_tg_name" {
    type    = string
    default = "ec2-lb-tg-name"
}

variable "back_ec2_lb_tg_protocol" {
    type    = string
    default = "HTTP"
}

variable "back_ec2_lb_tg_port" {
    type    = number
    default = 80
}

variable "back_ec2_lb_listener_protocol" {
    type    = string
    default = "HTTP"
}

variable "back_ec2_lb_listener_port" {
    type    = number
    default = 80
}

variable "back_ec2_lb_listener_action_type" {
    type    = string
    default = "forward"
}

variable "back_ec2_asg_name" {
    type    = string
    default = "ec2-asg-name"
}

variable "back_ec2_asg_desired_capacity" {
    type    = number
    default = 8
}

variable "back_ec2_asg_min_size" {
    type    = number
    default = 4
}

variable "back_ec2_asg_max_size" {
    type    = number
    default = 16
}


# SECURITY GROUP VARS DEFAULT VALUES

variable "back_sg_cidr_all" {
    type    = string
    default = "0.0.0.0/0"
}

variable "back_sg_port_all" {
    type    = number
    default = 0
}

variable "back_sg_port_ssh" {
    type    = number
    default = 22
}

variable "back_sg_port_http" {
    type    = number
    default = 80
}

variable "back_sg_protocol_any" {
    type    = string
    default = "-1"
}

variable "back_sg_protocol_tcp" {
    type    = string
    default = "tcp"
}