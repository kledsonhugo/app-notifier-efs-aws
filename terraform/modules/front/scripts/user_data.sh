#!/bin/bash
yum update -y
amazon-linux-extras install -y epel
yum install -y amazon-efs-utils httpd telnet tree
systemctl enable httpd
echo "Notifier app frontend" > /mnt/efs/html/index.html
service httpd start