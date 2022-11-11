# RESOURCE: SECURITY GROUP

resource "aws_security_group" "back_sg" {
    vpc_id = "${var.network_vpc_id}"
    egress {
        from_port   = "${var.back_sg_port_all}"
        to_port     = "${var.back_sg_port_all}"
        protocol    = "${var.back_sg_protocol_any}"
        cidr_blocks = ["${var.back_sg_cidr_all}"]
    }
    ingress {
        from_port   = "${var.back_sg_port_all}"
        to_port     = "${var.back_sg_port_all}"
        protocol    = "${var.back_sg_protocol_any}"
        cidr_blocks = [
            "${var.network_vpc_sn_az1_pub_cidr}",
            "${var.network_vpc_sn_az2_pub_cidr}",
            "${var.network_vpc_sn_az1_priv1_cidr}",
            "${var.network_vpc_sn_az2_priv1_cidr}"
            ]
    }
}


# ELASTIC FILE SYSTEM

resource "aws_efs_file_system" "efs" {
  encrypted = false
}

data "aws_caller_identity" "current" {}

resource "aws_efs_file_system_policy" "efs_policy" {
  file_system_id                     = aws_efs_file_system.efs.id
  bypass_policy_lockout_safety_check = true
  policy                             = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "efs-policy-efs",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": [
                "elasticfilesystem:*"
            ],
            "Resource": [
                "arn:aws:elasticfilesystem:us-east-1:${data.aws_caller_identity.current.account_id}:file-system/${aws_efs_file_system.efs.id}"
            ]
        }
    ]
}
POLICY
}

resource "aws_efs_mount_target" "efs-mount-az1" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = "${var.network_vpc_sn_az1_priv1_id}"
  security_groups = [aws_security_group.back_sg.id]
}

resource "aws_efs_mount_target" "efs-mount-az2" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = "${var.network_vpc_sn_az2_priv1_id}"
  security_groups = [aws_security_group.back_sg.id]
}


# RESOURCE: APPLICATION LOAD BALANCER

resource "aws_lb" "back_ec2_lb" {
    name               = "${var.back_ec2_lb_name}"
    load_balancer_type = "application"
    subnets            = ["${var.network_vpc_sn_az1_priv1_id}", "${var.network_vpc_sn_az2_priv1_id}"]
    security_groups    = [aws_security_group.back_sg.id]
}

resource "aws_lb_target_group" "back_ec2_lb_tg" {
    name     = "${var.back_ec2_lb_tg_name}"
    protocol = "${var.back_ec2_lb_tg_protocol}"
    port     = "${var.back_ec2_lb_tg_port}"
    vpc_id   = "${var.network_vpc_id}"
}

resource "aws_lb_listener" "back_ec2_lb_listener" {
    protocol          = "${var.back_ec2_lb_listener_protocol}"
    port              = "${var.back_ec2_lb_listener_port}"
    load_balancer_arn = aws_lb.back_ec2_lb.arn
    
    default_action {
        type             = "${var.back_ec2_lb_listener_action_type}"
        target_group_arn = aws_lb_target_group.back_ec2_lb_tg.arn
    }
}


# RESOURCE: AUTO SCALING GROUP

data "template_file" "user_data_back" {
  template = file("./modules/back/scripts/user_data.sh")
  vars = {
    efs_id = aws_efs_file_system.efs.id
  }
}

resource "aws_launch_template" "back_ec2_lt" {
    name                   = "${var.back_ec2_lt_name}"
    image_id               = "${var.back_ec2_lt_ami}"
    instance_type          = "${var.back_ec2_lt_instance_type}"
    key_name               = "${var.back_ec2_lt_ssh_key_name}"
    user_data              = base64encode(data.template_file.user_data_back.rendered)
    vpc_security_group_ids = [aws_security_group.back_sg.id]
}

resource "aws_autoscaling_group" "back_ec2_asg" {
    name                = "${var.back_ec2_asg_name}"
    desired_capacity    = "${var.back_ec2_asg_desired_capacity}"
    min_size            = "${var.back_ec2_asg_min_size}"
    max_size            = "${var.back_ec2_asg_max_size}"
    vpc_zone_identifier = ["${var.network_vpc_sn_az1_priv1_id}", "${var.network_vpc_sn_az2_priv1_id}"]
    target_group_arns   = [aws_lb_target_group.back_ec2_lb_tg.arn]
    launch_template {
        id      = aws_launch_template.back_ec2_lt.id
        version = "$Latest"
    }
}