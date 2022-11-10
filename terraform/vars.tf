# NETWORK VARS CUSTOM VALUES

variable "vpc_cidr" {
    type    = string
    default = "10.0.0.0/16"
}

variable "vpc_sn_az1" {
    type    = string
    default = "us-east-1a"
}

variable "vpc_sn_az2" {
    type    = string
    default = "us-east-1c"
}

variable "vpc_sn_az1_pub_cidr" {
    type    = string
    default = "10.0.1.0/24"
}

variable "vpc_sn_az2_pub_cidr" {
    type    = string
    default = "10.0.2.0/24"
}

variable "vpc_sn_az1_priv1_cidr" {
    type    = string
    default = "10.0.3.0/24"
}

variable "vpc_sn_az2_priv1_cidr" {
    type    = string
    default = "10.0.4.0/24"
}

variable "vpc_sn_az1_priv2_cidr" {
    type    = string
    default = "10.0.5.0/24"
}

variable "vpc_sn_az2_priv2_cidr" {
    type    = string
    default = "10.0.6.0/24"
}


# DATABASE VARS CUSTOM VALUES

variable "rds_identifier" {
    type    = string
    default = "rds-notifier"
}

variable "rds_sn_group_name" {
    type    = string
    default = "rds-sn-group-notifier"
}

variable "rds_param_group_name" {
    type    = string
    default = "rds-param-group-notifier"
}

variable "rds_dbname" {
    type    = string
    default = "rdsdbnotifier"
}

variable "rds_dbuser" {
    type    = string
    default = "rdsdbadmin"
}

variable "rds_dbpassword" {
    type    = string
    default = "rdsdbadminpwd"
}


# FRONT VARS CUSTOM VALUES

variable "front_ec2_lt_name" {
    type    = string
    default = "front-ec2-lt-notifier"
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
    default = "vockey"
}

variable "front_ec2_lb_name" {
    type    = string
    default = "front-ec2-lb-notifier"
}

variable "front_ec2_lb_tg_name" {
    type    = string
    default = "front-ec2-lb-tg-notifier"
}

variable "front_ec2_asg_name" {
    type    = string
    default = "front-ec2-asg-notifier"
}

variable "front_ec2_asg_desired_capacity" {
    type    = number
    default = 2
}

variable "front_ec2_asg_min_size" {
    type    = number
    default = 1
}

variable "front_ec2_asg_max_size" {
    type    = number
    default = 4
}


# BACK VARS CUSTOM VALUES

variable "back_ec2_lt_name" {
    type    = string
    default = "back-ec2-lt-notifier"
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
    default = "vockey"
}

variable "back_ec2_lb_name" {
    type    = string
    default = "back-ec2-lb-notifier"
}

variable "back_ec2_lb_tg_name" {
    type    = string
    default = "back-ec2-lb-tg-notifier"
}

variable "back_ec2_asg_name" {
    type    = string
    default = "back-ec2-asg-notifier"
}

variable "back_ec2_asg_desired_capacity" {
    type    = number
    default = 4
}

variable "back_ec2_asg_min_size" {
    type    = number
    default = 2
}

variable "back_ec2_asg_max_size" {
    type    = number
    default = 8
}