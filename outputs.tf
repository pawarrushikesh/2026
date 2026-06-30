output "web_server_instance_id" {
  description = "Web Server EC2 Instance ID"
  value       = aws_instance.web_server.id
}

output "web_server_public_ip" {
  description = "Web Server Public IP"
  value       = aws_instance.web_server.public_ip
}

output "web_server_ssh_command" {
  description = "SSH command for Web Server"
  value       = "ssh -i your-private-key.pem ec2-user@${aws_instance.web_server.public_ip}"
}

output "db_server_instance_id" {
  description = "DB Server EC2 Instance ID"
  value       = aws_instance.db_server.id
}

output "db_server_public_ip" {
  description = "DB Server Public IP"
  value       = aws_instance.db_server.public_ip
}

output "db_server_ssh_command" {
  description = "SSH command for DB Server"
  value       = "ssh -i your-private-key.pem ec2-user@${aws_instance.db_server.public_ip}"
}
