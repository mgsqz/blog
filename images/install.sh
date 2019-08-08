#!/bin/bash
sudo passwd << EOF
phoenix
phoenix
EOF
sudo apt update
sudo apt upgrade -y
sudo apt install expect -y
sudo sed -i 's/PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo mkdir /root/.ssh
sudo touch /root/.ssh/authorized_keys
sudo bash -c "echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDsQsFPkGZnP8s63i8Cv9kybhpJDKwdlQI4uN5mI55j8bZE5Ohk/jR9cX1r6MjFJtXKOV6jEqMtgDNiyRYP4m2tIG1KMkMHHAPVTTuFNdmI1kU4PUEwUJ/XuQixd9kOhPRM0BM8kF3C7vOneoPfS+aKrUWtgX0v0036v8E5/LIhl5ObvyVKd1l35xtorPrMbq3aL2NN1bm2sjzZOk74khwpvIuSLAb7jYp4+rZ90FJtsCepFOrF2iAHmUM5MNBl0IA06SuiEMqBfXPz69eZ72jnK4Nq8neB71BmOZREA1MmrYBb5nNH8Zg5rj4QPjyZWWSz07ry+1nZCV0GPDEbN7pr' > /root/.ssh/authorized_keys"
sudo service sshd restart
/usr/bin/expect -c "set timeout -1; spawn su; expect \"Password:\"; send \"phoenix\\r\"; interact"
