
#DNS of lb
output "dns-link" {
 value = aws_lb.application-lb.dns_name
}

#Create ssh command for each instance
output "ssh1" {
  value = "ssh -i ${local_file.ssh_key.filename} ec2-user@${aws_instance.server1.private_ip}"
}

output "ssh2" {
  value = "ssh -i ${local_file.ssh_key.filename} ec2-user@${aws_instance.server2.private_ip}"
}

#List PIP for each instance

output "private_ip_address1" {
  value = aws_instance.server1.private_ip
}

output "private_ip_address2" {
  value = aws_instance.server2.private_ip
}