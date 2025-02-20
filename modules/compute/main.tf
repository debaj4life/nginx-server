resource "aws_instance" "nginx_server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = "tutorial-key"
  subnet_id              = var.subnet_id
  associate_public_ip_address = true
  security_groups        = [var.security_group_id]

  user_data = file("${path.module}/../../nginx-userdata.sh") 
  tags = {
    Name = "Nginx-web-server"
  }
}