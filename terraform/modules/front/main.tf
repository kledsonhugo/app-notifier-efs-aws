# RESOURCE: EC2 LAUNCH TEMPLATE

resource "aws_launch_template" "front_ec2_lt" {
    name                   = "${var.front_ec2_lt_name}"
    image_id               = "${var.front_ec2_lt_ami}"
    instance_type          = "${var.front_ec2_lt_instance_type}"
    key_name               = "${var.front_ec2_lt_ssh_key_name}"
    vpc_security_group_ids = ["${var.network_vpc_sg_pub_id}"]
}


# RESOURCE: APPLICATION LOAD BALANCER

resource "aws_lb" "front_ec2_lb" {
    name               = "${var.front_ec2_lb_name}"
    load_balancer_type = "application"
    subnets            = ["${var.network_vpc_sn_az1_pub_id}", "${var.network_vpc_sn_az2_pub_id}"]
    security_groups    = ["${var.network_vpc_sg_pub_id}"]
}

resource "aws_lb_target_group" "front_ec2_lb_tg" {
    name     = "${var.front_ec2_lb_tg_name}"
    protocol = "${var.front_ec2_lb_tg_protocol}"
    port     = "${var.front_ec2_lb_tg_port}"
    vpc_id   = "${var.network_vpc_id}"
}

resource "aws_lb_listener" "front_ec2_lb_listener" {
    protocol          = "${var.front_ec2_lb_listener_protocol}"
    port              = "${var.front_ec2_lb_listener_port}"
    load_balancer_arn = aws_lb.front_ec2_lb.arn
    
    default_action {
        type             = "${var.front_ec2_lb_listener_action_type}"
        target_group_arn = aws_lb_target_group.front_ec2_lb_tg.arn
    }
}


# RESOURCE: AUTO SCALING GROUP

resource "aws_autoscaling_group" "front_ec2_asg" {
    name                = "${var.front_ec2_asg_name}"
    desired_capacity    = "${var.front_ec2_asg_desired_capacity}"
    min_size            = "${var.front_ec2_asg_min_size}"
    max_size            = "${var.front_ec2_asg_max_size}"
    vpc_zone_identifier = ["${var.network_vpc_sn_az1_pub_id}", "${var.network_vpc_sn_az2_pub_id}"]
    target_group_arns   = [aws_lb_target_group.front_ec2_lb_tg.arn]
    launch_template {
        id      = aws_launch_template.front_ec2_lt.id
        version = "$Latest"
    }
}