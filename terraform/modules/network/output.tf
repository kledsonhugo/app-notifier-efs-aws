# NETWORK OUTPUT TO BE REUSED

output "vpc_id" {
    value = "${aws_vpc.vpc.id}"
}

output "vpc_sn_az1_pub_id" {
    value = "${aws_subnet.sn_az1_pub.id}"
}

output "vpc_sn_az2_pub_id" {
    value = "${aws_subnet.sn_az2_pub.id}"
}

output "vpc_sn_az1_priv1_id" {
    value = "${aws_subnet.sn_az1_priv1.id}"
}

output "vpc_sn_az2_priv1_id" {
    value = "${aws_subnet.sn_az2_priv1.id}"
}

output "vpc_sn_az1_priv2_id" {
    value = "${aws_subnet.sn_az1_priv2.id}"
}

output "vpc_sn_az2_priv2_id" {
    value = "${aws_subnet.sn_az2_priv1.id}"
}