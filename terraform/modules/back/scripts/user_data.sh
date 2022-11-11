#!/bin/bash
yum update -y
amazon-linux-extras install -y epel
yum install -y amazon-efs-utils httpd telnet tree
systemctl enable httpd
service httpd start
mkdir /mnt/efs
echo "${efs_id}:/ /mnt/efs efs _netdev,noresvport,tls 0 0" >> /etc/fstab
x=10
while (( $x > 0 )); do
  mount -fav
  mnt=`df -h |grep /mnt/efs |wc -l`
  if (( $mnt >= 1 )); then
    [ ! -d "/mnt/efs/html" ] && mkdir /mnt/efs/html
    echo "Notifier app" > /mnt/efs/html/index.html
    rm -rf /var/www/html/
    ln -s /mnt/efs/html/ /var/www/html
    service httpd restart
    break
  fi
  echo $((x--))
  echo "Unable to mount EFS. Attempt: $x"
  sleep 5
done