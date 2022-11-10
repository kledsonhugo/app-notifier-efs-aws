#!/bin/bash
yum update -y
amazon-linux-extras install -y epel
yum install -y amazon-efs-utils httpd telnet tree
systemctl enable httpd