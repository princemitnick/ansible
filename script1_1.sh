#!/bin/bash
#Create the user matt
ansible -i inventory.ini servers -b -m user -a "name=matt state=present"

#Create the demo directory int matt's home directory
ansible -i inventory.ini  servers -b -m file -a "path=/home/matt/demo state=directory owner=matt group=matt mode=0755"

#Copy inventory to matt's home directory
ansible -i inventory.ini servers -b -m copy -a "src=/home/prince/ansible/inventory.ini dest=/home/matt/inventory.ini owner=matt group=matt"

#Install httpd to the servers
ansible -i inventory.ini servers -b -m yum -a "name=httpd state=latest"

#Enable httpd service
ansible -i inventory.ini servers -b -m service -a "name=httpd state=started enabled=yes"
