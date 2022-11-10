# NETWORK VARS DEFAULT VALUES (INPUT IS REQUIRED BECAUSE NO DEFAULT IS DEFINED)

variable "network_vpc_sn_az1_priv1_cidr" {}
variable "network_vpc_sn_az2_priv1_cidr" {}
variable "network_vpc_id" {}
variable "network_vpc_sn_az1_priv2_id" {}
variable "network_vpc_sn_az2_priv2_id" {}


# DATABASE VARS DEFAULT VALUES

variable "rds_sn_group_name" {
    type    = string
    default = "rds-sn-group-name"
}

variable "rds_param_group_name" {
    type    = string
    default = "rds-param-group-name"
}

variable "rds_identifier" {
    type    = string
    default = "rds-identifier"
}

variable "rds_family" {
    type    = string
    default = "mysql8.0"
}

variable "rds_charset" {
    type    = string
    default = "utf8"
}

variable "rds_engine" {
    type    = string
    default = "mysql"
}

variable "rds_engine_version" {
    type    = string
    default = "8.0.23"
}

variable "rds_instance_class" {
    type    = string
    default = "db.t2.micro"
}

variable "rds_storage_type" {
    type    = string
    default = "gp2"
}

variable "rds_allocated_storage" {
    type    = number
    default = 20
}

variable "rds_max_allocated_storage" {
    type    = number
    default = 0
}

variable "rds_monitoring_interval" {
    type    = number
    default = 0
}

variable "rds_skip_final_snapshot" {
    type    = bool
    default = true
}

variable "rds_dbname" {
    type    = string
    default = "rdsdbname"
}

variable "rds_dbuser" {
    type    = string
    default = "rdsdbuser"
}

variable "rds_dbpassword" {
    type    = string
    default = "rdsdbpassword" 
}

variable "rds_multi_az" {
    type    = bool
    default = true
}


# SECURITY GROUP VARS DEFAULT VALUES

variable "data_sg_cidr_all" {
    type    = string
    default = "0.0.0.0/0"
}

variable "data_sg_port_all" {
    type    = number
    default = 0
}

variable "data_sg_port_ssh" {
    type    = number
    default = 22
}

variable "data_sg_port_http" {
    type    = number
    default = 80
}

variable "data_sg_protocol_any" {
    type    = string
    default = "-1"
}

variable "data_sg_protocol_tcp" {
    type    = string
    default = "tcp"
}