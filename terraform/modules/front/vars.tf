# NETWORK VARS DEFAULT VALUES (INPUT IS REQUIRED BECAUSE NO DEFAULT IS DEFINED)

variable "network_vpc_id" {}
variable "network_vpc_sn_az1_pub_id" {}
variable "network_vpc_sn_az2_pub_id" {}
variable "network_vpc_sg_pub_id" {}


# COMPUTE VARS DEFAULT VALUES

variable "front_ec2_lt_name" {
    type    = string
    default = "ec2_lt_name"
}

variable "front_ec2_lt_ami" {
    type    = string
    default = "ami-02e136e904f3da870"
}

variable "front_ec2_lt_instance_type" {
    type    = string
    default = "t2.micro"
}

variable "front_ec2_lt_ssh_key_name" {
    type    = string
    default = "ec2_lt_ssh_key_name"
}

variable "front_ec2_lb_name" {
    type    = string
    default = "ec2-lb-name"
}

variable "front_ec2_lb_tg_name" {
    type    = string
    default = "ec2-lb-tg-name"
}

variable "front_ec2_lb_tg_protocol" {
    type    = string
    default = "HTTP"
}

variable "front_ec2_lb_tg_port" {
    type    = number
    default = 80
}

variable "front_ec2_lb_listener_protocol" {
    type    = string
    default = "HTTP"
}

variable "front_ec2_lb_listener_port" {
    type    = number
    default = 80
}

variable "front_ec2_lb_listener_action_type" {
    type    = string
    default = "forward"
}

variable "front_ec2_asg_name" {
    type    = string
    default = "ec2-asg-name"
}

variable "front_ec2_asg_desired_capacity" {
    type    = number
    default = 8
}

variable "front_ec2_asg_min_size" {
    type    = number
    default = 4
}

variable "front_ec2_asg_max_size" {
    type    = number
    default = 16
}