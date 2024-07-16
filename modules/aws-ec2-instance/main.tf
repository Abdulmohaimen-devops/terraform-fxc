# EC2 Instance
resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = true

  security_groups= [aws_security_group.allow_ssh.name]
  iam_instance_profile = aws_iam_instance_profile.test_profile.name
  
  user_data = data.template_file.backup_ec2_server.rendered

  tags = {
    Name  = var.instance_name
  }
}

# User-data file as a template
data "template_file" "backup_ec2_server" {
  template = file("${path.module}/template/user_data.tpl")
  vars = {
	bucket_name = var.bucket_name
  backup_path = var.backup_path
  }
}

# export the public IP of the instance
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.main.public_ip
}
