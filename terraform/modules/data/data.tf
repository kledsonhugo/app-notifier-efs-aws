# RESOURCE: SECURITY GROUP

resource "aws_security_group" "data_sg" {
    vpc_id = "${var.network_vpc_id}"
    egress {
        from_port   = "${var.data_sg_port_all}"
        to_port     = "${var.data_sg_port_all}"
        protocol    = "${var.data_sg_protocol_any}"
        cidr_blocks = ["${var.data_sg_cidr_all}"]
    }
    ingress {
        from_port   = "${var.data_sg_port_all}"
        to_port     = "${var.data_sg_port_all}"
        protocol    = "${var.data_sg_protocol_any}"
        cidr_blocks = ["${var.network_vpc_cidr}"]
    }
}


# RESOURCE: DB SUBNET GROUP

resource "aws_db_subnet_group" "rds_sn_group" {
    name       = "${var.rds_sn_group_name}"
    subnet_ids = ["${var.network_vpc_sn_az1_priv2_id}", "${var.network_vpc_sn_az2_priv2_id}"]
}


# RESOURCE: DB INSTANCE

resource "aws_db_instance" "rds_dbinstance" {
    identifier             = "${var.rds_identifier}"
    engine                 = "${var.rds_engine}"
    engine_version         = "${var.rds_engine_version}"
    instance_class         = "${var.rds_instance_class}"
    storage_type           = "${var.rds_storage_type}"
    allocated_storage      = "${var.rds_allocated_storage}"
    max_allocated_storage  = "${var.rds_max_allocated_storage}"
    monitoring_interval    = "${var.rds_monitoring_interval}"
    name                   = "${var.rds_dbname}"
    username               = "${var.rds_dbuser}"
    password               = "${var.rds_dbpassword}"
    skip_final_snapshot    = "${var.rds_skip_final_snapshot}"
#    multi_az               = "${var.rds_multi_az}"
    db_subnet_group_name   = aws_db_subnet_group.rds_sn_group.name
    vpc_security_group_ids = [aws_security_group.data_sg.id]
}