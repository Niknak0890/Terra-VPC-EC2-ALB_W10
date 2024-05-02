 #!/bin/bash
   sudo  yum update -y
   sudo   groupadd docker
   sudo   useradd John -aG docker 
   sudo   yum install git unzip wget httpd -yw
   sudo   systemctl start httpd
   sudo   systemctl enable httpd
   sudo   cd /opt
   sudo   wget https://github.com/kserge2001/web-consulting/archive/refs/heads/dev.zip
   sudo   unzip dev.zip
   sudo   cp -r /opt/web-consulting-dev/* /var/www/html
   echo "<html><h1><p> Welcome to Utrains the place to learn DevOps!!.<br> This traffic is servered from:  ${HOSTNAME} </p></h1></html>" > /var/www/html/index.html
             #Will use the echo to id which server is accepting our traffic